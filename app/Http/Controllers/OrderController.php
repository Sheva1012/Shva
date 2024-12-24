<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        $ordersQuery = Order::query();

        if ($request->search) {
            $ordersQuery->where('customer', 'like', "%{$request->search}%")
                ->orWhere('id', 'like', "%{$request->search}%");
        }

        if ($request->start_date && $request->end_date) {
            $ordersQuery->where('created_at', '>=', $request->start_date)
                ->where('created_at', '<=', $request->end_date . ' 23:59:59');
        }

        $orders = $ordersQuery->orderBy('created_at', 'desc')
            ->paginate(10);

        return view('order.index', [
            'orders' => $orders,
        ]);
    }

    public function show(Order $order)
    {
        return view('order.show', ['order' => $order]);
    }

    public function create(Request $request)
    {
        if (!session('order')) {
            $order = new Order();
            $order->customer = '-';
            $order->user_id = auth()->user()->id;

            session(['order' => $order]);
        }

        // Menambahkan kondisi untuk hanya mengambil kategori yang aktif
        $categories = Category::query()->where('active', 1)->get();

        // Query produk berdasarkan kategori yang aktif
        $productsQuery = Product::query()->whereHas('category', function ($query) {
            $query->where('active', 1); // Pastikan kategori produk aktif
        });

        if ($request->category_id) {
            $productsQuery->where('category_id', $request->category_id);
        }

        if ($request->search) {
            $productsQuery->where('name', 'like', "%{$request->search}%");
        }

        $products = $productsQuery->get();

        return view('order.create', [
            'categories' => $categories,
            'products' => $products,
        ]);
    }


    public function createDetail(Product $product)
    {
        $order = session('order');
        $detail = null;

        if (isset($order->details[$product->id])) {
            $detail = $order->details[$product->id];
        }

        return view('order.create-detail', [
            'product' => $product,
            'detail' => $detail,
        ]);
    }

    public function storeDetail(Request $request, Product $product)
    {
        $order = session('order');

        if ($request->submit == 'destroy') {
            unset($order->details[$product->id]);
            return redirect()->route('orders.create');
        }

        $request->validate([
            'qty' => 'required|numeric|min:1',
            'price' => 'required|numeric',
        ]);

        // Cek apakah stok cukup
        if ($product->stok < $request->qty) {
            return back()->withInput()->withErrors(['qty' => 'Stok tidak mencukupi']);
        }

        $detail = new OrderDetail();
        $detail->product_id = $product->id;
        $detail->qty = $request->qty;
        $detail->price = $request->price;

        $order->details[$product->id] = $detail;

        return redirect()->route('orders.create');
    }

    public function checkout(Request $request)
    {
        // Validasi data untuk checkout
        $request->validate([
            'customer' => 'required',
            'payment' => 'required',
        ]);

        $order = session('order');
        $total = 0;

        foreach ($order->details as $detail) {
            $total += $detail->qty * $detail->price;

            // Mengurangi stok produk
            $product = Product::find($detail->product_id);
            $product->stok -= $detail->qty;
            $product->save();
        }

        if ($request->payment < $total) {
            return back()->withInput()->withErrors(['payment' => 'Payment tidak mencukupi']);
        }

        $order->customer = $request->customer;
        $order->payment = $request->payment;
        $order->total = $total;
        $order->save();
        $order->details()->saveMany($order->details);

        // Menghapus session order setelah checkout berhasil
        $request->session()->forget('order');

        return redirect()->route('orders.show', ['order' => $order->id]);
    }

    public function destroy(Order $order)
    {
        // Menghapus detail order jika ada
        $order->details()->delete();

        // Menghapus order
        $order->delete();

        // Redirect dengan pesan sukses
        return redirect()->route('orders.index')->with('success', 'Order berhasil dihapus.');
    }

}

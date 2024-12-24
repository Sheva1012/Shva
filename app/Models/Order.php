<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;

class Order extends Model
{
    use HasFactory;

    public function index(Request $request)
{
    $orders = Order::with(['details.product']) // Load relasi detail dan produk
        ->when($request->filled('start_date'), function ($query) use ($request) {
            $query->whereDate('created_at', '>=', $request->start_date);
        })
        ->when($request->filled('end_date'), function ($query) use ($request) {
            $query->whereDate('created_at', '<=', $request->end_date);
        })
        ->when($request->filled('customer'), function ($query) use ($request) {
            $query->where('customer', 'like', '%' . $request->customer . '%');
        })
        ->paginate(1);

    return view('laporan.index', compact('orders'));
}

    public function details()
    {
        return $this->hasMany(OrderDetail::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function getFormattedCreatedAtAttribute()
    {
        return Carbon::parse($this->created_at)
            ->format('d M Y H:i');
    }
}

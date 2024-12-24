<x-layout>
    <x-slot:title>Orders</x-slot:title>

    <div class="container mt-4"
        style="background: linear-gradient(to right, #ffecd2, #fcb69f); min-height: 100%; padding: 20px; border-radius: 10px;">
        @if (session('success'))
            <div class="alert alert-success shadow" role="alert">
                {{ session('success') }}
            </div>
        @endif

        <div class="d-flex mb-3 justify-content-between">
            <form class="d-flex align-items-center gap-2" method="get">
                <input type="date" class="form-control w-auto" placeholder="Pilih periode awal" name="start_date"
                    value="{{ request()->start_date ?? date('Y-m-01') }}" style="border: 2px solid #f77a52;">
                <span>-</span>
                <input type="date" class="form-control w-auto" placeholder="Pilih periode akhir" name="end_date"
                    value="{{ request()->end_date ?? date('Y-m-d') }}" style="border: 2px solid #f77a52;">
                <input type="text" class="form-control w-auto" placeholder="Cari order" name="search"
                    value="{{ request()->search }}" style="border: 2px solid #f77a52;">
                <button type="submit" class="btn btn-warning text-white shadow-sm">Cari</button>
            </form>

            <a href="{{ route('orders.create') }}" class="btn btn-success shadow-sm">Buat Order Baru</a>
        </div>

        <div class="card shadow-lg border-0 mb-3">
            <table class="table table-hover table-striped m-0">
                <thead class="text-white" style="background-color: #f77a52;">
                    <tr>
                        <th>No</th>
                        <th>Customer</th>
                        <th>Payment</th>
                        <th>Total</th>
                        <th>User</th>
                        <th>Tanggal</th>
                        <th class="text-end">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($orders as $order)
                        <tr>
                            <td>Order #{{ $order->id }}</td>
                            <td>{{ $order->customer }}</td>
                            <td>{{ number_format($order->payment) }}</td>
                            <td>{{ number_format($order->total) }}</td>
                            <td>{{ $order->user->name ?? 'Unknown User' }}</td>
                            <td>{{ $order->formatted_created_at }}</td>
                            <td class="text-end">
                                <a href="{{ route('orders.show', ['order' => $order->id]) }}"
                                    class="btn btn-sm btn-primary shadow-sm">Lihat</a>
                                <form action="{{ route('orders.destroy', ['order' => $order->id]) }}" method="POST"
                                    class="d-inline"
                                    onsubmit="return confirm('Apakah Anda yakin ingin menghapus order ini?');">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-sm btn-danger shadow-sm">Hapus</button>
                                </form>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="7" class="text-center text-muted">Belum ada order</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        {{ $orders->links() }}
    </div>
</x-layout>

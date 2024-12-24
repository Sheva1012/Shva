<x-layout>
    <x-slot:title>Products</x-slot:title>
    <div class="container mt-4"
        style="background: linear-gradient(to right, #74ebd5, #acb6e5); min-height: 100vh; padding: 20px; border-radius: 10px;">
        @if (session('success'))
            <div class="alert alert-success shadow" role="alert">
                {{ session('success') }}
            </div>
        @endif

        <div class="d-flex justify-content-between align-items-center mb-3">
            <form class="d-flex gap-2" method="get">
                <input type="text" class="form-control w-auto" placeholder="Cari produk" name="search"
                    value="{{ request()->search }}" style="border: 2px solid #4caf50;">
                <button type="submit" class="btn btn-success">Cari</button>
            </form>
            <a href="/products/create" class="btn btn-primary shadow">Tambah Produk</a>
        </div>

        <div class="card shadow-lg border-0">
            <table class="table table-hover table-striped m-0">
                <thead class="text-white" style="background-color: #007bff;">
                    <tr>
                        <th scope="col">Gambar</th>
                        <th scope="col">Nama</th>
                        <th scope="col">Kategori</th>
                        <th scope="col">Harga</th>
                        <th scope="col">Stok</th>
                        <th scope="col" class="text-end">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($products as $product)
                        <tr>
                            <td>
                                <img src="{{ Storage::url($product->image) }}" alt="{{ $product->name }}"
                                    class="img-thumbnail rounded"
                                    style="width: 100px; height: 100px; object-fit: cover;">
                            </td>
                            <td>{{ $product->name }}</td>
                            <td>{{ $product->category->name }}</td>
                            <td>Rp {{ number_format($product->price, 0, ',', '.') }}</td>
                            <td>{{ $product->stok }}</td>
                            <td>
                                <div class="d-flex justify-content-end gap-2">
                                    <a href="{{ route('products.edit', ['product' => $product->id]) }}"
                                        class="btn btn-sm btn-warning shadow-sm">Edit</a>
                                    <form action="{{ route('products.destroy', ['product' => $product->id]) }}"
                                        method="post">
                                        @csrf
                                        @method('delete')
                                        <button class="btn btn-sm btn-danger shadow-sm">Hapus</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="6" class="text-center text-muted">Belum ada produk</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</x-layout>

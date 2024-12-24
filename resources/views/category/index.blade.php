<x-layout>
    <x-slot:title>Category</x-slot:title>
    <div class="container mt-4"
        style="background: linear-gradient(to right, #fbc2eb, #a6c1ee); min-height: 100%; padding: 20px; border-radius: 10px;">
        @if (session('success'))
            <div class="alert alert-success shadow" role="alert">
                {{ session('success') }}
            </div>
        @endif

        <div class="d-flex justify-content-between mb-3">
            <form class="d-flex gap-2" method="get">
                <input type="text" class="form-control w-auto" placeholder="Cari kategori" name="search"
                    value="{{ request()->search }}" style="border: 2px solid #6c63ff;">
                <button type="submit" class="btn btn-primary">Cari</button>
            </form>
            <a href="/categories/create" class="btn btn-success shadow">Tambah Kategori</a>
        </div>

        <div class="card shadow-lg border-0">
            <table class="table table-hover table-striped m-0">
                <thead class="text-white" style="background-color: #6c63ff;">
                    <tr>
                        <th scope="col">Nama</th>
                        <th scope="col">Status</th>
                        <th scope="col" class="text-end">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($categories as $category)
                        <tr>
                            <td>{{ $category->name }}</td>
                            <td>
                                @if ($category->active)
                                    <span class="badge bg-primary">Aktif</span>
                                @else
                                    <span class="badge bg-danger">Tidak Aktif</span>
                                @endif
                            </td>
                            <td>
                                <div class="d-flex justify-content-end gap-2">
                                    <a href="{{ route('categories.edit', ['category' => $category->id]) }}"
                                        class="btn btn-sm btn-warning shadow-sm">Edit</a>
                                    <form action="{{ route('categories.destroy', ['category' => $category->id]) }}"
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
                            <td colspan="3" class="text-center text-muted">Belum ada kategori</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</x-layout>

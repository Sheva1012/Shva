<x-layout>
    <x-slot:title>Users</x-slot:title>

    <div class="container py-4" style="background: #e3f2fd; border-radius: 8px;">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <form class="row g-3" method="GET" action="{{ route('users.index') }}">
                <div class="col-auto">
                    <label class="visually-hidden" for="search">Cari User</label>
                    <input type="text" class="form-control" id="search" name="search" placeholder="Cari user"
                        value="{{ request('search') }}">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary mb-3">Cari</button>
                </div>
            </form>
            <div class="d-flex mb-2 justify-content-end">
                <a href="{{ route('users.create') }}" class="btn btn-warning">Tambah User</a>
            </div>
        </div>

        <div class="card shadow-lg">
            <div class="card-body p-0">
                <table class="table table-striped table-bordered mb-0">
                    <thead class="table-info" style="background: #4caf50; color: white;">
                        <tr>
                            <th scope="col">Nama</th>
                            <th scope="col">Email</th>
                            <th scope="col">Tipe User</th>
                            <th scope="col" class="text-center">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($users as $user)
                            <tr>
                                <td>{{ $user->name }}</td>
                                <td>{{ $user->email }}</td>
                                <td>{{ $user->usertype }}</td>
                                <td class="text-center">
                                    <a href="{{ route('users.edit', $user->id) }}" class="btn btn-sm btn-secondary"
                                        title="Edit User">Edit</a>
                                    <a href="#" class="btn btn-sm btn-danger" title="Hapus User"
                                        onclick="event.preventDefault(); if(confirm('Are you sure you want to delete this user?')) { document.getElementById('delete-user-{{ $user->id }}').submit(); }">Hapus</a>
                                    <form id="delete-user-{{ $user->id }}"
                                        action="{{ route('users.destroy', $user->id) }}" method="POST"
                                        style="display: none;">
                                        @csrf
                                        @method('DELETE')
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</x-layout>

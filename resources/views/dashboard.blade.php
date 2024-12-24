<x-layout>
    <x-slot:title>Dashboard</x-slot:title>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10 text-center p-5 rounded shadow"
                style="background: linear-gradient(to right, #4facfe, #00f2fe); color: white;">
                <h1 class="display-4 fw-bold">Selamat Datang, {{ $userName }}</h1>
                <h2 class="mt-3">Anda disini masuk sebagai <span class="badge bg-success p-2">{{ $userType }}</span>
                </h2>
            </div>
        </div>
    </div>
</x-layout>

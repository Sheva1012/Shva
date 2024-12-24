<x-layout title="Orders">
    <div class="container py-4" style="background: linear-gradient(to right, #e0f7fa, #e0ece4); border-radius: 10px;">
        <div class="row">
            <div class="col">
                <div class="d-grid gap-4">
                    <form class="hstack gap-2" method="get">
                        <select name="category_id" id="category_id" class="form-control w-auto"
                            onchange="this.form.submit()">
                            <option value="">Semua kategori</option>
                            @foreach ($categories as $category)
                                <option value="{{ $category->id }}"
                                    {{ request()->category_id == $category->id ? 'selected' : '' }}>
                                    {{ $category->name }}
                                </option>
                            @endforeach
                        </select>

                        <div class="input-group">
                            <input type="text" placeholder="Cari product" class="form-control" name="search"
                                value="{{ request()->search }}" autofocus>
                        </div>

                        <button type="submit" class="btn btn-dark">Cari</button>
                    </form>

                    <div class="row g-4">
                        @forelse ($products as $product)
                            <div class="col-3">
                                <a href="{{ route('orders.create.detail', ['product' => $product->id]) }}"
                                    class="text-decoration-none">
                                    <div class="card product-card shadow-sm">
                                        <img src="{{ Storage::url($product->image) }}" alt="{{ $product->name }}"
                                            class="card-img-top border-bottom">
                                        <div class="card-body">
                                            <div class="fw-bold">{{ $product->name }}</div>
                                            <div class="hstack">
                                                <small>{{ $product->category->name }}</small>
                                                <small class="ms-auto">Rp{{ number_format($product->price) }}</small>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        @empty
                            <div class="col text-center">Belum ada products</div>
                        @endforelse
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <form id="checkoutForm" class="card shadow-lg" method="post" action="{{ route('orders.checkout') }}">
                    @csrf

                    <div class="card-body border-bottom fw-bold bg-primary text-white">Summary</div>

                    <div class="card-body border-bottom">
                        <x-text-input name="customer" label="Customer"
                            value="{{ session('order')->customer }}"></x-text-input>
                    </div>

                    <div class="card-body bg-body-tertiary border-bottom">
                        <div class="vstack gap-2">
                            @php $total = 0; @endphp

                            @forelse (session('order')->details as $detail)
                                @php $total += $detail->qty * $detail->price; @endphp
                                <a href="{{ route('orders.create.detail', ['product' => $detail->product_id]) }}"
                                    class="text-decoration-none">
                                    <div class="card product-card">
                                        <div class="card-body">
                                            <div>{{ $detail->product->name }}</div>
                                            <div class="d-flex justify-content-between">
                                                <div class="form-text">{{ $detail->qty }} x
                                                    {{ number_format($detail->price) }}</div>
                                                <div class="ms-auto form-text">
                                                    Rp{{ number_format($detail->qty * $detail->price) }}</div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            @empty
                                <div class="text-center">Belum ada product</div>
                            @endforelse
                        </div>
                    </div>

                    <div class="card-body border-bottom d-grid gap-2">
                        <div class="d-flex justify-content-between">
                            <div>Total</div>
                            <h4 class="ms-auto mb-0 fw-bold">Rp{{ number_format($total) }}</h4>
                        </div>
                        <div>
                            <x-text-input name="payment" label="Payment" type="number"></x-text-input>
                        </div>
                        <div>
                            <label for="payment_method" class="form-label">Pilih Metode Pembayaran</label>
                            <select name="payment_method" id="payment_method" class="form-select" required>
                                <option value="" disabled selected>Pilih metode</option>
                                <option value="cash">Cash</option>
                                <option value="debit">Debit</option>
                            </select>
                        </div>
                    </div>

                    <div class="card-body d-flex flex-row-reverse justify-content-between">
                        <button type="button" class="ms-auto btn btn-dark" data-bs-toggle="modal"
                            data-bs-target="#confirmModal">Checkout</button>
                        <a href="{{ route('orders.index') }}" class="btn btn-light">Batal</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmModalLabel">Konfirmasi Pembayaran</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">Apakah Anda yakin ingin melanjutkan pembayaran?</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tidak</button>
                    <button type="button" class="btn btn-primary" id="confirmCheckout">Ya, Lanjutkan</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('confirmCheckout').addEventListener('click', function() {
            document.getElementById('checkoutForm').submit();
        });
    </script>
</x-layout>

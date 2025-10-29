@extends('layouts.app')

@section('content')
<div class="container py-5 text-center" style="background-color: #fdfdfdff;">
    <h3 class="fw-bold mb-4">💻 IT Support Dashboard</h3>
    <p class="text-muted mb-5">Select an Issue Category to Report a New Ticket</p>

    <div class="row justify-content-center">
    @foreach($categories as $category)
        <div class="col-12 col-sm-6 col-md-3 mb-4">
            <a href="{{ route('tickets.create', ['category' => $category->id]) }}" 
               class="text-decoration-none">
                <div class="card shadow-sm border-0 h-100 category-card {{ strtolower(str_replace(' ', '-', $category->name)) }}">
                    <div class="card-body d-flex flex-column justify-content-center align-items-center py-4">
                        {{-- Icon based on category name --}}
                        @if(Str::contains(strtolower($category->name), 'software'))
                            <i class="fa fa-bug fa-3x mb-3"></i>
                        @elseif(Str::contains(strtolower($category->name), 'hardware'))
                            <i class="fa fa-microchip fa-3x mb-3"></i>
                        @elseif(Str::contains(strtolower($category->name), 'mail'))
                            <i class="fa fa-envelope fa-3x mb-3"></i>
                        @else
                            <i class="fa fa-cogs fa-3x mb-3"></i>
                        @endif

                        <h5 class="font-weight-bold text-white mb-0">{{ $category->name }}</h5>
                    </div>
                </div>
            </a>
        </div>
    @endforeach
</div>

    <div class="mt-5">
        <a href="{{ route('tickets.index') }}" class="text-decoration-none me-3">🏠 Home</a>
        <a href="{{ route('tickets.create') }}" class="text-decoration-none">📝 Report an Issue</a>
    </div>
</div>

{{-- Custom CSS for colored cards --}}
<style>
    .category-card {
    border-radius: 16px;
    transition: all 0.25s ease-in-out;
    color: #fff !important;
    text-align: center;
    cursor: pointer;
    border: none;
    overflow: hidden;
}

    .category-card:hover {
        transform: translateY(-6px) scale(1.03);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);
    }

    .category-card .card-body {
        padding: 40px 20px;
        min-height: 150px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        border-radius: 16px;
        color: #1700c1ff !important;
    }

    /* Apply gradient directly to card (not only the body) */
    .software-issues {
        background: linear-gradient(135deg, #4A90E2, #007AFF);
    }
    .hardware-issues {
        background: linear-gradient(135deg, #E07A5F, #C74B24);
    }
    .e-mail-issues {
        background: linear-gradient(135deg, #56ab2f, #a8e063);
    }
    .general-it-issues {
        background: linear-gradient(135deg, #9d7dbf, #6a4c93);
    }

    /* Icon & text styling */
    .category-card i {
        font-size: 3rem;
        margin-bottom: 15px;
    }

    .category-card h5 {
        font-weight: 700;
        letter-spacing: 0.5px;
    }

    /* Responsive */
    @media (max-width: 768px) {
        .category-card .card-body {
            padding: 25px 15px;
            min-height: 130px;
        }
    }
</style>


@endsection
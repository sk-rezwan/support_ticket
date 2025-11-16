@extends('layouts.app')

@section('content')
<div class="container py-5 text-center bg-light">
    <h3 class="font-weight-bold mb-3 text-primary">💻 IT Support Dashboard</h3>
    <p class="text-secondary mb-5">Select an Issue Category to Report a New Ticket</p>

    <div class="row justify-content-center">
    @foreach($categories as $category)
    <div class="col-12 col-sm-6 col-md-3 mb-4">
        <a href="{{ route('dashboard.subcategories', $category->id) }}" class="text-decoration-none">
              <div class="card h-100 border-0 category-card
                  @if(Str::contains(strtolower($category->name), 'software')) software-issues
                  @elseif(Str::contains(strtolower($category->name), 'hardware')) hardware-issues
                  @elseif(Str::contains(strtolower($category->name), 'mail')) e-mail-issues
                  @else general-it-issues @endif">
                  
                  <div class="card-body d-flex flex-column justify-content-center align-items-center">
                      @if(Str::contains(strtolower($category->name), 'software'))
                          <i class="fa fa-bug fa-3x mb-3 text-white"></i>
                      @elseif(Str::contains(strtolower($category->name), 'hardware'))
                          <i class="fa fa-microchip fa-3x mb-3 text-white"></i>
                      @elseif(Str::contains(strtolower($category->name), 'mail'))
                          <i class="fa fa-envelope fa-3x mb-3 text-white"></i>
                      @else
                          <i class="fa fa-cogs fa-3x mb-3 text-white"></i>
                      @endif
                      <h5 class="font-weight-bold text-white mb-0">{{ $category->name }}</h5>
                  </div>
            </div>
        </a>
        </div>
        @endforeach
    </div>

    <div class="mt-4">
        <a href="{{ route('tickets.index') }}" class="btn btn-outline-primary mr-2">🏠 Home</a>
        <a href="{{ route('tickets.create') }}" class="btn btn-primary">📝 Report an Issue</a>
    </div>
</div>

<style>
/* Background */
body {
  background-color: #f8fafc;
}

/* Category Cards */
.category-card {
  border-radius: 14px;
  transition: all 0.3s ease;
  background: #EFECE3;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
}

/* Flat vibrant backgrounds */
.software-issues   { background-color: #FCB53B !important; } /* Blue */
.hardware-issues   { background-color: #016B61 !important; } /* Red */
.e-mail-issues     { background-color: #2670efff !important; } /* Green */
.general-it-issues { background-color: #FFE797 !important; } /* Purple */

/* Hover effects */
.category-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 18px rgba(0, 0, 0, 0.25);
  filter: brightness(1.1);
}

/* Text & Icon styling */
.category-card i,
.category-card h5 {
  color: #151515ff !important;
}

.category-card h5 {
  font-weight: 600;
  letter-spacing: 0.4px;
}

/* Responsive */
@media (max-width: 768px) {
  .category-card .card-body {
    padding: 25px 10px;
  }
}
</style>
@endsection
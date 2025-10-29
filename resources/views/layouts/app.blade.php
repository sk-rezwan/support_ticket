<!DOCTYPE html>
<html>
<head>
    <title>IT Help Desk & Support</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome 5 (recommended) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <style>
        body {
            overflow-x: hidden;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        main {
            flex: 1;
        }
        .sidebar {
            min-height: 100%;
        }
        .nav-link.active {
            background-color: #e9ecef;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <!-- Navigation bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container">
            <h4>IT Help Desk & Support</h4>
            <div class="ms-auto d-flex align-items-center">
                <div class="text-end me-3">
                    <div class="fw-semibold">{{ Auth::user()->name }}</div>
                </div>
                <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <button type="submit" class="btn btn-sm btn-outline-danger">
                        Log Out
                    </button>
                </form>
            </div>
        </div>
    </nav>

    <!-- Main content with sidebar -->
    <main class="container-fluid">
        <div class="row g-0">
            <div class="col-md-3 col-lg-2 bg-light sidebar p-3">
                <h4>CDIP</h4>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="{{ url('/dashboard') }}">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{ url('/tickets') }}">Tickets</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="collapse" href="#reportsMenu" role="button" aria-expanded="false" aria-controls="reportsMenu">
                            Reports
                        </a>
                        <div class="collapse" id="reportsMenu">
                            <ul class="nav flex-column ms-3">
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ url('/reports/branch') }}">Branch-wise Report</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ url('/reports/problem') }}">Problem-wise Report</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="col-md-9 col-lg-10 p-4">
                @yield('content')
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-dark text-light py-3">
        <div class="container text-center">
            <small>&copy; {{ date('Y') }} CDIP IT Services. All rights reserved.</small>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

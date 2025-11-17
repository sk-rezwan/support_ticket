@extends('layouts.app')

@section('content')
<h3>Date-wise Tickets</h3>

<form method="GET" action="{{ url('/reports/branch') }}" class="row g-3 mb-4">
    <div class="col-auto">
        <label for="from_date" class="form-label">From Date</label>
        <input type="date" name="from_date" id="from_date" class="form-control form-control-sm" required value="{{ request('from_date') }}">
    </div>
    <div class="col-auto">
        <label for="to_date" class="form-label">To Date</label>
        <input type="date" name="to_date" id="to_date" class="form-control form-control-sm" required value="{{ request('to_date') }}">
    </div>
    <div class="col-auto align-self-end">
        <button type="submit" class="btn btn-info btn-sm px-3">Search</button>
    </div>
</form>

@if (!empty($tickets))
    <table class="table table-bordered">
        <thead class="table-light">
            <tr>
                <th>Branch</th>
                <th>Subject</th>
                <th>Status</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
        @foreach ($tickets as $ticket)
            <tr>
                <td>{{ $ticket->branch_name }}</td>
                <td>{{ $ticket->subject }}</td>
                <td>
                    @if ($ticket->status == 0)
                        <span class="badge bg-warning text-dark">Pending</span>
                    @elseif ($ticket->status == 1)
                        <span class="badge bg-info text-dark">Processing</span>
                    @else
                        <span class="badge bg-success">Solved</span>
                    @endif
                </td>
                <td>{{ \Carbon\Carbon::parse($ticket->created_at)->format('Y-m-d') }}</td>
            </tr>
        @endforeach
        </tbody>
    </table>
@endif
@endsection

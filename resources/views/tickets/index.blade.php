@extends('layouts.app')

@section('content')
    <div class="card shadow-sm">
    <div class="card-header bg-light text-grey">
        <h5 class="mb-0">All Tickets</h5>
    </div>
    <div class="card-body">
        <div class="mb-3 text-end">
            <a href="{{ route('tickets.create') }}" class="btn btn-info">
                + Add Ticket
            </a>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped align-middle">
                <thead class="table-light">
                    <tr>
                        <th>SL</th>
                        <th>Branch</th>
                        <th>Subject</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Actions</th>
                        <th>Solved By</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($tickets as $index => $ticket)
                        <tr>
                            <td>{{ $index + 1 }}</td>
                            <td>{{ $ticket->br_name }}</td>
                            <td>{{ $ticket->subject }}</td>
                            <td>
                                @if ($ticket->status == 0)
                                    <span class="badge bg-warning">Pending</span>
                                @elseif ($ticket->status == 1)
                                    <span class="badge bg-info">Processing</span>
                                @else
                                    <span class="badge bg-success">Solved</span>
                                @endif
                            </td>
                            <td>{{ \Carbon\Carbon::parse($ticket->created_at)->format('d M Y') }}</td>
                            <td>
                                <a href="{{ route('tickets.show', $ticket->id) }}" class="btn btn btn-sm btn-outline-primary">
                                    View
                                </a>
                            </td>
                            <td>{{ $ticket->solved_by_name }}</td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="7" class="text-center">No tickets found.</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
    
@extends('layouts.app')

@section('content')
<div class="card">
    <div class="card-header bg-light text-grey">
        <h4>Ticket Details</h4>
    </div>

    <div class="card-body">
        <p><strong>Subject:</strong> {{ $ticket->subject }}</p>
        <p><strong>Description:</strong> {{ $ticket->description }}</p>

        <p><strong>Status:</strong>
            @if ($ticket->status == 0)
                <span class="badge bg-secondary">Pending</span>
            @elseif ($ticket->status == 1)
                <span class="badge bg-warning text-dark">Processing</span>
            @else
                <span class="badge bg-success">Solved</span>
            @endif
        </p>

        @if (auth()->user()->role === 'admin')
            <form method="POST" action="{{ route('tickets.update', $ticket->id) }}" class="mt-4">
                @csrf
                @method('PUT')

<div class="row">
    <div class="col-md-4 col-lg-4 mb-4 p-3 border">
        <label for="status" class="form-label fw-semibold mb-2">Update Status</label>
        <select name="status" id="status" class="form-select shadow-sm">
            <option value="0" {{ $ticket->status == 0 ? 'selected' : '' }}>Pending</option>
            <option value="1" {{ $ticket->status == 1 ? 'selected' : '' }}>Processing</option>
            <option value="2" {{ $ticket->status == 2 ? 'selected' : '' }}>Solved</option>
        </select>
    </div>
</div>

                <button type="submit" class="btn btn-info">Update Status</button>
            </form>
        @endif
    </div>
</div>
@endsection

@extends('layouts.app')

@section('content')
<div class="container py-4">
    <div class="card shadow-sm border-0">
        <div class="card-header bg-info text-white d-flex justify-content-between align-items-center">
            <h4 class="mb-0">🎫 Ticket Details</h4>
            <small class="text-light">Ticket ID: #{{ $ticket->id }}</small>
        </div>

        <div class="card-body">
            {{-- Header Section --}}
            <div class="d-flex justify-content-between align-items-start flex-wrap mb-3">
                <div>
                    <p class="mb-1"><strong>Subject:</strong> {{ $ticket->subject }}</p>
                </div>
                <div class="text-end">
                    <p class="mb-1"><strong>Created At:</strong> {{ \Carbon\Carbon::parse($ticket->created_at)->format('d M, Y h:i A') }}</p>
                    @if(!empty($ticket->contact_person))
                        <p class="mb-0"><strong>Contact Person:</strong> {{ $ticket->contact_person }}</p>
                    @endif
                </div>
            </div>

            {{-- Description Section --}}
            <div class="mb-4">
                <p class="mb-1"><strong>Description:</strong></p>
                <div class="border rounded p-3 bg-light">
                    {!! nl2br(e($ticket->description)) !!}
                </div>
            </div>

            {{-- Attachment Section --}}
            @if($ticket->attachment)
                <div class="mb-4">
                    <strong>Attachment:</strong>
                    <a href="{{ asset('storage/' . $ticket->attachment) }}" class="btn btn-outline-primary btn-sm ms-2" target="_blank">
                        <i class="bi bi-paperclip"></i> View / Download
                    </a>
                </div>
            @endif

            {{-- Status Section (moved below attachment) --}}
            <div class="mb-4">
                <p class="mb-1"><strong>Status:</strong>
                    @if ($ticket->status == 0)
                        <span class="badge bg-secondary">Pending</span>
                    @elseif ($ticket->status == 1)
                        <span class="badge bg-warning text-dark">Processing</span>
                    @else
                        <span class="badge bg-success">Solved</span>
                    @endif
                </p>
                @if(!empty($ticket->solved_by))
                    <p class="mb-0"><strong>Solved By:</strong> {{ $ticket->solved_by_name ?? 'N/A' }}</p>
                @endif
            </div>

            {{-- Admin Section --}}
            @if (auth()->user()->role == 1)
                <hr>
                <div class="d-flex justify-content-between align-items-center flex-wrap mb-2">
                    <h5 class="mb-3 mb-md-0">🛠 Update Ticket Status</h5>
                    <form method="POST" action="{{ route('tickets.update', $ticket->id) }}" class="d-flex align-items-center bg-light p-3 rounded shadow-sm flex-wrap">
                        @csrf
                        @method('PUT')

                        <div class="me-3 mb-2 mb-md-0">
                            <label for="status" class="form-label fw-semibold mb-0 me-2">Status:</label>
                            <select name="status" id="status" class="form-select form-select-sm d-inline-block w-auto shadow-sm">
                                <option value="0" {{ $ticket->status == 0 ? 'selected' : '' }}>Pending</option>
                                <option value="1" {{ $ticket->status == 1 ? 'selected' : '' }}>Processing</option>
                                <option value="2" {{ $ticket->status == 2 ? 'selected' : '' }}>Solved</option>
                            </select>
                        </div>

                        <div class="text-end">
                            <button type="submit" class="btn btn-info btn-sm ms-2">
                                <i class="bi bi-check-circle"></i> Update Status
                            </button>
                        </div>
                    </form>
                </div>
            @endif
        </div>
    </div>
</div>
@endsection

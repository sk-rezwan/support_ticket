@extends('layouts.app')

@section('content')
<div class="container py-4">
    <div class="card shadow-sm border-0">
        <div class="card-header bg-info text-white d-flex justify-content-between align-items-center">
            <h4 class="mb-0">🎫 Ticket Details</h4>
            <small class="text-light">Ticket ID: #{{ $ticket->id }}</small>
        </div>

        <div class="card-body">

            {{-- Flash message --}}
            @if(session('success'))
                <div class="alert alert-success">
                    {{ session('success') }}
                </div>
            @endif

            {{-- Header Section --}}
            <div class="d-flex justify-content-between align-items-start flex-wrap mb-3">
                <div>
                    <p class="mb-1"><strong>Subject:</strong> {{ $ticket->subject }}</p>
                </div>
                <div class="text-end">
                    <p class="mb-1"><strong>Created at:</strong> {{ \Carbon\Carbon::parse($ticket->created_at)->format('d M, Y h:i A') }}</p>
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

            @if(!empty($ticket->assigned_to))
                <p class="mb-0">
                    <strong>Assigned Engineer:</strong> {{ $ticket->assigned_to_name ?? 'N/A' }}
                </p>
            @endif

            {{-- Status Section --}}
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

            {{-- Replies Section --}}
            <hr>
            <h5 class="mb-3">💬 Replies</h5>

            @if($replies->isEmpty())
                <p class="text-muted">No replies yet.</p>
            @else
                <div class="mb-4">
                    @foreach($replies as $reply)
                        <div class="border rounded p-3 mb-2 bg-light">
                            <div class="d-flex justify-content-between">
                                <strong>{{ $reply->user_name }}</strong>
                                <small class="text-muted">
                                    {{ \Carbon\Carbon::parse($reply->created_at)->format('d M, Y h:i A') }}
                                </small>
                            </div>
                            <div class="mt-2">
                                {!! nl2br(e($reply->message)) !!}
                            </div>
                        </div>
                    @endforeach
                </div>
            @endif

            {{-- Reply Form: only for Admin (1) or Engineer (2) --}}
            @if(in_array(auth()->user()->role, [1, 2]))
                <div class="mt-4">
                    <h5 class="mb-3">➕ Add a Reply</h5>
                    <form method="POST" action="{{ route('tickets.replies.store', $ticket->id) }}">
                        @csrf

                        <div class="mb-3">
                            <label for="message" class="form-label">Message</label>
                            <textarea name="message" id="message" rows="4" class="form-control" required>{{ old('message') }}</textarea>
                        </div>

                        <button type="submit" class="btn btn-primary btn-sm">
                            <i class="bi bi-send"></i> Submit Reply
                        </button>
                    </form>
                </div>
            @endif

            @if(auth()->user()->role == 1)
    <hr>
    <div class="mt-3 mb-3">
        <h5 class="mb-3">👨‍💻 Assign to Engineer</h5>

        @if(session('error'))
            <div class="alert alert-danger py-1 px-2 mb-2">
                {{ session('error') }}
            </div>
        @endif

        <form method="POST" action="{{ route('tickets.assign', $ticket->id) }}" class="d-flex flex-wrap align-items-center">
            @csrf

            <div class="me-2 mb-2">
                <select name="engineer_id" class="form-control form-control-sm">
                    <option value="">-- Select Engineer --</option>
                    @foreach($engineers as $engineer)
                        <option value="{{ $engineer->id }}"
                            {{ $ticket->assigned_to == $engineer->id ? 'selected' : '' }}>
                            {{ $engineer->name }}
                        </option>
                    @endforeach
                </select>
            </div>

            <button type="submit" class="btn btn-sm btn-primary mb-2">
                Assign
            </button>
        </form>

        @if($ticket->assigned_to)
            <p class="mt-2 mb-0">
                <strong>Currently assigned to:</strong> {{ $ticket->assigned_to_name ?? 'Unknown' }}
                    </p>
                @endif
            </div>
        @endif


            {{-- Admin Section: status update --}}
            @if (in_array(auth()->user()->role, [1,2]))
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

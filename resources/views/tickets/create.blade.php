@extends('layouts.app')

@section('content')
<div class="card">
    <div class="card-header">
        <h4>Create Ticket</h4>
    </div>
    <div class="card-body">
        @if ($errors->any())
            <div class="alert alert-danger">
                <ul class="mb-0">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form method="POST" action="{{ route('tickets.store') }}">
            @csrf
            @php $isAdmin = auth()->user()->role === 'admin'; @endphp

                @if($isAdmin)
                <div class="mb-3">
                    <label for="branch_id" class="form-label">Select Branch</label>
                    <select name="branch_id" id="branch_id" class="form-select" required>
                        <option value="">-- Select Branch --</option>
                        @foreach($branches as $branch)
                            <option value="{{ $branch->id }}">{{ $branch->name }}</option>
                        @endforeach
                    </select>
                </div>
            @endif

            <div class="mb-3">
                <label for="subject" class="form-label">Subject</label>
                <input type="text" name="subject" id="subject" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea name="description" id="description" class="form-control" rows="5" required></textarea>
            </div>

            <button type="submit" class="btn btn-info">Submit Ticket</button>
        </form>
    </div>
</div>
@endsection

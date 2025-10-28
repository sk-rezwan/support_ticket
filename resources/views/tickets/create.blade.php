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

        <form method="POST" action="{{ route('tickets.store') }}" enctype="multipart/form-data">
            @csrf
            @php $isAdmin = auth()->user()->role === 1; @endphp

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
            <label for="priority_id" class="form-label">Set Priority</label>
            <select name="priority_id" id="priority_id" class="form-select">
                <option value="">-- Select Priority --</option>
                @foreach($priorities as $priority)
                    <option value="{{ $priority->id }}">{{ $priority->name }}</option>
                @endforeach
            </select>

            <label for="category_id" class="form-label">Select Category</label>
            <select name="category_id" id="category_id" class="form-select">
                <option value="">-- Select Category --</option>
                @foreach($categories as $category)
                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                @endforeach
            </select>


    <div class="mb-3">
        <label for="subject" class="form-label">Subject</label>
        <input type="text" name="subject" id="subject" class="form-control" required>
    </div>

    <div class="mb-3">
        <label for="description" class="form-label">Description</label>
        <textarea name="description" id="description" class="form-control" rows="5" required></textarea>
    </div>

    <div class="mb-3">
        <label for="contact_person" class="form-label">Contact Person</label>
        <input type="text" name="contact_person" id="contact_person" class="form-control" placeholder="Enter contact person Name and Contact No ..">
    </div>

    <div class="mb-3">
        <label for="attachment" class="form-label">Attach File (optional)</label>
        <input type="file" name="attachment" id="attachment" class="form-control">
        <small class="text-muted">Allowed types: jpg, png, pdf, doc, docx, xlsx (max 2MB)</small>
    </div>

    <button type="submit" class="btn btn-info">Submit Ticket</button>
</form>
    </div>
</div>
@endsection

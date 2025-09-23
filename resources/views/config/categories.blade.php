@extends('layouts.app')

@section('content')
    <h2 class="mb-4">Category Management</h2>

    <!-- Add Category Form -->
    <div class="card p-3 mb-4">
        <form action="{{ route('categories.store') }}" method="POST">
            @csrf
            <div class="row mb-3">
                <div class="col">
                    <input type="text" name="category_name" class="form-control" placeholder="Category Name" required>
                </div>
                <div class="col">
                    <select name="status" class="form-control">
                        <option value="1">Active</option>
                        <option value="0">Inactive</option>
                    </select>
                </div>
                <div class="col">
                    <button type="submit" class="btn btn-primary">Add Category</button>
                </div>
            </div>
        </form>
    </div>

    <!-- Category List -->
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Category Name</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($categories as $category)
                <tr>
                    <td>{{ $category->category_id }}</td>
                    <td>{{ $category->category_name }}</td>
                    <td>
                        @if($category->status == 1)
                            <span class="badge bg-success">Active</span>
                        @else
                            <span class="badge bg-danger">Inactive</span>
                        @endif
                    </td>
                    <td>
                        <!-- Edit Form -->
                        <form action="{{ route('categories.update', $category->category_id) }}" method="POST" class="d-inline">
                            @csrf
                            <input type="hidden" name="category_name" value="{{ $category->category_name }}"> 
                            <button type="submit" class="btn btn-warning btn-sm">Edit</button>
                        </form>

                        <!-- Delete Link -->
                        <a href="{{ route('categories.destroy', $category->category_id) }}" 
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="4" class="text-center">No categories found.</td>
                </tr>
            @endforelse
        </tbody>
    </table>

</body>
</html>
@endsection
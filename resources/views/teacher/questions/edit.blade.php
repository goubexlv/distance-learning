@extends('layouts.examination')

@section("container-xxl")
<div class="container-fluid">

    <!-- Page Heading -->
    @if($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

<!-- Content Row -->
        <div class="card shadow">
            <div class="card-header">
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">{{ __('edit question')}}</h1>
                    <a href="{{ route('questions.index', ['ue'=>$ue->code]) }}" class="btn btn-primary btn-sm shadow-sm">{{ __('Go Back') }}</a>
                </div>
            </div>

            <div class="card-body">
                <form action="{{ route('question.update', $questions->id ) }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="question_text">{{ __('question text') }}</label>
                        <input type="text" class="form-control" id="question_text" placeholder="{{ __('question text') }}" name="question_text" value="{{ old('question_text', $questions->question_text) }}" />
                    </div>
                    <div class="form-group">
                        <label for="category">{{ __('code_ue') }}</label>
                        <select class="form-control" name="code_ue" id="code_ue">

                                <option value="{{ $questions->code }}">{{ $questions->code }}</option>

                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">{{ __('Save')}}</button>
                </form>
            </div>
        </div>


    <!-- Content Row -->

</div>
@endsection

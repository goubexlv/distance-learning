@extends('layouts.examination')

@section("container-xxl")
<div class="container-fluid">

    <!-- Page Heading -->


    <!-- Content Row -->
        <div class="card">
            <div class="card-header py-3 d-flex">
                <h6 class="m-0 font-weight-bold text-primary">
                    {{ __('question') }}
                </h6>
                <div class="ml-auto">
                    <a href="{{ route('questions.create', ['ue'=>$ue->code]) }}" class="btn btn-primary">
                        <span class="icon text-white-50">
                            <i class="fa fa-plus"></i>
                        </span>
                        <span class="text">{{ __('New question') }}</span>
                    </a>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover datatable datatable-question" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th width="10">

                                </th>
                                <th>No</th>
                                <th>Unite Enseignement</th>
                                <th>Question Text</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($questions as $question)
                            <tr data-entry-id="{{ $question->id }}">
                                <td>

                                </td>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $title }}</td>
                                <td>{{ $question->question_text }}</td>
                                <td>
                                    <span class="text-info">
                                      <a  href="{{ route('question.edit', $question->id) }}"><i class="bx bx-street-view"></i> </a>
                                    </span>

                                    <span class="text-danger">
                                        <a href="{{ route('question.delete', ['id' => $question->id]) }}"><i class="bx bx-trash"></i></a>
                                    </span>
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td colspan="7" class="text-center">{{ __('Data Empty') }}</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    <!-- Content Row -->

</div>
@endsection

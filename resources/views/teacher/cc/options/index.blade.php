@extends('layouts.examination_cc')

@section("container-xxl")
<div class="container-fluid">

    <!-- Page Heading -->


    <!-- Content Row -->
        <div class="card">
            <div class="card-header py-3 d-flex">
                <h6 class="m-0 font-weight-bold text-primary">
                    {{ __('option') }}
                </h6>
                <div class="ml-auto">
                    <a href="{{ route('options.create_cc', ['ue'=>$ue->code]) }}" class="btn btn-primary">
                        <span class="icon text-white-50">
                            <i class="fa fa-plus"></i>
                        </span>
                        <span class="text">{{ __('New option') }}</span>
                    </a>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover datatable datatable-option" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th width="10">

                                </th>
                                <th>No</th>
                                <th>Question</th>
                                <th>option Text</th>
                                <th>Point</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($options as $option)
                            <tr data-entry-id="{{ $option->id }}">
                                <td>

                                </td>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $option->question }}</td>
                                <td>{{ $option->option_text}}</td>
                                <td>{{ $option->points}}</td>
                                <td>


                                    <span class="text-danger">
                                        <a href="{{ route('option.delete', ['id' => $option->id]) }}"><i class="bx bx-trash"></i></a>
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


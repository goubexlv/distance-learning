@extends('layouts.examination')

@section("container-xxl")
<div class="container-fluid">

    <!-- Page Heading -->


    <!-- Content Row -->
        <div class="card">
            <div class="card-header py-3 d-flex">
                <h6 class="m-0 font-weight-bold text-primary">
                    {{ __('TP') }}
                </h6>

            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover datatable datatable-result" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th width="10">

                                </th>
                                <th>No</th>
                                <th>User</th>
                                <th>Telecharger</th>
                                <th>Points</th>
                                <th>Modifier</th>

                            </tr>
                        </thead>
                        <tbody>
                            @forelse($tpexam as $tpexams)
                            <tr data-entry-id="{{ $tpexams->id }}">
                                <td>

                                </td>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $tpexams->user->name }}</td>
                                <td>{{$tpexams->document}} --> <a href="{{ route('download.don', ['nom'=>$tpexams->document]) }}" class="btn btn-primary">
                                    <span class="icon text-white-50">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                    <span class="text">{{ __('Download') }}</span>
                                </a></td>

                                    <td>
                                        {{ $tpexams->note_tp  }}
                                    </td>
                                    @php
                                        $ids  = 0;
                                    @endphp
                                    <?php

                                    function afficher($id)
                                    {
                                        return $id;
                                    }

                                    ?>
                                    <td>
                                        <li class=""><a href="javascript:void(0);" onclick ="<?php $ids = afficher($tpexams->id);  ?>" data-toggle="modal" data-target="#newLiveModal" class="btn btn-primary" >Modifier</a></li>
                                    </td>


                            </tr>
                            @empty
                            <tr>
                                <td colspan="7" class="text-center">{{ __('Data Empty') }}</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>

                    <!-- New Live Modal -->
    <div class="modal fade" id="newLiveModal" tabindex="-1" role="dialog" aria-labelledby="registermodal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered login-pop-form" role="document">
            <div class="modal-content" id="registermodal">
                <span class="mod-close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></span>
                <div class="modal-body">
                    <h4 class="modal-header-title">New Note</h4>
                    <div class="login-form">
                        <form action="{{route('tp.note.add',  $ids ) }}" method="POST">
                            @csrf
                            <div class="form-group">
                                <label>Nouvelle note <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" placeholder="Note sur 20" name="note" required autofocus autocomplete="off">
                            </div>

                            <div class="form-group">
                                <button type="submit" class="btn btn-primaryn">Save</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal -->
                </div>
            </div>
        </div>
    <!-- Content Row -->

</div>
@endsection



@extends("layouts.examination_cc")

@section("container-xxl")


    <div class="container-fluid">

            <form id="addChapter" method="POST" action="{{route('exam_cc.add', $ue->code)}}" enctype="multipart/form-data">
                <hr>
                @csrf
                <div class="card-header bg-white shadow-sm border-0">
                    <h6 class="d-block position-relative text-dark py-2">Add examination to this Course fot Controle continu</h6>
                </div>

                <div class="row">

                    <div class="col-lg-12 col-md-12">
                        <div class="form-group">
                            <label>Document (txt) <sup class="text-danger">*</sup></label>
                            <input type="file" class="text-center form-control @error('document') is-invalid @enderror" name="document" required value="{{ old('document') }}">
                            @error('document')
                            <span class="text-danger text-sm" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
                    </div>

                <div class="form-group text-right">
                    <button class="btn btn-primary" type="button" onclick="javascript:location.reload();">Cancel</button>
                    <button class="btn btn-primary" type="submit">Submit Request</button>
                </div>
            </form>
    </div>

@endsection


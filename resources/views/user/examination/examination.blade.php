@extends("layouts.eva")

@section('content')
<div class="container">
    <div>
    <center><p>Après la fin du temps le formulaire sera automatiquement envoyé</p></center> <h4 class="edu_title" id="countminute" style="text-align: center; color: red;" ></h4>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">EXAMINATION</div>

                <div class="card-body">
                    @if(session('status'))
                        <div class="row">
                            <div class="col-12">
                                <div class="alert alert-success" role="alert">
                                    {{ session('status') }}
                                </div>
                            </div>
                        </div>
                    @endif
                    <div class="card-header" style="font-weight: bold; color: blue;">{{ $title }}</div>
                    <form method="POST" id="myForm" action="{{ route('test.store', $ue->code) }} ">
                        @csrf
                        @foreach($afficher as $affiche)

                                <div class="card-body">
                                    @foreach($affiche->question as $questions)


                                        <div class="card @if(!$loop->last)mb-3 @endif">

                                            <div class="card-header" style="font-weight: bold; font-style: italic; color: black;">
                                             {{ $questions->question_text }}</div>

                                            <div class="card-body">
                                                <input type="hidden" name="questions[{{ $questions->id }}]" value="">
                                                @foreach($questions->option as $options)

                                                    <div class="form-check" >
                                                        <input class="form-check-input" type="radio" name="questions[{{ $questions->id }}]" id="option-{{ $options->id }}" value="{{ $options->id }}"@if(old("questions.$questions->id") == $options->id) checked @endif>
                                                        <label class="form-check-label" for="option-{{ $options->id }}">
                                                            {{ $options->option_text }}
                                                        </label>
                                                    </div>
                                                @endforeach

                                                @if($errors->has("questions.$questions->id"))
                                                    <span style="margin-top: .25rem; font-size: 80%; color: #e3342f;" role="alert">
                                                        <strong>{{ $errors->first("questions.$questions->id") }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                        </div>
                                    @endforeach
                                </div>

                        @endforeach
                        <div class="form-group row mb-0">
                            <div class="col-md-6">
                                <button type="submit" class="btn btn-primary">
                                    Submit
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

@section("js")
    <script>
 $(function () {
            alert("At the end of the time the results will be submitted automatically");
            const startingMinutes = 60;
            let time = startingMinutes * 60;
            const countel = document.getElementById('countminute');
            setInterval(() => {
                const heure = time % 60;
                const minutes = Math.floor(time / 60);
                let seconds = time % 60;
                countel.innerHTML =  ` temps restant = ${heure} : ${minutes} : ${seconds}`;
                time--;
                if(time == 0){
                    $.ajaxSetup({
                        headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}
                    });
                        $.ajax({
                            url: "{{ route('test.store', $ue->code) }}",
                            type: "POST",
                            data: $('#myForm').serialize(),
                            success: function(reponse){
                                window.location.href="{{ route('user.resultas', ['ue'=>$ue->code] )}}";
                                },
                                error: function(){
                                    alert("Form submission failed!");
                                }
                            });

                }

            }, 1000);

            clearTimeout(time);


})
    </script>
@endsection




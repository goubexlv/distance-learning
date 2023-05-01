@extends("layouts.teacher", ['large_band' => true])

@section("content")
    <!-- Row -->
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 pt-4 pb-4">
            <span id="prev" class="d-none">{{ url()->previous() }}</span> <br>
        </div>
    </div>
    <!-- /Row -->

    <!-- Row -->
    <div class="row mb-4">
        <div class="text-center col-lg-12 col-md-12 col-sm-12">
            <strong>
                <h3>{{ strtoupper($live->ue->code) . " : " . $live->ue->name }}</h3>
                <h4><u>Live on</u>: {{ $live->titre }}</h4>
            </strong>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">

            <!-- Course Style 1 For Student -->
            @if($live->user_id == auth()->user()->id)
            <div class="assists_count">
                Nombre d'utilisateurs: <span id="nbre_assists">0</span>
            </div>
            @endif


            <div class="dashboard_container">
                <div class="dashboard_container_body">
                    <div class="row justify-content-around m-3">
                        @if($live->user_id == auth()->user()->id)
                        <button onclick="joindre2()" type="button" id="join" class="btn btn-theme mt-4" data-type="host" data-uid="{{ rand(11111, 99999) }}">Join</button>
                        @else
                        <button type="button" class="btn btn-theme mt-4" id="join" data-type="audience" onclick="joindre()" data-uid="{{ rand(111111, 999999) }}">Join</button>
                        @endif
                        <button type="button" class="d-none btn btn-theme" id="leave">Leave</button>
                    </div>
                </div>
                <div class="dashboard_container_header">
{{--                    <div class="dashboard_fl_1">--}}
{{--                        <h4>Assist Live : <i>Title here</i></h4>--}}
{{--                    </div>--}}
                    <div class="dashboard_fl_2 row" id="users_live" style="height: 600px; overflow-y:scroll;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /Row -->

@endsection

@section("js")

<script>


function joindre(){


        if (document.all)
        {
            try {
                var xml = new ActiveXObject("Microsoft.XMLHTTP");
                xml.Open( "GET", "{{$live->join_url}}", false );
                xml.Send()
                document.getElementById("users_live").innerHTML=xml.responseText;
            }
            catch (e) {
                var xml = new ActiveXObject("MSXML2.XMLHTTP.4.0");
                xml.Open( "GET", "{{$live->join_url}}", false );
                xml.Send()
                document.getElementById("users_live").innerHTML=xml.responseText;
            }
            }
            else
            {
                var xml=new XMLHttpRequest();
                xml.open("GET","{{$live->join_url}}",false);
                xml.send(null);
                document.getElementById("users_live").innerHTML=xml.responseText;
        }
}

function joindre2(){

    $.ajax({
        method: "GET", // GET ou POST comme tu veut
        url: "{{$live->join_url}}", // La page qui va faire le traitement
        data: "", // Les donnees a envoyer
  success : function(resultat){
    $('#users_live').html(resultat);
  }
})
}



</script>
    @if($live->user_id == auth()->user()->id)

    <script>

        function countUsers(){
            var live_uid = "{{$live->uuid}}";

            $.ajax({
                url: "{{ route('user.lives.count_users') }}",
                type: "post",
                data: "uid=" + live_uid,
                dataType: "json",
                success: function(response){
                    $("#nbre_assists").html(response.users);
                }
            });

            setTimeout(countUsers, 10000);
        }

        countUsers();
    </script>
    @endif
@endsection

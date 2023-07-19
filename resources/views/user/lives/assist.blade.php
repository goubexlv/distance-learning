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
                       <button  type="button" id="join" class="btn btn-theme mt-4" data-type="host" data-uid="{{ rand(11111, 99999) }}">Join local</button>
                        <a href="{{$live->join_url}}" data-id="{{$live->id}}" class="btn btn-theme mt-4">Join</a>

                        @else
                       <button  type="button" id="join" class="btn btn-theme mt-4" data-type="host" data-uid="{{ rand(11111, 99999) }}">Join local</button>

                       {{-- <button type="button" class="btn btn-theme mt-4" id="join" data-type="audience" onclick="joindre()" data-uid="{{ rand(111111, 999999) }}">Join</button>--}}
                        <a href="{{$live->join_url}}" data-id="{{$live->id}}" class="btn btn-theme mt-4">Joint</a>
                        @endif
                        <button type="button" class="d-none btn btn-theme" id="leave">Leave</button>
                    </div>
                </div>

                     <div id="users_live" class="container align-items-center">
                </div>


            </div>

        </div>
    </div>

    <!-- /Row -->

@endsection

@section("js")
<script src='https://meet.jit.si/external_api.js'></script>

<script>
var button = document.querySelector('#join');
var container = document.querySelector('#users_live');
var api = null;

button.addEventListener('click', () => {

    var nom = "{{$nom}}";
    var randomString = "{{$online->titre}}";

    var domain = "meet.jit.si";
    var options = {
        "roomName": randomString,
        "parentNode": container,
        "width": 600,
        "height": 600,
        userInfo: {
        	displayName: nom
   	 }
    };
    api = new JitsiMeetExternalAPI(domain, options);
});

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

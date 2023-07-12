<?php

namespace App\Http\Controllers;

use App\Http\Traits\MeetingZoomTrait;
use App\Models\Live;
use App\Models\online_classe;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use MacsiDigital\Zoom\Facades\Zoom;

class LiveController extends Controller
{
    use MeetingZoomTrait;

    public static function generateLiveCode(){
        /**
         * gen un code
         * vérifier en Bd son unicité
         **/

        // return $code;
    }

    /**
     * Récupérer la liste des Lives créés de l'utilisateur connecté
     */
    public function getUserLives()
    {

        $data = [
            'title' => "Live - ",
            'lives' => auth()->user()->onlines
        ];

        return view("user.lives.index", $data);
    }

    public function getNbreConectedUsers(Request $request)
    {
        $live = online_classe::where('uuid', $request->uid)->first();

        echo json_encode([
            'users' => $live->participants->count()
        ]);
    }

    public function create(Request $request)
    {


        $this->validate($request, [
            'title' => "string",
            'start_time' => "date",
            'ue' => "required|exists:ues,id",
        ]);
        $nom = Str::uuid();
        Live::create([
            'uuid' => $nom,
            'titre' => $request->title,
            'date_debut' => strtotime($request->start_time),
            'user_id' => auth()->user()->id,
            'ue_id' => $request->ue
        ]);

            $meeting = $this->createMeeting($request);

            online_classe::create([
                'uuid' => $nom,
                'user_id' => auth()->user()->id,
                'ue_id' => $request->ue,
                'meeting_id' => $meeting->id,
                'topic' => $request->title,
                'start_at' => strtotime($request->start_time),
                'duration' => $meeting->duration,
                'password' => $meeting->password,
                'start_url' => $meeting->start_url,
                'join_url' => $meeting->join_url,
            ]);


        return redirect()->back();
    }

    public function delete(Request $request)
    {
        $this->validate($request, [
            'live' => "required",
        ]);


        //$live = online_classe::where([
        //    'id' => $request->live,
        //    'user_id' => auth()->user()->id
        //])->first();

        $meeting = Zoom::meeting()->find($request->live);
        $meeting->delete();
        online_classe::where('meeting_id', $request->live)->delete();

        //online_classe::where('meeting_id', $request->id)->delete();

        //if(!is_null($live)) {
        //    $live->delete();
       // }

        return redirect()->back();
    }

    public function live($live_code)
    {
        $live = online_classe::where('uuid', $live_code)->first();
        $online = Live::where('uuid', $live_code)->first();

        if(is_null($live)){
            abort(404);
        }

        //dd(auth()->user()->name);
        $data = [
            'title' => "Assist Live - ",
            'live' => $live,
            'nom' => auth()->user()->name,
            'online' => $online,
        ];

        return view("user.lives.assist", $data);
    }
}

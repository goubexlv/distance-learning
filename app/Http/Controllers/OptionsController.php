<?php

namespace App\Http\Controllers;


use App\Models\Option;
use App\Models\Post;
use App\Models\Question;
use App\Models\Ue;
use Illuminate\Http\Request;

class OptionsController extends Controller
{
    public function index($code)
    {

        $options = Option::where('code', $code)->where("type_exam", 'sn')->get();

        $ue = Ue::whereCode($code)->first();

        if(is_null($ue)){
            abort(404);
        }

        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'options' => $options,
        ];

       // dd($data);


        return view("teacher.options.index", $data);
    }

    public function index_cc($code)
    {

        $options = Option::where('code', $code )->where("type_exam", 'cc')->get();

        $ue = Ue::whereCode($code)->first();

        if(is_null($ue)){
            abort(404);
        }

        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'options' => $options,
        ];

       // dd($data);


        return view("teacher.cc.options.index", $data);
    }

    public function create($code)
    {
        $options = Option::where('code', $code)->where("type_exam", 'sn')->get();
        $questions = Question::where('code', $code)->where("type_exam", 'sn')->get();

        // The UE does not exists
        $ue = Ue::whereCode($code)->first();

        if(is_null($ue)){
            abort(404);
        }

        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'questions' => $questions,
            'options' => $options,
        ];
        //dd($data);

     return view('teacher.options.create', $data);
    }

    public function create_cc($code)
    {
        $options = Option::where('code', $code )->where("type_exam", 'cc')->get();
        $questions = Question::where('code', $code )->where("type_exam", 'cc')->get();

        // The UE does not exists
        $ue = Ue::whereCode($code)->first();

        if(is_null($ue)){
            abort(404);
        }

        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'questions' => $questions,
            'options' => $options,
        ];
        //dd($data);
        return view('teacher.cc.options.create', $data);
    }

    public function newoptions(Request $request, $code)
    {

        $options = Option::where('code', $code)->where("type_exam", 'sn')->get();
        $questions = Question::where('question_text', $request->question)->where("type_exam", 'sn')->first();
        // The UE does not exists
        $ue = Ue::whereCode($code)->first();

        if(is_null($ue)){
            abort(404);
        }

        $this->validate($request, [
            'question' => "required",
            'option_text' => "required",
            'points' => "required",
            // 'poste' => "required",
        ]);

        Option::create([
            'question_id' => $questions->id,
            'code' => $code,
            'question' => $request->question,
            'option_text' => $request->option_text,
            'points' => $request->points,
            'type_exam' => 'sn'

        ]);



        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'options' => $options,
        ];
       // dd($data);
        return view('teacher.options.index',$data);
    }

    public function newoptions_cc(Request $request, $code)
    {

        $options = Option::where('code', $code)->where("type_exam", 'cc')->get();
        $questions = Question::where('question_text', $request->question)->where("type_exam", 'cc')->first();
        // The UE does not exists
        $ue = Ue::whereCode($code)->first();

        if(is_null($ue)){
            abort(404);
        }

        $this->validate($request, [
            'question' => "required",
            'option_text' => "required",
            'points' => "required",
            // 'poste' => "required",
        ]);

        Option::create([
            'question_id' => $questions->id,
            'code' => $code,
            'question' => $request->question,
            'option_text' => $request->option_text,
            'points' => $request->points,
            'type_exam' => 'cc',

        ]);



        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'options' => $options,
        ];
       // dd($data);
        return view('teacher.cc.options.index',$data);
    }


    public function deleteoption($id)
    {
        $options = Option::find($id);

        if(!is_null($options)){
            $options->delete();
        }

        return redirect()->back();
    }





}

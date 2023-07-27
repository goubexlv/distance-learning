<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreTestRequest;
use App\Models\Post;
use App\Models\Result;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Ue;
use App\Models\User;
use App\Models\Course;
use App\Models\Module;
use App\Models\Part;
use App\Models\Section;
use Illuminate\Support\Str;
use App\Http\Requests\Admin\QuestionRequest;
use App\Models\Question;

use Illuminate\Contracts\View\View;
use App\Http\Controllers\Controller;
use App\Models\Option;
use App\Models\Tpexamination;
use Illuminate\Http\RedirectResponse;
use Barryvdh\DomPDF\Facade\Pdf;



class ExaminationController extends Controller
{


    public function createexam(Request $request, $code)
    {
        error_reporting(0);

        $this->validate($request, [
            'document' => ['required','mimes:txt']
        ]);

        $doc_file= $request->document;
        $doc_name = explode(".", $doc_file->getClientOriginalName());
        $doc_name = Str::uuid().".".end($doc_name);
        $doc_file->move("uploads/sn/", $doc_name);
        $chemin = "uploads/sn/".$doc_name;
        $lignes = file($chemin);
        $question = "";
        $option = "";
        $idp = 0;
        foreach($lignes as $ligne){

            $lig = trim($ligne);

            if($lig[0] == "?"){
                $lig = substr($lig,1);
                $question = $lig;
                $idop = Question::create([
                    'code' => $code,
                    'question_text' => $question,
                    'type_exam' => 'sn'

                ]);

                Post::create([

                    'question_id' => $idop->id,
                    'option_id' => 0,
                    'code' => $code,
                    'type_exam' => "sn"

                ]);
                $idp = $idop->id;
            }elseif($lig[0] == "!"){
                $lig = substr($lig,1);
                $option = $lig;
            }elseif($lig[0] == "*"){
                $points = substr($lig,1);
                $points = (int)$points;
                Option::create([
                    'question_id' => $idp,
                    'code' => $code,
                    'question' => $question,
                    'option_text' => $option,
                    'points' => $points,
                    'type_exam' => "sn"

                ]);

            }


        }

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

        ];

        return view("teacher.questions.index", $data);
    }

    public function createexam_cc(Request $request, $code)
    {
        error_reporting(0);

        $this->validate($request, [
            'document' => ['required','mimes:txt']
        ]);

        $doc_file= $request->document;
        $doc_name = explode(".", $doc_file->getClientOriginalName());
        $doc_name = Str::uuid().".".end($doc_name);
        $doc_file->move("uploads/cc/", $doc_name);
        $chemin = "uploads/cc/".$doc_name;
        $lignes = file($chemin);
        $question = "";
        $option = "";
        $idp = 0;
        foreach($lignes as $ligne){

            $lig = trim($ligne);

            if($lig[0] == "?"){
                $lig = substr($lig,1);
                $question = $lig;
                $idop = Question::create([
                    'code' => $code,
                    'question_text' => $question,
                    'type_exam' => 'cc'

                ]);

                Post::create([

                    'question_id' => $idop->id,
                    'option_id' => 0,
                    'code' => $code,
                    'type_exam' => "cc"

                ]);
                $idp = $idop->id;
            }elseif($lig[0] == "!"){
                $lig = substr($lig,1);
                $option = $lig;
            }elseif($lig[0] == "*"){
                $points = substr($lig,1);
                $points = (int)$points;
                Option::create([
                    'question_id' => $idp,
                    'code' => $code,
                    'question' => $question,
                    'option_text' => $option,
                    'points' => $points,
                    'type_exam' => "cc"

                ]);

            }


        }

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

        ];

        return view("teacher.cc.questions.index", $data);
    }
    public function index()
    {

        return view("teacher.examination.add_examination");
    }

       //test evaluation

       public function follow_examination($code)
       {
            //$note = User::with([userResults])
           // The UE does not exists
           $ue = Ue::whereCode($code)->first();

           $aff = Post::all();


            if(count($aff) > 20){
                $afficher = Post::with(['question' => function ($query) {
                    $query->with(['option'])->where('type_exam', 'sn')->get();
                }])->where('code', $code)->where('type_exam', 'sn')->get();
            }else{
                $afficher = Post::with(['question' => function ($query) {
                    $query->with(['option'])->where('type_exam', 'sn')->get();
                }])->where('code', $code)->where('type_exam', 'sn')->get();

            }

            //dd($afficher);

           if(is_null($ue)){
               abort(404);
           }

           //dd($afficher);
           $data = [
               'title' => "$ue->name",
               'ue'=> $ue,
               'afficher' => $afficher,
           ];

           //dd($data);
           return view('user.examination.examination', $data);
       }

       public function follow_examination_cc($code)
       {
            //$note = User::with([userResults])
           // The UE does not exists
           $ue = Ue::whereCode($code)->first();

           $aff = Post::all();


            if(count($aff) > 20){
                $afficher = Post::with(['question' => function ($query) {
                    $query->with(['option'])->where('type_exam', 'cc')->get();
                }])->where('code', $code)->where('type_exam', 'cc')->get();
            }else{
                $afficher = Post::with(['question' => function ($query) {
                    $query->with(['option'])->where('type_exam', 'cc')->get();
                }])->where('code', $code)->where('type_exam', 'cc')->get();

            }

            //dd($afficher);

           if(is_null($ue)){
               abort(404);
           }

           //dd($afficher);
           $data = [
               'title' => "$ue->name",
               'ue'=> $ue,
               'afficher' => $afficher,
           ];


           //dd($data);
           return view('user.examination.examination_cc', $data);
       }


    public function add_examination($code, $chapter=null)
    {
        // The UE does not exists
        $ue = Ue::whereCode($code)->first();
        if(is_null($ue)){
            abort(404);
        }

        // he has not paid for this level
        if(!in_array(auth()->user()->id, $ue->semester->level->participants()->pluck('user_id')->toArray())){
            // abort(404);
        }

        if(!is_null($chapter)){
            $chapter = $ue->chapters()->where('chapters.id', $chapter)->first();
        }else{
            $chapter = @$ue->chapters[0];
        }

        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'chapter'=> $chapter,
        ];

        return view('teacher.examination.add_examination',$data);
    }

    public function add_examination_cc($code, $chapter=null)
    {
        // The UE does not exists
        $ue = Ue::whereCode($code)->first();
        if(is_null($ue)){
            abort(404);
        }

        // he has not paid for this level
        if(!in_array(auth()->user()->id, $ue->semester->level->participants()->pluck('user_id')->toArray())){
            // abort(404);
        }

        if(!is_null($chapter)){
            $chapter = $ue->chapters()->where('chapters.id', $chapter)->first();
        }else{
            $chapter = @$ue->chapters[0];
        }

        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'chapter'=> $chapter,
        ];



        return view('teacher.cc.examination.add_examination',$data);
    }

//question du QCM
    public function index1($code, $chapter=null)
    {
        $type = "sn";
        $questions = Question::where('code', $code )->where("type_exam", $type)->get();

        // The UE does not exists
        $ue = Ue::whereCode($code)->first();

        if(is_null($ue)){
            abort(404);
        }

        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'questions' => $questions,

        ];
        //dd($data);
        return view('teacher.questions.index', $data);
    }

    public function index1_cc($code, $chapter=null)
    {
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

        ];

        return view('teacher.cc.questions.index', $data);
    }

    public function create($code)
    {
        $questions = Question::where('code', $code)->where("type_exam", 'sn')->get();

        // The UE does not exists
        $ue = Ue::whereCode($code)->first();

        if(is_null($ue)){
            abort(404);
        }

        // he has not paid for this level
        if(!in_array(auth()->user()->id, $ue->semester->level->participants()->pluck('user_id')->toArray())){
            // abort(404);
        }


        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'questions' => $questions,
        ];
        //dd($data);
        return view('teacher.questions.create', $data);
    }

    public function create_cc($code)
    {
        $questions = Question::where('code', $code )->where("type_exam", 'cc')->get();

        // The UE does not exists
        $ue = Ue::whereCode($code)->first();

        if(is_null($ue)){
            abort(404);
        }

        // he has not paid for this level
        if(!in_array(auth()->user()->id, $ue->semester->level->participants()->pluck('user_id')->toArray())){
            // abort(404);
        }


        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'questions' => $questions,
        ];
        //dd($data);
        return view('teacher.cc.questions.create', $data);
    }

    public function newquestion(Request $request)
    {

        $questions = Question::where('code', $request->code_ue)->where("type_exam", 'sn')->get();

        // The UE does not exists
        $ue = Ue::whereCode($request->code_ue)->first();

        if(is_null($ue)){
            abort(404);
        }

        $this->validate($request, [
            'code_ue' => "required",
            // 'poste' => "required",
        ]);

        $idop = Question::create([
            'code' => $request->code_ue,
            'question_text' => $request->question_text,
            'type_exam' => 'sn',

        ]);

        Post::create([

            'question_id' => $idop->id,
            'option_id' => 0,
            'code' => $request->code_ue,
            'type_exam' => 'sn',

        ]);

        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'questions' => $questions,
        ];
        //dd($data);
        return view('teacher.questions.index',$data);
    }

    public function newquestion_cc(Request $request)
    {

        $questions = Question::where('code', $request->code_ue  )->where("type_exam", 'cc')->get();

        // The UE does not exists
        $ue = Ue::whereCode($request->code_ue)->first();

        if(is_null($ue)){
            abort(404);
        }

        $this->validate($request, [
            'code_ue' => "required",
            // 'poste' => "required",
        ]);

        $idop = Question::create([
            'code' => $request->code_ue,
            'question_text' => $request->question_text,
            'type_exam' => 'cc',

        ]);

        Post::create([

            'question_id' => $idop->id,
            'option_id' => 0,
            'code' => $request->code_ue,
            'type_exam' => 'cc',

        ]);

        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'questions' => $questions,
        ];
        //dd($data);
        return view('teacher.cc.questions.index',$data);
    }

    public function deletequestion($id)
    {
        $question = Question::find($id);

        if(!is_null($question)){
            $question->delete();
        }

        return back()->with([
            'message' => 'successfully deleted !',
            'alert-type' => 'danger'
        ]);
    }

    public function editquestion($id)
    {
        $questions = Question::where('id', $id)->first();
        $ue = Ue::whereCode($questions->code)->first();

        if(is_null($ue)){
            abort(404);
        }

        if(is_null($questions)){
            return redirect()->route('teacher.questions');
        }

        $data =[
            'title' => "$ue->name",
            'ue'=> $ue,
            'questions' => $questions,
        ];
        //dd($data);
        return view("teacher.questions.edit", $data);
    }

    public function editquestion_cc($id)
    {
        $questions = Question::where('id', $id)->first();
        $ue = Ue::whereCode($questions->code)->first();

        if(is_null($ue)){
            abort(404);
        }

        if(is_null($questions)){
            return redirect()->route('teacher.cc.questions');
        }

        $data =[
            'title' => "$ue->name",
            'ue'=> $ue,
            'questions' => $questions,
        ];
        //dd($data);
        return view("teacher.cc.questions.edit", $data);
    }


    public function updatequestion(Request $request, $id)
    {
        $this->validate($request, [
            'question_text' => "required",
        ]);


        $question = Question::find($id);

        $question->update([
            'code' => $request->code_ue,
            'question_text' => $request->question_text,
        ]); $question->save();

        return redirect()->back();

    }



      //resultat et evaluation

      public function tpstore(Request $request, $ue, $id)
    {
        $this->validate($request, [
            'document' => ['required','mimes:rar']
        ]);

        $id = (int)$id;
        if(!is_null($request->document)){
            $tp_file= $request->document;
            $tp_name = explode(".", $tp_file->getClientOriginalName());
            $tp_name = $tp_name[0].".".end($tp_name);
            $tp_file->move("uploads/tp/", $tp_name);
        }

        Tpexamination::create([
            'document' => $tp_name,
            'user_id' => $id,
            'code' => $ue,
            'note_tp' => 0
        ]);

        return redirect()->back();

    }

      public function store(Request $request, $code)
      {

          $options = Option::find(array_values($request->input('questions')));

          $result = auth()->user()->userResults()->create([
              'code' => $code,
              'total_points' => $options->sum('points'),
              'type_exam' => 'sn'
          ]);

          $questions = $options->mapWithKeys(function ($option) {
              return [$option->question_id => [
                          'option_id' => $option->id,
                          'points' => $option->points
                      ]
                  ];
              })->toArray();

          $result->questions()->sync($questions);

         return redirect()->route('user.results', $code);
     }

     public function store_cc(Request $request, $code)
     {

         $options = Option::find(array_values($request->input('questions')));

         $result = auth()->user()->userResults()->create([
             'code' => $code,
             'total_points' => $options->sum('points'),
             'type_exam' => 'cc'
         ]);

         $questions = $options->mapWithKeys(function ($option) {
             return [$option->question_id => [
                         'option_id' => $option->id,
                         'points' => $option->points
                     ]
                 ];
             })->toArray();

         $result->questions()->sync($questions);

        return redirect()->route('user.results', $code);
    }

    public function index2($code)
    {
        $questions = Question::where('code', $code)->get();

        $results = Result::where('code', $code)->where('type_exam', 'sn')->get();
        // The UE does not exists
        $ue = Ue::whereCode($code)->first();

        if(is_null($ue)){
            abort(404);
        }

        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'results' => $results,

        ];
        //dd($data);
        return view('teacher.results.index', $data);
    }

    public function index2_cc($code)
    {
        $questions = Question::where('code', $code)->where('type_exam', 'cc')->get();

        $results = Result::where('code', $code)->where('type_exam', 'cc')->get();
        // The UE does not exists
        $ue = Ue::whereCode($code)->first();

        if(is_null($ue)){
            abort(404);
        }

        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'results' => $results,

        ];
        //dd($data);
        return view('teacher.cc.results.index', $data);
    }

    public function tpcontrole($code)
    {
        $tpexam = Tpexamination::where('code', $code)->get();

        // The UE does not exists
        $ue = Ue::whereCode($code)->first();

        if(is_null($ue)){
            abort(404);
        }

        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'tpexam' => $tpexam,

        ];
        //dd($data);
        return view('teacher.results.tpindex', $data);
    }

    public function downloadtp($code)
    {
        $tpexam = Tpexamination::where('code', $code)->get();

        // The UE does not exists
        $ue = Ue::whereCode($code)->first();

        if(is_null($ue)){
            abort(404);
        }

        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'tpexam' => $tpexam,

        ];
        //dd($data);
        return view('teacher.results.tpindex', $data);
    }

    public function updatetp(Request $request, $id)
    {

        //dd($id);


        $tps = Tpexamination::find($id);

        $tps->update([
            'note_tp' => $request->note,
        ]); $tps->save();

        return redirect()->back();

    }

    //resultat


    public function show2($code){


        //$dernier = Result::where('code', $code)->latest();
        $dernier = Result::where('code', $code)->where('type_exam', 'sn')->get()->last();

        $result = Result::whereHas('user', function ($query) {
            $query->whereId(auth()->id());
        })->findOrFail($dernier->id);



    $ue = Ue::whereCode($result->code)->first();
    $data = [
        'title' => "$ue->name",
        'result'=> $result,
        'ue'=> $ue,
    ];

    return view('user.examination.results', $data);
}

public function show2_cc($code){


    //$dernier = Result::where('code', $code)->latest();
    $dernier = Result::where('code', $code)->where('type_exam', 'sn')->get()->last();

    $result = Result::whereHas('user', function ($query) {
        $query->whereId(auth()->id());
    })->findOrFail($dernier->id);



$ue = Ue::whereCode($result->code)->first();
$data = [
    'title' => "$ue->name",
    'result'=> $result,
    'ue'=> $ue,
];

return view('user.examination.results', $data);
}

public function consulter($result_id){




    $results_sn = Result::where('user_id', $result_id)->where('type_exam', 'sn')->get();
    $results_cc = Result::where('user_id', $result_id)->where('type_exam', 'cc')->get();
    $results_tp = Tpexamination::where('user_id', $result_id)->get();

    $tableaucode = [];
    $tableaunom = [];
    $tableaunotecc = [];
    $tableaunotetp = [];
    $tableaunotetpfinal = [];
    $tableaunoteccfinal = [];

    foreach ($results_tp as $value){

        $tableaunotetp [$value->code] =   $value->note_tp;
        $tableaunotetpfinal [] = $value->code;
    }

    foreach ($results_cc as $value){

        $tableaunotecc [$value->code] =   $value->total_points;
        $tableaunoteccfinal [] = $value->code;
    }

    foreach ($results_sn as $value){

        $tableaucode [] =   $value->code;
    }

    foreach ($tableaucode as $value){

        $ue = Ue::whereCode($value)->first();
        $tableaunom [$value] =   $ue->name;

        if(!in_array($value, $tableaunotetpfinal)){
            $tableaunotetp[$value] =  0;
        }

        if(!in_array($value, $tableaunoteccfinal)){
            $tableaunotecc[$value] =  0;
        }


    }


    $data = [
        'title' => "All UEs - ",
        'titre' => $tableaunom,
        'notecc' => $tableaunotecc,
        'notetp' => $tableaunotetp,
        'results'=> $results_sn,

    ];

   // dd($data);

    return view('user.examination.consulter', $data);
}






}

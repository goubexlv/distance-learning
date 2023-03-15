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
use Illuminate\Http\RedirectResponse;


class ExaminationController extends Controller
{


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


           $afficher = Post::with(['question' => function ($query) {
               $query->with(['option'])->get();
           }])->where('code', $code)->get();

           if(is_null($ue)){
               abort(404);
           }
           $nbr = count($afficher);

           $data = [
               'title' => "$ue->name",
               'ue'=> $ue,
               'afficher' => $afficher,
           ];

           //dd($afficher);
           return view('user.examination.examination', $data);
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

//question du QCM
    public function index1($code, $chapter=null)
    {
        $questions = Question::where('code', $code)->get();

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

    public function create($code)
    {
        $questions = Question::where('code', $code)->get();

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

    public function newquestion(Request $request)
    {

        $questions = Question::where('code', $request->code_ue)->get();

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

        ]);

        Post::create([

            'question_id' => $idop->id,
            'option_id' => 0,
            'code' => $request->code_ue,

        ]);

        $data = [
            'title' => "$ue->name",
            'ue'=> $ue,
            'questions' => $questions,
        ];
        //dd($data);
        return view('teacher.questions.index',$data);
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

      public function store(Request $request, $code)
      {
          $options = Option::find(array_values($request->input('questions')));

          $result = auth()->user()->userResults()->create([
              'code' => $code,
              'total_points' => $options->sum('points')
          ]);

          $questions = $options->mapWithKeys(function ($option) {
              return [$option->question_id => [
                          'option_id' => $option->id,
                          'points' => $option->points
                      ]
                  ];
              })->toArray();

          $result->questions()->sync($questions);

         return redirect()->route('user.index')->with(
             'message','Evaluation Enregistrez !');
     }

    public function index2($code)
    {
        $questions = Question::where('code', $code)->get();

        $results = Result::where('code', $code)->get();
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




}

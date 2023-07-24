<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Option extends Model
{
    use HasFactory;

    protected $fillable=[
        'question_id',
        'code',
        'question',
        'option_text',
        'points',
        'type_exam'
    ];

    public function ue()
    {
        return $this->belongsTo(Ue::class);
    }

    public function question(){
        return $this->belongsTo(Question::class, "question_id");
    }


}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    use HasFactory;

    protected $fillable=[
        'code',
        'question_text',
        'type_exam'
    ];

    public function ue()
    {
        return $this->belongsTo(Ue::class);
    }

    public function option(){
        return $this->hasMany(Option::class);
    }

}

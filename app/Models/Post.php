<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    protected $fillable=[
        'question_id',
        'option_id',
        'code',
    ];

    public function question(){
        return $this->hasMany(Question::class, 'id');
    }


}

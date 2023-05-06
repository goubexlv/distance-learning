<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class online_classe extends Model
{
    use HasFactory;

    public $fillable= ['uuid','user_id','ue_id','meeting_id','topic','start_at','duration','password','start_url','join_url'];



       public function ue()
       {
           return $this->belongsTo(Ue::class);
       }

       public function section()
       {
           return $this->belongsTo('App\Models\Section', 'section_id');
       }

       public function user()
       {
           return $this->belongsTo(User::class, 'user_id');
       }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Result extends Model
{
    use HasFactory;

    protected $guarded = ['id', 'created_at', 'updated_at'];

    protected $fillable=[
        'code',
        'total_points'
    ];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function questions()
    {
        return $this->belongsToMany(Question::class)->withPivot(['option_id', 'points']);
    }
    public function ue()
    {
        return $this->belongsTo(Ue::class, 'code');
    }
}

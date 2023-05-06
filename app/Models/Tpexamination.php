<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tpexamination extends Model
{
    use HasFactory;

    protected $fillable=[
        'document',
        'user_id',
        'code',
        'note_tp'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function ues()
    {
        return $this->belongsToMany(Ue::class);
    }

}

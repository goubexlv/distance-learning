<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ForumController extends Controller
{
    //
    public function forum()
    {
        $data= [
            'title' => ""
        ];
        return view("vendor.forum.master",$data);
    }
}

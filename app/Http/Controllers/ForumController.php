<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; // Assure-toi d'importer la façade DB
use Illuminate\Support\Facades\View;

class ForumController extends Controller
{

    public function forum()
    {
        // Récupère tous les sujets depuis la table "forum_threads" avec les catégories associées
    $threads = DB::table('forum_threads')
    ->select('forum_threads.id', 'forum_threads.title', 'forum_categories.title as category_name')
    ->join('forum_categories', 'forum_threads.category_id', '=', 'forum_categories.id')
    ->get();

     // Pour chaque sujet, récupère les posts associés depuis la table "forum_posts"
     foreach ($threads as $thread) {
        $posts = DB::table('forum_posts')
            ->where('thread_id', $thread->id)
            ->get();
        // Ajoute les posts associés au sujet dans le tableau $thread
        $thread->posts = $posts;  
    }

    $categories = DB::table('forum_categories')->get();

    // Puis renvoie la vue qui affiche la liste des sujets avec les données nécessaires
    return view('vendor.forum.master', compact('threads', 'categories'));
    }
    
    public function index()
    {
        // Votre logique pour récupérer les catégories depuis la base de données ici
        $categories = DB::table('forum_categories')->get();

        // Renvoie la vue avec les données récupérées
        //return view('vendor.forum.category.index', compact('threads', 'categories'));
        return View::make('vendor.forum.category.index', compact('categories'));
        // Passer les données des catégories à la vue "forum.category.index"
    }
}


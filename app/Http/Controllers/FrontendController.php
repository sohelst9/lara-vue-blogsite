<?php

namespace App\Http\Controllers;

use App\Http\Resources\blogResource;
use App\Models\BlogPost;
use Illuminate\Http\Request;

class FrontendController extends Controller
{
    //--index
    public function index(){
        // return 'dsdsd';
        return blogResource::collection(BlogPost::latest()->take(20)->get());
    }

    //--single_blog
    public function single_blog($slug)
    {
        return 'dd';
       return $post = BlogPost::where('slug', $slug)->first();
    }
}

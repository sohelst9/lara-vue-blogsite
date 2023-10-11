<?php

namespace App\Http\Controllers;

use App\Http\Resources\blogResource;
use App\Models\BlogPost;
use App\Models\Category;
use Illuminate\Http\Request;

class FrontendController extends Controller
{
    //--index
    public function index(){
        return blogResource::collection(BlogPost::latest()->take(20)->get());
    }
    //--single_blog
    public function single_blog($slug)
    {
        $post = BlogPost::where('slug', $slug)->first();
        return new blogResource($post);
    }
    //--related_blog
    public function related_blog($slug)
    {
        $post = BlogPost::where('slug', $slug)->first();
        $category = Category::findOrFail($post->category_id);
        if($category){
            $related_blog = $category->blog()->where('id', '!=', $post->id)->latest()->take(3)->get();
            return blogResource::collection($related_blog);
        }else{
            return "Category Id Not found";
        }
    }
    //--all_blogs
    public function all_blogs(Request $request)
    {
        //category_based blog post
        if($request->category){
          return  $blogs = blogResource::collection(Category::where('name', $request->category)->firstOrFail()->blog()->latest()->paginate(2)->withQueryString());
        }
        //search blog post
        elseif($request->search){
           return $blogs = blogResource::collection(BlogPost::where('title', 'LIKE', '%'.$request->search.'%')->paginate(2)->withQueryString());
        }
        //--all blog post
       return $blogs =  blogResource::collection(BlogPost::latest()->paginate(2));
    }

    //--all_categories
    public function all_categories()
    {
        return $categories = Category::take(4)->get();
    }
}

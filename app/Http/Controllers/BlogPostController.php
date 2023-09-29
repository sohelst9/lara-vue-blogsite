<?php

namespace App\Http\Controllers;

use App\Models\BlogPost;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class BlogPostController extends Controller
{
    //---store
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title'=>'required',
            'description'=>'required',
            'category_id'=>'required',
            'file'=>'required | image',
        ]);

        if($validator->fails()){
            return response()->json([
                'status' => 422,
                'errors' => $validator->messages()
            ], 422);
        }
        else{
            $slug = Str::slug($request->title, '-');
            if(!BlogPost::count()){
                $postId = 1;
            }else{
                $postId = BlogPost::latest()->first()->id +1;
            }

            $file = $request->file('file')->extension();
            $file_name = $slug.'-'.$postId.'.'.$file;
            $name = 'uploads/Blog/'.$slug.'-'.$postId.'.'.$file;
            $request->file('file')->move(public_path('uploads/Blog'), $file_name);


            $blog = BlogPost::create([
                'title' => $request->title,
                'slug' => $slug,
                'meta_title' => $request->meta_title,
                'meta_description' => $request->meta_description,
                'meta_keyword' => $request->meta_keyword,
                'image'=>$name,
                'category_id' => $request->category_id,
                'user_id' => auth()->user()->id,
                'description' => $request->description,
            ]);
            if ($blog) {
                return response()->json([
                    'status' => 200,
                    'message' => 'Blog Post Created Successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 500,
                    'message' => 'Something Went Wrong. Please Try Again!',
                ], 500);
            }
        }
    }
}

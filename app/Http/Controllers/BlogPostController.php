<?php

namespace App\Http\Controllers;

use App\Http\Resources\blogResource;
use App\Models\BlogPost;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class BlogPostController extends Controller
{
    //----show
    public function show()
    {
        $user = User::findOrFail(auth()->user()->id);
        if ($user->admin_check == 1) {
            return blogResource::collection(BlogPost::latest()->get());
        } else {
            return blogResource::collection(BlogPost::where('user_id', $user->id)->latest()->take(20)->get());
        }
    }
    //---store
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'description' => 'required',
            'category_id' => 'required',
            'file' => 'required | image',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->messages()
            ], 422);
        } else {
            $slug = Str::slug($request->title, '-');
            if (!BlogPost::count()) {
                $postId = 1;
            } else {
                $postId = BlogPost::latest()->first()->id + 1;
            }

            $file = $request->file('file')->extension();
            $file_name = $slug . '-' . $postId . '.' . $file;
            $name = 'uploads/Blog/' . $slug . '-' . $postId . '.' . $file;
            $request->file('file')->move(public_path('uploads/Blog'), $file_name);


            $blog = BlogPost::create([
                'title' => $request->title,
                'slug' => $slug,
                'meta_title' => $request->meta_title,
                'meta_description' => $request->meta_description,
                'meta_keyword' => $request->meta_keyword,
                'image' => $name,
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

    //---edit
    public function edit($slug)
    {
        $blog = BlogPost::where('slug', $slug)->first();
        if ($blog) {
            return response()->json($blog);
        } else {
            return response()->json('blog Not Found');
        }
    }

    //--update
    public function update(Request $request, $slug)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'description' => 'required',
            'category_id' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->messages()
            ], 422);
        } else {
            $blog = BlogPost::where('slug', $slug)->first();
            if ($blog) {
                $blog->update([
                    'title' => $request->title,
                    'slug' =>  Str::slug($request->title, '-'),
                    'meta_title' => $request->meta_title,
                    'meta_description' => $request->meta_description,
                    'meta_keyword' => $request->meta_keyword,
                    'category_id' => $request->category_id,
                    'description' => $request->description,
                ]);

                if ($request->file('file')) {
                    if($blog->image){
                        File::delete(public_path($blog->image));
                    }
                    $file_name = 'update'.'-'.uniqid().'.'. $request->file('file')->getClientOriginalExtension();
                    $path_name = 'uploads/Blog/'.$file_name;
                    $request->file('file')->move(public_path('uploads/Blog'), $file_name);
                    $blog->update([
                        'image' => $path_name
                    ]);

                }
                return response()->json([
                    'status' => 200,
                    'message' => "Blog Post Updated Successfully!"
                ], 200);
            }else{
                return response()->json([
                    'status' => 404,
                    'message' => "Blog Post Not Found!"
                ], 404);
            }
        }
    }

    //----delete
    public function delete($id)
    {
        $blog = BlogPost::findOrFail($id);
        if ($blog) {
            if ($blog->image) {
                File::delete(public_path($blog->image));
            }
            $blog->delete();

            return response()->json([
                'status' => 200,
                'message' => 'Blog Deleted Successfully'
            ], 200);
        } else {
            return response()->json('blog Not Found');
        }
    }
}

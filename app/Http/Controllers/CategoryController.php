<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CategoryController extends Controller
{
    //--index
    public function index()
    {
        $categories = Category::get();
        return response()->json([
            'status' => 200,
            'categories' => $categories
        ]);
    }
    //--store
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validator->messages()
            ], 422);
        } else {
            $category = Category::create([
                'name' => $request->name
            ]);
            if ($category) {
                return response()->json([
                    'status' => 200,
                    'message' => 'Category Created Successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 500,
                    'message' => 'Something Went Wrong. Please Try Again!',
                ], 500);
            }
        }
    }

    //--edit
    public function edit($id)
    {
        $category = Category::where('id', $id)->first();
        if ($category) {
            return response()->json([
                'status' => 200,
                'category' => $category
            ], 200);
        }
        else{
            return response()->json([
                'status'=> 404,
                'message'=>'category not found'
            ], 404);
        }
    }

    //---update
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'name'=>'required',
        ]);
        if($validator->fails()){
            return response()->json([
                'status' => 422,
                'errors' => $validator->messages()
            ], 422);
        }else{
            $category = Category::where('id', $id)->first();
            if($category){
                $category->update([
                    'name'=>$request->name
                ]);

                return response()->json([
                    'status' => 200,
                    'message' => 'Category Updated Successfully'
                ], 200);
            }else{
                return response()->json([
                    'status' => 404,
                    'message' => 'Category Not Found',
                ], 404);
            }
            
        }
    }
    //--delete
    public function delete($id)
    {
        $category = Category::where('id', $id)->first();
        if($category){
            $category->delete();
            return response()->json([
                'status' => 200,
                'message' => 'Category Deleted Successfully'
            ], 200);
        }
        else{
            return response()->json([
                'status' => 404,
                'message' => 'Category Not Found',
            ], 404);
        }
    }
}

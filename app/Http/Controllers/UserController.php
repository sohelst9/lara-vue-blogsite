<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller
{
    //login
    public function login()
    {
        return response()->json([
            'status' => 401,
            'error' => 'Unauthorized'
        ], 401);
    }
    
}

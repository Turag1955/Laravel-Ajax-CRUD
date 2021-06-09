<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class jsController extends Controller
{
    public function index()
    {
        return view('javascript');
    }
    public function get_ajax()
    {
        $text = 'kawsar uddin Turag';
        return response($text);
    }
    public function get_image()
    {
        $image = '<img src="https://www.w3schools.com/css/img_5terre.jpg" alt="" width="50">';
        return response($image);
    }

    public function submit_form(Request $request)
    {
        $name = $request->name;
        return response($name);
    }
}

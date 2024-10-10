<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Doctrine\DBAL\Schema\View;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    //our success route method
    public function success(){
        return view("success");
    }

    //our cancel route method
    public function cancel(){
        return [""];
    }
}

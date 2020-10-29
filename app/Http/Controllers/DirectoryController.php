<?php

namespace App\Http\Controllers;

use App\Directory;
use Illuminate\Http\Request;
use Storage;

class DirectoryController extends Controller
{

	public $public_path = "public";

	
	//Create a Directory
    public function directoryCreate(Request $request)
    {
        $directory_name = $request['directory_name'];
        $current_path = $this->public_path . "/" . $request['current_path'];

        $full_path = $current_path . "/" . $directory_name;

        if(Storage::exists($full_path)){
            return "Directory Exists";
        }
        else{
            // return "Directory will create";
            $response =  Storage::makeDirectory($full_path);

            if($response == 1){
                return "Directory Created Successfully";
            }
            else{
                return "Sorry, Some problem to create directory. Please try again later";
            }
        }
    }
}

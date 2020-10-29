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

    //All contents of a Directory
    public function directoryAllFiles(Request $request)
    {
        //
        $current_path = $this->public_path . "/" . $request['current_path'];

        if(Storage::exists($current_path)){
            $all_contents = [];
            // return "Directory all files show here";
            $folder_contents['directories'] =  Storage::allDirectories($current_path);
            $folder_contents['files'] =  Storage::files($current_path);

            return $folder_contents;
        }
        else{
            return "Directory Not Exists";
        }
    }
}

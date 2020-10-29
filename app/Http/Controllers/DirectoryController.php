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



    //Copy a file to another Directory
    public function fileCopy(Request $request)
    {
        $copy_from = $this->public_path . "/" . $request['copy_from'];
        $copy_to = $this->public_path . "/" . $request['copy_to'];

        if(Storage::exists($copy_from)){

        	if(!Storage::exists($copy_to . "/" . basename($copy_from))){

	            $response = Storage::copy($copy_from, $copy_to . "/" . basename($copy_from));

	            if($response == 1){
	                return "Copy Successfully";
	            }
	            else{
	                return "Sorry, Some problem to copy now. Please try again later";
	            }
	        }
	        else{
	        	return "Can't copy because this name already exists.";
	        }
        }
        else{
            return "Content Not Exists";
        }
    }




    //Move a file to another Directory
    public function fileMove(Request $request)
    {
        $move_from = $this->public_path . "/" . $request['move_from'];
        $move_to = $this->public_path . "/" . $request['move_to'];
        
        if(Storage::exists($move_from)){

            if(!Storage::exists($move_to . "/" . basename($move_from))){

                $response =  Storage::move($move_from, $move_to . "/" . basename($move_from));

                if($response == 1){
                    return "Move Successfully";
                }
                else{
                    return "Sorry, Some problem to move now. Please try again later";
                }
            }
            else{
                return "Can't move because this name already exists.";
            }
        }
        else{
            return "Content Not Exists";
        }
    }
}

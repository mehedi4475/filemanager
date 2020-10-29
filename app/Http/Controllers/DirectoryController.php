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
                return response()->json("Directory Created Successfully");
            }
            else{
                return response()->json("Sorry, Some problem to create directory. Please try again later");
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

            $directory_list = Storage::directories($current_path);
			$folder_contents['directories'] = array_map(function($single){
				return substr($single, strrpos($single, '/') + 1);
			}, $directory_list);


			$file_list = Storage::files($current_path);
			$folder_contents['files'] = array_map(function($file){
				return substr($file, strrpos($file, '/') + 1);
			}, $file_list);


            return $folder_contents;
        }
        else{
           return response()->json("Directory Not Exists");
        }
    }



    // Copy a file to another Directory
    // copy_from = full path + file name
    // copy_to = directory name
    public function fileCopy(Request $request)
    {
        $copy_from = $this->public_path . "/" . $request['copy_from'];
        $copy_to = $this->public_path . "/" . $request['copy_to'];

        if(Storage::exists($copy_from)){

        	if(!Storage::exists($copy_to . "/" . basename($copy_from))){

	            $response = Storage::copy($copy_from, $copy_to . "/" . basename($copy_from));

	            if($response == 1){
	               return response()->json("Copy Successfully");
	            }
	            else{
	                return response()->json("Sorry, Some problem to copy now. Please try again later");
	            }
	        }
	        else{
	        	return response()->json("Can't copy because this name already exists.");
	        }
        }
        else{
            return response()->json("Content Not Exists");
        }
    }




    // Move a file to another Directory
    // move_from = full path + file name
    // move_to = directory name
    public function fileMove(Request $request)
    {
        $move_from = $this->public_path . "/" . $request['move_from'];
        $move_to = $this->public_path . "/" . $request['move_to'];
        
        if(Storage::exists($move_from)){

            if(!Storage::exists($move_to . "/" . basename($move_from))){

                $response =  Storage::move($move_from, $move_to . "/" . basename($move_from));

                if($response == 1){
                    return response()->json("Move Successfully");
                }
                else{
                    return response()->json("Sorry, Some problem to move now. Please try again later");
                }
            }
            else{
                return response()->json("Can't move because this name already exists.");
            }
        }
        else{
           return response()->json("Content Not Exists");
        }
    }


    //Rename File/Directory
    //If rename file, don't show file extension to rename it.
    //Only file name will show and rename
    // old = full path
    // new = full path

    public function rename(Request $request)
    {
        $old = $this->public_path . "/" . $request['old'];
        $new = $this->public_path . "/" . $request['new'];

        if(Storage::exists($old)){

            if(!Storage::exists($new)){

                $response =  Storage::move($old, $new);

                if($response == 1){
                   return response()->json("Rename Successfully");
                }
                else{
                   return response()->json("Sorry, Some problem to rename now. Please try again later");
                }
            }
            else{
                return response()->json("Can't rename because this name already exists.");
            }
        }
        else{
            return response()->json("Content Not Exists");
        }
    }




    //Delete File/Directory
    // path = file/folder path
    // type = directory | file

    public function delete(Request $request)
    {
        $path = $this->public_path . "/" . $request['path'];
        $type = $request['type'];

        if(Storage::exists($path) && $type == "directory"){
            
            $response = Storage::deleteDirectory($path);
            
            if($response == 1){
                return response()->json("Delete Directory Successfully");
            }
            else{
               return response()->json("Sorry, Some problem to delete directory now. Please try again later");
            }
        }
        elseif(Storage::exists($path) && $type == "file"){

            $response = Storage::delete($path);
            
            if($response == 1){
                return response()->json("Delete File Successfully");
            }
            else{
                return response()->json("Sorry, Some problem to delete file now. Please try again later");
            }

        }
        else{
            return response()->json("Not found, Please check file name/path");
        }

    }




    //Upload File
    public function fileUpload(Request $request){

        $this->validate($request, [
            'fileName' => 'required|image|max:102024|mimes:jpeg,png'
        ]);

        $path = $request['path'] OR ".";

        $file_title = $request->file('fileName')->getClientOriginalName();
    	

    	return $temp_path = Storage::disk('public')->putFileAs($path, $request->fileName, $file_title);

        


    }




}

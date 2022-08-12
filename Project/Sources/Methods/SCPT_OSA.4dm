//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_OSA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 06:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_StandardError; $_blb_StandardOutput; $_t_StandardInput)
	C_LONGINT:C283($_l_Platform)
	C_TEXT:C284($_t_boot_volume; $_t_oldMethodName; $_t_script_file_path; $_t_script_folder_path; $_t_StandardOutput; $_t_SystemFolder; $_t_SystemPath; $_t_TargetVolume; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_OSA")


//_O_PLATFORM PROPERTIES($_l_Platform)
Get_PlatformProperty("Platform"; ->$_l_Platform)
If ($_l_Platform=Mac OS:K25:2)
	
	$_t_script_folder_path:=Get 4D folder:C485(Current resources folder:K5:16)+"scpt:"
	$_t_script_file_path:=$_t_script_folder_path+$1
	
	If (Test path name:C476($_t_script_file_path)=Is a document:K24:1)
		
		$_t_SystemPath:=Replace string:C233($_t_script_file_path; ":"; "/")  //the POSIX separator
		$_t_TargetVolume:=Substring:C12($_t_SystemPath; 1; Position:C15("/"; $_t_SystemPath)-1)
		$_t_SystemFolder:=System folder:C487(System:K41:1)  //take care of the /Volumes/ syntax
		$_t_boot_volume:=Substring:C12($_t_SystemFolder; 1; Position:C15(":"; $_t_SystemFolder)-1)
		$_t_script_file_path:=Choose:C955($_t_boot_volume=$_t_TargetVolume; Substring:C12($_t_SystemPath; Position:C15("/"; $_t_SystemPath)); "/Volumes/"+$_t_SystemPath)
		
		LAUNCH EXTERNAL PROCESS:C811("osascript \""+$_t_script_file_path+"\""; $_t_StandardInput; $_blb_StandardOutput; $_blb_StandardError)
		$_t_StandardOutput:=Convert to text:C1012($_blb_StandardOutput; "UTF-8")
		
		If (BLOB size:C605($_blb_StandardError)#0) & (BLOB size:C605($_blb_StandardOutput)=0)
			$0:=Convert to text:C1012($_blb_StandardError; "UTF-8")
		Else 
			$0:=Substring:C12($_t_StandardOutput; 1; Length:C16($_t_StandardOutput)-1)
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("SCPT_OSA"; $_t_oldMethodName)

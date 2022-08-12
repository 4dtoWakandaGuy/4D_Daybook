//%attributes = {}

If (False:C215)
	//Project Method Name:      SCPT_VBS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_StandardError; $_blb_StandardOutput)
	C_LONGINT:C283($_l_Platform)
	C_TEXT:C284($_t_oldMethodName; $_t_script_file_path; $_t_script_folder_path; $_t_StandardInput; $_t_StandardOutput; $0; $1; $2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SCPT_VBS")



//End Project method Amendments

$_t_oldMethodName:=ERR_MethodTracker("SCPT_VBS")


//_O_PLATFORM PROPERTIES($_l_platform)
Get_PlatformProperty("Platform"; ->$_l_Platform)
If ($_l_platform=Windows:K25:3)
	
	$_t_script_folder_path:=Get 4D folder:C485(Current resources folder:K5:16)+"vbs\\"
	$_t_script_file_path:=$_t_script_folder_path+$1
	
	If (Test path name:C476($_t_script_file_path)=Is a document:K24:1)
		
		SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_HIDE_CONSOLE"; "true")
		
		If (Count parameters:C259=2)
			$_t_StandardInput:=$2
		End if 
		
		LAUNCH EXTERNAL PROCESS:C811("cscript //Nologo //U \""+$_t_script_file_path+"\""; $_t_StandardInput; $_blb_StandardOutput; $_blb_StandardError)
		$_t_StandardOutput:=Convert to text:C1012($_blb_StandardOutput; "UTF-16LE")
		
		If (BLOB size:C605($_blb_StandardError)#0) & (BLOB size:C605($_blb_StandardOutput)=0)
			$0:=Convert to text:C1012($_blb_StandardError; "UTF-16LE")
		Else 
			$0:=$_t_StandardOutput
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("SCPT_VBS"; $_t_oldMethodName)

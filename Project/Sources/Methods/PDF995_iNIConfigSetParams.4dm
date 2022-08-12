//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_iNIConfigSetParams
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 16:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_iNIConfigSetParams")

If (Is Windows:C1573)
	$_bo_OK:=PDF995_iNIConfigInit  //read existing options in ini file
	If ($_bo_OK)
		$_bo_OK:=PDF995_iNIConfigSetParam("[Parameters]"; "")  //first line
		$_bo_OK:=PDF995_iNIConfigSetParam("Install="; "1")  //change/add option we want to
		$_bo_OK:=PDF995_iNIConfigSetParam("Quiet="; "0")  //change/add option we want to
		$_bo_OK:=PDF995_iNIConfigSetParam("Use GPL Ghostcript="; "1")  //change/add option we want to
		$_bo_OK:=PDF995_iNIConfigSetParam("User File="; PDF995_targetPathGet)  //change/add option we want to
		$_bo_OK:=PDF995_iNIConfigSetParam("Initial Dir="; PDF995_filePathToDirPath(PDF995_targetPathGet))  //change/add option we want to
		$_bo_OK:=PDF995_iNIConfigSetParam("Launch="; PDF995_targetPathGet)  //change/add option we want to
		$_bo_OK:=PDF995_iNIConfigSetParam("Output File="; PDF995_targetPathGet)  //change/add option we want to
		$_bo_OK:=PDF995_iNIConfigSetParam("AutoLaunch="; String:C10(Num:C11(PDF995_autoLaunchGet)))  //change/add option we want to
		$_bo_OK:=PDF995_iNIConfigSetParam("Initial Dir="; PDF995_filePathToDirPath(PDF995_targetPathGet))  //change/add option we want to
		$_bo_OK:=PDF995_iNIConfigSetParam("Document Name="; "Daybook Report")  //change/add option we want to
		$_bo_OK:=PDF995_iNIConfigSetParam("processpdf="; PDF995_batchFileGet)  //change/add option we want to
		$_bo_OK:=PDF995_iNIConfigSetParam("Output Folder="; PDF995_filePathToDirPath(PDF995_targetPathGet))  //change/add option we want to
		
		If ($_bo_OK)
			$_bo_OK:=PDF995_iNIConfigCommit  //save new config options
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("PDF995_iNIConfigSetParams"; $_t_oldMethodName)

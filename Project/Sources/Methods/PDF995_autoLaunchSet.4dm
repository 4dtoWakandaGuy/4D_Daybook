//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_autoLaunchSet
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
	C_BOOLEAN:C305(<>PDF995_autoLaunchBool; $_bo_OK; $_bo_SetINIFile; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_autoLaunchSet")

If (Count parameters:C259>1)
	$_bo_SetINIFile:=$2
Else 
	$_bo_SetINIFile:=True:C214
End if 

If (Is Windows:C1573)
	
	PDF995_constantsInit
	
	Case of 
		: (Count parameters:C259=0)
			$_bo_SetINIFile:=False:C215  // do nothing
			
		Else 
			<>PDF995_autoLaunchBool:=$1
	End case 
	
	If (($_bo_SetINIFile) & (Test path name:C476(PDF995_iNIFilePathGet)=Is a document:K24:1))
		
		$_bo_OK:=PDF995_iNIConfigInit  //read existing options in ini file
		If ($_bo_OK)
			$_bo_OK:=PDF995_iNIConfigSetParam("AutoLaunch="; String:C10(Num:C11(<>PDF995_autoLaunchBool)))  //change/add option we want to
			If ($_bo_OK)
				$_bo_OK:=PDF995_iNIConfigCommit  //save new config options
			End if 
		End if 
	End if 
End if 

ERR_MethodTrackerReturn("PDF995_autoLaunchSet"; $_t_oldMethodName)

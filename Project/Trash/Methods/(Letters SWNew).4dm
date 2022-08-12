//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letters SWNew
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:22
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters SWNew")
//Letters SWNew
Start_Process
$_bo_Continue:=Letters_File
If ($_bo_Continue)
	Letters_SWNew2
	Process_End
End if 
ERR_MethodTrackerReturn("Letters SWNew"; $_t_oldMethodName)
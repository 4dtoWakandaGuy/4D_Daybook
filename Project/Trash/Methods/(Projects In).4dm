//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Projects In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/02/2010 07:59
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

$_t_oldMethodName:=ERR_MethodTracker("Projects In")
Start_Process
$_bo_Continue:=Projects_File
If ($_bo_Continue)
	
	Gen_InMid("Enter Projects"; "AMaster"; ->[PROJECTS:89])
End if 
Process_End
ERR_MethodTrackerReturn("Projects In"; $_t_oldMethodName)

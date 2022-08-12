//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Standing_CheckP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	_O_C_INTEGER:C282($_l_Number)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Standing_CheckP")
Start_Process
$_l_Number:=Standing_Check
Process_End
ERR_MethodTrackerReturn("Standing_CheckP"; $_t_oldMethodName)
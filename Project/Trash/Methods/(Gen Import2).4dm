//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_Import2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Import2")
While (OK=1)
	RECEIVE RECORD:C79
	DB_SaveRecord
End while 
ERR_MethodTrackerReturn("Gen_Import2"; $_t_oldMethodName)
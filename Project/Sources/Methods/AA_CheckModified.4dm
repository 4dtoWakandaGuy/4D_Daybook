//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_CheckModified
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/06/2014 16:30
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

$_t_oldMethodName:=ERR_MethodTracker("AA_CheckModified")
ERR_MethodTrackerReturn("AA_CheckModified"; $_t_oldMethodName)
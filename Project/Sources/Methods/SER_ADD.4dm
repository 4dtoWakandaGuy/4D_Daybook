//%attributes = {}
If (False:C215)
	//Project Method Name:      SER_ADD
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SER_ADD")
_O_ADD DATA SEGMENT:C361
ERR_MethodTrackerReturn("SER_ADD"; $_t_oldMethodName)
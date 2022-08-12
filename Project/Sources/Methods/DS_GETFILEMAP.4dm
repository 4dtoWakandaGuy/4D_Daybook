//%attributes = {}
If (False:C215)
	//Project Method Name:      DS_GETFILEMAP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2009 13:08:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DS_GETFILEMAP")
//NG MARCH 2004
//This method will read the file map
//pass to pointers
ERR_MethodTrackerReturn("DS_GETFILEMAP"; $_t_oldMethodName)
If (False:C215)
	//object Name: [USER]SalesProjectionEntry.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 16:37
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SalesProjectionEntry.Variable2"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [USER].SalesProjectionEntry.Variable2"; $_t_oldMethodName)
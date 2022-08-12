//%attributes = {}
If (False:C215)
	//Project Method Name:      Lists_InLPA
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
	C_LONGINT:C283(vAdd)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Lists_InLPA")
If (vAdd=1)
	DB_SaveRecord(->[LIST_ITEMS:95])
	AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
	DB_DeletionControl(->[LIST_ITEMS:95])
	
	
	DELETE RECORD:C58([LIST_ITEMS:95])
End if 
ERR_MethodTrackerReturn("Lists_InLPA"; $_t_oldMethodName)
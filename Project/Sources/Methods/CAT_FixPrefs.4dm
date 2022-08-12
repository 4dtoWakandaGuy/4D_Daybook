//%attributes = {}
If (False:C215)
	//Project Method Name:      CAT_FixPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2009 22:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CAT_bo_FixFlag)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAT_FixPrefs")

CAT_bo_FixFlag:=True:C214
ERR_MethodTrackerReturn("CAT_FixPrefs"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      PersonGr_Mod
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
	C_TEXT:C284(<>SYS_t_FormSizeName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PersonGr_Mod")
Minor_ModName(->[PERSONNEL_GROUPS:92]; "Groups"; <>SYS_t_FormSizeName; "Personnel Groups")
ERR_MethodTrackerReturn("PersonGr_Mod"; $_t_oldMethodName)
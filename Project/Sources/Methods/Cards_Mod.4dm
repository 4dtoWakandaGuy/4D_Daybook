//%attributes = {}
If (False:C215)
	//Project Method Name:      Cards_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
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

$_t_oldMethodName:=ERR_MethodTracker("Cards_Mod")
If ((DB_GetModuleSettingByNUM(1))#5)
	Minor_ModName(->[X_URL_LInks:101]; "Cards"; <>SYS_t_FormSizeName; "Card Ranges")
End if 
ERR_MethodTrackerReturn("Cards_Mod"; $_t_oldMethodName)
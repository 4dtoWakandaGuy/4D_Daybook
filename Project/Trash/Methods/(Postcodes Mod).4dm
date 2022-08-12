//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Postcodes Mod
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
	C_TEXT:C284(<>DB_t_PostcodeLabel; <>SYS_t_FormSizeName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Postcodes Mod")
Minor_ModName(->[POSTAL_CODES:50]; "Postcodes"; <>SYS_t_FormSizeName; <>DB_t_PostcodeLabel+"s")
Postcodes_Def
ERR_MethodTrackerReturn("Postcodes Mod"; $_t_oldMethodName)
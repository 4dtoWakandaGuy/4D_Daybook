//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_InDisCode
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

$_t_oldMethodName:=ERR_MethodTracker("Gen_InDisCode")
//If (DB_GetModuleSetting(21)>0)
// If ($1»#"")
// If ((Current user#"Designer") &(Current user#"Designer II") & (Current user#"Ad
//     & (Current user#"Administrator WP"))
//` SET ENTERABLE($1»;False)
// End if
//End if
//`Gen_RemDisDel ($2)
//End if
ERR_MethodTrackerReturn("Gen_InDisCode"; $_t_oldMethodName)
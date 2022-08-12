//%attributes = {}
If (False:C215)
	//Project Method Name:      Qualities_Mod
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
	C_LONGINT:C283(vA)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Qualities_Mod")
Gen_Mod("View Qualitative Information"; "Qualities_File"; "Master"; ->[INFORMATION:55]; ->vA; "Qualities_Sel"; "Qualities")
Comp_Unload
ERR_MethodTrackerReturn("Qualities_Mod"; $_t_oldMethodName)
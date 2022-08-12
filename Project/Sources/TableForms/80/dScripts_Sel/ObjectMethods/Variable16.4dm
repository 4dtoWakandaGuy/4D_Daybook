If (False:C215)
	//object Name: [SCRIPTS]dMacros_Sel.Variable16
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vGroup)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].dMacros_Sel.Variable16"; Form event code:C388)
If (cNAL=0)
	Check_Lists(->vGroup; "Macro Groups")
End if 
ERR_MethodTrackerReturn("OBJ [SCRIPTS].dMacros_Sel.Variable16"; $_t_oldMethodName)

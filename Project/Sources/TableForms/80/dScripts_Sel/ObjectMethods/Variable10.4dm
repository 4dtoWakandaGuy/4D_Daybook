If (False:C215)
	//object Name: [SCRIPTS]dMacros_Sel.Variable10
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
	C_LONGINT:C283(iNoDear; iNoSal)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].dMacros_Sel.Variable10"; Form event code:C388)
If (iNoSal=1)
	iNoDear:=0
End if 
ERR_MethodTrackerReturn("OBJ [SCRIPTS].dMacros_Sel.Variable10"; $_t_oldMethodName)

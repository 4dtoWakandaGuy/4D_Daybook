If (False:C215)
	//object Name: [SCRIPTS]dMacros_Sel.Popup Drop down List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/06/2010 20:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SRProdCode;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].dMacros_Sel.Popup Drop down List"; Form event code:C388)

If (SRProdCode=0)
	SRProdCode:=1
End if 
ERR_MethodTrackerReturn("OBJ [SCRIPTS].dMacros_Sel.Popup Drop down List"; $_t_oldMethodName)

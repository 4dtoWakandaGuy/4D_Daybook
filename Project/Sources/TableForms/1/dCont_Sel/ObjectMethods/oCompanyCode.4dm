If (False:C215)
	//object Name: [CONTACTS]dCont_Sel.oCompanyCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vCompCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dCont_Sel.oCompanyCode"; Form event code:C388)
Sel_LPCompCode(->vCompCode; ->[CONTACTS:1])
ERR_MethodTrackerReturn("OBJ [CONTACTS].dCont_Sel.oCompanyCode"; $_t_oldMethodName)

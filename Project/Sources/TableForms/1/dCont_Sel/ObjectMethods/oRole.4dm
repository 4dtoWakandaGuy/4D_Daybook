If (False:C215)
	//object Name: [CONTACTS]dCont_Sel.oRole
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
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vRole)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dCont_Sel.oRole"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vRole; ""; ->[ROLES:87]; ->[ROLES:87]Role_Code:1; ->[ROLES:87]Role_Name:2; "Role")
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dCont_Sel.oRole"; $_t_oldMethodName)

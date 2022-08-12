If (False:C215)
	//object Name: [CONTACTS]dSWContact.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(a03Stri1)
	C_LONGINT:C283($l; CON_l_SelectRow)
	C_TEXT:C284($_t_oldMethodName; vCompCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dSWContact.Variable2"; Form event code:C388)

If (CON_l_SelectRow>0)
	vCompCode:=a03Stri1{CON_l_SelectRow}
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dSWContact.Variable2"; $_t_oldMethodName)

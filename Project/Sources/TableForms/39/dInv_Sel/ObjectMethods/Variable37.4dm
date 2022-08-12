If (False:C215)
	//object Name: [INVOICES]dInv_Sel.Variable37
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
	C_TEXT:C284($_t_oldMethodName; vContCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dInv_Sel.Variable37"; Form event code:C388)
If (cNAL=0)
	Check_ContactNC(->vContCode; ->[COMPANIES:2]Company_Code:1; ->[INVOICES:39])
End if 
ERR_MethodTrackerReturn("OBJ [INVOICES].dInv_Sel.Variable37"; $_t_oldMethodName)

If (False:C215)
	//object Name: [TRANSACTIONS]dTrans_Sel.Variable21
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
	C_TEXT:C284($_t_oldMethodName; vJobCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS].dTrans_Sel.Variable21"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vJobCode; ""; ->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES:39]Company_Code:2; "Invoice")
End if 
ERR_MethodTrackerReturn("OBJ [TRANSACTIONS].dTrans_Sel.Variable21"; $_t_oldMethodName)

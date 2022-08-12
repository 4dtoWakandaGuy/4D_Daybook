If (False:C215)
	//object Name: [PURCHASE_INVOICES]dPurch Sel.oNoLookupCheckbox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/07/2012 14:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>NAL)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].dPurch Sel.oNoLookupCheckbox"; Form event code:C388)
<>NAL:=(cNAL=1)
ERR_MethodTrackerReturn("OBJ [PURCHASE_INVOICES].dPurch Sel.oNoLookupCheckbox"; $_t_oldMethodName)
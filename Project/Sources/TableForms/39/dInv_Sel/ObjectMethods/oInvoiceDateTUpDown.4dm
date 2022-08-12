If (False:C215)
	//object Name: [INVOICES]dInv_Sel.oInvoiceDateTUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 11:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SRCH_bo_vIDateToSet)
	C_DATE:C307(vIDateF; vIDateT; vIDateTBASE)
	C_LONGINT:C283($_l_event; vIDateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dInv_Sel.oInvoiceDateTUpDown"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		
		If (vIDateT=!00-00-00!)
			vIDateT:=Current date:C33
			vIDateTBASE:=Current date:C33
			//vIDateF:=vIDateT
		End if 
		If (vIDateTBASE=!00-00-00!)
			vIDateTBASE:=vIDateT
		End if 
		vIDateT:=vIDateTBASE+vIDateTupDown
		If (vIDateT>!00-00-00!)
			SRCH_bo_vIDateToSet:=True:C214
			If (vIDateT<vIDateF)
				vIDateF:=vIDateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [INVOICES].dInv_Sel.oInvoiceDateTUpDown"; $_t_oldMethodName)

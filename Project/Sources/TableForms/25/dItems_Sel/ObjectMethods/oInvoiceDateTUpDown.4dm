If (False:C215)
	//object Name: [ORDER_ITEMS]dItems_Sel.oInvoiceDateTUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 16:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SRCH_bo_viDateToSet)
	C_DATE:C307(viDateF; viDateT; viDateTBASE)
	C_LONGINT:C283($_l_event; viDateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS]dItems_Sel.oInvoiceDateTUpDown"; Form event code:C388)


$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (viDateT=!00-00-00!)
			viDateT:=Current date:C33
			viDateTBASE:=Current date:C33
			//viDateF:=viDateT
		End if 
		If (viDateTBASE=!00-00-00!)
			viDateTBASE:=viDateT
		End if 
		viDateT:=viDateTBASE+viDateTupDown
		If (viDateT>!00-00-00!)
			SRCH_bo_viDateToSet:=True:C214
			If (viDateT<viDateF)
				viDateF:=viDateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].dItems_Sel.oInvoiceDateTUpDown"; $_t_oldMethodName)

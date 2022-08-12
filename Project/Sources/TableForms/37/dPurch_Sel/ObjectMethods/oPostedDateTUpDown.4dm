If (False:C215)
	//object Name: [PURCHASE_INVOICES]dPurch Sel.oPostedDateTUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/07/2012 15:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SRCH_bo_vPDateToSet)
	C_DATE:C307(vPDateF; vPDateT; vPDateTBASE)
	C_LONGINT:C283($_l_event; vPDateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].dPurch Sel.oPostedDateTUpDown"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (vPDateT=!00-00-00!)
			vPDateT:=Current date:C33
			vPDateTBASE:=Current date:C33
			//vPDateF:=vPDateT
		End if 
		If (vPDateTBASE=!00-00-00!)
			vPDateTBASE:=vPDateT
		End if 
		vPDateT:=vPDateTBASE+vPDateTupDown
		If (vPDateT>!00-00-00!)
			SRCH_bo_vPDateToSet:=True:C214
			If (vPDateT<vPDateF)
				vPDateF:=vPDateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PURCHASE_INVOICES].dPurch Sel.oPostedDateTUpDown"; $_t_oldMethodName)

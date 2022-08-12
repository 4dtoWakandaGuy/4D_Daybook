If (False:C215)
	//object Name: [ORDERS]dOrders_Sel.oVfDateTUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 18:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SRCH_bo_VfdateToSet)
	C_DATE:C307(VfdateF; VfdateT; VfdateTBASE)
	C_LONGINT:C283($_l_event; VfdateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dOrders_Sel.oVfDateTUpDown"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VfdateT=!00-00-00!)
			VfdateT:=Current date:C33
			VfdateTBASE:=Current date:C33
			//VfdateF:=VfdateT
		End if 
		If (VfdateTBASE=!00-00-00!)
			VfdateTBASE:=VfdateT
		End if 
		VfdateT:=VfdateTBASE+VfdateTupDown
		If (VfdateT>!00-00-00!)
			SRCH_bo_VfdateToSet:=True:C214
			If (VfdateT<VfdateF)
				VfdateF:=VfdateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ORDERS].dOrders_Sel.oVfDateTUpDown"; $_t_oldMethodName)

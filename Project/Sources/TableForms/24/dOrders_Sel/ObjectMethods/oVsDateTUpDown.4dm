If (False:C215)
	//object Name: [ORDERS]dOrders_Sel.oVsDateTUpDown
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
	//C_DATE(VsdateTBASE)
	C_BOOLEAN:C305(SRCH_bo_VsdateToSet)
	C_DATE:C307(VsdateF; VsdateT)
	C_LONGINT:C283($_l_event; VsdateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dOrders_Sel.oVsDateTUpDown"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VsdateT=!00-00-00!)
			VsdateT:=Current date:C33
			VsdateTBASE:=Current date:C33
			//VsdateF:=VsdateT
		End if 
		If (VsdateTBASE=!00-00-00!)
			VsdateTBASE:=VsdateT
		End if 
		VsdateT:=VsdateTBASE+VsdateTupDown
		If (VsdateT>!00-00-00!)
			SRCH_bo_VsdateToSet:=True:C214
			If (VsdateT<VsdateF)
				VsdateF:=VsdateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ORDERS].dOrders_Sel.oVsDateTUpDown"; $_t_oldMethodName)

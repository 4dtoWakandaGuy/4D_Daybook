If (False:C215)
	//object Name: [ORDERS]dOrders_Sel.oVrDateTUpDown
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
	C_BOOLEAN:C305(SRCH_bo_VrdateToSet)
	C_DATE:C307(SRCH_d_rdateTBase; VrdateF; VrdateT)
	C_LONGINT:C283($_l_event; VrdateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dOrders_Sel.oVrDateTUpDown"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VrdateT=!00-00-00!)
			VrdateT:=Current date:C33
			SRCH_d_rdateTBase:=Current date:C33
			//VrdateF:=VrdateT
		End if 
		If (SRCH_d_rdateTBase=!00-00-00!)
			SRCH_d_rdateTBase:=VrdateT
		End if 
		VrdateT:=SRCH_d_rdateTBase+VrdateTupDown
		If (VrdateT>!00-00-00!)
			SRCH_bo_VrdateToSet:=True:C214
			If (VrdateT<VrdateF)
				VrdateF:=VrdateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ORDERS].dOrders_Sel.oVrDateTUpDown"; $_t_oldMethodName)

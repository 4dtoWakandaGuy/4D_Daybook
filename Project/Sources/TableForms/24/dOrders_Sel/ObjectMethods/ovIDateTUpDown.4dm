If (False:C215)
	//object Name: [ORDERS]dOrders_Sel.ovIDateTUpDown
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
	C_BOOLEAN:C305(SRCH_bo_VidateToSet)
	C_DATE:C307(VidateF; VidateT; VidateTBASE)
	C_LONGINT:C283($_l_event; VidateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dOrders_Sel.ovIDateTUpDown"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VidateT=!00-00-00!)
			VidateT:=Current date:C33
			VidateTBASE:=Current date:C33
			//VidateF:=VidateT
		End if 
		If (VidateTBASE=!00-00-00!)
			VidateTBASE:=VidateT
		End if 
		VidateT:=VidateTBASE+VidateTupDown
		If (VidateT>!00-00-00!)
			SRCH_bo_VidateToSet:=True:C214
			If (VidateT<VidateF)
				VidateF:=VidateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ORDERS].dOrders_Sel.ovIDateTUpDown"; $_t_oldMethodName)

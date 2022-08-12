If (False:C215)
	//object Name: [INVOICES]dInv_Sel.oPostedDateTUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 09:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SRCH_bo_VrDateToSet)
	C_DATE:C307(SRCH_d_rdateTBase; VrDateF; VrDateT)
	C_LONGINT:C283($_l_event; VrDateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dInv_Sel.oPostedDateTUpDown"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VrDateT=!00-00-00!)
			VrDateT:=Current date:C33
			SRCH_d_rdateTBase:=Current date:C33
			//VrDateF:=VrDateT
		End if 
		If (SRCH_d_rdateTBase=!00-00-00!)
			SRCH_d_rdateTBase:=VrDateT
		End if 
		VrDateT:=SRCH_d_rdateTBase+VrDateTupDown
		If (VrDateT>!00-00-00!)
			SRCH_bo_VrDateToSet:=True:C214
			If (VrDateT<VrDateF)
				VrDateF:=VrDateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [INVOICES].dInv_Sel.oPostedDateTUpDown"; $_t_oldMethodName)

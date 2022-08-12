If (False:C215)
	//object Name: [TRANSACTION_BATCHES]dTransB_Sel.oVTDateTUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/07/2012 16:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SRCH_bo_VDndateToSet)
	C_DATE:C307(VDndateF; VDndateT; VDndateTBASE)
	C_LONGINT:C283($_l_event; VDndateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES]dTransB_Sel.oVTDateTUpDown"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VDndateT=!00-00-00!)
			VDndateT:=Current date:C33
			VDndateTBASE:=Current date:C33
			//VDndateF:=VDndateT
		End if 
		If (VDndateTBASE=!00-00-00!)
			VDndateTBASE:=VDndateT
		End if 
		VDndateT:=VDndateTBASE+VDndateTupDown
		If (VDndateT>!00-00-00!)
			SRCH_bo_VDndateToSet:=True:C214
			If (VDndateT<VDndateF)
				VDndateF:=VDndateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("[COMPANIES].dComp_Sel.Ruler"; $_t_oldMethodName)

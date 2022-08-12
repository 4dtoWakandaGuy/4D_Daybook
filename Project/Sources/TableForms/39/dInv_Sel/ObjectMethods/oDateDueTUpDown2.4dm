If (False:C215)
	//object Name: [INVOICES]dInv_Sel.oDateDueTUpDown2
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
	C_BOOLEAN:C305(SRCH_bo_VDoDateToSet)
	C_DATE:C307(SRCH_d_DoDateTBase; VDoDateF; VDoDateT)
	C_LONGINT:C283($_l_event; VDoDateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dInv_Sel.oDateDueTUpDown2"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VDoDateT=!00-00-00!)
			VDoDateT:=Current date:C33
			SRCH_d_DoDateTBase:=Current date:C33
			//VDoDateF:=VDoDateT
		End if 
		If (SRCH_d_DoDateTBase=!00-00-00!)
			SRCH_d_DoDateTBase:=VDoDateT
		End if 
		VDoDateT:=SRCH_d_DoDateTBase+VDoDateTupDown
		If (VDoDateT>!00-00-00!)
			SRCH_bo_VDoDateToSet:=True:C214
			If (VDoDateT<VDoDateF)
				VDoDateF:=VDoDateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [INVOICES].dInv_Sel.oDateDueTUpDown2"; $_t_oldMethodName)

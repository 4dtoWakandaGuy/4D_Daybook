If (False:C215)
	//object Name: [DIARY]dDiary_Sel.ovdoDateTUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/07/2012 14:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SRCH_bo_VDodateToSet)
	C_DATE:C307(SRCH_d_DoDateTBase; VDodateF; VDodateT)
	C_LONGINT:C283($_l_event; VDodateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY]dDiary_Sel.ovdoDateTUpDown"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VDodateT=!00-00-00!)
			VDodateT:=Current date:C33
			SRCH_d_DoDateTBase:=Current date:C33
			//`VDodateF:=VDodateT
		End if 
		If (SRCH_d_DoDateTBase=!00-00-00!)
			SRCH_d_DoDateTBase:=VDodateT
		End if 
		VDodateT:=SRCH_d_DoDateTBase+VDodateTupDown
		If (VDodateT>!00-00-00!)
			SRCH_bo_VDodateToSet:=True:C214
			If (VDodateT<VDodateF)
				VDodateF:=VDodateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("[COMPANIES].dComp_Sel.Ruler"; $_t_oldMethodName)

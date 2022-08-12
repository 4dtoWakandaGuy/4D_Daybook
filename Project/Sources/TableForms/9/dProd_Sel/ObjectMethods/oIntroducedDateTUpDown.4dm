If (False:C215)
	//object Name: [PRODUCTS]dProd_Sel.oIntroducedDateTUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SRCH_bo_VIntdateToSet)
	C_DATE:C307(VIntdateF; VIntdateT; VIntdateTBASE)
	C_LONGINT:C283($_l_event; VIntdateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].dProd_Sel.oIntroducedDateTUpDown"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VIntdateT=!00-00-00!)
			VIntdateT:=Current date:C33
			VIntdateTBASE:=Current date:C33
			//VIntdateF:=VIntdateT
		End if 
		If (VIntdateTBASE=!00-00-00!)
			VIntdateTBASE:=VIntdateT
		End if 
		VIntdateT:=VIntdateTBASE+VIntdateTupDown
		If (VIntdateT>!00-00-00!)
			SRCH_bo_VIntdateToSet:=True:C214
			If (VIntdateT<VIntdateF)
				VIntdateF:=VIntdateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].dProd_Sel.oIntroducedDateTUpDown"; $_t_oldMethodName)

If (False:C215)
	//object Name: [COMPANIES]dComp_Sel.oVDoDateTUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/07/2012 14:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SRCH_bo_vDoDateToSet)
	C_DATE:C307(SRCH_d_DoDateTBase; vDoDateF; vDoDateT)
	C_LONGINT:C283($_l_event; vDoDateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dComp_Sel.oVDoDateTUpDown"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (vDoDateT=!00-00-00!)
			vDoDateT:=Current date:C33
			SRCH_d_DoDateTBase:=Current date:C33
			//vDoDateF:=vDoDateT
		End if 
		If (SRCH_d_DoDateTBase=!00-00-00!)
			SRCH_d_DoDateTBase:=vDoDateT
		End if 
		vDoDateT:=SRCH_d_DoDateTBase+vDoDateTupDown
		If (vDoDateT>!00-00-00!)
			SRCH_bo_vDoDateToSet:=True:C214
			If (vDoDateT<vDoDateF)
				vDoDateF:=vDoDateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dComp_Sel.oVDoDateTUpDown"; $_t_oldMethodName)

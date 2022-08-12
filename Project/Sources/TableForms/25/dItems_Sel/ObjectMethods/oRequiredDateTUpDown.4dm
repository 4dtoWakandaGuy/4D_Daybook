If (False:C215)
	//object Name: [ORDER_ITEMS]dItems_Sel.oRequiredDateTUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 15:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SRCH_bo_vRdDateToSet)
	C_DATE:C307(vRdDateF; vRdDateT; vRdDateTBASE)
	C_LONGINT:C283($_l_event; vRdDateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS]dItems_Sel.oRequiredDateTUpDown"; Form event code:C388)


$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (vRdDateT=!00-00-00!)
			vRdDateT:=Current date:C33
			vRdDateTBASE:=Current date:C33
			//vRdDateF:=vRdDateT
		End if 
		If (vRdDateTBASE=!00-00-00!)
			vRdDateTBASE:=vRdDateT
		End if 
		vRdDateT:=vRdDateTBASE+vRdDateTupDown
		If (vRdDateT>!00-00-00!)
			SRCH_bo_vRdDateToSet:=True:C214
			If (vRdDateT<vRdDateF)
				vRdDateF:=vRdDateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].dItems_Sel.oRequiredDateTUpDown"; $_t_oldMethodName)

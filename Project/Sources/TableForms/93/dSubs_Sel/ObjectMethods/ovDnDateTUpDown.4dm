If (False:C215)
	//object Name: [SUBSCRIPTIONS]dSubs Sel.ovDnDateTUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/07/2012 13:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SRCH_bo_vDnDateToSet)
	C_DATE:C307(vDnDateF; vDnDateT; vDnDateTBASE)
	C_LONGINT:C283($_l_event; vDnDateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [SUBSCRIPTIONS]dSubs Sel.ovDnDateTUpDown"; Form event code:C388)


$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (vDnDateT=!00-00-00!)
			vDnDateT:=Current date:C33
			vDnDateTBASE:=Current date:C33
			//vDnDateF:=vDnDateT
		End if 
		If (vDnDateTBASE=!00-00-00!)
			vDnDateTBASE:=vDnDateT
		End if 
		vDnDateT:=vDnDateTBASE+vDnDateTupDown
		If (vDnDateT>!00-00-00!)
			SRCH_bo_vDnDateToSet:=True:C214
			If (vDnDateT<vDnDateF)
				vDnDateF:=vDnDateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [SUBSCRIPTIONS].dSubs Sel.ovDnDateTUpDown"; $_t_oldMethodName)

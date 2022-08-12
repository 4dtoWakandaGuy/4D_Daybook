If (False:C215)
	//object Name: [COMPANIES]dComp_Sel.oVSDateTUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/07/2012 15:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_DATE(VsdateTBASE)
	C_BOOLEAN:C305(SRCH_bo_vSDateToSet)
	C_DATE:C307(vSDateF; vSDateT)
	C_LONGINT:C283($_l_event; vSDateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES]dComp_Sel.oVSDateTUpDown"; Form event code:C388)


$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (vSDateT=!00-00-00!)
			vSDateT:=Current date:C33
			vSDateTBASE:=Current date:C33
			//vSDateF:=vSDateT
		End if 
		If (vSDateTBASE=!00-00-00!)
			vSDateTBASE:=vSDateT
		End if 
		vSDateT:=vSDateTBASE+vSDateTupDown
		If (vSDateT>!00-00-00!)
			SRCH_bo_vSDateToSet:=True:C214
			If (vSDateT<vSDateF)
				vSDateF:=vSDateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dComp_Sel.oVSDateTUpDown"; $_t_oldMethodName)

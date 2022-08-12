If (False:C215)
	//object Name: [COMPANIES]dComp_Sel.oVFDateTUpDown
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
	C_BOOLEAN:C305(SRCH_bo_vfDateToSet)
	C_DATE:C307(vfDateF; vfDateT; vfDateTBASE)
	C_LONGINT:C283($_l_event; vfDateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dComp_Sel.oVFDateTUpDown"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (vfDateT=!00-00-00!)
			vfDateT:=Current date:C33
			vfDateTBASE:=Current date:C33
			//vfDateF:=vfDateT
		End if 
		If (vfDateTBASE=!00-00-00!)
			vfDateTBASE:=vfDateT
		End if 
		vfDateT:=vfDateTBASE+vfDateTupDown
		If (vfDateT>!00-00-00!)
			SRCH_bo_vfDateToSet:=True:C214
			If (vfDateT<vfDateF)
				vfDateF:=vfDateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dComp_Sel.oVFDateTUpDown"; $_t_oldMethodName)

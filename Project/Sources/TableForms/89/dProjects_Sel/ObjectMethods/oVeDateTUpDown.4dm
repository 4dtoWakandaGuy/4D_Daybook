If (False:C215)
	//object Name: [PROJECTS]dProjects_Sel.oVeDateTUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/07/2012 16:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SRCH_bo_VeDateToSet)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; VedateTBASE)
	C_LONGINT:C283($_l_event; VeDateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PROJECTS].dProjects_Sel.oVeDateTUpDown"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (SRCH_d_EntryDateTo=!00-00-00!)
			SRCH_d_EntryDateTo:=Current date:C33
			VedateTBASE:=Current date:C33
			SRCH_d_EntryDateFrom:=SRCH_d_EntryDateTo
		End if 
		If (VedateTBASE=!00-00-00!)
			VedateTBASE:=SRCH_d_EntryDateTo
		End if 
		SRCH_d_EntryDateTo:=VedateTBASE+VeDateTupDown
		If (SRCH_d_EntryDateTo>!00-00-00!)
			SRCH_bo_VeDateToSet:=True:C214
			If (SRCH_d_EntryDateTo<SRCH_d_EntryDateFrom)
				SRCH_d_EntryDateFrom:=SRCH_d_EntryDateTo
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PROJECTS].dProjects_Sel.oVeDateTUpDown"; $_t_oldMethodName)

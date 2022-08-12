If (False:C215)
	//object Name: [JOBS]dJobs_Sel.oStartDateFUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/07/2012 14:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SRCH_bo_VeDateToSet)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; VedateFBASE)
	C_LONGINT:C283($_l_event; VeDateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].dJobs_Sel.oStartDateFUpDown"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (SRCH_d_EntryDateFrom=!00-00-00!)
			SRCH_d_EntryDateFrom:=Current date:C33-365
		End if 
		If (VedateFBASE=!00-00-00!)
			VedateFBASE:=SRCH_d_EntryDateFrom
		End if 
		SRCH_d_EntryDateFrom:=VedateFBASE+VeDateFupDown
		If (SRCH_d_EntryDateFrom>!00-00-00!)
			If (SRCH_bo_VeDateToSet=False:C215)
				SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
			End if 
			If (SRCH_d_EntryDateFrom>SRCH_d_EntryDateTo)
				SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
			End if 
			OBJECT SET VISIBLE:C603(*; "oVEDateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [JOBS].dJobs_Sel.oStartDateFUpDown"; $_t_oldMethodName)

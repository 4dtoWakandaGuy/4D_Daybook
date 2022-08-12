If (False:C215)
	//object Name: [SUBSCRIPTIONS]dSubs Sel.oviDateTUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/07/2012 13:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SRCH_bo_vIDateToSet; SRCH_bo_IDateToSet)
	C_DATE:C307(SUBS_d_IDateF; SUBS_d_IDateFrom; SUBS_d_iDateTo; SUBS_d_iDateToBase)
	C_LONGINT:C283($_l_event; SUBS_l_IDateToupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SUBSCRIPTIONS].dSubs Sel.oviDateTUpDown"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (SUBS_d_iDateTo=!00-00-00!)
			SUBS_d_iDateTo:=Current date:C33
			SUBS_d_iDateToBase:=Current date:C33
			//vIDateF:=SUBS_d_iDateTo
		End if 
		If (SUBS_d_iDateToBase=!00-00-00!)
			SUBS_d_iDateToBase:=SUBS_d_iDateTo
		End if 
		SUBS_d_iDateTo:=SUBS_d_iDateToBase+SUBS_l_IDateToupDown
		If (SUBS_d_iDateTo>!00-00-00!)
			SRCH_bo_IDateToSet:=True:C214
			If (SUBS_d_iDateTo<SUBS_d_IDateFrom)
				SUBS_d_IDateF:=SUBS_d_iDateTo
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [SUBSCRIPTIONS].dSubs Sel.oviDateTUpDown"; $_t_oldMethodName)

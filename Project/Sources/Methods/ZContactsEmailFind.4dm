//%attributes = {}
If (False:C215)
	//Project Method Name:      ZContactsEmailFind
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(EMAIL_bo_MailListBuilt)
	C_LONGINT:C283(DOC_l_ContactsProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZContactsEmailFind")
If (Not:C34(EMAIL_bo_MailListBuilt))
	If (DOC_l_ContactsProcess=0)
		DOC_l_ContactsProcess:=New process:C317("Contacts_Mod"; DB_ProcessMemoryinit(3); "View Contacts"; Current process:C322; "DOC_l_CallEvent")
	Else 
		BRING TO FRONT:C326(DOC_l_ContactsProcess)
	End if 
End if 
ERR_MethodTrackerReturn("ZContactsEmailFind"; $_t_oldMethodName)
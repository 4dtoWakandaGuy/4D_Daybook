If (False:C215)
	//Table Form Method Name: [CONTACTS_COMPANIES]Companies_SubP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/04/2011 07:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_oldMethodName; COM_t_TelephoneNumberFormat; DB_t_CurrentFormUsage; vDetails)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS_COMPANIES].Companies_SubP"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		RELATE ONE:C42([CONTACTS_COMPANIES:145]Company_Code:1)
		If (DB_t_CurrentFormUsage="Full")
			Company_Details
		Else 
			vDetails:=[COMPANIES:2]Company_Name:2
		End if 
		If ([COMPANIES:2]Country:8#"")
			If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
				QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
				COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
			End if 
		Else 
			COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
		End if 
		If (COM_t_TelephoneNumberFormat#"")
			OBJECT SET FORMAT:C236([COMPANIES:2]Telephone:9; COM_t_TelephoneNumberFormat)
		End if 
End case 
ERR_MethodTrackerReturn("FM [CONTACTS_COMPANIES].Companies_SubP"; $_t_oldMethodName)

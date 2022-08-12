If (False:C215)
	//Table Form Method Name: [CONTACTS]Contacts_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; COM_t_TelephoneNumberFormat; vCompName; vContName; vTel)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].Contacts_List"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
		vCompName:=[COMPANIES:2]Company_Name:2
		vTel:=[COMPANIES:2]Telephone:9
		If ([COMPANIES:2]Country:8#"")
			If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
				QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
				COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
			End if 
		End if 
		If (COM_t_TelephoneNumberFormat#"")
			OBJECT SET FORMAT:C236(vTel; COM_t_TelephoneNumberFormat)
		End if 
		vContName:=[CONTACTS:1]Contact_Name:31
		If ([CONTACTS:1]Qualifications:13#"")
			vContName:=vContName+", "+[CONTACTS:1]Qualifications:13
		End if 
End case 
ERR_MethodTrackerReturn("FM:Contacts_List"; $_t_oldMethodName)

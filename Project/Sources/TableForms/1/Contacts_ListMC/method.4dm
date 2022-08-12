If (False:C215)
	//Table Form Method Name: [CONTACTS]Contacts_ListMC
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
	//C_UNKNOWN(Address_Status)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_Index)
	C_TEXT:C284($_t_oldMethodName; COM_t_TelephoneNumberFormat; vCompName; vContName; vTel)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].Contacts_ListMC"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		REDUCE SELECTION:C351([COMPANIES:2]; 0)
		CREATE EMPTY SET:C140([COMPANIES:2]; "SUb")
		QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
		QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
		For ($_l_Index; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
			If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
				ADD TO SET:C119([COMPANIES:2]; "SUb")
			End if 
			NEXT RECORD:C51([CONTACTS_COMPANIES:145])
		End for 
		USE SET:C118("Sub")
		CLEAR SET:C117("Sub")
		
		vContName:=[CONTACTS:1]Contact_Name:31
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
		If ([CONTACTS:1]Qualifications:13#"")
			vContName:=vContName+", "+[CONTACTS:1]Qualifications:13
		End if 
End case 
ERR_MethodTrackerReturn("FM:Contacts_ListMC"; $_t_oldMethodName)

If (False:C215)
	//Table Form Method Name: [COMPANIES]Comp_Cont
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; COM_t_TelephoneNumberFormat; vSource; vStatus; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].Comp_Cont"; Form event code:C388)
//Comp_Cont
Company_Details
RELATE ONE:C42([COMPANIES:2]Status:12)
vStatus:=[STATUS:4]Status_Name:2
RELATE ONE:C42([COMPANIES:2]Company_Type:13)
vType:=[TYPES:5]Type_Name:2
RELATE ONE:C42([COMPANIES:2]Source:14)
If ([COMPANIES:2]Country:8#"")
	If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
		QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
		COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
	End if 
End if 
If (COM_t_TelephoneNumberFormat#"")
	OBJECT SET FORMAT:C236([COMPANIES:2]Telephone:9; COM_t_TelephoneNumberFormat)
End if 
vSource:=[SOURCES:6]Source_Name:2
ERR_MethodTrackerReturn("FM:Comp_Cont"; $_t_oldMethodName)
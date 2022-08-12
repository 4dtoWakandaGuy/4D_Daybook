//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls_InLPB2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/04/2011 15:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_oldMethodName; COM_t_TelephoneNumberFormat; SD_t_CallingCompanyCode; SD_t_CallingContactCode; SVS_t_CompDetails; SVS_t_emailAddress; SVS_t_Mobile; vCompName; vTel)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_InLPB2")


If (SD_t_CallingCompanyCode#"") & ([SERVICE_CALLS:20]Company_Code:1="")
	[SERVICE_CALLS:20]Company_Code:1:=SD_t_CallingCompanyCode
	SD_t_CallingCompanyCode:=""
End if 
If ([SERVICE_CALLS:20]Contact_Code:2="") & (SD_t_CallingContactCode#"")
	[SERVICE_CALLS:20]Contact_Code:2:=SD_t_CallingContactCode
	SD_t_CallingContactCode:=""
End if 

RELATE ONE:C42([SERVICE_CALLS:20]Company_Code:1)
vCompName:=[COMPANIES:2]Company_Name:2
SVS_t_CompDetails:=""
Address_Details(->SVS_t_CompDetails)
vTel:=[COMPANIES:2]Telephone:9
If ([COMPANIES:2]Country:8#"")
	If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
		QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
		COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
	End if 
Else 
	COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
End if 
If (COM_t_TelephoneNumberFormat#"")
	OBJECT SET FORMAT:C236(vTel; COM_t_TelephoneNumberFormat)
End if 
RELATE ONE:C42([SERVICE_CALLS:20]Contact_Code:2)
Contact_Details(->SVS_t_emailAddress; ->SVS_t_Mobile)
ERR_MethodTrackerReturn("Calls_InLPB2"; $_t_oldMethodName)
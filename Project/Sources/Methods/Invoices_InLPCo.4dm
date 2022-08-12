//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_InLPCo
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
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_oldMethodName; COM_t_TelephoneNumberFormat; vCompName; vTel)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_InLPCo")
RELATE ONE:C42([INVOICES:39]Company_Code:2)
RELATE ONE:C42([INVOICES:39]Contact_Code:3)
vCompName:=[COMPANIES:2]Company_Name:2
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
Contact_Details
ERR_MethodTrackerReturn("Invoices_InLPCo"; $_t_oldMethodName)
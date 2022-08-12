//%attributes = {}
If (False:C215)
	//Project Method Name:      Public_InLPB
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
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_oldMethodName; COM_t_TelephoneNumberFormat; vCompName; vContName; vTel)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Public_InLPB")
RELATE ONE:C42([PUBLICATIONS:52]Company_Code:3)
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
RELATE ONE:C42([PUBLICATIONS:52]Contact_Code:4)
vContName:=[CONTACTS:1]Contact_Name:31
Macro_AccType("Load "+String:C10(Table:C252(->[PUBLICATIONS:52])))
ERR_MethodTrackerReturn("Public_InLPB"; $_t_oldMethodName)
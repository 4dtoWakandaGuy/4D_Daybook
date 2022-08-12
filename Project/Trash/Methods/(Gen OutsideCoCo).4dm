//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen OutsideCoCo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/04/2011 11:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $2)
	C_TEXT:C284(<>CompCode; <>ContCode; <>SYS_t_DefaultTelFormat; $_t_oldMethodName; COM_t_TelephoneNumberFormat; vCompName; vContName; vExtn; vTel)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen OutsideCoCo")
If ((<>CompCode#"") & ($1->=""))
	$1->:=<>CompCode
	RELATE ONE:C42($1->)
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
End if 
If ((<>ContCode#"") & ($2->=""))
	$2->:=<>ContCode
	RELATE ONE:C42($2->)
	vContName:=[CONTACTS:1]Contact_Name:31
	vExtn:=[CONTACTS:1]Extn:9
End if 
BRING TO FRONT:C326(Current process:C322)
ERR_MethodTrackerReturn("Gen OutsideCoCo"; $_t_oldMethodName)
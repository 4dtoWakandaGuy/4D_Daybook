If (False:C215)
	//object Name: [CONTRACTS]Contract_in.Variable1
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
	//ARRAY TEXT(SVS_at_ContractsTabs;0)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_oldMethodName; COM_t_TelephoneNumberFormat; vCompName; vTel)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].Contract_in.Variable1"; Form event code:C388)
If (SVS_at_ContractsTabs<Size of array:C274(SVS_at_ContractsTabs))
	SVS_at_ContractsTabs:=SVS_at_ContractsTabs+1
End if 

If (SVS_at_ContractsTabs>0)
	If (SVS_at_ContractsTabs#FORM Get current page:C276)
		Case of 
			: (SVS_at_ContractsTabs=2)
				RELATE ONE:C42([CONTRACTS:17]Supplier_Company:9)
				RELATE ONE:C42([CONTRACTS:17]Supplier_Contact:10)
				vCompName:=[COMPANIES:2]Company_Name:2
				vTel:=[COMPANIES:2]Telephone:9
				Contact_Details
				FORM GOTO PAGE:C247(2)
			: (SVS_at_ContractsTabs=1)
				RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
				RELATE ONE:C42([CONTRACTS:17]Contact_Code:2)
				vCompName:=[COMPANIES:2]Company_Name:2
				vTel:=[COMPANIES:2]Telephone:9
				Contact_Details
				FORM GOTO PAGE:C247(1)
		End case 
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
End if 
ERR_MethodTrackerReturn("OBJ:Contract_in,Bright"; $_t_oldMethodName)

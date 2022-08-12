//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InLPDCom
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
	//C_UNKNOWN(vCallCode)
	//C_UNKNOWN(vCompName)
	//C_UNKNOWN(vName)
	//C_UNKNOWN(vTel)
	//ARRAY INTEGER(ST_ai_StatusUsage;0)
	C_BOOLEAN:C305(<>ForceCred)
	C_LONGINT:C283($_l_UsageRow)
	C_TEXT:C284($_t_CompanyCode; $_t_oldMethodName; $_t_ParentCompanyCode; $_t_Terms; COM_t_TelephoneNumberFormat; vCallCode; vCompName; vName; vTel; <>SYS_t_DefaultTelFormat; $_t_CompanyCode)
	C_TEXT:C284($_t_oldMethodName; $_t_ParentCompanyCode; $_t_Terms; COM_t_TelephoneNumberFormat)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPDCom")

Check_CompanyIS(->[ORDERS:24]Company_Code:1; ->[ORDERS:24]Contact_Code:2; ->[ORDERS:24])





If ([ORDERS:24]Company_Code:1#vCallCode)  //this is here solely because forms otherwise make the Co Code think its modified
	If ([ORDERS:24]Company_Code:1#"")
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
		If ([COMPANIES:2]Sales_Person:29#"")
			[ORDERS:24]Person:5:=[COMPANIES:2]Sales_Person:29
			Check_PersAnal(->[ORDERS:24]Person:5; ->[ORDERS:24]Analysis_Code:33)
			vName:=[PERSONNEL:11]Name:2
		End if 
		If ([COMPANIES:2]SL_Terms:40#"")
			If ([COMPANIES:2]Invoice_Superior:57) & ([COMPANIES:2]Superior:34#"")
				$_t_Terms:=[COMPANIES:2]SL_Terms:40
				$_t_ParentCompanyCode:=[COMPANIES:2]Superior:34
				$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_ParentCompanyCode)
				If ([COMPANIES:2]SL_Terms:40#"")
					[ORDERS:24]Terms:16:=[COMPANIES:2]SL_Terms:40
				Else 
					[ORDERS:24]Terms:16:=$_t_Terms
				End if 
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
			Else 
				
				[ORDERS:24]Terms:16:=[COMPANIES:2]SL_Terms:40
			End if 
		Else 
			If ([COMPANIES:2]Invoice_Superior:57) & ([COMPANIES:2]Superior:34#"")
				
				$_t_ParentCompanyCode:=[COMPANIES:2]Superior:34
				$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_ParentCompanyCode)
				If ([COMPANIES:2]SL_Terms:40#"")
					[ORDERS:24]Terms:16:=[COMPANIES:2]SL_Terms:40
				End if 
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
			End if 
		End if 
		$_l_UsageRow:=Find in array:C230(ST_ai_StatusUsage; 1)
		If ($_l_UsageRow>0)
			Gen_CreditCheck
			If ((vSNo>0) & (<>ForceCred))
				[ORDERS:24]Company_Code:1:=""
				[ORDERS:24]Contact_Code:2:=""
				Comp_vClear
			Else 
				Check_ContDef(->[ORDERS:24]Company_Code:1; ->[ORDERS:24]Contact_Code:2)
				Layer_InDDef(->[ORDERS:24]Layer_Code:47)
				If (Records in selection:C76([ORDER_ITEMS:25])=0)
					Currency_InDDefault(->[ORDERS:24]Currency_Code:32)
				End if 
			End if 
		Else 
			Check_ContDef(->[ORDERS:24]Company_Code:1; ->[ORDERS:24]Contact_Code:2)
			Layer_InDDef(->[ORDERS:24]Layer_Code:47)
			If (Records in selection:C76([ORDER_ITEMS:25])=0)
				Currency_InDDefault(->[ORDERS:24]Currency_Code:32)
			End if 
		End if 
	End if 
	[ORDERS:24]Export:24:=Export_Stamp3([ORDERS:24]Export:24)
	Orders_InLPArea
End if 
vCallCode:=[ORDERS:24]Company_Code:1
ERR_MethodTrackerReturn("Orders_InLPDCom"; $_t_oldMethodName)

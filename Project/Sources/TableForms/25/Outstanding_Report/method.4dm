If (False:C215)
	//Table Form Method Name: [ORDER_ITEMS]Outstanding_Report
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_oldMethodName; COM_t_TelephoneNumberFormat; vCompName; vProdName; vSupplier; vTel)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ORDER_ITEMS].Outstanding_Report"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		vProdName:=[ORDER_ITEMS:25]Product_Name:13
		RELATE ONE:C42([ORDER_ITEMS:25]Supplier_Code:20)
		vSupplier:=[COMPANIES:2]Company_Name:2
		vTel:=[COMPANIES:2]Telephone:9
		RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
		If ([ORDERS:24]Order_Code:3="")
			vCompName:=""
		Else 
			RELATE ONE:C42([ORDERS:24]Company_Code:1)
			vCompName:=[COMPANIES:2]Company_Name:2
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
			OBJECT SET FORMAT:C236(vTel; COM_t_TelephoneNumberFormat)
		End if 
End case 
ERR_MethodTrackerReturn("FM:Outstanding_Report"; $_t_oldMethodName)

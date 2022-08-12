If (False:C215)
	//object Name: [COMPANIES]Company_In.Check Box2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(B_ClipboardButton; cb_Edit)
	C_PICTURE:C286(COM_pic_ClipBoardPICT)
	C_TEXT:C284($_t_oldMethodName; COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Country; COM_t_County; COM_t_DisplayAddress; COM_t_PostalCode; COM_t_Town; DB_t_Address1Label; DB_t_Address2Label; DB_t_CountryLabel)
	C_TEXT:C284(DB_t_CountyLabel; DB_t_PostcodeLabel; DB_t_TownLabel; vATAdd11)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.Check Box2"; Form event code:C388)
//WT: 10/12/00
If (False:C215)
	
	Case of 
		: (cb_Edit=1)
			OBJECT SET VISIBLE:C603(DB_t_Address1Label; True:C214)
			OBJECT SET VISIBLE:C603(DB_t_Address2Label; True:C214)
			OBJECT SET VISIBLE:C603(DB_t_TownLabel; True:C214)
			OBJECT SET VISIBLE:C603(DB_t_CountyLabel; True:C214)
			OBJECT SET VISIBLE:C603(DB_t_PostcodeLabel; True:C214)
			OBJECT SET VISIBLE:C603(DB_t_CountryLabel; True:C214)
			OBJECT SET VISIBLE:C603([COMPANIES:2]Company_Name:2; True:C214)
			OBJECT SET VISIBLE:C603([COMPANIES:2]Address_Line_one:3; True:C214)
			OBJECT SET VISIBLE:C603([COMPANIES:2]Address_Line_two:4; True:C214)
			OBJECT SET VISIBLE:C603([COMPANIES:2]Town_or_City:5; True:C214)
			OBJECT SET VISIBLE:C603([COMPANIES:2]County_or_State:6; True:C214)
			OBJECT SET VISIBLE:C603([COMPANIES:2]Postal_Code:7; True:C214)
			OBJECT SET VISIBLE:C603([COMPANIES:2]Country:8; True:C214)
			OBJECT SET VISIBLE:C603(vATAdd11; False:C215)
			OBJECT SET VISIBLE:C603([COMPANIES:2]ADDRESS:60; False:C215)
			OBJECT SET VISIBLE:C603(COM_pic_ClipBoardPICT; False:C215)
			OBJECT SET VISIBLE:C603(B_ClipboardButton; False:C215)
			OBJECT SET ENABLED:C1123(B_ClipBoardButton; False:C215)
			OBJECT SET ENTERABLE:C238([COMPANIES:2]Company_Name:2; True:C214)
			
		: (cb_Edit=0)
			OBJECT SET VISIBLE:C603(DB_t_Address1Label; False:C215)
			OBJECT SET VISIBLE:C603(DB_t_Address2Label; False:C215)
			OBJECT SET VISIBLE:C603(DB_t_TownLabel; False:C215)
			OBJECT SET VISIBLE:C603(DB_t_CountyLabel; False:C215)
			OBJECT SET VISIBLE:C603(DB_t_PostcodeLabel; False:C215)
			OBJECT SET VISIBLE:C603(DB_t_CountryLabel; False:C215)
			OBJECT SET VISIBLE:C603([COMPANIES:2]Company_Name:2; True:C214)
			OBJECT SET VISIBLE:C603([COMPANIES:2]Address_Line_one:3; False:C215)
			OBJECT SET VISIBLE:C603([COMPANIES:2]Address_Line_two:4; False:C215)
			OBJECT SET VISIBLE:C603([COMPANIES:2]Town_or_City:5; False:C215)
			OBJECT SET VISIBLE:C603([COMPANIES:2]County_or_State:6; False:C215)
			OBJECT SET VISIBLE:C603([COMPANIES:2]Postal_Code:7; False:C215)
			OBJECT SET VISIBLE:C603([COMPANIES:2]Country:8; False:C215)
			OBJECT SET VISIBLE:C603(vATAdd11; True:C214)
			OBJECT SET VISIBLE:C603([COMPANIES:2]ADDRESS:60; True:C214)
			OBJECT SET VISIBLE:C603(COM_pic_ClipBoardPICT; True:C214)
			OBJECT SET VISIBLE:C603(B_ClipboardButton; True:C214)
			OBJECT SET ENABLED:C1123(B_ClipBoardButton; True:C214)
			
			OBJECT SET ENTERABLE:C238([COMPANIES:2]Company_Name:2; False:C215)
	End case 
Else 
	OBJECT SET VISIBLE:C603(*; "oAddressLine1Label@"; (cb_Edit=1) & (DB_t_Address1Label#""))
	OBJECT SET VISIBLE:C603(*; "oAddressLine2Label@"; (cb_Edit=1) & (DB_t_Address2Label#""))
	OBJECT SET VISIBLE:C603(*; "oTownLabel@"; (cb_Edit=1) & (DB_t_TownLabel#""))
	OBJECT SET VISIBLE:C603(*; "oCountyLabel@"; (cb_Edit=1) & (DB_t_CountyLabel#""))
	OBJECT SET VISIBLE:C603(*; "oPostcodeLabel@"; (cb_Edit=1) & (DB_t_PostcodeLabel#""))
	OBJECT SET VISIBLE:C603(*; "oCountryLabel"; (cb_Edit=1) & (DB_t_CountryLabel#""))
	OBJECT SET VISIBLE:C603(*; "oAddressLine1var@"; (cb_Edit=1))
	OBJECT SET VISIBLE:C603(*; "oAddressLine2Var@"; (cb_Edit=1))
	//OBJECT SET VISIBLE(COM_t_AddressLine1;False)
	//OBJECT SET VISIBLE(COM_t_AddressLine2;False)
	OBJECT SET VISIBLE:C603(*; "oTown@"; (cb_Edit=1))
	OBJECT SET VISIBLE:C603(*; "oCounty@"; (cb_Edit=1))
	OBJECT SET VISIBLE:C603(*; "oPostalCode@"; (cb_Edit=1))
	OBJECT SET VISIBLE:C603(*; "oCountry@"; (cb_Edit=1))
	OBJECT SET ENTERABLE:C238(*; "oCompanyName@"; (cb_Edit=1))
	OBJECT SET ENTERABLE:C238(*; "oAddressLine@"; (cb_Edit=1))
	//OBJECT SET VISIBLE(COM_t_AddressLine1;False)
	//OBJECT SET VISIBLE(COM_t_AddressLine2;False)
	OBJECT SET ENTERABLE:C238(*; "oTown@"; (cb_Edit=1))
	OBJECT SET ENTERABLE:C238(*; "oCounty@"; (cb_Edit=1))
	OBJECT SET ENTERABLE:C238(*; "oPostalCode@"; (cb_Edit=1))
	OBJECT SET ENTERABLE:C238(*; "oCountry@"; (cb_Edit=1))
	//
	OBJECT SET ENTERABLE:C238(*; "oAddressLine1Label@"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "oAddressLine2Label@"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "oTownLabel@"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "oCountyLabel@"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "oPostcodeLabel@"; False:C215)
	OBJECT SET ENTERABLE:C238(*; "oCountryLabel"; False:C215)
	
	
	
	
	//
	OBJECT SET VISIBLE:C603(*; "oCompanyAddress@"; (Not:C34(cb_Edit=1)))
	OBJECT SET VISIBLE:C603(*; "oAddressClipBoard@"; (Not:C34(cb_Edit=1)))
	OBJECT SET ENABLED:C1123(*; "oAddressClipBoardButton@"; (Not:C34(cb_Edit=1)))
	
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.Check Box2"; $_t_oldMethodName)

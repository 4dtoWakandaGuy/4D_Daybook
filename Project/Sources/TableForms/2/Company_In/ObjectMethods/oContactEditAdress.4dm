If (False:C215)
	//object Name: [COMPANIES]Company_In.Check Box4
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
	C_TEXT:C284($_t_oldMethodName; DB_t_Address1Label; DB_t_Address2Label; DB_t_CountryLabel; DB_t_CountyLabel; DB_t_PostcodeLabel; DB_t_TownLabel; vATAdd11)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.Check Box4"; Form event code:C388)
//WT: 10/12/00
//oAddressLine1Label_P5
OBJECT SET VISIBLE:C603(*; "oAddressLine1Label_P5@"; (cb_Edit=1) & (DB_t_Address1Label#""))
OBJECT SET VISIBLE:C603(*; "oAddressLine2Label_P5@"; (cb_Edit=1) & (DB_t_Address2Label#""))
OBJECT SET VISIBLE:C603(*; "oCON_CompanyAdLab3@"; (cb_Edit=1) & (DB_t_TownLabel#""))
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
ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.Check Box4"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      Countries_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 09:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CCM_at_CountryCodes;0)
	//ARRAY TEXT(CCM_at_CurrencyNames;0)
	//ARRAY TEXT(DM_at_CountryCodes;0)
	//ARRAY TEXT(DM_at_CountryNames;0)
	C_LONGINT:C283($_l_CountryRow; COU_l_EditCountry; COU_l_EditCurrency)
	C_TEXT:C284($_t_oldMethodName; CUR_t_ISoCountryName; CUR_t_ISoCurrencyName; vButtDisCOUNTRIES; vTitle2; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Countries_InLPB")
RELATE ONE:C42([COUNTRIES:73]Address_Format:2)
vType:=[ADDRESS_FORMATS:74]Format_Name:2
vTitle2:=Term_VATWT("Default VAT Code")
If ([COUNTRIES:73]ISO_Code:6#"")
	$_l_CountryRow:=Find in array:C230(DM_at_CountryCodes; [COUNTRIES:73]ISO_Code:6)
	If ($_l_CountryRow<0)
		CUR_t_ISoCountryName:=""
		OBJECT SET VISIBLE:C603(DM_at_CountryNames; True:C214)
		OBJECT SET VISIBLE:C603(COU_l_EditCountry; False:C215)
	Else 
		CUR_t_ISoCountryName:=DM_at_CountryNames{$_l_CountryRow}
		OBJECT SET VISIBLE:C603(DM_at_CountryNames; False:C215)
		OBJECT SET VISIBLE:C603(COU_l_EditCountry; True:C214)
	End if 
Else 
	CUR_t_ISoCountryName:=""
	OBJECT SET VISIBLE:C603(DM_at_CountryNames; True:C214)
	OBJECT SET VISIBLE:C603(COU_l_EditCountry; False:C215)
End if 
If ([COUNTRIES:73]ISO_Currency:8#"")
	$_l_CountryRow:=Find in array:C230(CCM_at_CountryCodes; [COUNTRIES:73]ISO_Currency:8)
	If ($_l_CountryRow<0)
		CUR_t_ISoCurrencyName:=""
		OBJECT SET VISIBLE:C603(CCM_at_CurrencyNames; True:C214)
		OBJECT SET VISIBLE:C603(COU_l_EditCurrency; False:C215)
	Else 
		CUR_t_ISoCurrencyName:=CCM_at_CurrencyNames{$_l_CountryRow}
		OBJECT SET VISIBLE:C603(CCM_at_CurrencyNames; False:C215)
		OBJECT SET VISIBLE:C603(COU_l_EditCurrency; True:C214)
	End if 
Else 
	CUR_t_ISoCurrencyName:=""
	OBJECT SET VISIBLE:C603(CCM_at_CurrencyNames; True:C214)
	OBJECT SET VISIBLE:C603(COU_l_EditCurrency; False:C215)
End if 
vButtDisCOUNTRIES:="I  PMO  FSSSRCADT"
Input_Buttons(->[COUNTRIES:73]; ->vButtDisCOUNTRIES)
ERR_MethodTrackerReturn("Countries_InLPB"; $_t_oldMethodName)
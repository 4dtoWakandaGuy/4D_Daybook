//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies_vAT2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284(<>DB_t_Address1Label; <>DB_t_Address2Label; <>DB_t_CountryLabel; <>DB_t_CountyLabel; <>DB_t_PostcodeLabel; <>DB_t_TownLabel; $_t_oldMethodName; DB_t_Address1Label; DB_t_Address2Label; DB_t_CountryLabel; DB_t_CountyLabel)
	C_TEXT:C284(DB_t_PostcodeLabel; DB_t_TownLabel)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_vAT2")
If (Count parameters:C259=0)
	If ([COMPANIES:2]Country:8="")
		DB_t_Address1Label:=<>DB_t_Address1Label
		DB_t_Address2Label:=<>DB_t_Address2Label
		DB_t_TownLabel:=<>DB_t_TownLabel
		DB_t_CountyLabel:=<>DB_t_CountyLabel
		DB_t_PostcodeLabel:=<>DB_t_PostcodeLabel
		DB_t_CountryLabel:=<>DB_t_CountryLabel
	Else 
		RELATE ONE:C42([COMPANIES:2]Country:8)
		RELATE ONE:C42([COUNTRIES:73]Address_Format:2)
		If (Records in selection:C76([ADDRESS_FORMATS:74])=1)
			DB_t_Address1Label:=[ADDRESS_FORMATS:74]Address_1_Name:3
			DB_t_Address2Label:=[ADDRESS_FORMATS:74]Address_2_Name:4
			DB_t_TownLabel:=[ADDRESS_FORMATS:74]Town_Name:5
			DB_t_CountyLabel:=[ADDRESS_FORMATS:74]County_Name:6
			DB_t_PostcodeLabel:=[ADDRESS_FORMATS:74]Postcode_Name:7
			DB_t_CountryLabel:=[ADDRESS_FORMATS:74]Country_Name:8
		Else 
			DB_t_Address1Label:=<>DB_t_Address1Label
			DB_t_Address2Label:=<>DB_t_Address2Label
			DB_t_TownLabel:=<>DB_t_TownLabel
			DB_t_CountyLabel:=<>DB_t_CountyLabel
			DB_t_PostcodeLabel:=<>DB_t_PostcodeLabel
			DB_t_CountryLabel:=<>DB_t_CountryLabel
		End if 
	End if 
Else 
	If ($1->="")
		DB_t_Address1Label:=<>DB_t_Address1Label
		DB_t_Address2Label:=<>DB_t_Address2Label
		DB_t_TownLabel:=<>DB_t_TownLabel
		DB_t_CountyLabel:=<>DB_t_CountyLabel
		DB_t_PostcodeLabel:=<>DB_t_PostcodeLabel
		DB_t_CountryLabel:=<>DB_t_CountryLabel
	Else 
		QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=$1->)
		RELATE ONE:C42([COUNTRIES:73]Address_Format:2)
		If (Records in selection:C76([ADDRESS_FORMATS:74])=1)
			DB_t_Address1Label:=[ADDRESS_FORMATS:74]Address_1_Name:3
			DB_t_Address2Label:=[ADDRESS_FORMATS:74]Address_2_Name:4
			DB_t_TownLabel:=[ADDRESS_FORMATS:74]Town_Name:5
			DB_t_CountyLabel:=[ADDRESS_FORMATS:74]County_Name:6
			DB_t_PostcodeLabel:=[ADDRESS_FORMATS:74]Postcode_Name:7
			DB_t_CountryLabel:=[ADDRESS_FORMATS:74]Country_Name:8
		Else 
			DB_t_Address1Label:=<>DB_t_Address1Label
			DB_t_Address2Label:=<>DB_t_Address2Label
			DB_t_TownLabel:=<>DB_t_TownLabel
			DB_t_CountyLabel:=<>DB_t_CountyLabel
			DB_t_PostcodeLabel:=<>DB_t_PostcodeLabel
			DB_t_CountryLabel:=<>DB_t_CountryLabel
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Companies_vAT2"; $_t_oldMethodName)
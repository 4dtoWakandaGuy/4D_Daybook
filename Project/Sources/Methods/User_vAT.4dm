//%attributes = {}
If (False:C215)
	//Project Method Name:      User_vAT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2012 15:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_Country; $_t_oldMethodName; $1; DB_t_Address1Label; DB_t_Address2Label; DB_t_CountryLabel; DB_t_CountyLabel; DB_t_PostcodeLabel; DB_t_TownLabel)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_vAT")
If (Count parameters:C259>=1)
	$_t_Country:=$1
Else 
	$_t_Country:=DB_GetOrganisationCountry
End if 

If ($_t_Country="")
	Companies_vAT
Else 
	QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=$_t_Country)
	QUERY:C277([ADDRESS_FORMATS:74]; [ADDRESS_FORMATS:74]Format_Code:1=[COUNTRIES:73]Address_Format:2)
	If (Records in selection:C76([ADDRESS_FORMATS:74])=1)
		DB_t_Address1Label:=[ADDRESS_FORMATS:74]Address_1_Name:3
		DB_t_Address2Label:=[ADDRESS_FORMATS:74]Address_2_Name:4
		DB_t_TownLabel:=[ADDRESS_FORMATS:74]Town_Name:5
		DB_t_CountyLabel:=[ADDRESS_FORMATS:74]County_Name:6
		DB_t_PostcodeLabel:=[ADDRESS_FORMATS:74]Postcode_Name:7
		DB_t_CountryLabel:=[ADDRESS_FORMATS:74]Country_Name:8
	Else 
		Companies_vAT
	End if 
End if 
ERR_MethodTrackerReturn("User_vAT"; $_t_oldMethodName)

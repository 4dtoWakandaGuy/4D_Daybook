If (False:C215)
	//object Name: [COUNTRIES]Country_In.oCUR_ISOName_POPUP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/09/2012 09:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DM_at_CountryCodes;0)
	//ARRAY TEXT(DM_at_CountryNames;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; CUR_t_ISoCountryName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COUNTRIES].Country_In.oCUR_ISOName_POPUP"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (DM_at_CountryNames>0)
			[COUNTRIES:73]ISO_Code:6:=DM_at_CountryCodes{DM_at_CountryNames}
			CUR_t_ISoCountryName:=DM_at_CountryNames{DM_at_CountryNames}
		End if 
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [COUNTRIES].Country_In.oCUR_ISOName_POPUP"; $_t_oldMethodName)

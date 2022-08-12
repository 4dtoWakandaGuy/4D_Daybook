If (False:C215)
	//object Name: [COUNTRIES]Country_In.oCUR_ISOName_POPUP1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/09/2012 15:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CCM_at_CountryCodes;0)
	//ARRAY TEXT(CCM_at_CurrencyNames;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; CUR_t_ISoCurrencyName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COUNTRIES].Country_In.oCUR_ISOName_POPUP1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (CCM_at_CurrencyNames>0)
			[COUNTRIES:73]ISO_Currency:8:=CCM_at_CountryCodes{CCM_at_CurrencyNames}
			CUR_t_ISoCurrencyName:=CCM_at_CurrencyNames{CCM_at_CurrencyNames}
		End if 
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [COUNTRIES].Country_In.oCUR_ISOName_POPUP1"; $_t_oldMethodName)

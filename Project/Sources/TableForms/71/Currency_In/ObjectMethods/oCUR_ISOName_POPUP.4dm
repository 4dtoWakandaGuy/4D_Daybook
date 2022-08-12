If (False:C215)
	//object Name: [CURRENCIES]Currency_In.oCUR_ISOName_POPUP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CCM_at_CurrencyCodes;0)
	//ARRAY TEXT(CCM_at_CurrencyNames;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; CUR_t_ISoCurrencyName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CURRENCIES].Currency_In.oCUR_ISOName_POPUP"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (CCM_at_CurrencyNames>0)
			[CURRENCIES:71]ISO_Currency_Code:8:=CCM_at_CurrencyCodes{CCM_at_CurrencyNames}
			CUR_t_ISoCurrencyName:=CCM_at_CurrencyNames{CCM_at_CurrencyNames}
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [CURRENCIES].Currency_In.oCUR_ISOName_POPUP"; $_t_oldMethodName)

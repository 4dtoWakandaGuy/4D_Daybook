If (False:C215)
	//object Name: [USER]CUR_ConversionRates.oLBCurrencies
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2012 09:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CUR_al_CurrencyIDs;0)
	//ARRAY TEXT(CUR_at_CurrencyNames;0)
	C_BOOLEAN:C305(CUR_bo_CurrencyModify)
	C_LONGINT:C283($_l_CurrencyID; $_l_event; $_l_SelectedRow; CUR_l_SelectedCurrencyCode)
	C_TEXT:C284($_at_CurrencyNames; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CUR_ConversionRates.oLBCurrencies"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_l_SelectedRow:=Self:C308->
		
		$_l_CurrencyID:=CUR_al_CurrencyIDs{$_l_SelectedRow}
		$_at_CurrencyNames:=CUR_at_CurrencyNames{$_l_SelectedRow}
		CUR_SaveExisting(CUR_l_SelectedCurrencyCode)
		If ($_l_CurrencyID>0)
			CUR_at_CurrencyNames:=Find in array:C230(CUR_al_CurrencyIDs; $_l_CurrencyID)
			If (CUR_at_CurrencyNames>0)
				CUR_l_SelectedCurrencyCode:=CUR_al_CurrencyIDs{$_l_SelectedRow}
				CUR_LoadConversions(CUR_l_SelectedCurrencyCode)
				CUR_bo_CurrencyModify:=False:C215
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].CUR_ConversionRates.oLBCurrencies"; $_t_oldMethodName)

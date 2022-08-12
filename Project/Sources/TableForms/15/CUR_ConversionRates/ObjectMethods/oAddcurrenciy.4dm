If (False:C215)
	//object Name: [USER]CUR_ConversionRates.oAddcurrenciy
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2012 09:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CUR_bo_CurrencyModify)
	C_LONGINT:C283(CUR_l_SelectedCurrencyCode)
	C_TEXT:C284($_t_oldMethodName; CUR_S5_CurrencyCode2; CUR_t_CurrencyName2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CUR_ConversionRates.oAddcurrenciy"; Form event code:C388)

CUR_SaveExisting(CUR_l_SelectedCurrencyCode)

CREATE RECORD:C68([CURRENCIES:71])
OBJECT SET ENTERABLE:C238(CUR_S5_CurrencyCode2; True:C214)
OBJECT SET ENTERABLE:C238(CUR_t_CurrencyName2; True:C214)
CUR_S5_CurrencyCode2:=""
CUR_t_CurrencyName2:=""
[CURRENCIES:71]X_ID:3:=-AA_GetNextIDinMethod(->[CURRENCIES:71]X_ID:3)
CUR_l_SelectedCurrencyCode:=[CURRENCIES:71]X_ID:3
CUR_LoadConversions(0; False:C215)
CUR_bo_CurrencyModify:=False:C215
GOTO OBJECT:C206(CUR_S5_CurrencyCode2)
ERR_MethodTrackerReturn("OBJ [USER].CUR_ConversionRates.oAddcurrenciy"; $_t_oldMethodName)
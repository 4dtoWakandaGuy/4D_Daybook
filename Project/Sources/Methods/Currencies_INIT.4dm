//%attributes = {}
If (False:C215)
	//Project Method Name:      Currencies_INIT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 16:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>DB_at_CurrencyName;0)
	C_BOOLEAN:C305(<>DB_bo_CurrenciesInited)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Currencies_INIT")

While (Semaphore:C143("$Inserting"+"◊aCurrency"))
	DelayTicks
End while 
If (Not:C34(<>DB_bo_CurrenciesInited))
	If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>1)
		READ ONLY:C145([CURRENCIES:71])
		ALL RECORDS:C47([CURRENCIES:71])
		SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; <>DB_at_CurrencyName)
		INSERT IN ARRAY:C227(<>DB_at_CurrencyName; 1; 1)
		UNLOAD RECORD:C212([CURRENCIES:71])
	Else 
		ARRAY TEXT:C222(<>DB_at_CurrencyName; 1)
	End if 
	<>DB_at_CurrencyName{1}:="BASE"
	<>DB_at_CurrencyName:=1
End if 
CLEAR SEMAPHORE:C144("$Inserting"+"◊aCurrency")
<>DB_bo_CurrenciesInited:=True:C214
ERR_MethodTrackerReturn("Currencies_INIT"; $_t_oldMethodName)
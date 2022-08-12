//%attributes = {}
If (False:C215)
	//Project Method Name:      CUR_SaveExisting
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CUR_al_CurrencyIDs;0)
	//ARRAY TEXT(CUR_at_CurrencyCodes;0)
	//ARRAY TEXT(CUR_at_CurrencyNames;0)
	C_BOOLEAN:C305(CUR_bo_CurrencyModify)
	C_LONGINT:C283(CUR_l_CurrencyPeriod)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; CUR_S5_CurrencyCode2; CUR_t_CurrencyName2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CUR_SaveExisting")
If (Count parameters:C259>=1)
	If ($1#0)
		Case of 
			: ($1>0)  //existing currency
				If (CUR_bo_CurrencyModify)
					[CURRENCIES:71]Currency_Code:1:=CUR_S5_CurrencyCode2
					[CURRENCIES:71]Currency_Name:2:=CUR_t_CurrencyName2
					DB_SaveRecord(->[CURRENCIES:71])
					AA_CheckFileUnlocked(->[CURRENCIES:71]X_ID:3)
				End if 
				CUR_SaveRateChanges([CURRENCIES:71]Currency_Code:1; CUR_l_CurrencyPeriod)
			: ($1<0)  //just added not real
				[CURRENCIES:71]Currency_Code:1:=CUR_S5_CurrencyCode2
				[CURRENCIES:71]Currency_Name:2:=CUR_t_CurrencyName2
				[CURRENCIES:71]X_ID:3:=Abs:C99($1)
				DB_SaveRecord(->[CURRENCIES:71])
				AA_CheckFileUnlocked(->[CURRENCIES:71]X_ID:3)
				//well it must be loaded!
				CUR_SaveRateChanges([CURRENCIES:71]Currency_Code:1; CUR_l_CurrencyPeriod)
				ALL RECORDS:C47([CURRENCIES:71])
				SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Name:2; CUR_at_CurrencyNames; [CURRENCIES:71]X_ID:3; CUR_al_CurrencyIDs; [CURRENCIES:71]Currency_Code:1; CUR_at_CurrencyCodes)
		End case 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("CUR_SaveExisting"; $_t_oldMethodName)
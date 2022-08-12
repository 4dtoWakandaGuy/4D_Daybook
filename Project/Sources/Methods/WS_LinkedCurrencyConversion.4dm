//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_LinkedCurrencyConversion
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($0; $1; VBalance)
	C_TEXT:C284($_t_oldMethodName; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WS_LinkedCurrencyConversion")
//this will convert to  currency
//First convert to currency one
If (Count parameters:C259>=4)
	QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Name:2=$3)
	
	QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1; $2; *)
	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=[CURRENCIES:71]Currency_Code:1)
	ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
	vBalance:=Gen_Round(($1*[CURRENCY_RATES:72]Rate:3); 2; 2)
	//now convert from that currency to the output currency
	QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1; [CURRENCIES:71]Currency_Code:1; *)
	QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$4)
	ORDER BY:C49([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4; <)
	vBalance:=Gen_Round((vBalance*[CURRENCY_RATES:72]Rate:3); 2; 2)
	$0:=vBalance
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("WS_LinkedCurrencyConversion"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      CurrRates_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 09:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; vButtDisCRT; ACC_t_CurrencyCode; vLayer)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CurrRates_InLPB")
If ([CURRENCY_RATES:72]Currency_From:1="")
	[CURRENCY_RATES:72]Currency_From:1:=<>SYS_t_BaseCurrency
	GOTO OBJECT:C206([CURRENCY_RATES:72]Currency_To:2)
Else 
	GOTO OBJECT:C206([CURRENCY_RATES:72]Rate:3)
End if 
RELATE ONE:C42([CURRENCY_RATES:72]Currency_From:1)
ACC_t_CurrencyCode:=[CURRENCIES:71]Currency_Name:2
RELATE ONE:C42([CURRENCY_RATES:72]Currency_To:2)
vLayer:=[CURRENCIES:71]Currency_Name:2
If ([CURRENCY_RATES:72]Date:4=!00-00-00!)
	[CURRENCY_RATES:72]Date:4:=<>DB_d_CurrentDate
End if 
vButtDisCRT:="I  PMO  FSSSRCADT"
Input_Buttons(->[CURRENCY_RATES:72]; ->vButtDisCRT)
ERR_MethodTrackerReturn("CurrRates_InLPB"; $_t_oldMethodName)
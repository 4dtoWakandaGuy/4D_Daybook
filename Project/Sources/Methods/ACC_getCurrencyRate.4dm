//%attributes = {}

If (False:C215)
	//Database Method Name:      ACC_getCurrencyRate
	//------------------ Method Notes ------------------
	//this is used when there is no record of the rate between currency a and b to work out what it is from other currencies
	//------------------ Revision Control ----------------
	//Date Created:  16/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue)
	C_DATE:C307($_d_FromDate; $_d_toDate)
	C_LONGINT:C283($_l_CurrencyPeriod; $3)
	C_TEXT:C284($_t_CurrencyPeriod; $_t_FromCurrency; $_t_PeriodFromDate; $_t_periodToDate; $_t_ToCurrency; $1; $2)
End if 

//Code Starts Here
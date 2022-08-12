If (False:C215)
	//object Name: [ACCOUNT_BALANCES]dCurrConv.Variable3
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
	C_LONGINT:C283(r0; r1)
	C_OBJECT:C1216($_obj_FormEvent)
	C_TEXT:C284($_t_oldMethodName; vCallCode)
End if 
//Code Starts Here

$_obj_FormEvent:=FORM Event:C1606
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].dCurrConv.Variable3"; $_obj_FormEvent.code)
Case of 
	: ($_obj_FormEvent.code=On Clicked:K2:4)
		
		QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=Form:C1466.CurrencyCode)
		If (Records in selection:C76([CURRENCIES:71])#1)
			GOTO OBJECT:C206(*; "oCurrencyCode")
			Form:C1466.CurrencyCode:=""
		Else 
			Form:C1466.CurrencyCode:=[CURRENCIES:71]Currency_Code:1
			Form:C1466.DoNotConvert:=0
			Form:C1466.Convert:=1
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].dCurrConv.Variable3"; $_t_oldMethodName)

If (False:C215)
	//object Name: [INVOICES]dPayment.Variable12
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
	C_REAL:C285(vPayment; vT1; vTotal)
	C_TEXT:C284($_t_oldMethodName; ACC_t_CurrencyCode; vCountry)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dPayment.Variable12"; Form event code:C388)



Sel_NoAtAt(->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ACC_t_CurrencyCode; ACC_t_CurrencyCode+"@")


If (Records in selection:C76([CURRENCIES:71])>0)
	ACC_t_CurrencyCode:=[CURRENCIES:71]Currency_Code:1
	If (ACC_t_CurrencyCode=vCountry)
		vPayment:=vT1
	Else 
		CurrRate_MostRecent(vCountry; ACC_t_CurrencyCode)
		CurrRate_Convert(vCountry; ->vPayment)
	End if 
Else 
	Gen_Alert("That Currency does not exist")
	ACC_t_CurrencyCode:=vCountry
	vPayment:=vT1
End if 
ERR_MethodTrackerReturn("OBJ [INVOICES].dPayment.Variable12"; $_t_oldMethodName)

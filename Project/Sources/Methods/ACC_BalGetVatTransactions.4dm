//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalGetVatTransactions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 14:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_OBJECT:C1216($_obj_Settings; $_obj_SettingscurrencyCode; $1)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; ACC_t_analysisCodeFrom; ACC_t_currencyCode; vAnalCodeT; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalGetVatTransactions")
If ((ACC_t_analysisCodeFrom#"") | (vAnalCodeT#""))
	If (ACC_t_analysisCodeFrom=vAnalCodeT)
		QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=ACC_t_analysisCodeFrom)
	Else 
		If (vAnalCodeT="")
			vAnalCodeT:=("Z"*10)
		End if 
		QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2>=ACC_t_analysisCodeFrom; *)
		QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2<=vAnalCodeT)
	End if 
End if 
If (ACC_t_currencyCode#"")
	If (ACC_t_currencyCode=<>SYS_t_BaseCurrency)
		QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=ACC_t_currencyCode; *)
		QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Currency_Code:22="")
	Else 
		QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=ACC_t_currencyCode)
	End if 
End if 
If (vText#"")
	If (vText=DB_GetLedgerActualLayer)
		QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23=vText; *)
		QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Layer_Code:23="")
	Else 
		QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23=vText)
	End if 
End if 

ERR_MethodTrackerReturn("ACC_BalGetVatTransactions"; $_t_oldMethodName)

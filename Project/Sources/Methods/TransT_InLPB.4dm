//%attributes = {}
If (False:C215)
	//Project Method Name:      TransT_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 16:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; ACC_t_CurrencyCode; vAnalysis; vButtDisTRT; vCAccName; vDAccName; vLayer; vProblem; vSolution; vTitle2)
	C_TEXT:C284(vTitle3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransT_InLPB")
RELATE ONE:C42([TRANSACTION_TYPES:31]Debit_Account:4)
vDAccName:=[ACCOUNTS:32]Account_Name:3
vProblem:=Trans_IOText([ACCOUNTS:32]IO:5)
RELATE ONE:C42([TRANSACTION_TYPES:31]Credit_Account:5)
vCAccName:=[ACCOUNTS:32]Account_Name:3
vSolution:=Trans_IOText([ACCOUNTS:32]IO:5)
RELATE ONE:C42([TRANSACTION_TYPES:31]Analysis_Code:7)
vAnalysis:=[ANALYSES:36]Analysis_Name:2
If ([TRANSACTION_TYPES:31]Currency_Code:17="")
	[TRANSACTION_TYPES:31]Currency_Code:17:=<>SYS_t_BaseCurrency
End if 
RELATE ONE:C42([TRANSACTION_TYPES:31]Currency_Code:17)
ACC_t_CurrencyCode:=[CURRENCIES:71]Currency_Name:2
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
	OBJECT SET ENTERABLE:C238([TRANSACTION_TYPES:31]Currency_Code:17; False:C215)
End if 
If ([TRANSACTION_TYPES:31]Layer_Code:16="")
	[TRANSACTION_TYPES:31]Layer_Code:16:=DB_GetLedgerActualLayer
End if 
RELATE ONE:C42([TRANSACTION_TYPES:31]Layer_Code:16)
vLayer:=[LAYERS:76]Layer_Name:2
If ([TRANSACTION_TYPES:31]DC:3="")
	[TRANSACTION_TYPES:31]DC:3:="D"
End if 
vTitle2:=Term_VATWT("VAT Code")
vTitle3:=Term_VATWT("VAT Debit or Credit")
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
	OBJECT SET ENTERABLE:C238([TRANSACTION_TYPES:31]Currency_Code:17; False:C215)
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
	OBJECT SET ENTERABLE:C238([TRANSACTION_TYPES:31]Phantom_Transaction:18; False:C215)
	OBJECT SET ENTERABLE:C238([TRANSACTION_TYPES:31]Phantom_Same_Layer:19; False:C215)
	OBJECT SET ENTERABLE:C238([TRANSACTION_TYPES:31]Phantom_View:20; False:C215)
	OBJECT SET ENTERABLE:C238([TRANSACTION_TYPES:31]Phantom_Tied:21; False:C215)
	OBJECT SET ENTERABLE:C238([TRANSACTION_TYPES:31]Phantom_Standard:22; False:C215)
End if 
If ([TRANSACTION_TYPES:31]Transaction_Type_Code:1#"")
	GOTO OBJECT:C206([TRANSACTION_TYPES:31]Transaction_Type_Name:2)
End if 
vButtDisTRT:="I  PMO  FSSSRCADT"
Input_Buttons(->[TRANSACTION_TYPES:31]; ->vButtDisTRT)
ERR_MethodTrackerReturn("TransT_InLPB"; $_t_oldMethodName)

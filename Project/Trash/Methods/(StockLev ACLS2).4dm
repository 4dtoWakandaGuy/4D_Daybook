//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockLev ACLS2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 16:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StockAnal)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $1; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockLev ACLS2")
//See also StockLev_ACLSr
If (<>StockAnal)
	QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=$1)
Else 
	QUERY:C277([STOCK_LEVELS:58])  //; & ;[Stock levels]Analysis Code="")
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
	If ($2=<>SYS_t_BaseCurrency)
		QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$2; *)
		QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Currency_Code:8="")
	Else 
		QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$2)
	End if 
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
	If ($3=DB_GetLedgerActualLayer)
		QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$3; *)
		QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Layer_Code:9="")
	Else 
		QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$3)
	End if 
End if 
ERR_MethodTrackerReturn("StockLev ACLS2"; $_t_oldMethodName)

//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockLev ACLSr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/10/2010 15:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StockAnal)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_oldMethodName; $1; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockLev ACLSr")
//See also StockCurrACLSr
//Used in StockAss_In
If (Count parameters:C259>=1)
	$_t_AnalysisCode:=$1
Else 
	$_t_AnalysisCode:=[STOCK_MOVEMENTS:40]Analysis_Code:9
End if 
If (Count parameters:C259>=2)
	$_t_CurrencyCode:=$2
Else 
	$_t_CurrencyCode:=[STOCK_MOVEMENTS:40]Currency_Code:10
End if 
If (Count parameters:C259>=3)
	$_t_LayerCode:=$3
Else 
	$_t_LayerCode:=[STOCK_MOVEMENTS:40]Layer_Code:11
End if 
If (<>StockAnal)
	QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=$_t_AnalysisCode)
Else 
	QUERY:C277([STOCK_LEVELS:58])  //; & ;[STOCK LEVELS]Analysis Code="")
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
	If (Records in selection:C76([STOCK_LEVELS:58])#0)
		If ([STOCK_MOVEMENTS:40]Currency_Code:10=<>SYS_t_BaseCurrency)
			QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$_t_CurrencyCode; *)
			QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Currency_Code:8="")
		Else 
			QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$_t_CurrencyCode)
		End if 
	End if 
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
	If (Records in selection:C76([STOCK_LEVELS:58])#0)
		If ([STOCK_MOVEMENTS:40]Layer_Code:11=DB_GetLedgerActualLayer)
			QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$_t_LayerCode; *)
			QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Layer_Code:9="")
		Else 
			QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$_t_LayerCode)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("StockLev ACLSr"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_CurrentACLsr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/04/2010 21:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StockAnal)
	C_LONGINT:C283($_l_RecordsInSelection)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_oldMethodName; $1; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StK_CurrentACLSr")
//See also StockLev_ACLSr
If (Count parameters:C259>1)
	$_t_AnalysisCode:=$1
Else 
	$_t_AnalysisCode:=[STOCK_MOVEMENTS:40]Analysis_Code:9
End if 
If (Count parameters:C259>3)
	$_t_LayerCode:=$2
Else 
	$_t_LayerCode:=[STOCK_MOVEMENTS:40]Layer_Code:11
End if 
If (Count parameters:C259>3)
	$_t_CurrencyCode:=$3
Else 
	$_t_CurrencyCode:=[STOCK_MOVEMENTS:40]Currency_Code:10
End if 
If (<>StockAnal)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$_t_AnalysisCode)
Else 
	QUERY:C277([CURRENT_STOCK:62])
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
	$_l_RecordsInSelection:=Records in selection:C76([CURRENT_STOCK:62])
	If ($_l_RecordsInSelection#0)
		If ($_t_CurrencyCode=<>SYS_t_BaseCurrency)
			If ($_l_RecordsInSelection=1)
				If (([CURRENT_STOCK:62]Currency_Code:11#$_t_CurrencyCode) & ([CURRENT_STOCK:62]Currency_Code:11#""))
					REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
				End if 
			Else 
				QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Currency_Code:11=$_t_CurrencyCode; *)
				QUERY SELECTION:C341([CURRENT_STOCK:62];  | ; [CURRENT_STOCK:62]Currency_Code:11="")
			End if 
		Else 
			If ($_l_RecordsInSelection=1)
				If ([CURRENT_STOCK:62]Currency_Code:11#$_t_CurrencyCode)
					REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
				End if 
			Else 
				QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Currency_Code:11=$_t_CurrencyCode)
			End if 
		End if 
	End if 
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
	$_l_RecordsInSelection:=Records in selection:C76([CURRENT_STOCK:62])
	If ($_l_RecordsInSelection#0)
		If ($_t_LayerCode=DB_GetLedgerActualLayer)
			If ($_l_RecordsInSelection=1)
				If (([CURRENT_STOCK:62]Layer_Code:12#$_t_LayerCode) & ([CURRENT_STOCK:62]Layer_Code:12#""))
					REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
				End if 
			Else 
				QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Layer_Code:12=$_t_LayerCode; *)
				QUERY SELECTION:C341([CURRENT_STOCK:62];  | ; [CURRENT_STOCK:62]Layer_Code:12="")
			End if 
		Else 
			If ($_l_RecordsInSelection=1)
				If ([CURRENT_STOCK:62]Layer_Code:12#$_t_LayerCode)
					REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
				End if 
			Else 
				QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Layer_Code:12=$_t_LayerCode)
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("StockCurr_ACLSr"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      StockCurr_ACLSr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/04/2010 10:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StockAnal; $_bo_ContinuationQuery; $1)
	C_LONGINT:C283($_l_RecordsinSelection)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_oldMethodName; $2; $3; $4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockCurr_ACLSr")
//See also StockLev_ACLSr
If (Count parameters:C259>=1)
	$_bo_ContinuationQuery:=$1
Else 
	$_bo_ContinuationQuery:=True:C214
End if 
If (Count parameters:C259>=2)
	$_t_AnalysisCode:=$2
Else 
	$_t_AnalysisCode:=[STOCK_MOVEMENTS:40]Analysis_Code:9
End if 
If (Count parameters:C259>=3)
	$_t_CurrencyCode:=$3
Else 
	$_t_CurrencyCode:=[STOCK_MOVEMENTS:40]Currency_Code:10
End if 
If (Count parameters:C259>=4)
	$_t_LayerCode:=$4
Else 
	$_t_LayerCode:=[STOCK_MOVEMENTS:40]Layer_Code:11
End if 
If (<>StockAnal)
	If ($_bo_ContinuationQuery)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$_t_AnalysisCode)
	Else 
		QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Analysis_Code:10=$_t_AnalysisCode)
	End if 
Else 
	If ($_bo_ContinuationQuery)
		QUERY:C277([CURRENT_STOCK:62])  //; & ;[CURRENT STOCK]Analysis Code="")
	Else 
		
	End if 
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
	$_l_RecordsinSelection:=Records in selection:C76([CURRENT_STOCK:62])
	If ($_l_RecordsinSelection#0)
		If ([STOCK_MOVEMENTS:40]Currency_Code:10=<>SYS_t_BaseCurrency)
			If ($_l_RecordsinSelection=1)
				If (([CURRENT_STOCK:62]Currency_Code:11#$_t_CurrencyCode) & ([CURRENT_STOCK:62]Currency_Code:11#""))
					REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
				End if 
			Else 
				QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Currency_Code:11=$_t_CurrencyCode; *)
				QUERY SELECTION:C341([CURRENT_STOCK:62];  | ; [CURRENT_STOCK:62]Currency_Code:11="")
			End if 
		Else 
			If ($_l_RecordsinSelection=1)
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
	$_l_RecordsinSelection:=Records in selection:C76([CURRENT_STOCK:62])
	If ($_l_RecordsinSelection#0)
		If ([STOCK_MOVEMENTS:40]Layer_Code:11=DB_GetLedgerActualLayer)
			If ($_l_RecordsinSelection=1)
				If (([CURRENT_STOCK:62]Layer_Code:12#$_t_LayerCode) & ([CURRENT_STOCK:62]Layer_Code:12#""))
					REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
				End if 
			Else 
				QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Layer_Code:12=$_t_LayerCode; *)
				QUERY SELECTION:C341([CURRENT_STOCK:62];  | ; [CURRENT_STOCK:62]Layer_Code:12="")
			End if 
		Else 
			If ($_l_RecordsinSelection=1)
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

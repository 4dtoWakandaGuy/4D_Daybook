//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockCurr ACLS2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/11/2010 23:49
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

$_t_oldMethodName:=ERR_MethodTracker("StockCurr ACLS2")
//See also StockLev_ACLSr
If (<>StockAnal)
	If ($1#"")
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$1)
	Else 
		QUERY:C277([CURRENT_STOCK:62])
	End if 
Else 
	QUERY:C277([CURRENT_STOCK:62])  //; & ;[CURRENT STOCK]Analysis Code="")
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
	
	If ($2=<>SYS_t_BaseCurrency)
		QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Currency_Code:11=$2; *)
		QUERY SELECTION:C341([CURRENT_STOCK:62];  | ; [CURRENT_STOCK:62]Currency_Code:11="")
	Else 
		If ($2#"")
			QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Currency_Code:11=$2)
		End if 
	End if 
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
	If ($3=DB_GetLedgerActualLayer)
		QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Layer_Code:12=$3; *)
		QUERY SELECTION:C341([CURRENT_STOCK:62];  | ; [CURRENT_STOCK:62]Layer_Code:12="")
	Else 
		If ($3#"")
			QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Layer_Code:12=$3)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("StockCurr ACLS2"; $_t_oldMethodName)

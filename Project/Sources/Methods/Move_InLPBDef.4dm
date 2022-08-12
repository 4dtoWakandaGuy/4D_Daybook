//%attributes = {}
If (False:C215)
	//Project Method Name:      Move_InLPBDef
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 14:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PersAnOver)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>Per_t_CurrentDefaultAnalCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Move_InLPBDef")
If ((<>PersAnOver) & ([STOCK_MOVEMENTS:40]Analysis_Code:9=""))
	[STOCK_MOVEMENTS:40]Analysis_Code:9:=<>Per_t_CurrentDefaultAnalCode
End if 
If ([STOCK_MOVEMENTS:40]Currency_Code:10="")
	[STOCK_MOVEMENTS:40]Currency_Code:10:=<>SYS_t_BaseCurrency
End if 
If ([STOCK_MOVEMENTS:40]Layer_Code:11="")
	[STOCK_MOVEMENTS:40]Layer_Code:11:=DB_GetLedgerActualLayer
End if 
ERR_MethodTrackerReturn("Move_InLPBDef"; $_t_oldMethodName)
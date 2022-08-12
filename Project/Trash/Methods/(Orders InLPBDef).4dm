//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_InLPBDef
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
	C_BOOLEAN:C305(<>SalesHdrDP)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPBDef")
[ORDERS:24]Taken_By:17:=<>PER_t_CurrentUserInitials
If ([ORDERS:24]Analysis_Code:33="")
	Check_PersAnal(->[ORDERS:24]Taken_By:17; ->[ORDERS:24]Analysis_Code:33)
End if 
If ([COMPANIES:2]SL_Terms:40#"")
	[ORDERS:24]Terms:16:=[COMPANIES:2]SL_Terms:40
Else 
	[ORDERS:24]Terms:16:=DB_GetLedgerDefaultTerms
End if 
[ORDERS:24]Print_Comments:44:=<>SalesHdrDP
If ([ORDERS:24]Layer_Code:47="")
	If ([TRANSACTION_TYPES:31]Layer_Code:16#"")
		[ORDERS:24]Layer_Code:47:=[TRANSACTION_TYPES:31]Layer_Code:16
	Else 
		[ORDERS:24]Layer_Code:47:=DB_GetLedgerActualLayer
	End if 
End if 
If ([ORDERS:24]Currency_Code:32="")
	[ORDERS:24]Currency_Code:32:=<>SYS_t_BaseCurrency
End if 
ERR_MethodTrackerReturn("Orders_InLPBDef"; $_t_oldMethodName)
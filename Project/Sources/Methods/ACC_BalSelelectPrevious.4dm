//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalSelelectPrevious
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 14:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_OBJECT:C1216($_obj_Data; $1)
	C_POINTER:C301(vFilePtr)
	C_REAL:C285(vAmountF; vAmountT)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_PeriodFrom; ACC_t_PeriodTo; vText; vTitle13)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalSelectPrevious")
If (Count parameters:C259>=1)
	$_obj_Data:=$1
	SelPvs_AnalysesCode($_obj_Data)
	$_obj_Data.PeriodCodeFrom:=""
	$_obj_Data.PeriodCodeTo:=""
	$_obj_Data.AccountCodeFrom:=""
	$_obj_Data.AccountCodeTo:=""
	$_obj_Data.CurrencyCode:=<>SYS_t_BaseCurrency
	$_obj_Data.AmountFrom:=0
	$_obj_Data.AmountTo:=0
	$_obj_Data.LayerCode:=DB_GetLedgerActualLayer
	$_obj_Data.TableNumber:=Table:C252(->[ACCOUNT_BALANCES:34])
	$_obj_Data.QueryVariables:=New collection:C1472("AnalysisCodeFrom"; "AnalysisCodeTo"; "PeriodCodeFrom"; "PeriodCodeTo"; "AccountCodeFrom"; "AccountCodeTo"; "AmountFrom"; "AmountTo"; "LayerCode"; "FilterinEmptyAccounts"; "NoLookupLists")
	
Else 
	SelPvs_AnalysesCode
	ACC_t_PeriodFrom:=""
	ACC_t_PeriodTo:=""
	Acc_t_AccountCodeFrom:=""
	Acc_t_AccountCodeTo:=""
	ACC_t_CurrencyCode:=<>SYS_t_BaseCurrency
	vAmountF:=0
	vAmountT:=0
	vText:=DB_GetLedgerActualLayer
	vFilePtr:=->[ACCOUNT_BALANCES:34]
	vTitle13:="ACC_t_AnalysisCodeFrom+vAnalCodeT+ACC_t_PeriodFrom+ACC_t_PeriodTo+Acc_t_AccountCodeFrom+Acc_t_AccountCodeTo+vAmountF+vAmountT+"
	vTitle13:=vTitle13+"vText+ch5+ch7+ch6+s1+s2+"
End if 
ERR_MethodTrackerReturn("ACC_BalSelectPrevious"; $_t_oldMethodName)

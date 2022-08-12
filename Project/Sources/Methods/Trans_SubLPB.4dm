//%attributes = {}
If (False:C215)
	//Project Method Name:      Trans_SubLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 14:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PersAnOver)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_PeriodID)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; <>SYS_t_BaseCurrency; $_t_oldMethodName; SYS_t_AccessType; vCAccName; vCompany; vDAccName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_SubLPB")
//Trans_SubLPB
If ([TRANSACTION_BATCH_ITEMS:155]Tax_Code:7="")
	[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=DB_GetLedgerDefaultSalesTax
	[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:="N"
	// If (◊TermST)
	//  [TRANS IN_TRANS SUB]Credit IO:="N"
	// Else
	[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:="N"
	// End if
	[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
End if 
If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5=!00-00-00!)
	[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=[TRANSACTION_BATCHES:30]Batch_Date:1
	vDate:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5
	$_l_PeriodID:=Check_Period
	If ([PERIODS:33]NL_Closed:5=True:C214)
		Period_Find
	End if 
	[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PERIODS:33]Period_Code:1
	If (([TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5>[PERIODS:33]To_Date:4) | ([TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5<[PERIODS:33]From_Date:3))
		[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=[PERIODS:33]From_Date:3
	End if 
	If ([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19="")
		[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=<>SYS_t_BaseCurrency
	End if 
	If (<>PersAnOver)
		[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=<>Per_t_CurrentDefaultAnalCode
	End if 
	If ([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20="")
		[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=DB_GetLedgerActualLayer
	End if 
End if 
If (SYS_t_AccessType="") | (True:C214)
	If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
		OBJECT SET ENTERABLE:C238([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; False:C215)
	End if 
	If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
		OBJECT SET ENTERABLE:C238([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; False:C215)
	End if 
	
	
	If (((DB_GetModuleSettingByNUM(Module_JobCosting))<2))
		OBJECT SET ENTERABLE:C238([TRANSACTION_BATCH_ITEMS:155]Job_Code:23; False:C215)
	End if 
	vCompany:=""
	vCAccName:=""
	vDAccName:=""
End if 
ERR_MethodTrackerReturn("Trans_SubLPB"; $_t_oldMethodName)

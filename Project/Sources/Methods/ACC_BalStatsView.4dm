//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalStatsView
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SYS_bo_StatsView)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vSVCF)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalStatsView")
//ACC_BalStatsView
vFilePtr:=->[ACCOUNT_BALANCES:34]
SYS_bo_StatsView:=True:C214
vSVCF:="ACC_BalSVCallsFile"
StatsView_ArFiS("Balances/34/ACC_BalSelect/"+"Transactions/29/Trans_Sel/Sales Ledger/39/Invoices_Sel/"+"Purchase Ledger/37/Purchases_Sel"+"/Jobs/26/Jobs_Sel/")

StatsView_ArF1S("1.36/2.32.2,3/4.33/5.76/6.71/")
ERR_MethodTrackerReturn("ACC_BalStatsView"; $_t_oldMethodName)

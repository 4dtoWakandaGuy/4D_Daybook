//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans SV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2009 14:08
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

$_t_oldMethodName:=ERR_MethodTracker("Trans SV")
vFilePtr:=->[TRANSACTIONS:29]
SYS_bo_StatsView:=True:C214
vSVCF:="Trans_SVCF"
StatsView_ArFiS("Transactions/29/Trans_Sel/Sales Ledger/39/Invoices_Sel/"+"Purchase Ledger/37/Purchases_Sel"+"/Jobs/26/Jobs_Sel/")

StatsView_ArF1S("1.31/2.36/3.32.2,3/9.2/12.33/14/18/21/22.71/23.76/26.41/")
ERR_MethodTrackerReturn("Trans SV"; $_t_oldMethodName)
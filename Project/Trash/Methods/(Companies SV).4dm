//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies SV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
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

$_t_oldMethodName:=ERR_MethodTracker("Companies SV")
//Companies SV - StatsView - called from Companies_File
vFilePtr:=->[COMPANIES:2]
SYS_bo_StatsView:=True:C214
vSVCF:="Companies_SVCF"
StatsView_ArFiS("Companies/2/Comp_Sel/Contacts/1/Cont_Sel/Qualities/55/Qualities_Sel/"+"Diary/12/Diary_Sel/Sales Orders/24/Orders_Sel/"+"Order Items/25/OrderI_Sel/Purchase Orders/57/PurchOrd_Sel/"+"Sales Ledger/39/Invoices_Sel/"+"Purchase Ledger/37/Purchases_Sel/Nominal Ledger/29/Trans_Sel/"+"Service Calls/20/Calls_Sel/Jobs/26/Jobs_Sel/")

StatsView_ArF1S("5/6/8/11.3/12.4/13.5/14.6/17/26.11/29.11")
ERR_MethodTrackerReturn("Companies SV"; $_t_oldMethodName)
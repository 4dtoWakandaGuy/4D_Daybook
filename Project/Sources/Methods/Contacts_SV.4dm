//%attributes = {}
If (False:C215)
	//Project Method Name:      Contacts_SV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 21:14:42If (False)// ----------------------------------------------------
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

$_t_oldMethodName:=ERR_MethodTracker("Contacts_SV")
//Contacts_SV
vFilePtr:=->[CONTACTS:1]
SYS_bo_StatsView:=True:C214
vSVCF:="Contacts_SVCF"
StatsView_ArFiS("Contacts/1/Cont_Sel/Companies/2/Comp_Sel/Qualities/55/Qualities_Sel/"+"Diary/12/Diary_Sel/Sales Orders/24/Orders_Sel/"+"Order Items/25/OrderI_Sel/"+"Sales Ledger/39/Invoices_Sel/"+"Service Calls/20/Calls_Sel/Jobs/26/Jobs_Sel/")
StatsView_ArF1S("6/11.87/14.4/15.5/16.6/20/25.11/26")
ERR_MethodTrackerReturn("Contacts_SV"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_PPProf
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 14:04
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDelDate; vInvDate)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vInvNo)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_PPProf")
//Jobs_PPProf
Menu_Record("Jobs_PPProf"; "Proforma Invoice")
If ((DB_GetModuleSettingByNUM(Module_SalesLedger)<2) | (DB_GetModuleSettingByNUM(Module_SalesLedger)=3))
	Gen_Alert("You do not have access to the Sales Ledger"; "Cancel")
Else 
	If (Gen_PPChkStSing(->[ORDERS:24]State:15; 2))
		vInvNo:=Gen_Request("Proforma No to print:")
		If (OK=1)
			Jobs_PPBef
			Jobs_PPInvSrc
			If ((Records in selection:C76([ORDER_ITEMS:25])=0) & (Records in selection:C76([JOB_STAGES:47])=0))
				Gen_Alert("There are no Stages or Items to Invoice"; "Cancel")
			Else 
				Jobs_InLPSort
				vInvDate:=[ORDER_ITEMS:25]Invoice_Date:25
				vDelDate:=[ORDER_ITEMS:25]Delivery_Date:11
				Gen_PP1(->[JOBS:26]; "Jobs")
				DB_t_CurrentFormUsage:="Proforma"
				DB_t_CurrentFormUsage2:="Proforma"
				Jobs_InvTrans
				Gen_PP2("Jobs")
			End if 
			Jobs_PPEnd
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Jobs_PPProf"; $_t_oldMethodName)
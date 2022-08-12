//%attributes = {"invisible":true}

If (False:C215)
	//Project Method Name:      Jobs PPInv
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDelDate; vInvDate)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; vInvNo)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs PPInv")

//NG January 2007-=---temp change to allow invoicing of jobs--needs looking at
If (False:C215)
	Menu_Record("Jobs PPInv"; "Invoice or Credit Note")
	If ((DB_GetModuleSettingByNUM(Module_SalesLedger)<2) | (DB_GetModuleSettingByNUM(Module_SalesLedger)=3))
		Gen_Alert("You do not have access to the Sales Ledger"; "Cancel")
	Else 
		If (Gen_PPChkStSing(->[JOBS:26]State:9; 2))
			vInvNo:=Gen_Request("Invoice/CN/Proforma No to print:")
			If (OK=1)
				Jobs_PPBef
				Jobs_PPInvSrc
				If ((Records in selection:C76([ORDER_ITEMS:25])=0) & (Records in selection:C76([JOB_STAGES:47])=0))
					Gen_Alert("There are no Stages or Items to Invoice"; "Cancel")
				Else 
					If (Gen_PPCreditChk(->[JOBS:26]Company_Code:3; ->[CREDIT_STAGES:54]Prevent_Invoice:7; "Invoiced"))
						Jobs_InLPSort
						vInvDate:=[ORDER_ITEMS:25]Invoice_Date:25
						vDelDate:=[ORDER_ITEMS:25]Delivery_Date:11
						Gen_PP1(->[JOBS:26]; "Jobs")
						DB_t_CurrentFormUsage:="Invoice"
						DB_t_CurrentFormUsage2:="Invoice"
						Jobs_InvTrans
						Gen_PP2("Jobs")
					End if 
				End if 
				Jobs_PPEnd
			End if 
		End if 
	End if 
	ERR_MethodTrackerReturn("Jobs PPInv"; $_t_oldMethodName)
Else 
	$_t_oldMethodName:=ERR_MethodTracker("Jobs PPInv")
	Menu_Record("Jobs PPInv"; "Invoice or Credit Note")
	If ((DB_GetModuleSettingByNUM(Module_SalesLedger)<2) | (DB_GetModuleSettingByNUM(Module_SalesLedger)=3))
		
		
		
		Gen_Alert("You do not have access to the Sales Ledger"; "Cancel")
	Else 
		//If (Gen_PPChkStSing (->[JOBS]State;2))
		If (True:C214)  //kmw 11/01/07 - need to change this back and in fact improve it so it tests that job state is highest code instead of looking in functions
			vInvNo:=Gen_Request("Invoice/CN/Proforma No to print:")
			If (OK=1)
				Jobs_PPBef
				Jobs_PPInvSrc
				If ((Records in selection:C76([ORDER_ITEMS:25])=0) & (Records in selection:C76([JOB_STAGES:47])=0))
					Gen_Alert("There are no Stages or Items to Invoice"; "Cancel")
				Else 
					If (Gen_PPCreditChk(->[JOBS:26]Company_Code:3; ->[CREDIT_STAGES:54]Prevent_Invoice:7; "Invoiced"))
						Jobs_InLPSort
						vInvDate:=[ORDER_ITEMS:25]Invoice_Date:25
						vDelDate:=[ORDER_ITEMS:25]Delivery_Date:11
						Gen_PP1(->[JOBS:26]; "Jobs")
						DB_t_CurrentFormUsage:="Invoice"
						DB_t_CurrentFormUsage2:="Invoice"
						Jobs_InvTrans
						Gen_PP2("Jobs")
					End if 
				End if 
				Jobs_PPEnd
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Jobs PPInv"; $_t_oldMethodName)
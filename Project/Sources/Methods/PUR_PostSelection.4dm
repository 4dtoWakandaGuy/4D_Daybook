//%attributes = {}
If (False:C215)
	//Project Method Name:      PUR_PostSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   31/10/2010 17:21
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vInvDate)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; vNo)
	C_TEXT:C284($_t_oldMethodName; $_t_PeriodCode; DB_t_CurrentContext)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUR_PostSelection")
CREATE SET:C116([PURCHASE_INVOICES:37]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
$_t_PeriodCode:=""
FIRST RECORD:C50([PURCHASE_INVOICES:37])
While ((Not:C34(End selection:C36([PURCHASE_INVOICES:37]))) & ($_t_PeriodCode=""))
	RELATE ONE:C42([PURCHASE_INVOICES:37]Period_Code:3)
	If (([PERIODS:33]NL_Closed:5) | ([PERIODS:33]Period_Code:1=""))
		If ([PERIODS:33]NL_Closed:5)
			$_t_PeriodCode:="Period "+[PERIODS:33]Period_Code:1
		Else 
			$_t_PeriodCode:="Purchase "+[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
		End if 
	End if 
	NEXT RECORD:C51([PURCHASE_INVOICES:37])
End while 
If ($_t_PeriodCode#"")
	If ($_t_PeriodCode="Period@")
		Gen_Alert($_t_PeriodCode+" is closed.  Reopen it before posting"; "Cancel")
	Else 
		Gen_Alert($_t_PeriodCode+" has no Period allocated"; "Cancel")
	End if 
Else 
	Gen_Confirm("Post "+String:C10(vNo)+" Purchase"+("s"*Num:C11(vNo>1))+"?"; "Yes"; "No")
	If (OK=1)
		//  START TRANSACTION
		StartTransaction  // 13/05/02 pb
		
		FIRST RECORD:C50([PURCHASE_INVOICES:37])
		While ((Not:C34(End selection:C36([PURCHASE_INVOICES:37]))) & (OK=1))
			vInvDate:=[PURCHASE_INVOICES:37]Invoice_Date:5
			Purch_InvCalc
			Purch_InvPost
			NEXT RECORD:C51([PURCHASE_INVOICES:37])
		End while 
		Transact_End
	End if 
End if 
USE SET:C118("$temp")
QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=1)
SEL_UpdateRecordCache(Table:C252(->[PURCHASE_INVOICES:37]))
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("PUR_PostSelection"; $_t_oldMethodName)

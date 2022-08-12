//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_PostSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:      29/11/2010 15:55
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vInvDate)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; DB_l_MaxRecords; vNo)
	C_TEXT:C284($_t_oldMethodName; $_t_PeriodCode; DB_t_CurrentContext; DB_t_CurrentFormUsage2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_PostSelection")
CREATE SET:C116([INVOICES:39]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
READ WRITE:C146([INVOICES:39])

vNo:=Records in selection:C76([INVOICES:39])
$_t_PeriodCode:=""
FIRST RECORD:C50([INVOICES:39])
While ((Not:C34(End selection:C36([INVOICES:39]))) & ($_t_PeriodCode=""))
	RELATE ONE:C42([INVOICES:39]Period_Code:13)
	If (([PERIODS:33]NL_Closed:5) | ([PERIODS:33]Period_Code:1=""))
		If ([PERIODS:33]NL_Closed:5)
			$_t_PeriodCode:="Period "+[PERIODS:33]Period_Code:1
		Else 
			$_t_PeriodCode:="Invoice "+[INVOICES:39]Invoice_Number:1
		End if 
	End if 
	NEXT RECORD:C51([INVOICES:39])  //NG may 2004 added table
End while 
If ($_t_PeriodCode#"")
	If ($_t_PeriodCode="Period@")
		Gen_Alert($_t_PeriodCode+" is closed.  Reopen it before posting"; "Cancel")
	Else 
		Gen_Alert($_t_PeriodCode+" has no Period allocated"; "Cancel")
	End if 
Else 
	Gen_Confirm("Post "+String:C10(vNo)+" Invoice"+("s"*Num:C11(vNo>1))+"?"; "Yes"; "No")
	If (OK=1)
		//  START TRANSACTION
		StartTransaction  // 13/05/02 pb
		
		FIRST RECORD:C50([INVOICES:39])  //NG may 2004 added table
		LOAD RECORD:C52([INVOICES:39])
		While ((Not:C34(End selection:C36([INVOICES:39]))) & (OK=1))  //NG may 2004 added table
			vInvDate:=[INVOICES:39]Invoice_Date:4
			Inv_InvCalc
			DB_t_CurrentFormUsage2:="NR"
			Inv_InvPost
			NEXT RECORD:C51([INVOICES:39])  //NG may 2004 added table
		End while 
		Transact_End
	End if 
End if 
DB_SetFormMenuoptions
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=1)
DB_l_MaxRecords:=Records in selection:C76([INVOICES:39])
DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("INV_PostSelection"; $_t_oldMethodName)
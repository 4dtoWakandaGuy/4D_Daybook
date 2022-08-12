//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_PrintAuditTrail
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/11/2010 15:31
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; MOD_l_CurrentModuleAccess; $_l_OK; DB_l_CurrentDisplayedForm; MOD_l_CurrentModuleAccess)
	C_TEXT:C284(DB_t_CurrentContext; $_t_oldMethodName; DB_t_CurrentContext)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_PrintAuditTrail")
CREATE SET:C116([TRANSACTION_BATCHES:30]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
	If (Not:C34(SR_ReportOK("TransBAudit")))
		$_l_OK:=PRINT_SetSIZE("A4"; "L"; "Transaction Batch Audit")
		If ($_l_OK>=0)  // see comments in Print_setsize about this
			FORM SET OUTPUT:C54([TRANSACTION_BATCHES:30]; "TransB_List")
			PRINT SELECTION:C60([TRANSACTION_BATCHES:30])
			If ((OK=1) & (MOD_l_CurrentModuleAccess#3))
				Gen_Confirm("Were the Transactions printed correctly?"; "Yes"; "No")
				If (OK=1)
					READ WRITE:C146([TRANSACTION_BATCHES:30])
					DB_lockFile(->[TRANSACTION_BATCHES:30])
					APPLY TO SELECTION:C70([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Printed:11:=True:C214)
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTION_BATCHES:30]))
				End if 
				PRT_SetPrinterPaperOptions("Transaction Batch Audit")  //NG June 2005
			End if 
		End if 
	End if 
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("ACC_PrintAuditTrail"; $_t_oldMethodName)

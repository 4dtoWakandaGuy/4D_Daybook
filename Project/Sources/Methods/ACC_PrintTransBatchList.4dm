//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_PrintTransBatchList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/11/2010 15:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_PrintTransBatchList")
CREATE SET:C116([TRANSACTION_BATCHES:30]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
	If (Not:C34(SR_ReportOK("TransBPrint")))
		FORM SET OUTPUT:C54([TRANSACTION_BATCHES:30]; "TransB_Print")
		PRINT SELECTION:C60([TRANSACTION_BATCHES:30])
		
	End if 
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("ACC_PrintTransBatchList"; $_t_oldMethodName)
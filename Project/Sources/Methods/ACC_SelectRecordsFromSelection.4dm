//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_SelectRecordsFromSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/08/2010 16:22
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

$_t_oldMethodName:=ERR_MethodTracker("ACC_SelectRecordsFromSelection")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
	DB_SetFormMenuoptions
End if 
ERR_MethodTrackerReturn("ACC_SelectRecordsFromSelection"; $_t_oldMethodName)
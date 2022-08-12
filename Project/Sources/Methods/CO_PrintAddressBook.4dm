//%attributes = {}
If (False:C215)
	//Project Method Name:      CO_PrintAddressBook
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   10/11/2010 11:45
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

$_t_oldMethodName:=ERR_MethodTracker("CO_PrintAddressBook")

CREATE SET:C116([COMPANIES:2]; "$temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([COMPANIES:2])>0)
	CO_AddressBook
	
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("CO_PrintAddressBook"; $_t_oldMethodName)
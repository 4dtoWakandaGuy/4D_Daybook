//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_CountRecordsFromSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/05/2010 15:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_CountRecordsFromSelection")
CREATE SET:C116([CONTACTS:1]; "$temp")
USE SET:C118("ListboxSet0")
//$_ptr_Table:=Table(DB_l_CurrentDisplayedForm)
Gen_Count(->[CONTACTS:1]; "ListboxSet0")

Companies_OutCo
Gen_Alert(vText; "")
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("CON_CountRecordsFromSelection"; $_t_oldMethodName)
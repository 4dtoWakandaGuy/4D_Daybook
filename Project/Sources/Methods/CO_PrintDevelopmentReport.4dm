//%attributes = {}
If (False:C215)
	//Project Method Name:      CO_PrintDevelopmentReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   10/11/2010 11:48
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

$_t_oldMethodName:=ERR_MethodTracker("CO_PrintDevelopmentReport")
CREATE SET:C116([COMPANIES:2]; "$temp")
USE SET:C118("ListboxSet0")
If (Records in selection:C76([COMPANIES:2])>0)
	CO_DevelopmentReport
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("CO_PrintDevelopmentReport"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SortrecordsFromSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/05/2010 15:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SortrecordsFromSelection")

SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
ORDER BY:C49($_ptr_Table->)
SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
ERR_MethodTrackerReturn("DB_SortrecordsFromSelection"; $_t_oldMethodName)
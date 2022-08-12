If (False:C215)
	//object Name: Object Name:      SCRIPT_FORM.oSearchCriteria
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2012 06:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; SD2_T_SearchValue)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ SCRIPT_FORM.oSearchCriteria")

$_t_oldMethodName:=ERR_MethodTracker("OBJ SCRIPT_FORM.oSearchCriteria"; Form event code:C388)
GOTO OBJECT:C206(SD2_T_SearchValue)
ERR_MethodTrackerReturn("OBJ SCRIPT_FORM.oSearchCriteria"; $_t_oldMethodName)
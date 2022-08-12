If (False:C215)
	//object Name: Object Name:      Temp.oSearchCriteria
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oSearchCriteria")

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oSearchCriteria"; Form event code:C388)
GOTO OBJECT:C206(SD2_T_SearchValue)
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oSearchCriteria"; $_t_oldMethodName)
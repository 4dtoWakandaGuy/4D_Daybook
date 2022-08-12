If (False:C215)
	//object Name: [USER]SD2_PersonAdd.oSearchCriteria
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:25
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_PersonAdd.oSearchCriteria"; Form event code:C388)
GOTO OBJECT:C206(SD2_T_SearchValue)
ERR_MethodTrackerReturn("OBJ [USER].SD2_PersonAdd.oSearchCriteria"; $_t_oldMethodName)
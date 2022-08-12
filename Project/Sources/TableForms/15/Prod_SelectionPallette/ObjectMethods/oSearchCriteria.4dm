If (False:C215)
	//object Name: [USER]Prod_SelectionPallette.oSearchCriteria
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 16:31
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Prod_SelectionPallette.oSearchCriteria"; Form event code:C388)
GOTO OBJECT:C206(SD2_T_SearchValue)
ERR_MethodTrackerReturn("OBJ [USER].Prod_SelectionPallette.oSearchCriteria"; $_t_oldMethodName)
If (False:C215)
	//object Name: [LIST_LAYOUTS]ALL_FIELDS.bQuery
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [LIST_LAYOUTS].ALL_FIELDS.bQuery"; Form event code:C388)
QUERY:C277(Current form table:C627->)
ERR_MethodTrackerReturn("OBJ [LIST_LAYOUTS].ALL_FIELDS.bQuery"; $_t_oldMethodName)
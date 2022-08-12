If (False:C215)
	//object Name: [EW_BK_FieldMap]ListAll2.bOrderBy
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_BK_FieldMap].ListAll2.bOrderBy"; Form event code:C388)
ORDER BY:C49(Current form table:C627->)
ERR_MethodTrackerReturn("OBJ [EW_BK_FieldMap].ListAll2.bOrderBy"; $_t_oldMethodName)
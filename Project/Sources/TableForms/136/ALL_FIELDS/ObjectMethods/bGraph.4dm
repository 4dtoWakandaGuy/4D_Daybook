If (False:C215)
	//object Name: [CCM_PSPTransaction]ALL_FIELDS.bGraph
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CCM_PSPTransaction].ALL_FIELDS.bGraph"; Form event code:C388)
_O_GRAPH TABLE:C148(Current form table:C627->)
ERR_MethodTrackerReturn("OBJ [CCM_PSPTransaction].ALL_FIELDS.bGraph"; $_t_oldMethodName)
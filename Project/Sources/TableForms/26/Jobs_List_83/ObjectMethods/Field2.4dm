If (False:C215)
	//object Name: [JOBS]Jobs_List_83.Field2
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].Jobs_List_83.Field2"; Form event code:C388)
RELATE ONE:C42([JOBS:26]Company_Code:3)
ERR_MethodTrackerReturn("OBJ [JOBS].Jobs_List_83.Field2"; $_t_oldMethodName)
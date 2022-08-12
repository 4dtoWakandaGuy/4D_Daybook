If (False:C215)
	//object Name: [USER]QV_Groupings.Variable7
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
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].QV_Groupings.Variable7"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].QV_Groupings.Variable7"; $_t_oldMethodName)

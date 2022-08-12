If (False:C215)
	//object Name: Object Name:      DOC_AccessRights.oUsersGroups
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/06/2012 19:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DOC_at_usersgroups;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DOC_AccessRights.oUsersGroups"; Form event code:C388)
Case of 
	: (DOC_at_usersgroups=1)
		OBJECT SET VISIBLE:C603(*; "oLBAccessRightsGroups"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oLBAccessRights"; True:C214)
	: (DOC_at_usersgroups=2)
		OBJECT SET VISIBLE:C603(*; "oLBAccessRightsGroups"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oLBAccessRights"; False:C215)
End case 
ERR_MethodTrackerReturn("OBJ DOC_AccessRights.oUsersGroups"; $_t_oldMethodName)

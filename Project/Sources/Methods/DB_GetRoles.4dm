//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetRoles
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/01/2011 11:45 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_RoleCodes; 0)
	ARRAY TEXT:C222($_at_RoleNames; 0)
	ARRAY TEXT:C222($_at_Roles; 0)
	//ARRAY TEXT(DB_at_RoleCodes;0)
	//ARRAY TEXT(DB_at_RoleNames;0)
	C_BOOLEAN:C305($_bo_Used; $2; DB_bo_RolesReady)
	C_LONGINT:C283($_l_BlankRow; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetRoles")

If (Count parameters:C259>=1)
	READ ONLY:C145([ROLES:87])
	If (Count parameters:C259>=2)
		$_bo_Used:=$2
	Else 
		$_bo_Used:=False:C215
	End if 
	If ($_bo_Used)
		READ ONLY:C145([CONTACTS:1])
		ALL RECORDS:C47([CONTACTS:1])
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Deleted:32=0)
		
		DISTINCT VALUES:C339([CONTACTS:1]Role:11; $_at_Roles)
		QUERY WITH ARRAY:C644([ROLES:87]Role_Code:1; $_at_Roles)
	Else 
		ALL RECORDS:C47([ROLES:87])
	End if 
	
	SELECTION TO ARRAY:C260([ROLES:87]Role_Code:1; $_at_RoleCodes; [ROLES:87]Role_Name:2; $_at_RoleNames)
	$_l_BlankRow:=Find in array:C230($_at_RoleCodes; "")
	If ($_l_BlankRow>0)
		DELETE FROM ARRAY:C228($_at_RoleCodes; $_l_BlankRow)
		DELETE FROM ARRAY:C228($_at_RoleNames; $_l_BlankRow)
	End if 
	
	VARIABLE TO VARIABLE:C635($1; DB_at_RoleNames; $_at_RoleNames; DB_at_RoleCodes; $_at_RoleCodes)
	SET PROCESS VARIABLE:C370($1; DB_bo_RolesReady; True:C214)
End if 
ERR_MethodTrackerReturn("DB_GetRoles"; $_t_oldMethodName)
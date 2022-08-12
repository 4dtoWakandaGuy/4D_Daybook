//%attributes = {}
If (False:C215)
	//Project Method Name:      Get_UserGroup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   15/01/2011 12:52 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_GroupReady)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName; $2; DB_t_CurrentUserGroup)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Get_UserGroup")

If (Count parameters:C259>=2)
	READ ONLY:C145([PERSONNEL:11])
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$2)
	SET PROCESS VARIABLE:C370($1; DB_t_CurrentUserGroup; [PERSONNEL:11]Group_Code:28)
	SET PROCESS VARIABLE:C370($1; DB_bo_GroupReady; True:C214)
End if 
ERR_MethodTrackerReturn("Get_UserGroup"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Group_ID
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Group_ID (group name{; user name}) --> Number
	
	// Returns the ID for the group with the specified name and (optionally) of the specified user.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Text : The group name
	//   $2 : Text : The user name (optional)
	
	// Returns:
	//   $0 : Longint : The group ID
	
	// Created by Dave Batton on Apr 18, 2006
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:31`Method: Cal4D_Group_ID
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>CAL_l_CurrentUserID; <>CAL_l_SharedUserID; $_l_UserID; $0)
	C_POINTER:C301(<>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupFld_Name; <>Cal_ptr_GroupTable; <>Cal_ptr_GroupUserIDField)
	C_TEXT:C284($_t_GroupName; $_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Group_ID")


$_t_GroupName:=$1

Case of 
	: (Count parameters:C259=1)
		$_l_UserID:=<>CAL_l_CurrentUserID
	: ($2="")  // The "shared" user.
		$_l_UserID:=<>CAL_l_SharedUserID
	Else 
		$_l_UserID:=Cal4D_User_ID($2)
End case 

READ ONLY:C145(<>Cal_ptr_GroupTable->)

QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupFld_Name->=$_t_GroupName; *)
QUERY:C277(<>Cal_ptr_GroupTable->;  & ; <>Cal_ptr_GroupUserIDField->=$_l_UserID)

$0:=<>Cal_ptr_GroupFld_ID->
ERR_MethodTrackerReturn("Cal4D_Group_ID"; $_t_oldMethodName)
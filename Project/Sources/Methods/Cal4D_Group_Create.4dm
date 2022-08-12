//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Group_Create
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Group_Create (group name{; color{; others can view?{; others can modify?}}}) --> Number
	
	// Allows the developer to create a new group.
	// If a group with the name already exists then the ID is returned but the group is left unchanged.
	// The "others can modify?" parameter is ignored if "others can view?" is not True.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Text : The group name
	//   $2 : Longint : The group color (optional)
	//   $3 : Boolean : Let others view events? (optional)
	//   $4 : Boolean : Let others modify events? (optional)
	
	// Returns:
	//   $0 : Longint : The new group's ID
	
	// Created by Dave Batton on Jun 10, 2004
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:27`Method: Cal4D_Group_Create
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_AllowModify; $_bo_AllowView; $3; $4)
	C_LONGINT:C283(<>CAL_l_CurrentUserID; $_l_Colour; $0; $2)
	C_POINTER:C301(<>Cal_ptr_GroupFld_Colour; <>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupFld_Name; <>Cal_ptr_GroupicalPasswordField; <>Cal_ptr_GroupicalURLField; <>Cal_ptr_GroupicaluserNameField; <>Cal_ptr_GroupotherscanModField; <>Cal_ptr_GroupotherscanviewField; <>Cal_ptr_GroupTable; <>Cal_ptr_GroupUserIDField)
	C_TEXT:C284($_t_GroupName; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Group_Create")


$_t_GroupName:=$1
$_bo_AllowView:=True:C214
$_bo_AllowModify:=False:C215

If (Count parameters:C259>=2)
	$_l_Colour:=$2
	If (Count parameters:C259>=3)
		$_bo_AllowView:=$3
		If ((Count parameters:C259>=4) & ($_bo_AllowView))
			$_bo_AllowModify:=$4
		End if 
	End if 
Else 
	$_l_Colour:=0x0000  // Default to black.
End if 

Cal4D_Init

READ ONLY:C145(<>Cal_ptr_GroupTable->)
QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupUserIDField->=<>CAL_l_CurrentUserID; *)
QUERY:C277(<>Cal_ptr_GroupTable->;  & ; <>Cal_ptr_GroupFld_Name->=$_t_GroupName)

If (Records in selection:C76(<>Cal_ptr_GroupTable->)=0)
	CREATE RECORD:C68(<>Cal_ptr_GroupTable->)
	<>Cal_ptr_GroupFld_ID->:=Sequence number:C244(<>Cal_ptr_GroupTable->)
	<>Cal_ptr_GroupUserIDField->:=<>CAL_l_CurrentUserID
	<>Cal_ptr_GroupFld_Name->:=$_t_GroupName
	<>Cal_ptr_GroupFld_Colour->:=$_l_Colour
	<>Cal_ptr_GroupicalURLField->:=""
	<>Cal_ptr_GroupicaluserNameField->:=""
	<>Cal_ptr_GroupicalPasswordField->:=""
	<>Cal_ptr_GroupotherscanviewField->:=$_bo_AllowView
	<>Cal_ptr_GroupotherscanModField->:=$_bo_AllowModify
	SAVE RECORD:C53(<>Cal_ptr_GroupTable->)
End if 

$0:=<>Cal_ptr_GroupFld_ID->

UNLOAD RECORD:C212(<>Cal_ptr_GroupTable->)
ERR_MethodTrackerReturn("Cal4D_Group_Create"; $_t_oldMethodName)
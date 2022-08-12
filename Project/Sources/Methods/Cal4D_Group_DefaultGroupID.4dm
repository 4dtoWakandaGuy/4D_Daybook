//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Group_DefaultGroupID
	//------------------ Method Notes ------------------
	
	// ----------------------------------------------------
	// Project Method: Cal4D_Group_DefaultGroupID (user ID) --> Number
	
	// Returns the default group number for the specified user. Makes sure the
	//   group is valid. Repairs are made if necessary to make sure the user
	//   has a valid default group.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : A user ID
	
	// Returns: Nothing
	//   $1 : Longint : The new group ID
	
	// Created by Dave Batton on Jul 21, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:27`Method: Cal4D_Group_DefaultGroupID
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_GroupID; $_l_UserID; $0; $1)
	C_POINTER:C301(<>Cal_ptr_GroupFld_Colour; <>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupFld_Name; <>Cal_ptr_GroupicalURLField; <>Cal_ptr_GroupotherscanModField; <>Cal_ptr_GroupotherscanviewField; <>Cal_ptr_GroupTable; <>Cal_ptr_GroupUserIDField; <>CAL_ptr_UserDefaultGroupIDFld; Cal_ptr_UserIDField; Cal_ptr_UserTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Group_DefaultGroupID")


$_l_UserID:=$1

READ ONLY:C145(Cal_ptr_UserTable->)
QUERY:C277(Cal_ptr_UserTable->; Cal_ptr_UserIDField->=$_l_UserID)

READ ONLY:C145(<>Cal_ptr_GroupTable->)
QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupFld_ID->=<>CAL_ptr_UserDefaultGroupIDFld->)

If (Records in selection:C76(<>Cal_ptr_GroupTable->)=0)
	// If the default group isn't valid, see if there's a group
	//   we can assign as the new default.
	QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupUserIDField->=Cal_ptr_UserIDField->; *)
	QUERY:C277(<>Cal_ptr_GroupTable->;  & ; <>Cal_ptr_GroupicalURLField->="")
	
	If (Records in selection:C76(<>Cal_ptr_GroupTable->)=0)
		// //  Modified by: Charles Vass (07/23/2009, 11:55)
		// //  Create one public calendar for the database.
		// //  There can only be one public calendar
		//{
		//SET QUERY DESTINATION(Into variable ;)
		//QUERY(◊Cal_po_GroupTable->;◊Cal_po_GroupFld_Name->="Public Calendar")
		//SET QUERY DESTINATION(Into current selection )
		
		//If (=0)
		CREATE RECORD:C68(<>Cal_ptr_GroupTable->)
		<>Cal_ptr_GroupFld_ID->:=Sequence number:C244(<>Cal_ptr_GroupTable->)
		<>Cal_ptr_GroupUserIDField->:=$_l_UserID
		<>Cal_ptr_GroupFld_Name->:="Public Calendar"  // Localize
		<>Cal_ptr_GroupFld_Colour->:=0x9900  // Default to green.
		<>Cal_ptr_GroupotherscanviewField->:=True:C214
		<>Cal_ptr_GroupotherscanModField->:=True:C214
		SAVE RECORD:C53(<>Cal_ptr_GroupTable->)
		//End if
		//}
		
		// And create a private group for this user. This will be set as the default below.
		CREATE RECORD:C68(<>Cal_ptr_GroupTable->)
		<>Cal_ptr_GroupFld_ID->:=Sequence number:C244(<>Cal_ptr_GroupTable->)
		<>Cal_ptr_GroupUserIDField->:=$_l_UserID
		<>Cal_ptr_GroupFld_Name->:="Personal Calendar"  // Localize
		<>Cal_ptr_GroupFld_Colour->:=0x00FF  // Default to blue.
		<>Cal_ptr_GroupotherscanviewField->:=False:C215
		<>Cal_ptr_GroupotherscanModField->:=False:C215
		SAVE RECORD:C53(<>Cal_ptr_GroupTable->)
	End if 
End if 

$_l_GroupID:=<>Cal_ptr_GroupFld_ID->

If (<>CAL_ptr_UserDefaultGroupIDFld->#$_l_GroupID)
	READ WRITE:C146(Cal_ptr_UserTable->)
	LOAD RECORD:C52(Cal_ptr_UserTable->)
	<>CAL_ptr_UserDefaultGroupIDFld->:=$_l_GroupID
	SAVE RECORD:C53(Cal_ptr_UserTable->)
	UNLOAD RECORD:C212(Cal_ptr_UserTable->)
End if 

$0:=$_l_GroupID

UNLOAD RECORD:C212(<>Cal_ptr_GroupTable->)
ERR_MethodTrackerReturn("Cal4D_Group_DefaultGroupID"; $_t_oldMethodName)
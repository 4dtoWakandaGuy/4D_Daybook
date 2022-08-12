//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Group_LoadRecord
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Group_LoadRecord (ID)
	
	// Loads the Group record with read-only access.  If it's already loaded, then
	//   nothing changes (the selection isn't messed up).
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : The record ID
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 19, 2004
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:26`Method: Cal4D_Group_LoadRecord
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; $_l_RecordID)
	C_POINTER:C301(<>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Group_LoadRecord")


$_l_RecordID:=$1

If (<>Cal_ptr_GroupFld_ID->#$_l_RecordID)
	If (Count parameters:C259=1)
		READ ONLY:C145(<>Cal_ptr_GroupTable->)
	Else 
		READ WRITE:C146(<>Cal_ptr_GroupTable->)
	End if 
	QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupFld_ID->=$_l_RecordID)
End if 
ERR_MethodTrackerReturn("Cal4D_Group_LoadRecord"; $_t_oldMethodName)
//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_Group_LoadHList
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Group_LoadHList
	
	// Loads the hierarchical list used by the Setup dialog.
	
	// Access Type: Private
	
	// Parameters: None
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 1, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/01/2010 16:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_GroupColours; 0)
	ARRAY LONGINT:C221($_al_GroupIDS; 0)
	ARRAY TEXT:C222($_at_Names; 0)
	C_LONGINT:C283(<>CAL_l_CurrentUserID; <>CAL_l_GroupHlist; $_l_SelectedListItem; $_l_Index)
	C_POINTER:C301(<>Cal_ptr_GroupFld_Colour; <>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupFld_Name; <>Cal_ptr_GroupTable; <>Cal_ptr_GroupUserIDField; Cal_ptr_UserTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Group_LoadHList")



// Load the group records for the current user.
READ ONLY:C145(Cal_ptr_UserTable->)
READ ONLY:C145(<>Cal_ptr_GroupTable->)
QUERY:C277(Cal_ptr_UserTable->; Cal_ptr_UserIDField->=<>CAL_l_CurrentUserID)  // We'll be using this record below.
QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupUserIDField->=Cal_ptr_UserIDField->)

// SELECTION TO ARRAY is faster in client/server than looping through records.
ARRAY LONGINT:C221($_al_GroupIDS; 0)
ARRAY TEXT:C222($_at_Names; 0)
ARRAY LONGINT:C221($_al_GroupColours; 0)
SELECTION TO ARRAY:C260(<>Cal_ptr_GroupFld_ID->; $_al_GroupIDS; <>Cal_ptr_GroupFld_Name->; $_at_Names; <>Cal_ptr_GroupFld_Colour->; $_al_GroupColours)
SORT ARRAY:C229($_at_Names; $_al_GroupIDS; $_al_GroupColours; >)

// If it's already a list, get the selected item so we can restore it. Then clear the list.
If (Is a list:C621(<>CAL_l_GroupHlist))
	$_l_SelectedListItem:=Selected list items:C379(<>CAL_l_GroupHlist; *)
	CLEAR LIST:C377(<>CAL_l_GroupHlist; *)
Else 
	$_l_SelectedListItem:=0
End if 

// Create the new list from the arrays we just loaded.
<>CAL_l_GroupHlist:=New list:C375
For ($_l_Index; 1; Size of array:C274($_al_GroupColours))
	If ($_al_GroupIDS{$_l_Index}>0)  // Works around a bug in a 4D beta. If test shouldn't be needed for final 4D 2004 release.
		APPEND TO LIST:C376(<>CAL_l_GroupHlist; $_at_Names{$_l_Index}; $_al_GroupIDS{$_l_Index})
		SET LIST ITEM PROPERTIES:C386(<>CAL_l_GroupHlist; $_al_GroupIDS{$_l_Index}; False:C215; Plain:K14:1; 0; $_al_GroupColours{$_l_Index})
	End if 
End for 

// Then make the default group name bold.
SET LIST ITEM PROPERTIES:C386(<>CAL_l_GroupHlist; Cal4D_Group_DefaultGroupID(Cal_ptr_UserIDField->); False:C215; Bold:K14:2; 0)

If ($_l_SelectedListItem=0)
	SELECT LIST ITEMS BY POSITION:C381(<>CAL_l_GroupHlist; Count list items:C380(<>CAL_l_GroupHlist)+1)  // Trick to selecting nothing.
Else 
	SELECT LIST ITEMS BY REFERENCE:C630(<>CAL_l_GroupHlist; $_l_SelectedListItem)
End if 

// ////////////_o_REDRAW LIST(<>Cal4D_l_GroupHlist)
ERR_MethodTrackerReturn("Cal4D_Group_LoadHList"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_DeselectObject
	//------------------ Method Notes ------------------
	// Project Method: Cal4D_DeselectObject (->variable object)
	
	// This method deselects the specified object on the calendar by returning its
	//   color to normal.  This method is called by Cal4D_SelectObject.  It can
	//   also be called at any other time you want to deselect the currently selected
	//   object (which should always be pointed to by <>Cal4D_SelectedObjectPtr.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Pointer : The variable object to deselect
	
	// Returns: Nothing
	
	// Created by Dave Batton on Aug 1, 200
	//------------------ Revision Control ----------------
	//Date Created: 20/12/2009 14:16`Method: Cal4D_DeselectObject
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301(<>CAL_ptr_Nil; <>CAL_ptr_SelectedObject; $1; $objectPtr)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_DeselectObject")


$objectPtr:=$1

If (Not:C34(Is nil pointer:C315($objectPtr)))  // Since it's valid for <>Cal_SelectedObjectPtr to be a nil pointer.
	//MOVE OBJECT(*;"Cal4D_SelectRect@";5000;5000;5005;5005;*)  ` Move all of the selection rectangles offscreen.
	//MOVE OBJECT(*;"Cal4D_DragRect@";5000;5000;5005;5005;*)  ` Move the banner drag indicators offscreen.
	
	<>CAL_ptr_SelectedObject:=<>CAL_ptr_Nil
End if 

// Hide the list box if it was displayed.
//SET VISIBLE(◊Cal4D_ListBox_ab;False)
ERR_MethodTrackerReturn("Cal4D_DeselectObject"; $_t_oldMethodName)
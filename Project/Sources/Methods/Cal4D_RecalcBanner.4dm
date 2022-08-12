//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_RecalcBanner
	//------------------ Method Notes ------------------
	// Project Method: Cal4D_RecalcBanner
	
	// Called by the Cal4D_BannerDrag method after a banner has been resized.
	// Assumes these variables are set for it to use:
	//   <>Cal4D_DragBannerPtr --> a pointer to the banner object that was resized.
	
	// Access Type: Private
	
	// Parameters: None
	// Delarations
	
	// Returns: Nothing
	
	// Created by Dave Batton on Aug 5, 2004
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:25`Method: Cal4D_RecalcBanner
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Cal_bo_DragStart)
	C_LONGINT:C283($_l_FudgeFactor; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop)
	C_POINTER:C301(<>CAL_ptr_DragBanner; <>CAL_ptr_EventEndDateFld; <>CAL_ptr_EventStartDateFld; <>Cal_ptr_EventTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_RecalcBanner")

$_l_FudgeFactor:=5  // Box widths aren't always exactly even, so this lets us aim for the most likely box.

Cal4D_LoadAssociatedRecord(<>CAL_ptr_DragBanner; Write mode:K24:4)

OBJECT GET COORDINATES:C663(<>CAL_ptr_DragBanner->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)

If (<>Cal_bo_DragStart)
	$_l_ObjectLeft:=$_l_ObjectLeft+$_l_FudgeFactor
	<>CAL_ptr_EventStartDateFld->:=Cal4D_GetDateByBoxNumber(Cal4D_GetBoxNumberByCoordinates($_l_ObjectLeft; $_l_ObjectTop))
	
Else 
	$_l_ObjectRight:=$_l_ObjectRight-$_l_FudgeFactor
	<>CAL_ptr_EventEndDateFld->:=Cal4D_GetDateByBoxNumber(Cal4D_GetBoxNumberByCoordinates($_l_ObjectRight; $_l_ObjectTop))
End if 

If (<>CAL_ptr_EventEndDateFld->>=<>CAL_ptr_EventStartDateFld->)  // Make sure the new dates appear to be valid.
	SAVE RECORD:C53(<>Cal_ptr_EventTable->)
Else 
	Cal4D_Alert("An error occurred in the "+Current method name:C684+" method. The end date is earlier than the start date. "+"Please notify the developer.")
End if 
ERR_MethodTrackerReturn("Cal4D_RecalcBanner"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_DragObjectMethod
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_DragObjectMethod (->drag button object)
	
	// Called by the invisible buttons we put at the end of each banner to allow the
	//   banner object to be resized by dragging.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Pointer : The form object being dragged
	
	// Returns: Nothing
	
	// Created by Dave Batton on Aug 1, 2004
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:37`Method: Cal4D_DragObjectMethod
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Cal_bo_DragStart)
	C_LONGINT:C283(<>CAL_l_DragBannerBottom; <>CAL_l_DragBannerLeft; <>CAL_l_DragBannerOffset; <>CAL_l_DragBannerRight; <>CAL_l_DragBannerTop; <>CAL_l_DragRightLimit; $_l_Bottom; $_l_FieldNumber; $_l_Left; $_l_MouseButton; $_l_MouseX)
	C_LONGINT:C283($_l_MouseY; $_l_ObjectNumber; $_l_TableNumber; $_l_Top)
	C_POINTER:C301(<>CAL_ptr_DragBanner; <>CAL_ptr_DragBttn; $_ptr_CurrentObject; $1)
	C_TEXT:C284($_t_BannerVariableName; $_t_oldMethodName; $_t_VariableName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_DragObjectMethod")


$_ptr_CurrentObject:=$1

$_l_ObjectNumber:=Cal4D_GetObjectNumber($_ptr_CurrentObject)
$_t_BannerVariableName:="<>Cal4D_t_Banner"+String:C10($_l_ObjectNumber; "000")  // "<>" works on either platform.

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
		<>CAL_ptr_DragBanner:=Get pointer:C304($_t_BannerVariableName)
		OBJECT GET COORDINATES:C663(<>CAL_ptr_DragBanner->; <>CAL_l_DragBannerLeft; <>CAL_l_DragBannerTop; <>CAL_l_DragBannerRight; <>CAL_l_DragBannerBottom)
		
		RESOLVE POINTER:C394($_ptr_CurrentObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		If ($_t_VariableName="@Cal4D_DragButtonLeft@")  // It's a start position (on the Left) drag object.
			<>Cal_bo_DragStart:=True:C214
			<>CAL_l_DragBannerOffset:=$_l_MouseX-<>CAL_l_DragBannerLeft
		Else 
			<>Cal_bo_DragStart:=False:C215
			<>CAL_l_DragBannerOffset:=<>CAL_l_DragBannerRight-$_l_MouseX
		End if 
		
		OBJECT GET COORDINATES:C663(*; "Cal4D_Box007"; $_l_Left; $_l_Top; <>CAL_l_DragRightLimit; $_l_Bottom)  // Sets the <>Cal4D_DragRightLimit variable.
		
		<>CAL_ptr_DragBttn:=$_ptr_CurrentObject  // We'll use this in Cal4D_BannerDrag.
		SET TIMER:C645(1)
		
		
	: (Form event code:C388=On Double Clicked:K2:5)  // Do what the banner would do if double-clicked on.
		$_ptr_CurrentObject:=Get pointer:C304($_t_BannerVariableName)
		Cal4D_BannerObjectMethod($_ptr_CurrentObject)
End case 
ERR_MethodTrackerReturn("Cal4D_DragObjectMethod"; $_t_oldMethodName)
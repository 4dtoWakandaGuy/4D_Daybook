//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Util_ScaleImage
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Util_ScaleImage (->image)
	
	// Resizes the image based on the new maximum width and height parameters.
	//   Also attempts to recenter the image.  Ideally suited for resizing images
	//   in 4D form objects with the "On Background" display format.
	// If the image is already smaller than the maximum width and height, it is not
	//   resized.  However, it will still be centered.
	
	// Parameters:
	//   $1 : Pointer : A pointer to an image
	//   $2 : Text : The name of the picture form object
	
	// Returns: Nothing
	//   Directly modifies the image
	
	// Created by Dave Batton
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:23`Method: Cal4D_Util_ScaleImage
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ImageHeight; $_l_ImageHoffset; $_l_ImageVoffset; $_l_ImageWidth; $_l_MaxHeight; $_l_MaxWidth; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop)
	C_POINTER:C301($_ptr_Image; $1)
	C_REAL:C285($_r_ScalePercentage)
	C_TEXT:C284($_t_FormObjectName; $_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Util_ScaleImage")

$_ptr_Image:=$1
$_t_FormObjectName:=$2

OBJECT GET COORDINATES:C663(*; $_t_FormObjectName; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
$_l_MaxWidth:=$_l_ObjectRight-$_l_ObjectLeft
$_l_MaxHeight:=$_l_ObjectBottom-$_l_ObjectTop

PICTURE PROPERTIES:C457($_ptr_Image->; $_l_ImageWidth; $_l_ImageHeight; $_l_ImageVoffset; $_l_ImageHoffset)
// The horizontal and vertical offsets are reversed from the documented parameter positions!

// Center the image (if there is one).
If (($_l_ImageWidth>0) & ($_l_ImageHeight>0))
	// Use picture math to set the image's horizontal and vertical offsets to zero.
	$_ptr_Image->:=$_ptr_Image->+(0-$_l_ImageHoffset)
	$_ptr_Image->:=$_ptr_Image->/(0-$_l_ImageVoffset)
	
	// This code will reduce the image size, but we don't want this here.
	//If ($_l_ImageWidth>$_l_MaxWidth) | ($_l_ImageHeight>$_l_MaxHeight)  ` Only if the picture is too big.
	//If ($_l_ImageWidth>$_l_ImageHeight)  ` Resize based on the larger of the width or height.
	//$_r_ScalePercentage:=$_l_MaxWidth/$_l_ImageWidth
	//Else
	//$_r_ScalePercentage:=$_l_MaxHeight/$_l_ImageHeight
	//End if
	//$_ptr_Image->:=$_ptr_Image->*$_r_ScalePercentage
	//End if
	
	// Get the updated properties.
	PICTURE PROPERTIES:C457($_ptr_Image->; $_l_ImageWidth; $_l_ImageHeight; $_l_ImageVoffset; $_l_ImageHoffset)
	// The horizontal and vertical offsets are reversed from the documented parameter positions!
	
	// Use picture math to center the resized image.
	$_l_ImageHoffset:=($_l_MaxWidth-$_l_ImageWidth)/2
	$_ptr_Image->:=$_ptr_Image->+$_l_ImageHoffset
	$_l_ImageVoffset:=($_l_MaxHeight-$_l_ImageHeight)/2
	$_ptr_Image->:=$_ptr_Image->/$_l_ImageVoffset
End if 
ERR_MethodTrackerReturn("Cal4D_Util_ScaleImage"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Util_ModifyColor
	//------------------ Method Notes ------------------
	// Project Method: Cal4D_Util_ModifyColor (RGB color; change) --> Number
	
	// Lightens or darkens a 4D RGB color by the specified amount. Use a negative
	//   number to darken it, or a positive number to lighten it.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : The RGB color value
	//   $2 : Longint : The amount to change it (-255 to 255 or -0xFF to 0xFF)
	
	// Returns:
	//   $0 : Longint : The modified RGB color value
	
	// Created by Dave Batton on Aug 5, 2004
	//------------------ Revision Control ----------------
	//Date Created: 20/12/2009 14:31`Method: Cal4D_Util_ModifyColor
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Blue; $_l_Change; $_l_Green; $_l_Red; $_l_Rgb; $0; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Util_ModifyColor")

$_l_Rgb:=$1
$_l_Change:=$2

// Get the individual RGB values.
$_l_Red:=(($_l_Rgb >> 16) & 0x00FF)  // get the blue byte, 0..255
$_l_Green:=(($_l_Rgb >> 8) & 0x00FF)  // get the green byte, 0..255
$_l_Blue:=($_l_Rgb & 0x00FF)  // get the red byte, 0..255

// Modify the individual colors.
$_l_Red:=$_l_Red+$_l_Change
Case of 
	: ($_l_Red<0x0000)
		$_l_Red:=0x0000
	: ($_l_Red>0x00FF)
		$_l_Red:=0x00FF
End case 

$_l_Green:=$_l_Green+$_l_Change
Case of 
	: ($_l_Green<0x0000)
		$_l_Green:=0x0000
	: ($_l_Green>0x00FF)
		$_l_Green:=0x00FF
End case 

$_l_Blue:=$_l_Blue+$_l_Change
Case of 
	: ($_l_Blue<0x0000)
		$_l_Blue:=0x0000
	: ($_l_Blue>0x00FF)
		$_l_Blue:=0x00FF
End case 

// Combine them into a single RGB value again.
$_l_Rgb:=($_l_Red << 16)+($_l_Green << 8)+$_l_Blue

$0:=$_l_Rgb
ERR_MethodTrackerReturn("Cal4D_Util_ModifyColor"; $_t_oldMethodName)
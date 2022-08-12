//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Util_RGBToIndexedColor
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Util_RGBToIndexedColor (RGB color) --> Number
	
	// Converts a 4D RGB color (not a 4D Chart RGB color) to a indexed color (1..256)
	// See also Cal4D_Util_IndexedColorToRGB.
	
	// Parameters:
	//   $1 : Longint : The RGB color value
	
	// Returns:
	//   $0 : Longint : The index color value
	
	// Created by Dave Batton on Jul 21, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:23`Method: Cal4D_Util_RGBToIndexedColor
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Blue; $_l_ChartColour; $_l_Green; $_l_Index; $_l_Red; $_l_Rgb; $0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Util_RGBToIndexedColor")

$_l_Rgb:=$1

// Get the individual RGB values.
$_l_Red:=(($_l_Rgb >> 16) & 0x00FF)  // get the blue byte, 0..255
$_l_Green:=(($_l_Rgb >> 8) & 0x00FF)  // get the green byte, 0..255
$_l_Blue:=($_l_Rgb & 0x00FF)  // get the red byte, 0..255

// Combine them into a 4D Chart RGB value (which is really BGR).
$_l_ChartColour:=($_l_Blue << 16)+($_l_Green << 8)+$_l_Red

// Use 4D Chart to convert it into an indexed color.
//$_l_Index:=DB_CreateSVGgraph ($_l_ChartColour)

$0:=$_l_Index
ERR_MethodTrackerReturn("Cal4D_Util_RGBToIndexedColor"; $_t_oldMethodName)
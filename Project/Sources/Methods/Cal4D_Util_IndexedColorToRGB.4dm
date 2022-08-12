//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Util_IndexedColorToRGB
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Util_IndexedColorToRGB (index) --> Number
	
	// Converts an indexed color from 4D's color palette (1-256) to an RGB longint value (0x00rrggbb).
	// See also Cal4D_Util_RGBToIndexedColor.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : The index color value
	
	// Returns:
	//   $0 : Longint : The RGB color value
	
	// Created by Dave Batton on Jul 21, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:23`Method: Cal4D_Util_IndexedColorToRGB
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Blue; $_l_ChartColour; $_l_Green; $_l_Index; $_l_Red; $_l_RGB; $0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Util_IndexedColorToRGB")

$_l_Index:=$1

//$_l_ChartColour:=DB_CreateSVGgraph ($_l_Index)  // Gets us a 0x00bbggrr value.

// Extract the RGB values. CT COLOR TO RGB doesn't do this the
//   way we want.  It returns values from 0..65535.
$_l_Red:=($_l_ChartColour & 0x00FF)  // get the red byte, 0..255
$_l_Green:=(($_l_ChartColour >> 8) & 0x00FF)  // get the green byte, 0..255
$_l_Blue:=(($_l_ChartColour >> 16) & 0x00FF)  // get the blue byte, 0..255

// Combine the RGB values to create a 4D RGB (0x00rrggbb) value
$_l_RGB:=($_l_Red << 16)+($_l_Green << 8)+$_l_Blue

$0:=$_l_RGB
ERR_MethodTrackerReturn("Cal4D_Util_IndexedColorToRGB"; $_t_oldMethodName)
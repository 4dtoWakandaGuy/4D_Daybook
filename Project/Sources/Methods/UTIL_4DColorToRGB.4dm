//%attributes = {}

If (False:C215)
	//Project Method Name:      UTIL_4DColorToRGB
	//------------------ Method Notes ------------------
	//  von Rob Laveaux 17.8.2012 via iNug 
	//------------------ Revision Control ----------------
	//Date Created:  02/06/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	ARRAY LONGINT:C221($_al_ColoursasRGB; 0)
	C_LONGINT:C283($_l_4DColor; $_l_ColourIndex; $_l_Comma2Position; $_l_CommaPosition; $_l_Return; $_l_RGBBlue; $_l_RGBColor; $_l_RGBGreen; $_l_RGBRed; $1)
	C_TEXT:C284($_t_Comma; $_t_RGBString)
End if 
//Code Starts Here
//TRACE

$_l_4DColor:=$1+1  //using the red constant here as an example. Of course this would be a parameter in a method. 
EXECUTE METHOD:C1007("SVG_Color_from_index"; $_t_RGBString; $_l_4DColor)
$_t_Comma:=","
If (False:C215)
	$_t_RGBString:=Replace string:C233(Substring:C12($_t_RGBString; 5; 100); ")"; "")
	
	$_l_CommaPosition:=Position:C15($_t_Comma; $_t_RGBString)
	$_l_Comma2Position:=Position:C15($_t_Comma; $_t_RGBString; $_l_CommaPosition+1)
	$_l_RGBRed:=Num:C11(Substring:C12($_t_RGBString; 1; $_l_CommaPosition-1))
	$_l_RGBGreen:=Num:C11(Substring:C12($_t_RGBString; $_l_CommaPosition+1; $_l_Comma2Position-$_l_CommaPosition))
	$_l_RGBBlue:=Num:C11(Substring:C12($_t_RGBString; $_l_Comma2Position+1; 1000))
	
	$_l_RGBColor:=($_l_RGBRed << 16)+($_l_RGBGreen << 8)+$_l_RGBBlue  //create the RGB color number 
End if 
$0:=$_t_RGBString



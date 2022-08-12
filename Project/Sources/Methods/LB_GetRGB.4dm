//%attributes = {}

If (False:C215)
	//Database Method Name:      LB_GetRGB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  23/07/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_4DColor; $_l_Comma2Position; $_l_CommaPosition; $_l_RGBBlue; $_l_RGBColor; $_l_RGBGreen; $_l_RGBRed; $1; $BGRcolor)
	C_POINTER:C301($2; $3; $4)
	C_TEXT:C284($_t_Comma; $_t_RGBString)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LB_GetRGB")

$_l_4DColor:=$1  //using the red constant here as an example. Of course this would be a parameter in a method. 
EXECUTE METHOD:C1007("SVG_Color_from_index"; $_t_RGBString; $_l_4DColor)
$_t_Comma:=","
$_t_RGBString:=Replace string:C233(Substring:C12($_t_RGBString; 5; 100); ")"; "")

$_l_CommaPosition:=Position:C15($_t_Comma; $_t_RGBString)
$_l_Comma2Position:=Position:C15($_t_Comma; $_t_RGBString; $_l_CommaPosition+1)
$_l_RGBRed:=Num:C11(Substring:C12($_t_RGBString; 1; $_l_CommaPosition-1))
$_l_RGBGreen:=Num:C11(Substring:C12($_t_RGBString; $_l_CommaPosition+1; $_l_Comma2Position-$_l_CommaPosition))
$_l_RGBBlue:=Num:C11(Substring:C12($_t_RGBString; $_l_Comma2Position+1; 1000))

$_l_RGBColor:=($_l_RGBRed << 16)+($_l_RGBGreen << 8)  //create the RGB color number 
$2->:=$_l_RGBRed
$3->:=$_l_RGBGreen
$4->:=$_l_RGBBlue
ERR_MethodTrackerReturn("LB_GetRGB"; $_t_oldMethodName)
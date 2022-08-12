//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_UTIL_Cal4D_ColorToIndex
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_NewColours; 0)
	C_LONGINT:C283($_l_Colour; $_l_Index; $0; $1)
	C_TEXT:C284($_t_Hex; $_t_MethodName; $_t_oldMethodName; Color_1; Color_10; Color_11; Color_12; Color_2; Color_3; Color_4; Color_5)
	C_TEXT:C284(Color_6; Color_7; Color_8; Color_9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_UTIL_Cal4D_ColorToIndex")

$_l_Colour:=$1
$_t_Hex:=CAl4D_UTIL_RGBDecimal_To_RGBHex($_l_Colour; "")

ARRAY TEXT:C222($_at_NewColours; 12)
$_at_NewColours{1}:=Color_1
$_at_NewColours{2}:=Color_2
$_at_NewColours{3}:=Color_3
$_at_NewColours{4}:=Color_4
$_at_NewColours{5}:=Color_5
$_at_NewColours{6}:=Color_6
$_at_NewColours{7}:=Color_7
$_at_NewColours{8}:=Color_8
$_at_NewColours{9}:=Color_9
$_at_NewColours{10}:=Color_10
$_at_NewColours{11}:=Color_11
$_at_NewColours{12}:=Color_12


$_l_Index:=Find in array:C230($_at_NewColours; $_t_Hex)
If ($_l_Index<1)
	$_l_Index:=1
End if 

$0:=$_l_Index
ERR_MethodTrackerReturn("Cal4D_UTIL_Cal4D_ColorToIndex"; $_t_oldMethodName)
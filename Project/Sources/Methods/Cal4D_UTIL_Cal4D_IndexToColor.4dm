//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_UTIL_Cal4D_IndexToColor
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Colour; $_l_index; $0; $1)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; Color_1; Color_10; Color_11; Color_12; Color_2; Color_3; Color_4; Color_5; Color_6)
	C_TEXT:C284(Color_7; Color_8; Color_9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_UTIL_Cal4D_IndexToColor")


$_l_index:=$1


Case of 
	: ($_l_index=1)
		$_l_Colour:=CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL(Color_1)
	: ($_l_index=2)
		$_l_Colour:=CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL(Color_2)
	: ($_l_index=3)
		$_l_Colour:=CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL(Color_3)
	: ($_l_index=4)
		$_l_Colour:=CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL(Color_4)
	: ($_l_index=5)
		$_l_Colour:=CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL(Color_5)
	: ($_l_index=6)
		$_l_Colour:=CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL(Color_6)
	: ($_l_index=7)
		$_l_Colour:=CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL(Color_7)
	: ($_l_index=8)
		$_l_Colour:=CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL(Color_8)
	: ($_l_index=9)
		$_l_Colour:=CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL(Color_9)
	: ($_l_index=10)
		$_l_Colour:=CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL(Color_10)
	: ($_l_index=11)
		$_l_Colour:=CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL(Color_11)
	: ($_l_index=12)
		$_l_Colour:=CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL(Color_12)
End case 

$0:=$_l_Colour
ERR_MethodTrackerReturn("Cal4D_UTIL_Cal4D_IndexToColor"; $_t_oldMethodName)
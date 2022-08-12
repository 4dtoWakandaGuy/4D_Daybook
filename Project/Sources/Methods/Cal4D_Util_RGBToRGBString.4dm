//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Util_RGBToRGBString
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Blue; $_l_Green; $_l_Red; $_l_RGB; $1)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; $_t_RGBString; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Util_RGBToRGBString")


$_l_RGB:=$1


// Get the individual RGB values.
$_l_Red:=(($_l_RGB >> 16) & 0x00FF)  // get the blue byte, 0..255
$_l_Green:=(($_l_RGB >> 8) & 0x00FF)  // get the green byte, 0..255
$_l_Blue:=($_l_RGB & 0x00FF)  // get the red byte, 0..255

$_t_RGBString:="rgb("+String:C10($_l_Red)+","+String:C10($_l_Green)+","+String:C10($_l_Blue)+")"


$0:=$_t_RGBString
ERR_MethodTrackerReturn("Cal4D_Util_RGBToRGBString"; $_t_oldMethodName)
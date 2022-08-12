//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cell_BG_MouseOver
	//------------------ Method Notes ------------------
	//*****************************************************************************
	////
	////  Cal4D_Cell_BG_MouseOver
	////
	////  Written by Charles Vass - 05/08/2009, 09:05
	////
	////  Purpose:
	////
	////  $1 - type - purpose
	////
	////
	//*****************************************************************************
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 13:45`Method: Cal4D_Cell_BG_MouseOver
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Blue; $_l_Green; $_l_Hue; $_l_Red; $_l_Saturation; $_l_Value)
	C_TEXT:C284($_t_Buf; $_t_HSV; $_t_MethodName; $_t_oldMethodName; $_t_RGB; $0; $1; CAL_t_MouseOverRGB)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cell_BG_MouseOver")

If (Count parameters:C259=1)
	CAL_t_MouseOverRGB:=$1
	
	$_t_Buf:=Substring:C12(CAL_t_MouseOverRGB; Position:C15("("; CAL_t_MouseOverRGB)+1)
	$_t_Buf:=Substring:C12($_t_Buf; 1; Position:C15(")"; $_t_Buf)-1)
	$_l_Red:=Num:C11(CAL4D_STR_Parse($_t_Buf; 1; ","))
	$_l_Green:=Num:C11(CAL4D_STR_Parse($_t_Buf; 2; ","))
	$_l_Blue:=Num:C11(CAL4D_STR_Parse($_t_Buf; 3; ","))
	
	
	$_t_HSV:=CAL4D_UTIL_Color_RGB2HSV($_l_Red; $_l_Green; $_l_Blue)
	$_l_Hue:=Num:C11(CAL4D_STR_Parse($_t_HSV; 1; ","))
	$_l_Saturation:=Num:C11(CAL4D_STR_Parse($_t_HSV; 2; ","))
	$_l_Value:=Num:C11(CAL4D_STR_Parse($_t_HSV; 3; ","))
	
	$_l_Saturation:=$_l_Saturation*0.1
	
	$_t_RGB:="rgb("+CAL4D_UTIL_Color_HSV2RGB($_l_Hue; $_l_Saturation; $_l_Value)+")"
	Cal4D_Cell_BG_WeekOf($_t_RGB)
	
	
	
End if 

$0:=CAL_t_MouseOverRGB
ERR_MethodTrackerReturn("Cal4D_Cell_BG_MouseOver"; $_t_oldMethodName)
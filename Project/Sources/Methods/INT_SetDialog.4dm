//%attributes = {}
If (False:C215)
	//Project Method Name:      INT_SetDialog
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/03/2010 09:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_SetBackgroundVisible; $1)
	C_LONGINT:C283($_l_objectBottom; $_l_objectLeft; $_l_objectRight; $_l_objectTop; $_l_WindowBottom; $_l_WindowHeight; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $_l_WindowWidth)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INT_SetDialog")
//INT_SetDialog
//Rollo 20/8/2004

//Show or hide a white background for all dialogs - Windows or not
//resizes if shown

If (Count parameters:C259>=1)
	$_bo_SetBackgroundVisible:=$1
Else 
	$_bo_SetBackgroundVisible:=True:C214
End if 
If (DBGetOSVersion="Windows@") | ($_bo_SetBackgroundVisible)
	
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
	$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
	$_l_WindowHeight:=$_l_WindowBottom-$_l_WindowTop
	//OBJECT GET COORDINATES(*; "oWhiteBackground"; 0; $_l_objectTop; $_l_WindowWidth; $_l_objectBottom)
	OBJECT SET COORDINATES:C1248(*; "oWhiteBackground"; 0; 0; $_l_WindowWidth; $_l_WindowHeight)
Else 
	OBJECT SET VISIBLE:C603(*; "oWhiteBackground"; False:C215)
End if 
ERR_MethodTrackerReturn("INT_SetDialog"; $_t_oldMethodName)

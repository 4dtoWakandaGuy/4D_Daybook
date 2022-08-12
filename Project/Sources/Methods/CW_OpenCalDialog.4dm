//%attributes = {}
If (False:C215)
	//Project Method Name:      CW_OpenCalDialog
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_DialogBottom; $_l_DialogHeight; $_l_DialogLeft; $_l_DialogRight; $_l_DialogTop; $_l_DialogWidth; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRef; $_l_WindowRight; $_l_WindowTop; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CW_OpenCalDialog")
//Project Method: CW_OpenCalWindow
//Opens a calendar window

GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton; *)

SCREEN COORDINATES:C438($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
$_l_DialogWidth:=185
$_l_DialogHeight:=215
If (($_l_MouseX+$_l_DialogWidth)>$_l_WindowRight)
	$_l_DialogLeft:=$_l_WindowRight-$_l_DialogWidth
	$_l_DialogRight:=$_l_WindowRight
Else 
	$_l_DialogLeft:=$_l_MouseX
	$_l_DialogRight:=$_l_MouseX+$_l_DialogWidth
End if 
If (($_l_MouseY+$_l_DialogHeight)>$_l_WindowBottom)
	$_l_DialogTop:=$_l_WindowBottom-$_l_DialogHeight
	$_l_DialogBottom:=$_l_WindowBottom
Else 
	$_l_DialogTop:=$_l_MouseY
	$_l_DialogBottom:=$_l_MouseY+$_l_DialogHeight
End if 
$_l_WindowRef:=Open window:C153($_l_DialogLeft; $_l_DialogTop; $_l_DialogRight; $_l_DialogBottom; 1; ""; "CW_Close")
If (Not:C34(WIN_bo_TrackerInited))
	ARRAY LONGINT:C221(WIN_al_CalledFromReference; 0)
	ARRAY LONGINT:C221(WIN_al_ThisWIndowReference; 0)
	WIN_bo_TrackerInited:=True:C214
End if 

APPEND TO ARRAY:C911(WIN_al_CalledFromReference; WIN_l_CurrentWinRef)
APPEND TO ARRAY:C911(WIN_al_ThisWIndowReference; $_l_WindowRef)
WIN_l_CurrentWinRef:=$_l_WindowRef

DIALOG:C40([USER:15]; "CW_CalenderDialog")
ERR_MethodTrackerReturn("CW_OpenCalDialog"; $_t_oldMethodName)
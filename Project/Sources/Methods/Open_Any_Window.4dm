//%attributes = {}
If (False:C215)
	//Project Method Name:      Open_Any_Window
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:47
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
	C_LONGINT:C283($_l_NewHeight; $_l_NewTopPosition; $_l_NewWidthCentre; $_l_ScreenCentreVertical; $_l_WindowReference; $1; $2; $3; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Open_Any_Window")
If (Not:C34(WIN_bo_TrackerInited))
	ARRAY LONGINT:C221(WIN_al_CalledFromReference; 0)
	ARRAY LONGINT:C221(WIN_al_ThisWIndowReference; 0)
	WIN_bo_TrackerInited:=True:C214
End if 
//Open_Any_Window
If (($1>220) & (Screen height:C188<480))
	$_l_NewTopPosition:=44
Else 
	$_l_NewTopPosition:=80
End if 
$_l_ScreenCentreVertical:=Screen width:C187/2
$_l_NewHeight:=$1
$_l_NewWidthCentre:=$2/2
If (Count parameters:C259>2)
	
	$_l_WindowReference:=Open window:C153($_l_ScreenCentreVertical-$_l_NewWidthCentre; $_l_NewTopPosition; $_l_ScreenCentreVertical+$_l_NewWidthCentre; $_l_NewTopPosition+$_l_NewHeight; $3)
Else 
	$_l_WindowReference:=Open window:C153($_l_ScreenCentreVertical-$_l_NewWidthCentre; $_l_NewTopPosition; $_l_ScreenCentreVertical+$_l_NewWidthCentre; $_l_NewTopPosition+$_l_NewHeight; -Palette window:K34:3)
End if 
APPEND TO ARRAY:C911(WIN_al_CalledFromReference; WIN_l_CurrentWinRef)
APPEND TO ARRAY:C911(WIN_al_ThisWIndowReference; $_l_WindowReference)
WIN_l_CurrentWinRef:=$_l_WindowReference
ERR_MethodTrackerReturn("Open_Any_Window"; $_t_oldMethodName)
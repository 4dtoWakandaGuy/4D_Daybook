//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_WinCenter
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:32
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
	C_LONGINT:C283($_l_CountParameters; $_l_ScreenCentreHorizontal; $_l_ScreenCentreVertical; $_l_WindowReference; $1; $2; $3; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; $4; $5)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_WinCenter")
// uti_WinCenter
// opens a centered window
// $1 -> x size of desired window
// $2 -> y size of desired window
// $3 -> type of desired window
// $4 -> name of window
// $5 -> closing procedure
// modified Axel 10/12/2000


$_l_CountParameters:=Count parameters:C259
If (Count parameters:C259>=2)
	$_l_ScreenCentreHorizontal:=(Screen width:C187-$1)\2
	$_l_ScreenCentreVertical:=(Screen height:C188-$2)\2
	If (Not:C34(WIN_bo_TrackerInited))
		ARRAY LONGINT:C221(WIN_al_CalledFromReference; 0)
		ARRAY LONGINT:C221(WIN_al_ThisWIndowReference; 0)
		WIN_bo_TrackerInited:=True:C214
	End if 
	Case of 
		: ($_l_CountParameters=3)
			$_l_WindowReference:=Open window:C153($_l_ScreenCentreHorizontal; $_l_ScreenCentreVertical; $_l_ScreenCentreHorizontal+$1; $_l_ScreenCentreVertical+$2; $3)
		: ($_l_CountParameters=4)
			$_l_WindowReference:=Open window:C153($_l_ScreenCentreHorizontal; $_l_ScreenCentreVertical; $_l_ScreenCentreHorizontal+$1; $_l_ScreenCentreVertical+$2; $3; $4)
		: ($_l_CountParameters=5)
			$_l_WindowReference:=Open window:C153($_l_ScreenCentreHorizontal; $_l_ScreenCentreVertical; $_l_ScreenCentreHorizontal+$1; $_l_ScreenCentreVertical+$2; $3; $4; $5)
		Else 
			$_l_WindowReference:=Open window:C153($_l_ScreenCentreHorizontal; $_l_ScreenCentreVertical; $_l_ScreenCentreHorizontal+100; $_l_ScreenCentreVertical+100)  //trap the prob and open a window
	End case 
Else 
	$_l_WindowReference:=Open window:C153(64; 64; 64+100; 64+100)  //Just to trap the problem and open a window
End if 
APPEND TO ARRAY:C911(WIN_al_CalledFromReference; WIN_l_CurrentWinRef)
APPEND TO ARRAY:C911(WIN_al_ThisWIndowReference; $_l_WindowReference)
WIN_l_CurrentWinRef:=$_l_WindowReference
ERR_MethodTrackerReturn("UTI_WinCenter"; $_t_oldMethodName)

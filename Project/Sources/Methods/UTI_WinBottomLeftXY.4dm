//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_WinBottomLeftXY
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
	C_BOOLEAN:C305($_bo_NoLog; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowReference; $_l_WindowTop; $1; $2; $3; $4; $5; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; $6; $7)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_WinBottomLeftXY")
// uti_WinBottomLeftXY
// opens a window bottom left with X & Y indents
// $1 -> x size of desired window
// $2 -> y size of desired window
// $3 -> type of desired window
// $4 -> left offset
// $5 -> bottom offset
// $6 -> name of window
// $7 -> closing procedure


If (Count parameters:C259>=5)
	$_l_WindowLeft:=8+$4
	$_l_WindowTop:=Screen height:C188-$2-8-$5
	If (Not:C34(WIN_bo_TrackerInited))
		ARRAY LONGINT:C221(WIN_al_CalledFromReference; 0)
		ARRAY LONGINT:C221(WIN_al_ThisWIndowReference; 0)
		WIN_bo_TrackerInited:=True:C214
	End if 
	$_bo_NoLog:=False:C215
	Case of 
		: (Count parameters:C259>=7)
			$_l_WindowReference:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft+$1; $_l_WindowTop+$2; $3; $6; $7)
		: (Count parameters:C259=6)
			$_l_WindowReference:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft+$1; $_l_WindowTop+$2; $3; $6)
		: (Count parameters:C259=5)
			$_l_WindowReference:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft+$1; $_l_WindowTop+$2; $3)
			
			
		Else 
			$_bo_NoLog:=True:C214
			Gen_Alert("Something wrong in UTI WInBottomLeft")
	End case 
Else 
	$_bo_NoLog:=True:C214
	Gen_Alert("Something wrong in UTI WInBottomLeft")
End if 
If (Not:C34($_bo_NoLog))
	APPEND TO ARRAY:C911(WIN_al_CalledFromReference; WIN_l_CurrentWinRef)
	APPEND TO ARRAY:C911(WIN_al_ThisWIndowReference; $_l_WindowReference)
	WIN_l_CurrentWinRef:=$_l_WindowReference
	
End if 
ERR_MethodTrackerReturn("UTI_WinBottomLeftXY"; $_t_oldMethodName)

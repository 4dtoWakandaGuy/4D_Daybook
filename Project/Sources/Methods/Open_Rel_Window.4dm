//%attributes = {}
If (False:C215)
	//Project Method Name:      Open_Rel_Window
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:38
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
	C_LONGINT:C283(<>SYS_l_WindowTop; $_l_DockRight; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowReference; $_l_WindowRight; $_l_WindowTop; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle; $1; $2; $Close)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Open_Rel_Window")
$_l_DockRight:=INT_GetDock("R")
$_l_WindowRight:=Screen width:C187-$_l_DockRight
$_l_WindowTop:=<>SYS_l_WindowTop+50
$_l_WindowBottom:=<>SYS_l_WindowTop+261
$_l_WindowLeft:=$_l_WindowRight-273
$_t_WindowTitle:=Replace string:C233($1; "_"; " ")
If (Not:C34(WIN_bo_TrackerInited))
	ARRAY LONGINT:C221(WIN_al_CalledFromReference; 0)
	ARRAY LONGINT:C221(WIN_al_ThisWIndowReference; 0)
	WIN_bo_TrackerInited:=True:C214
End if 
$_l_WindowReference:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; 1987; $_t_WindowTitle; "Close_Cancel")  //Dan
APPEND TO ARRAY:C911(WIN_al_CalledFromReference; WIN_l_CurrentWinRef)
APPEND TO ARRAY:C911(WIN_al_ThisWIndowReference; $_l_WindowReference)
WIN_l_CurrentWinRef:=$_l_WindowReference
ERR_MethodTrackerReturn("Open_Rel_Window"; $_t_oldMethodName)
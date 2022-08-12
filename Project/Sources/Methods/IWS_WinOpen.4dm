//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_WinOpen
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>IWS_al_WinProc;0)
	//ARRAY TEXT(<>IWS_at_WinTitle;0)
	C_LONGINT:C283(<>IWS_l_WinAddX; <>IWS_l_WinAddY; <>IWS_l_WinSizeX; <>IWS_l_WinSizeY; <>IWS_l_WinStartX; <>IWS_l_WinStartY; $_l_ProcessRow; $_l_WIndowLeft; $_l_WIndowTop)
	C_TEXT:C284($_t_oldMethodName; $_t_Semaphore; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_WinOpen")
//LOG_SetMethod ("IWS_WinOpen")
// IWS_WinOpen
// opens a window and add to window list
// $1 -> name of window

$_l_ProcessRow:=Find in array:C230(<>IWS_al_WinProc; Current process:C322)
If ($_l_ProcessRow>0)
	BRING TO FRONT:C326(Current process:C322)
Else 
	$_t_Semaphore:="$AddWinList"
	If (UTI_Semaphore($_t_Semaphore))
		INSERT IN ARRAY:C227(<>IWS_al_WinProc; Size of array:C274(<>IWS_al_WinProc)+1; 1)
		INSERT IN ARRAY:C227(<>IWS_at_WinTitle; Size of array:C274(<>IWS_at_WinTitle)+1; 1)
		<>IWS_al_WinProc{Size of array:C274(<>IWS_al_WinProc)}:=Current process:C322
		<>IWS_at_WinTitle{Size of array:C274(<>IWS_at_WinTitle)}:=$1
		$_l_WIndowLeft:=<>IWS_l_WinStartX+((Size of array:C274(<>IWS_al_WinProc)-1)*<>IWS_l_WinAddX)
		$_l_WIndowTop:=<>IWS_l_WinStartY+((Size of array:C274(<>IWS_al_WinProc)-1)*<>IWS_l_WinAddY)
		Open window:C153($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowLeft+<>IWS_l_WinSizeX; $_l_WIndowTop+<>IWS_l_WinSizeY; 8; $1; "IWS_WinClose")
		UTI_ClearSemaphore($_t_Semaphore)
	End if 
End if 

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_WinOpen"; $_t_oldMethodName)
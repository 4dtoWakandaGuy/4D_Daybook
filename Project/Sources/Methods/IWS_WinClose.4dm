//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_WinClose
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
	C_LONGINT:C283($_l_processRow)
	C_TEXT:C284($_t_oldMethodName; $_t_Semaphore)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_WinClose")
//LOG_SetMethod ("IWS_WinClose")
// web_WinClose
// close a window and delete from window list


$_l_processRow:=Find in array:C230(<>IWS_al_WinProc; Current process:C322)
If (($_l_processRow>0) & ($_l_processRow<=Size of array:C274(<>IWS_al_WinProc)))
	$_t_Semaphore:="$AddWinList"
	If (UTI_Semaphore($_t_Semaphore))
		DELETE FROM ARRAY:C228(<>IWS_al_WinProc; $_l_processRow; 1)
		DELETE FROM ARRAY:C228(<>IWS_at_WinTitle; $_l_processRow; 1)
		CANCEL:C270
		CLOSE WINDOW:C154
		UTI_ClearSemaphore($_t_Semaphore)
	End if 
End if 


//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_WinClose"; $_t_oldMethodName)
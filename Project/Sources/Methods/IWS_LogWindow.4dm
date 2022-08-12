//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_LogWindow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:32
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>SYS_bo_MACOptimize; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; $sOptimizedMode; $_t_WindowTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_LogWindow")

// IWS_LogWindow
// web server log process

Start_Process
DelayTicks(10)


//MENU BAR(1)

If (<>SYS_bo_MACOptimize=True:C214)
	$sOptimizedMode:=" Optimized"
Else 
	$sOptimizedMode:=" Not optimized"
End if 


$_t_WindowTitle:="Web Server on "+IWS_LocalIPAddress+"/"+$sOptimizedMode+"-    "+"Started "+String:C10(Current date:C33)+", "+String:C10(Current time:C178; 5)  // Axel
UTI_WinBottomLeftXY(642; 428; 8; 60; 30; $_t_WindowTitle)

DIALOG:C40([WEBSETUP_4D:129]; "WebLog")
CLOSE WINDOW:C154
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
ERR_MethodTrackerReturn("IWS_LogWindow"; $_t_oldMethodName)
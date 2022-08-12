//%attributes = {}
If (False:C215)
	//Project Method Name:      Calls_Check
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:15
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
	C_LONGINT:C283($_l_Continue; $_l_DelayTicks; $_l_WindowReferenceRow; vProc; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; $_t_WindowTitle; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_Check")
//Calls_Check
$_t_WindowTitle:="Checking Calls"
Start_Process($_t_WindowTitle)
Open_PrD_Window($_t_WindowTitle)
$_l_Continue:=1
$_t_CurrentOutputform:=WIN_t_CurrentOutputform

While ($_l_Continue=1)
	QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Resolved:9=False:C215)
	$_l_DelayTicks:=3600
	If (Records in selection:C76([SERVICE_CALLS:20])>0)
		SHOW PROCESS:C325(Current process:C322)
		BRING TO FRONT:C326(Current process:C322)
		Gen_Confirm("There are Service Calls to be resolved.  See them?"; "Yes"; "No")
		If (OK=1)
			DBI_MenuDisplayRecords("Service CallsOutstanding")
			
			
		Else 
			Gen_Confirm("Continue with the process?"; "Yes"; "No")
			If (OK=0)
				//ABORTNG JUne 2004 removed
				$_l_Continue:=0
			End if 
		End if 
		HIDE PROCESS:C324(vProc)
	End if 
	DelayTicks($_l_DelayTicks)
End while 
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
ERR_MethodTrackerReturn("Calls_Check"; $_t_oldMethodName)
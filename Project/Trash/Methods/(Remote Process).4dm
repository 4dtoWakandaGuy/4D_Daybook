//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote Process
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:07
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305($_bo_Unload; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess; <>SYS_l_LoggedInaccount; $_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote Process")
//Remote Process
Start_Process
Open_PrD_Window("Remote Process (Command-. to Cancel)")
<>SYS_l_CancelProcess:=0
<>Process:=Current process:C322
//ON EVENT CALL("Remote Event")
MESSAGE:C88(Char:C90(13))
READ ONLY:C145([USER:15])
$_bo_Unload:=(Records in selection:C76([USER:15])=0)
If (<>SYS_l_LoggedInaccount=0)
	QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
Else 
	QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
End if 
ALERT:C41("NOT AVAILABLE")
If ($_bo_Unload)
	UNLOAD RECORD:C212([USER:15])
End if 
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
<>SYS_l_CancelProcess:=0
<>Process:=0
Process_End
ERR_MethodTrackerReturn("Remote Process"; $_t_oldMethodName)

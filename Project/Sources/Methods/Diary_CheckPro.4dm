//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_CheckPro
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 12:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_DelayTime; vProc)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_TimeString; $_t_WindowTitle; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_CheckPro")
//Diary CheckPro

$_t_WindowTitle:="Diary Check"
Start_Process

OK:=1
While (OK=1)
	$_l_DelayTime:=3600
	QUERY:C277([DIARY:12]; [DIARY:12]Done:14=False:C215; *)
	QUERY:C277([DIARY:12];  & ; [DIARY:12]Person:8=<>PER_t_CurrentUserInitials; *)
	QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=<>DB_d_CurrentDate)
	If (Records in selection:C76([DIARY:12])>0)
		SHOW PROCESS:C325(vProc+2)
		BRING TO FRONT:C326(vProc+2)
		Gen_Confirm("There are things to do in your Diary.  See them?"; "Yes"; "No")
		If (OK=1)
			If (Diary_File)  // modified NG June 2004
				FORM SET OUTPUT:C54([DIARY:12]; "Diary")
				Open_Pro_Window($_t_WindowTitle; 0; 1; ->[DIARY:12]; "diary")
				FS_SetFormSort(WIN_t_CurrentOutputform; Table:C252(->[DIARY:12]))
				WIn_SetFormSize(1; ->[DIARY:12]; "diary")
				MODIFY SELECTION:C204([DIARY:12]; *)
				Close_ProWin
				$_t_TimeString:="5"
				$_t_TimeString:=Substring:C12(Gen_Request("Ask again in x minutes?"; "5"); 1; 11)
				If (OK=1)
					$_l_DelayTime:=Num:C11($_t_TimeString)*30*60
				End if 
			End if 
			
		Else 
			Gen_Confirm("Continue with the Diary Checking process?"; "Continue"; "Cancel")
		End if 
		HIDE PROCESS:C324(vProc+2)
	Else 
		OK:=1
	End if 
	DelayTicks($_l_DelayTime)
End while 
ERR_MethodTrackerReturn("Diary_CheckPro"; $_t_oldMethodName)

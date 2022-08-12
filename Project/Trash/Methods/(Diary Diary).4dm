//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary Diary
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
	C_LONGINT:C283(<>SD3_l_DiaryVersion; $1; MOD_l_CurrentModuleAccess; vDiaryCheck; vMod)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary Diary")
//Diary Diary
Start_Process
If (Diary_File)  // modified NG June 2004
	If (Count parameters:C259>=1)
		vDiaryCheck:=$1
	Else 
		vDiaryCheck:=0
	End if 
	//vDiaryCheck:=◊DiaryCheck
	//◊DiaryCheck:=0
	vMod:=0
	//vDate:=◊CDate
	//vUser2:=◊User
	Diary_DateSrch
	If (Records in selection:C76([DIARY:12])=0)
		If (MOD_l_CurrentModuleAccess=3)
			Gen_Alert("There is nothing in your Diary for today"; "OK")
		Else 
			Gen_Confirm("There is nothing in your Diary for today.  Would you like to add something?"; "No"; "Yes")
			If (OK=0)
				Diary_In
			End if 
		End if 
	Else 
		Open_Pro_Window(Diary_DiaryWT; 0; 1; ->[DIARY:12]; "diary")
		FS_SetFormSort(WIN_t_CurrentOutputform; Table:C252(->[DIARY:12]))
		WIn_SetFormSize(1; ->[DIARY:12]; "diary")
		MODIFY SELECTION:C204([DIARY:12]; *)
		Close_ProWin
	End if 
End if 

Comp_Unload
Process_End
ERR_MethodTrackerReturn("Diary Diary"; $_t_oldMethodName)
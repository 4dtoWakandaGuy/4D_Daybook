//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_PopCalenderSelect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 10:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_PersonClass;0)
	//ARRAY TEXT(SD_at_DiaryOwners;0)
	//ARRAY TEXT(SD_at_PersonInitials;0)
	C_LONGINT:C283($_l_CallBackProcess; $_l_CurrentWinRefOLD; $_l_ObjectLeftPosition; $_l_ObjectTopPosition; $_l_PersonRow; $1; SD_l_ProcessReady; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; WS_l_OpenCalander)
	C_REAL:C285($2; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_SDProcName; SD2_t_OpenDiaryPersonIdent)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_PopCalenderSelect")

//This method lets the user select a calender to view-this alway opens a new window with that c alender

If (Count parameters:C259>=3)
	SD_l_ProcessReady:=0
	ARRAY TEXT:C222(SD_at_PersonInitials; 0)
	ARRAY TEXT:C222(SD_at_DiaryOwners; 0)
	ARRAY LONGINT:C221(SD_al_PersonClass; 0)
	SD_l_ProcessReady:=1
	While (SD_l_ProcessReady=1)
		DelayTicks(3)
	End while 
	
	$_l_CallBackProcess:=$1
	$_l_ObjectLeftPosition:=$2
	$_l_ObjectTopPosition:=$3
	//Open window with a pop-up
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153($_l_ObjectLeftPosition; $_l_ObjectTopPosition; $_l_ObjectLeftPosition; $_l_ObjectTopPosition; 1)
	DIALOG:C40([USER:15]; "SD2_SelectCalenderDialog")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	If (WS_l_OpenCalander>0)
		//SD2_t_OpenDiaryPersonIdent
		$_l_PersonRow:=Find in array:C230(SD_at_PersonInitials; SD2_t_OpenDiaryPersonIdent)
		If ($_l_PersonRow>0)
			$_t_SDProcName:="Schedule"+"-"+SD_at_DiaryOwners{$_l_PersonRow}
		Else 
			$_t_SDProcName:="Schedule"+"-"+"???"  //This should never happen
		End if 
		ZProc("Diary_Mod_SD"; DB_ProcessMemoryinit(6); $_t_SDProcName; SD2_t_OpenDiaryPersonIdent)
		
	End if 
End if 
ERR_MethodTrackerReturn("SD2_PopCalenderSelect"; $_t_oldMethodName)

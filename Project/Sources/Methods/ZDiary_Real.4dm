//%attributes = {}
If (False:C215)
	//Project Method Name:      ZDiary_Real
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 08:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SD3_bo_Query)
	C_LONGINT:C283(<>SD3_l_DiaryVersion; $_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime; SD3_l_CallActionNum; SD3_l_DiaryActionNum)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>SD3_t_DiaryProcName; $_t_oldMethodName; $_t_SDProcessName; DB_t_CallOnCloseorSave; vButtDisDiary)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZDiary_Real")


//◊WT_Initial:=1  `process was initiated from the menu bar
Case of 
	: ((<>SD3_l_DiaryVersion=0) | (<>SD3_bo_Query=True:C214))  //use old diary manager
		<>SD3_bo_Query:=False:C215
		ZProc("Diary_Real"; DB_ProcessMemoryinit(4); "Diary Appointments")
	: (<>SD3_l_DiaryVersion=1)  //use SuperDiary manager
		//this must move the diary to the current date
		
		
		$_t_SDProcessName:="View SuperDiary"+"-"+<>PER_t_CurrentUserInitials
		$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
		PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
		If ($_l_ProcessState<0)
			$_l_ProcessNumber:=0
			$_t_SDProcessName:="View SuperDiary"+"-"+<>PER_t_CurrentUserInitials
		End if 
		//vButtDisDry:="I  PMO   SSSRCAD "
		//Input_Buttons (->[DIARY];->vButtDisDry)
		DB_t_CallOnCloseorSave:="File"
		vButtDisDiary:="A DPMONPFSSSRCADT"
		Input_Buttons(->[USER:15]; ->vButtDisDiary)
		If ($_l_ProcessNumber>0)
			SD3_l_CallActionNum:=5
			SHOW PROCESS:C325($_l_ProcessNumber)
			RESUME PROCESS:C320($_l_ProcessNumber)
			BRING TO FRONT:C326($_l_ProcessNumber)
			SD3_l_CallActionNum:=0
		Else 
			ZProc("Diary_Mod_SD"; DB_ProcessMemoryinit(4); <>SD3_t_DiaryProcName)
			Repeat 
				DelayTicks(10)
				$_t_SDProcessName:="View SuperDiary"+"-"+<>PER_t_CurrentUserInitials
				$_t_SDProcessName:="View SuperDiary"+"-"+<>PER_t_CurrentUserInitials
				$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
			Until ($_l_ProcessNumber>0)
			PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
			SD3_l_CallActionNum:=5
			If ($_l_ProcessState>=0)  // 30/05/02 pb
				SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
				SHOW PROCESS:C325($_l_ProcessNumber)
				RESUME PROCESS:C320($_l_ProcessNumber)
				BRING TO FRONT:C326($_l_ProcessNumber)
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			End if 
			SD3_l_CallActionNum:=0
		End if 
End case 
ERR_MethodTrackerReturn("ZDiary_Real"; $_t_oldMethodName)

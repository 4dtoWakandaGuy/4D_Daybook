//%attributes = {}
If (False:C215)
	//Project Method Name:      ZDiary_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/03/2010 14:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SD3_bo_Query)
	C_LONGINT:C283(<>SD3_l_DiaryVersion; $_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime; $_l_TImeSeconds; SD3_l_CallActionNum; SD3_l_DiaryActionNum)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>SD3_t_DiaryProcName; $_t_DateString; $_t_oldMethodName; $_t_ProcessName; $_t_SDProcessName; $_t_TImeString)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZDiary_In")

//TRACE

//C_LONGINT(◊SDAddRec)  ``SuperDiary
//◊WT_Initial:=1  `process was initiated from the menu bar
Case of 
	: (Form event code:C388=On Menu Selected:K2:14)
		//TRACE
	: ((<>SD3_l_DiaryVersion=0) | (<>SD3_bo_Query=True:C214))  //use old diary manager
		<>SD3_bo_Query:=False:C215
		ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary")  //``old code-29/06/01
		//Copied to Functions palette
	: (<>SD3_l_DiaryVersion=1)  //use SuperDiary manager
		
		If (False:C215)
			
			$_t_SDProcessName:="View SuperDiary"+"-"+<>PER_t_CurrentUserInitials
			$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
			PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
			If ($_l_ProcessState<0)
				$_l_ProcessNumber:=0
				$_t_SDProcessName:="View SuperDiary"+"-"+<>PER_t_CurrentUserInitials
			End if 
			
			
			If ($_l_ProcessNumber>0)
				SD3_l_CallActionNum:=4
				PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
				If ($_l_ProcessState>=0)  // 29/05/02
					SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
					SHOW PROCESS:C325($_l_ProcessNumber)
					RESUME PROCESS:C320($_l_ProcessNumber)
					BRING TO FRONT:C326($_l_ProcessNumber)
					If (Application type:C494#4D Server:K5:6)
						POST OUTSIDE CALL:C329($_l_ProcessNumber)
					End if 
				End if 
				SD3_l_CallActionNum:=0
				
			Else 
				ZDiary_Mod
				Repeat 
					DelayTicks(10)
					$_t_SDProcessName:="View SuperDiary"+"-"+<>PER_t_CurrentUserInitials
					$_t_SDProcessName:="View SuperDiary"+"-"+<>PER_t_CurrentUserInitials
					$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
				Until ($_l_ProcessNumber>0)
				PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
				SD3_l_CallActionNum:=4
				PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
				If ($_l_ProcessState>=0)  // 29/05/02
					SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
					SHOW PROCESS:C325($_l_ProcessNumber)
					RESUME PROCESS:C320($_l_ProcessNumber)
					BRING TO FRONT:C326($_l_ProcessNumber)
					If (Application type:C494#4D Server:K5:6)
						POST OUTSIDE CALL:C329($_l_ProcessNumber)
					End if 
				End if 
				SD3_l_CallActionNum:=0
			End if 
		Else 
			
			$_t_SDProcessName:="View SuperDiary"+"-"+<>PER_t_CurrentUserInitials
			$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
			PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
			If ($_l_ProcessState<0)
				$_l_ProcessNumber:=0
				$_t_SDProcessName:="View SuperDiary"+"-"+<>PER_t_CurrentUserInitials
			End if 
			
			
			If ($_l_ProcessNumber>0)
				$_l_TImeSeconds:=Current time:C178(*)*1
				$_t_TImeString:=Time string:C180($_l_TImeSeconds)
				$_t_DateString:=String:C10(Current date:C33(*))
				ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10($_l_ProcessNumber); ""; ""; "Diary_InNEW"; $_t_DateString; $_t_TImeString)
				
			Else 
				ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(0); ""; ""; "Diary_InNEW")
				
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("ZDiary_In"; $_t_oldMethodName)

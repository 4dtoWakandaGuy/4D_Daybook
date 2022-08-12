//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_EditScheduleDiary
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  24/11/2010 13:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CallBackProcess; $_l_DiaryID; $_l_ProcessState; DB_l_ButtonClickedFunction)
	C_REAL:C285($1; $2)
	C_TEXT:C284($_t_oldMethodName; CO_t_RelatedContact; SD_t_CurrentDiaryInitials)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_EditScheduleDiary")

//Note that this method is passed the [X_DIaryDisplay]x_DiaryViewRecordID as $1 so ` we have to get the [X_DIaryDisplay]xDiaryRecordID:=[DIARY]x_ID
If (Count parameters:C259>=1)
	
	If ($1>0)  //This method will display a diary record in another process
		If (Count parameters:C259>=2)
			$_l_CallBackProcess:=$2
		Else 
			$_l_CallBackProcess:=0
		End if 
		
		Start_Process
		If (Diary_FileL)
			QUERY:C277([X_DIaryDisplay:142]; [X_DIaryDisplay:142]x_DiaryViewRecordID:1=$1)
			$_l_DiaryID:=[X_DIaryDisplay:142]xDiaryRecordID:3
			UNLOAD RECORD:C212([X_DIaryDisplay:142])
			QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=$_l_DiaryID)
			DBI_DisplayRecord(Current process:C322; Table:C252(->[DIARY:12]); "Schedule"; [DIARY:12]Diary_Code:3)
			
			
		End if 
		Process_End
		If (Count parameters:C259>=2)
			If ($_l_CallBackProcess>0)
				$_l_ProcessState:=Process state:C330($_l_CallBackProcess)
				If ($_l_ProcessState>=0)
					SET PROCESS VARIABLE:C370($_l_CallBackProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Refresh"))
					
					POST OUTSIDE CALL:C329($_l_CallBackProcess)
					
				End if 
				//call back to update 'parent process'(
				//if it is still running
			End if 
			
		End if 
		
	Else 
		//not record..ad one
		
		
		ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); [COMPANIES:2]Company_Code:1; CO_t_RelatedContact; "Diary_InNEW"; String:C10(!00-00-00!); Time string:C180(?00:00:00?*1); SD_t_CurrentDiaryInitials)
		
	End if 
End if 
ERR_MethodTrackerReturn("SD2_EditScheduleDiary"; $_t_oldMethodName)

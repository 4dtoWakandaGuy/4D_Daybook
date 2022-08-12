//%attributes = {}
If (False:C215)
	//Project Method Name:      ZDiary_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2/5/10 5:18 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SD3_at_HistoryRelation;0)
	C_BOOLEAN:C305(<>SD3_bo_Query)
	C_LONGINT:C283(<>SD_l_SelectedMenuNumber; <>SD3_l_DiaryProcess; <>SD3_l_DiaryVersion; $_l_ProcessNum; $_l_ProcessState; $_l_ProcessTime; SD_l_CompanionMenuTable; SD3_l_CallActionNum; SD3_l_DiaryActionNum; SD3_l_DiaryRelatedRecordTable; SD3_l_DiarySourceProcess)
	C_TEXT:C284(<>SD3_t_CompMenuCall; <>SD3_t_DiaryProcName; <>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_ProcessName; SD3_t_DiaryRelatedRecord; SD3_t_DiaryRelatedRecordCode; DB_t_CallOnCloseorSave)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZDiary_Mod")


//process was initiated from the menu bar
Case of 
	: ((<>SD3_l_DiaryVersion=0) | (<>SD3_bo_Query=True:C214))  //use old diary manager
		<>SD3_bo_Query:=False:C215
		If (<>SD3_at_HistoryRelation>0)
			ZProc("Diary_Mod"; DB_ProcessMemoryinit(4); "View Diary")
			//Repeated in Functions Palette
		Else 
			ZProc("Diary_Mod"; DB_ProcessMemoryinit(4); "View Diary")
		End if 
	: (<>SD3_l_DiaryVersion=1)  //use SuperDiary manager
		
		
		
		$_t_ProcessName:="View Diary"+"-"+<>PER_t_CurrentUserInitials
		$_l_ProcessNum:=Process number:C372($_t_ProcessName)
		PROCESS PROPERTIES:C336($_l_ProcessNum; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
		If ($_l_ProcessState<0)
			$_l_ProcessNum:=0
			$_t_ProcessName:="View SuperDiary"+"-"+<>PER_t_CurrentUserInitials
		End if 
		DB_t_CallOnCloseorSave:="File"
		If (SD3_l_CallActionNum>0)
			If ($_l_ProcessNum>0)
				
				
				
				PROCESS PROPERTIES:C336($_l_ProcessNum; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
				If ($_l_ProcessState>=0)  // 29/05/02
					SET PROCESS VARIABLE:C370($_l_ProcessNum; SD3_t_DiaryRelatedRecordCode; SD3_t_DiaryRelatedRecord)
					SET PROCESS VARIABLE:C370($_l_ProcessNum; SD3_l_DiarySourceProcess; Current process:C322)
					SET PROCESS VARIABLE:C370($_l_ProcessNum; SD3_l_DiaryRelatedRecordTable; SD_l_CompanionMenuTable)
					SET PROCESS VARIABLE:C370($_l_ProcessNum; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
					SHOW PROCESS:C325($_l_ProcessNum)
					RESUME PROCESS:C320($_l_ProcessNum)
					BRING TO FRONT:C326($_l_ProcessNum)
					If (Application type:C494#4D Server:K5:6)
						POST OUTSIDE CALL:C329($_l_ProcessNum)
					End if 
				End if 
			Else 
				ZProc("Diary_Mod_SD"; DB_ProcessMemoryinit(6); $_t_ProcessName)
				Repeat 
					DelayTicks(10)
					$_t_ProcessName:="View Diary"+"-"+<>PER_t_CurrentUserInitials
					$_t_ProcessName:="View Diary"+"-"+<>PER_t_CurrentUserInitials
					$_l_ProcessNum:=Process number:C372($_t_ProcessName)
				Until ($_l_ProcessNum>0)
				
				SD3_l_CallActionNum:=4
				PROCESS PROPERTIES:C336($_l_ProcessNum; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
				If ($_l_ProcessState>=0)  // 29/05/02
					SET PROCESS VARIABLE:C370($_l_ProcessNum; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
					SHOW PROCESS:C325($_l_ProcessNum)
					RESUME PROCESS:C320($_l_ProcessNum)
					BRING TO FRONT:C326($_l_ProcessNum)
					If (Application type:C494#4D Server:K5:6)
						POST OUTSIDE CALL:C329($_l_ProcessNum)
					End if 
				End if 
				SD3_l_CallActionNum:=0
			End if 
			
			// ZProc ("Diary_Mod";◊K4;"View Diary")
			//Diary_MenV
		Else 
			If ($_l_ProcessNum>0)
				
				SD3_l_CallActionNum:=9
				PROCESS PROPERTIES:C336($_l_ProcessNum; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
				If ($_l_ProcessState>=0)  // 29/05/02
					SET PROCESS VARIABLE:C370($_l_ProcessNum; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
					SHOW PROCESS:C325($_l_ProcessNum)
					RESUME PROCESS:C320($_l_ProcessNum)
					BRING TO FRONT:C326($_l_ProcessNum)
					If (Application type:C494#4D Server:K5:6)
						POST OUTSIDE CALL:C329($_l_ProcessNum)
					End if 
				End if 
				SD3_l_CallActionNum:=0
			Else 
				ZProc("Diary_Mod_SD"; DB_ProcessMemoryinit(6); $_t_ProcessName)
			End if 
		End if 
	: (<>SD3_l_DiaryVersion=2)
		//Version 2 of super diary...
		//Open Searchable list of Diary items
		ZProc("SD2_Diary_Mod"; DB_ProcessMemoryinit(4); "View Diary")
End case 
ERR_MethodTrackerReturn("ZDiary_Mod"; $_t_oldMethodName)
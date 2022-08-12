//%attributes = {}
If (False:C215)
	//Project Method Name:      ZDiary_CalM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SaturdayoN; <>SD3_bo_Query; <>SundayoN)
	C_LONGINT:C283(<>SD3_l_DiaryVersion; $_l_CalendarProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZDiary_CalM")
Case of 
	: ((<>SD3_l_DiaryVersion=0) | (<>SD3_bo_Query=True:C214))  //use old diary manager
		<>SD3_bo_Query:=False:C215
		ZProc("Diary_CalM"; DB_ProcessMemoryinit(4); "Calendar")
	: (<>SD3_l_DiaryVersion=1)  //use SuperDiary manager
		<>SaturdayoN:=SD_bo_SaturdayWork
		<>SundayoN:=SD_bo_SundayWork
		$_l_CalendarProcess:=Process number:C372("Calendar")
		If ($_l_CalendarProcess=0)
			ZProc("SD_Diary_CalM"; DB_ProcessMemoryinit(4); "Calendar")
		Else 
			
			SHOW PROCESS:C325($_l_CalendarProcess)
			BRING TO FRONT:C326($_l_CalendarProcess)
		End if 
		
End case 
ERR_MethodTrackerReturn("ZDiary_CalM"; $_t_oldMethodName)

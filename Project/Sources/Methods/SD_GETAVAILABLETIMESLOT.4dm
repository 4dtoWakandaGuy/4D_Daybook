//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_GETAVAILABLETIMESLOT
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
	//ARRAY LONGINT(<>SD_al_DiaryItemsCheck;0)
	C_BOOLEAN:C305(<>SD2_bo_ScheduleTypeActionsInite; SD2_bo_SearchCompleted)
	C_DATE:C307($2)
	C_LONGINT:C283($_l_PersonID; $_l_Process; $_l_TimeOut; $4)
	C_TEXT:C284($_t_oldMethodName; $1)
	C_TIME:C306($0; $3; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart; SD2_ti_SetTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_GETAVAILABLETIMESLOT")
//SD_GETAVAILABVLETIMESLOT

//this method will find the first available time slot for the person
//passed in $1
MESSAGES OFF:C175

READ ONLY:C145([PERSONNEL:11])
If ([PERSONNEL:11]Initials:1#$1)
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
End if 
$_l_PersonID:=[PERSONNEL:11]Personnel_ID:48
//QUERY([DIARY_ITEMOWNERS];[DIARY_ITEMOWNERS]PERSONNEL_ID=$_l_PersonID)
ARRAY LONGINT:C221(<>SD_al_DiaryItemsCheck; 0)
While (Semaphore:C143("$ScheduleCheck"))
	DelayTicks(2)
End while 
SD2_ti_SetTime:=?00:00:00?
SD2_bo_SearchCompleted:=False:C215
$_l_Process:=New process:C317("SD2_GetMyDiaryItems"; DB_ProcessMemoryinit(1); "Record Check"; Current process:C322; $_l_PersonID; $2; $3; SD_ti_SettingsTimeStart; $4; SD_ti_SettingsTimeEnd)
$_l_TimeOut:=0
Repeat 
	IDLE:C311
	If (Not:C34(SD2_bo_SearchCompleted))
		DelayTicks(2)
		$_l_TimeOut:=$_l_TimeOut+1
	End if 
Until (SD2_bo_SearchCompleted) | ($_l_TimeOut>1000)
CLEAR SEMAPHORE:C144("$ScheduleCheck")

$0:=SD2_ti_SetTime
ERR_MethodTrackerReturn("SD_GETAVAILABLETIMESLOT"; $_t_oldMethodName)

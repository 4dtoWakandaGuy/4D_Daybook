If (False:C215)
	//object Name: [USER]SD2_ScheduleWindow.oSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/12/2012 19:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_abo_TimeModified;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY LONGINT(SD_al_ActionTimeOLD;0)
	C_BOOLEAN:C305(PER_Bo_SaturdayWork; PER_bo_SettingsModified; PER_bo_SundayWork; SD_bo_SaturdayWork; SD_bo_SundayWork; $_bo_EditTimings; PER_Bo_SaturdayWork; PER_bo_SettingsModified; PER_bo_SundayWork; SD_bo_SaturdayWork; SD_bo_SundayWork)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_event; $_l_Index; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; PER_l_RunReminders; PER_l_SaveSettings; PER_l_ShowSchedule; SD_l_SettingsTimeLen)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; <>PER_l_CurrentUserID; $_l_CurrentWinRefOLD; $_l_event; $_l_Index; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; PER_l_RunReminders)
	C_LONGINT:C283(PER_l_SaveSettings; PER_l_SettingsTimeLen; PER_l_ShowSchedule; PER_l_ShowWorkflow; SD_l_SettingsTimeLen; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(PER_ti_SettingsTimeStart; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart; PER_ti_SettingsTimeEnd; PER_ti_SettingsTimeStart; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.oSetup"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		READ WRITE:C146([PERSONNEL:11])
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=<>PER_l_CurrentUserID)
		If (Check_Locked(->[PERSONNEL:11]; 2))
			
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			
			OBJECT GET COORDINATES:C663(*; "oSetup"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			If (Is macOS:C1572)
				WIN_l_CurrentWinRef:=Open window:C153($_l_ObjectLeft+20; $_l_ObjectTop+10; $_l_ObjectRight-50; $_l_ObjectTop+10; 34)
			Else 
				WIN_l_CurrentWinRef:=Open window:C153($_l_ObjectLeft+20; $_l_ObjectTop+10; $_l_ObjectRight-50; $_l_ObjectTop+10; 1984)
			End if 
			DIALOG:C40([PERSONNEL:11]; "PER_DiarySetup")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			If (PER_l_SaveSettings=1)
				If (PER_bo_SettingsModified) | (Find in array:C230(SD_abo_TimeModified; True:C214)>0)
					//something is modified
					//with the time records we are only going to update the preferences if the user has personalised them if they are using inherited values the personal settting remains at 0
					[PERSONNEL:11]Startup_Diary:16:=0
					If (PER_l_ShowSchedule=1)
						[PERSONNEL:11]Startup_Diary:16:=[PERSONNEL:11]Startup_Diary:16+1
					End if 
					If (PER_l_ShowWorkflow=1)
						[PERSONNEL:11]Startup_Diary:16:=[PERSONNEL:11]Startup_Diary:16+2
					End if 
					If (PER_l_RunReminders=1)
						[PERSONNEL:11]Startup_Diary:16:=[PERSONNEL:11]Startup_Diary:16+4
					End if 
					// So here is the time was not modified the user set it back to whatever got loaded from the prefs-this will ensure we do not override defaults
					For ($_l_Index; 1; Size of array:C274(SD_abo_TimeModified))
						If (Not:C34(SD_abo_TimeModified{$_l_Index}))
							SD_al_ActionTime{$_l_Index}:=SD_al_ActionTimeOLD{$_l_Index}
						End if 
					End for 
					$_bo_EditTimings:=(PER_ti_SettingsTimeStart#SD_ti_SettingsTimeStart)
					$_bo_EditTimings:=$_bo_EditTimings | (PER_ti_SettingsTimeEnd#SD_ti_SettingsTimeEnd)
					$_bo_EditTimings:=$_bo_EditTimings | (PER_Bo_SaturdayWork#SD_bo_SaturdayWork)
					$_bo_EditTimings:=$_bo_EditTimings | (PER_bo_SundayWork#SD_bo_SundayWork)
					$_bo_EditTimings:=$_bo_EditTimings | (PER_l_SettingsTimeLen#SD_l_SettingsTimeLen)
					
					If ($_bo_EditTimings) | (Find in array:C230(SD_abo_TimeModified; True:C214)>0)
						SD_ti_SettingsTimeStart:=PER_ti_SettingsTimeStart
						SD_ti_SettingsTimeEnd:=PER_ti_SettingsTimeEnd
						SD_bo_SaturdayWork:=PER_Bo_SaturdayWork
						SD_bo_SundayWork:=PER_bo_SundayWork
						SD_l_SettingsTimeLen:=PER_l_SettingsTimeLen
						
						SD_SavePrefs([PERSONNEL:11]Personnel_ID:48; 1)
					End if 
					
					DB_SaveRecord(->[PERSONNEL:11])
					UNLOAD RECORD:C212([PERSONNEL:11])
					READ ONLY:C145([PERSONNEL:11])
					
					
					
					
					
				End if 
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.oSetup"; $_t_oldMethodName)

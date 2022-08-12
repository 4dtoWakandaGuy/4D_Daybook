//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetMyDiaryItems
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
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	ARRAY LONGINT:C221($_al_allActionIDS; 0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY TEXT(<>SD2_at_SheduleDiaryActions;0)
	ARRAY TEXT:C222($_at_AllActionCode; 0)
	ARRAY TEXT:C222($_at_DiaryCodes; 0)
	ARRAY TEXT:C222($_at_ThisPersonsDiaryRecords; 0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	C_BOOLEAN:C305(<>SD2_bo_ScheduleTypeActionsInite; $_bo_OK; $_bo_Skip; $_bo_Stop; SD2_bo_SearchCompleted)
	C_DATE:C307($_d_Date; $3)
	C_LONGINT:C283($_l_CallBackProcess; $_l_index; $_l_LocationsPosition; $_l_PersonID; $_l_TimeFrame; $1; $2; $6)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_DefaultStartTime; $_ti_NextTime; $_ti_OriginalTime; $_ti_SettingsTimeEnd; $_ti_Time; $4; $5; $7; SD2_ti_SetTIme)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetMyDiaryItems")


If (Count parameters:C259>=7)
	$_l_CallBackProcess:=$1
	$_l_PersonID:=$2
	$_d_Date:=$3
	$_ti_Time:=$4
	$_ti_DefaultStartTime:=$5
	$_l_TimeFrame:=$6
	$_ti_SettingsTimeEnd:=$7
	If (Not:C34(<>SD2_bo_ScheduleTypeActionsInite))
		While (Semaphore:C143("$InitingSchedactions"))
			DelayTicks(6)
		End while 
		If (Not:C34(<>SD2_bo_ScheduleTypeActionsInite))
			ARRAY TEXT:C222(<>SD2_at_SheduleDiaryActions; 0)
			ALL RECORDS:C47([ACTIONS:13])
			SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_AllActionCode; [ACTIONS:13]xID:12; $_al_allActionIDS)
			ARRAY TEXT:C222(SD2_at_DiaryLocations; 0)
			ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
			ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
			SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
			For ($_l_index; 1; Size of array:C274($_at_AllActionCode))
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_at_AllActionCode{$_l_index})
				ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
				
				SD2_ActionAttributesToArrays
				$_bo_OK:=False:C215
				$_l_LocationsPosition:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
				If ($_l_LocationsPosition>0)
					If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsPosition})>0)
						$_bo_OK:=(Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_LocationsPosition}; 1)>0)  //1 is for sheduled items
					Else 
						$_bo_OK:=True:C214
					End if 
				Else 
					$_bo_OK:=True:C214  // locations not set up so every goes in everywhere
				End if 
				If ($_bo_OK)  // This ensures we only include
					APPEND TO ARRAY:C911(<>SD2_at_SheduleDiaryActions; $_at_AllActionCode{$_l_index})
				End if 
			End for 
			<>SD2_bo_ScheduleTypeActionsInite:=True:C214  //SO WE DO NOT NEED TO DO THAT AGAIN-
		End if 
		//NOTE THAT IF AN ACTION IS MODIFIED THIS HAS TO BE SET BACK TO FALSE VIA THE SERVER ON ALL CLIENTS
		CLEAR SEMAPHORE:C144("$InitingSchedactions")
		
	End if 
	QUERY WITH ARRAY:C644([DIARY:12]Action_Code:9; <>SD2_at_SheduleDiaryActions)
	//ARRAY STRING(15;$ADiaryCode;0)
	//SELECTION TO ARRAY([DIARY_ITEMOWNERS]DIARY_CODE;$ADiaryCode)
	CREATE SET:C116([DIARY:12]; "ScheduleActions")
	
	QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$_l_PersonID)
	SELECTION TO ARRAY:C260([DIARY_ITEMOWNERS:106]DIARY_CODE:1; $_at_ThisPersonsDiaryRecords)
	QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_ThisPersonsDiaryRecords)
	CREATE SET:C116([DIARY:12]; "ThisPerson")
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$_l_PersonID)
	QUERY:C277([DIARY:12]; [DIARY:12]Person:8=[PERSONNEL:11]Person_Identity:13)
	CREATE SET:C116([DIARY:12]; "ThisPerson2")
	UNLOAD RECORD:C212([DIARY:12])
	UNION:C120("ThisPerson"; "ThisPerson2"; "ThisPerson")
	CLEAR SET:C117("ThisPerson2")
	
	INTERSECTION:C121("ThisPerson"; "ScheduleActions"; "ThisPerson")
	//This person is now a seleciton of diary records that appear in the scchedule
	CLEAR SET:C117("ScheduleActions")
	QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_From:4=$_d_Date; *)
	QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=False:C215; *)
	QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
	CREATE SET:C116([DIARY:12]; "ThisDate")
	
	//now narrow down to date
	INTERSECTION:C121("ThisPerson"; "ThisDate"; "ThisPerson")
	USE SET:C118("ThisPerson")
	ARRAY TEXT:C222($_at_DiaryCodes; 0)
	SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; $_at_DiaryCodes)
	CLEAR SET:C117("ThisDate")
	If ($_ti_Time=?00:00:00?)
		$_ti_Time:=$_ti_DefaultStartTime
	End if 
	$_ti_OriginalTime:=$_ti_Time
	
	If ($_l_TimeFrame=0)
		$_l_TimeFrame:=60
	End if 
	$_ti_NextTime:=Time:C179(Time string:C180($_ti_Time+($_l_TimeFrame*60)))
	$_bo_Skip:=False:C215
	Repeat 
		DelayTicks(2)
		USE SET:C118("ThisPerson")
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Time_Do_From:6<=$_ti_Time; *)
		QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Time_Do_To:35>=$_ti_NextTime)
		
		If (Records in selection:C76([DIARY:12])=0)
			//find items that end after start time and before the end time
			USE SET:C118("ThisPerson")
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Time_Do_To:35<=$_ti_NextTime; *)
			QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Time_Do_To:35>=$_ti_Time)
			
			
			If (Records in selection:C76([DIARY:12])=0)
				//find items that start after the start time and before the end time
				USE SET:C118("ThisPerson")
				QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Time_Do_From:6>$_ti_Time; *)
				QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Time_Do_From:6<=$_ti_NextTime)
				
				
			End if 
		End if 
		If (Records in selection:C76([DIARY:12])=0)
			$_ti_Time:=Time:C179(Time string:C180($_ti_NextTime+1))  // this adds 1 second on to it
			$_ti_NextTime:=Time:C179(Time string:C180($_ti_Time+($_l_TimeFrame*60)))
		End if 
		$_bo_Stop:=False:C215
		If (Time:C179(Time string:C180($_ti_Time+($_l_TimeFrame*60)))>=$_ti_SettingsTimeEnd) & (Not:C34($_bo_Skip))
			If ($_ti_Time>=$_ti_OriginalTime)
				//Open window(70;60;320;100;-1984)
				//MESSAGE("This item will be outside normal hours.")
				//Delayticks(130)
				//CLOSE WINDOW
				
			End if 
			
			// If (OK=1)
			// $_bo_Stop:=True
			// $0:=†00:00:00†
			//Else
			$_bo_Skip:=True:C214
			//  End if
		End if 
	Until (Records in selection:C76([DIARY:12])=0) | ($_bo_Stop)
	$_ti_NextTime:=Time:C179(Time string:C180($_ti_Time+($_l_TimeFrame*60)))
	If (Size of array:C274($_at_DiaryCodes)>0)
		If ($_bo_Stop=False:C215) & (Records in selection:C76([DIARY:12])=0)
			
			//we now check   for items
			//  $_bo_Skip:=False
			
			For ($_l_index; 1; Size of array:C274($_at_DiaryCodes))
				
				USE SET:C118("ThisPerson")
				QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Diary_Code:3=$_at_DiaryCodes{$_l_index}; *)
				QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Time_Do_From:6<=$_ti_Time; *)
				QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Time_Do_To:35>=$_ti_NextTime)
				
				
				If (Records in selection:C76([DIARY:12])=0)
					
					USE SET:C118("ThisPerson")
					QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Diary_Code:3=$_at_DiaryCodes{$_l_index}; *)
					QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Time_Do_To:35<=$_ti_NextTime; *)
					QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Time_Do_To:35>=$_ti_Time)
					
					
					If (Records in selection:C76([DIARY:12])=0)
						
						USE SET:C118("ThisPerson")
						QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Diary_Code:3=$_at_DiaryCodes{$_l_index}; *)
						QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Time_Do_From:6>$_ti_Time; *)
						QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Time_Do_From:6<=$_ti_NextTime)
						
					Else 
						
						
					End if 
				Else 
					
				End if 
				If (Records in selection:C76([DIARY:12])=0)
					
					$_ti_Time:=Time:C179(Time string:C180($_ti_NextTime+1))  // this adds 1 second on to it
					$_ti_NextTime:=Time:C179(Time string:C180($_ti_Time+($_l_TimeFrame*60)))
					
				End if 
				If (Time:C179(Time string:C180($_ti_Time+($_l_TimeFrame*60)))>=$_ti_SettingsTimeEnd) & (Not:C34($_bo_Skip))
					If ($_ti_Time>=$_ti_OriginalTime)
						//Open window(70;60;320;100;-1984)
						//MESSAGE("This item will be outside normal hours.")
						//Delayticks(30)
						//CLOSE WINDOW
					End if 
					//   Gen_Confirm ("There are no available time slots to complete this diary item o
					//  If (OK=1)
					//  $_bo_Stop:=True
					//Else
					$_bo_Skip:=True:C214
					// End if
				End if 
				If ($_bo_Stop)
					$_l_index:=Size of array:C274($_at_DiaryCodes)
					SD2_ti_SetTIme:=?00:00:00?
					SET PROCESS VARIABLE:C370($_l_CallBackProcess; SD2_ti_SetTime; SD2_ti_SetTime)
					
				End if 
			End for 
			
			
		End if 
		SD2_ti_SetTIme:=$_ti_Time
		SET PROCESS VARIABLE:C370($_l_CallBackProcess; SD2_ti_SetTime; SD2_ti_SetTime)
		
	Else 
		If ($_bo_Stop=False:C215) & (Records in selection:C76([DIARY:12])=0)
			
			SD2_ti_SetTIme:=$_ti_NextTime
			SET PROCESS VARIABLE:C370($_l_CallBackProcess; SD2_ti_SetTime; SD2_ti_SetTime)
		Else 
			SD2_ti_SetTIme:=?00:00:00?
			SET PROCESS VARIABLE:C370($_l_CallBackProcess; SD2_ti_SetTime; SD2_ti_SetTime)
		End if 
	End if 
End if 
SET PROCESS VARIABLE:C370($_l_CallBackProcess; SD2_bo_SearchCompleted; True:C214)
ERR_MethodTrackerReturn("SD2_GetMyDiaryItems"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SETViews
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
	//ARRAY TEXT(SD_at_Events;0)
	//ARRAY TEXT(SD_at_EventSort;0)
	//ARRAY TEXT(SD_at_ToDoList;0)
	//ARRAY TEXT(SD_at_ToDoSort;0)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_BOOLEAN:C305(<>SD_bo_NoAgendaEvent; $_bo_ShowEvents; $_bo_ShowSchedule; $_bo_ShowTasks; SD_bo_AgendaEnabled; SD_bo_NoAgendaEvent)
	C_LONGINT:C283($_l_DefaultEventSize; $_l_DefaultScheduleSize; $_l_DefaultTaskSize; $_l_EventHeight; $_l_HeightDifference; $_l_LabelSpacing; $_l_MaxEventHeight; $_l_MaxScheduleHeight; $_l_MaxTaskHeight; $_l_MaxTotalHeight; $_l_MinEventHeight)
	C_LONGINT:C283($_l_MinScheduleHeight; $_l_MinTaskHeight; $_l_MinWidth; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectsArea; $_l_ObjectTop)
	C_LONGINT:C283($_l_ObjectTop2; $_l_ObjectWidth; $_l_OriginalMaxTotal; $_l_ScheduleHeight; $_l_Start; $_l_TabRightPosition; $_l_TaskHeight; $_l_ThisObjectWidth; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_WindowTop; $_l_WindowWidth; B_ChangeSortToDO; CB_l_ScheduleFullPage; SD_incCompanyinfo; SD_l_AGENDA; SD_l_ChangeSortEvent; SD_l_EndSlider; SD_l_HLDayTime; SD_l_IncAppointmentCo; SD_l_IncEventCo)
	C_LONGINT:C283(SD_l_IncludeCompleted; SD_l_IncQueryCo; SD_l_StartSlider)
	C_PICTURE:C286(SD_Pic_EventSort; SD_Pic_ToDoSort)
	C_REAL:C285($_r_PercentageGrowth)
	C_TEXT:C284($_t_oldMethodName; SD_t_AgendaEndTime; SD_t_AgendaStartTime; SD_t_LabelFind; SD_t_LabelList; SD_t_LabelNew; SD_t_LabelOpen; SD_t_LabelPerson; SD_t_LabelPriority; SD_t_LabelToday; SD_t_LabelTodo)
	C_TEXT:C284(SD_t_VIewingTodo)
End if 

//Code Starts Here

If (True:C214)
	$_t_oldMethodName:=ERR_MethodTracker("SD_SETViews")
	//this method will set the object positions
	//to hide SD_Events and SD_at_ToDoList
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
	$_l_WindowWidth:=($_l_WindowRight-$_l_WindowLeft)
	$_l_ObjectsArea:=394
	OBJECT GET COORDINATES:C663(WS_at_DiaryVIewTab; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	$_l_ObjectRight:=$_l_WindowWidth-$_l_ObjectsArea
	$_l_TabRightPosition:=Int:C8((($_l_ObjectRight-$_l_ObjectLeft)/2)+(80))
	
	If ($_l_WindowWidth>828)
		OBJECT MOVE:C664(SD_incCompanyinfo; $_l_ObjectRight-140; $_l_ObjectTop; $_l_ObjectRight-10; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_l_IncQueryCo; $_l_ObjectRight-140; $_l_ObjectTop; $_l_ObjectRight-10; $_l_ObjectBottom; *)
	Else 
		OBJECT MOVE:C664(SD_incCompanyinfo; $_l_TabRightPosition+5; $_l_ObjectTop; $_l_TabRightPosition+130; $_l_ObjectBottom; *)
		OBJECT MOVE:C664(SD_l_IncQueryCo; $_l_TabRightPosition+5; $_l_ObjectTop; $_l_TabRightPosition+130; $_l_ObjectBottom; *)
	End if 
	
	$_l_MaxTotalHeight:=(($_l_WindowBottom-$_l_WindowTop)-($_l_ObjectBottom+1))-22
	If (FORM Get current page:C276#0)  //| (Current form page=1)
		$_l_MaxEventHeight:=0
		$_l_MaxScheduleHeight:=0
		$_l_MaxTaskHeight:=0
		$_l_MinEventHeight:=40
		$_l_MinScheduleHeight:=50
		$_l_MinTaskHeight:=50
		If (Size of array:C274(SD_at_Events)=0)
			$_bo_ShowEvents:=False:C215
			$_l_EventHeight:=0
		Else 
			$_bo_ShowEvents:=True:C214
			$_l_EventHeight:=12*Size of array:C274(SD_at_Events)
		End if 
		If (SD_bo_AgendaEnabled)
			$_bo_ShowSchedule:=True:C214
			If (Is a list:C621(SD_l_HLDayTime))
				$_l_ScheduleHeight:=12*Count list items:C380(SD_l_HLDayTime)
			Else 
				$_l_ScheduleHeight:=12*1
			End if 
			
		Else 
			If (Is a list:C621(SD_l_HLDayTime))
				If (Count list items:C380(SD_l_HLDayTime)=0)
					$_bo_ShowSchedule:=False:C215
					$_l_ScheduleHeight:=0
				Else 
					$_bo_ShowSchedule:=True:C214
					$_l_ScheduleHeight:=12*Count list items:C380(SD_l_HLDayTime)
				End if 
				
			Else 
				$_bo_ShowSchedule:=False:C215
				$_l_ScheduleHeight:=0
			End if 
		End if 
		
		If (Size of array:C274(SD_at_ToDoList)=0)
			$_bo_ShowTasks:=False:C215
			$_l_TaskHeight:=0
		Else 
			$_bo_ShowTasks:=True:C214
			$_l_TaskHeight:=12*Size of array:C274(SD_at_ToDoList)
		End if 
		If ($_bo_ShowTasks=False:C215) & ($_bo_ShowSchedule=False:C215) & ($_bo_ShowEvents=False:C215)
			$_bo_ShowTasks:=True:C214
			$_bo_ShowSchedule:=True:C214
			$_bo_ShowEvents:=True:C214
		End if 
		
		$_l_MaxScheduleHeight:=$_l_MaxTotalHeight-14
		$_l_MaxTaskHeight:=$_l_MaxTotalHeight-14
		$_l_MaxEventHeight:=$_l_MaxTotalHeight-14
		$_l_OriginalMaxTotal:=239+69+52+14+14+14
		$_l_HeightDifference:=$_l_MaxTotalHeight-$_l_OriginalMaxTotal
		$_r_PercentageGrowth:=($_l_HeightDifference/$_l_OriginalMaxTotal)*100
		$_l_DefaultEventSize:=((52*$_r_PercentageGrowth)/100)+52
		$_l_DefaultScheduleSize:=((239*$_r_PercentageGrowth)/100)+239
		$_l_DefaultTaskSize:=((69*$_r_PercentageGrowth)/100)+69
		If (($_l_EventHeight+$_l_TaskHeight)>($_l_DefaultEventSize+$_l_DefaultTaskSize))
			//the Schedule height needs restricting
			$_l_MaxScheduleHeight:=$_l_DefaultScheduleSize
		End if 
		If ($_l_ScheduleHeight>$_l_MaxScheduleHeight)
			$_l_ScheduleHeight:=$_l_MaxScheduleHeight
		End if 
		If ($_l_ScheduleHeight<$_l_MinScheduleHeight) & ($_bo_ShowSchedule)
			$_l_ScheduleHeight:=$_l_MinScheduleHeight
		End if 
		If ($_l_EventHeight+$_l_ScheduleHeight>($_l_DefaultEventSize+$_l_DefaultScheduleSize))
			$_l_MaxTaskHeight:=$_l_DefaultTaskSize
		End if 
		
		If ($_l_TaskHeight>$_l_MaxTaskHeight)
			$_l_TaskHeight:=$_l_MaxTaskHeight
		End if 
		If ($_l_TaskHeight<$_l_MinTaskHeight) & ($_bo_ShowTasks)
			$_l_TaskHeight:=$_l_MinTaskHeight
		End if 
		If (($_l_TaskHeight+$_l_ScheduleHeight)>($_l_DefaultScheduleSize+$_l_DefaultTaskSize))
			$_l_MaxEventHeight:=$_l_DefaultEventSize
		End if 
		If ($_l_EventHeight>$_l_MaxEventHeight)
			$_l_EventHeight:=$_l_MaxEventHeight
		End if 
		If ($_l_EventHeight<$_l_MinEventHeight) & ($_bo_ShowEvents)
			$_l_EventHeight:=$_l_MinEventHeight
		End if 
		
		Case of 
			: (($_l_ScheduleHeight+$_l_TaskHeight+$_l_EventHeight)<($_l_MaxTotalHeight)) & ($_bo_ShowSchedule)
				$_l_ScheduleHeight:=$_l_MaxTotalHeight-($_l_TaskHeight+$_l_EventHeight)
			: (($_l_ScheduleHeight+$_l_TaskHeight+$_l_EventHeight)<($_l_MaxTotalHeight)) & ($_bo_ShowTasks)
				$_l_TaskHeight:=$_l_MaxTotalHeight-($_l_ScheduleHeight+$_l_EventHeight)
			: (($_l_ScheduleHeight+$_l_TaskHeight+$_l_EventHeight)<($_l_MaxTotalHeight)) & ($_bo_ShowEvents)
				$_l_EventHeight:=$_l_MaxTotalHeight-($_l_TaskHeight+$_l_ScheduleHeight)
				
		End case 
		
		
		If ($_bo_ShowEvents)
			OBJECT SET VISIBLE:C603(*; "SD_pic_sort1"; True:C214)
			OBJECT SET VISIBLE:C603(SD_Pic_EventSort; True:C214)
			OBJECT SET VISIBLE:C603(SD_at_EventSort; True:C214)
			OBJECT SET ENABLED:C1123(SD_l_ChangeSortEvent; True:C214)
			OBJECT SET VISIBLE:C603(SD_l_ChangeSortEvent; True:C214)
			
			OBJECT SET VISIBLE:C603(SD_at_Events; True:C214)
			OBJECT SET VISIBLE:C603(*; "SD_t_EventLabel"; True:C214)
			//SET ENTERABLE(SD_l_ChangeSortEvent;True)
			
			
			OBJECT SET ENABLED:C1123(SD_l_IncEventCo; True:C214)
			OBJECT GET COORDINATES:C663(WS_at_DiaryVIewTab; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectRight:=$_l_WindowWidth-$_l_ObjectsArea
			OBJECT MOVE:C664(*; "SD_t_EventLabel"; $_l_ObjectLeft; $_l_ObjectBottom+1; $_l_ObjectRight; $_l_ObjectBottom+13; *)
			
			OBJECT GET COORDINATES:C663(*; "SD_pic_sort1"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			$_l_ObjectWidth:=11
			OBJECT MOVE:C664(*; "SD_pic_sort1"; ($_l_ObjectRight-15)-$_l_ObjectWidth; $_l_ObjectBottom+2; $_l_ObjectRight-15; $_l_ObjectBottom+11+2; *)
			OBJECT MOVE:C664(SD_at_EventSort; ($_l_ObjectRight-15)-$_l_ObjectWidth; $_l_ObjectBottom+2; $_l_ObjectRight-15; $_l_ObjectBottom+11+2; *)
			
			OBJECT MOVE:C664(*; "Pic_Sortarrow1"; ($_l_ObjectRight-5)-$_l_ObjectWidth; $_l_ObjectBottom+2; $_l_ObjectRight-5; $_l_ObjectBottom+11+2; *)
			OBJECT MOVE:C664(SD_l_ChangeSortEvent; ($_l_ObjectRight-5)-$_l_ObjectWidth; $_l_ObjectBottom+2; $_l_ObjectRight-5; ($_l_ObjectBottom+11+2); *)
			//SD_at_EventSort
			//SD_pic_sort1
			//Pic_Sortarrow1
			
			OBJECT MOVE:C664(SD_at_Events; $_l_ObjectLeft; $_l_ObjectBottom+15; $_l_ObjectRight; $_l_ObjectBottom+(15+$_l_EventHeight); *)
		Else 
			OBJECT SET VISIBLE:C603(*; "SD_pic_sort1"; False:C215)
			OBJECT SET VISIBLE:C603(*; "Pic_Sortarrow1"; False:C215)
			OBJECT SET VISIBLE:C603(SD_at_EventSort; False:C215)
			//SET VISIBLE(SD_l_ChangeSortEvent;False)
			
			OBJECT SET VISIBLE:C603(SD_l_IncEventCo; False:C215)
			OBJECT SET VISIBLE:C603(SD_at_Events; False:C215)
			OBJECT SET VISIBLE:C603(*; "SD_t_EventLabel"; False:C215)
		End if 
		If ($_bo_ShowSchedule)
			If (SD_bo_AgendaEnabled)
				OBJECT SET VISIBLE:C603(SD_l_HLDayTime; False:C215)
				OBJECT SET VISIBLE:C603(SD_l_AGENDA; True:C214)
				OBJECT SET VISIBLE:C603(SD_t_AgendaStartTime; True:C214)
				OBJECT SET VISIBLE:C603(SD_l_StartSlider; True:C214)
				OBJECT SET VISIBLE:C603(SD_t_AgendaEndTime; True:C214)
				OBJECT SET VISIBLE:C603(SD_l_EndSlider; True:C214)
				OBJECT SET VISIBLE:C603(SD_l_IncAppointmentCo; True:C214)
				OBJECT SET ENABLED:C1123(SD_l_IncAppointmentCo; True:C214)
				OBJECT SET VISIBLE:C603(*; "SD_t_ScheduleLabel"; True:C214)
				OBJECT SET VISIBLE:C603(CB_l_ScheduleFullPage; True:C214)
				If ($_l_TaskHeight>80)
					$_l_TaskHeight:=80
				End if 
				
				If ($_bo_ShowEvents)
					OBJECT GET COORDINATES:C663(SD_at_Events; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				Else 
					OBJECT GET COORDINATES:C663(WS_at_DiaryVIewTab; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_ObjectRight:=$_l_WindowWidth-$_l_ObjectsArea
				End if 
				OBJECT MOVE:C664(*; "SD_t_ScheduleLabel"; $_l_ObjectLeft; $_l_ObjectBottom+1; $_l_ObjectRight-82; $_l_ObjectBottom+13; *)
				OBJECT MOVE:C664(CB_l_ScheduleFullPage; $_l_ObjectRight-81; $_l_ObjectBottom+1; $_l_ObjectRight-1; $_l_ObjectBottom+13; *)
				If ($_bo_ShowTasks)
					$_l_ScheduleHeight:=($_l_MaxTotalHeight-$_l_TaskHeight-15)-($_l_ObjectBottom+15)
					If ($_l_ScheduleHeight<$_l_MinScheduleHeight)
						$_l_ScheduleHeight:=$_l_MinScheduleHeight
					End if 
					
				End if 
				If ($_l_MaxTotalHeight>$_l_ScheduleHeight)
					$_l_ThisObjectWidth:=($_l_ObjectRight-$_l_ObjectLeft)
					
					OBJECT MOVE:C664(SD_t_AgendaStartTime; $_l_ObjectLeft; $_l_ObjectBottom+15; $_l_ObjectLeft+($_l_ThisObjectWidth/2); $_l_ObjectBottom+15+(12); *)
					OBJECT MOVE:C664(SD_t_AgendaEndTime; $_l_ObjectRight-($_l_ThisObjectWidth/2); $_l_ObjectBottom+15; $_l_ObjectRight; $_l_ObjectBottom+15+(12); *)
					$_l_ObjectBottom:=$_l_ObjectBottom+12
					OBJECT MOVE:C664(SD_l_StartSlider; $_l_ObjectLeft; $_l_ObjectBottom+15; $_l_ObjectLeft+($_l_ThisObjectWidth/2); $_l_ObjectBottom+15+(12); *)
					OBJECT MOVE:C664(SD_l_endSlider; $_l_ObjectRight-($_l_ThisObjectWidth/2); $_l_ObjectBottom+15; $_l_ObjectRight; $_l_ObjectBottom+15+(12); *)
					$_l_ObjectBottom:=$_l_ObjectBottom+20
					SD_bo_NoAgendaEvent:=True:C214
					OBJECT MOVE:C664(SD_l_AGENDA; $_l_ObjectLeft; $_l_ObjectBottom+15; $_l_ObjectRight; $_l_ObjectBottom+15+($_l_ScheduleHeight); *)
					SD_bo_NoAgendaEvent:=False:C215
					//MOVE OBJECT(SD_l_HLDayTime;$_l_ObjectLeft;$_l_ObjectBottom+15;$_l_ObjectRight;($_l_ObjectBottom+15+$_l_MaxTotalHeight);*)
					//MOVE OBJECT(SD_l_AGENDA;$_l_ThisObjectWidth+1;$_l_ObjectBottom+15;$_l_ObjectRight;$_l_ObjectBottom+($_l_ScheduleHeight);*)
				Else 
					$_l_ThisObjectWidth:=($_l_ObjectRight-$_l_ObjectLeft)
					
					OBJECT MOVE:C664(SD_t_AgendaStartTime; $_l_ObjectLeft; $_l_ObjectBottom+15; $_l_ObjectLeft+($_l_ThisObjectWidth/2); $_l_ObjectBottom+15+(12); *)
					OBJECT MOVE:C664(SD_t_AgendaEndTime; $_l_ObjectRight-($_l_ThisObjectWidth/2); $_l_ObjectBottom+15; $_l_ObjectRight; $_l_ObjectBottom+15+(12); *)
					$_l_ObjectBottom:=$_l_ObjectBottom+12
					OBJECT MOVE:C664(SD_l_StartSlider; $_l_ObjectLeft; $_l_ObjectBottom+15; $_l_ObjectLeft+($_l_ThisObjectWidth/2); $_l_ObjectBottom+15+(12); *)
					OBJECT MOVE:C664(SD_l_endSlider; $_l_ObjectRight-($_l_ThisObjectWidth/2); $_l_ObjectBottom+15; $_l_ObjectRight; $_l_ObjectBottom+15+(12); *)
					$_l_ObjectBottom:=$_l_ObjectBottom+20
					<>SD_bo_NoAgendaEvent:=True:C214
					OBJECT MOVE:C664(SD_l_AGENDA; $_l_ObjectLeft; $_l_ObjectBottom+15; $_l_ObjectRight; $_l_ObjectBottom+$_l_ScheduleHeight-26; *)
					<>SD_bo_NoAgendaEvent:=False:C215
				End if 
			Else 
				OBJECT SET VISIBLE:C603(SD_l_HLDayTime; True:C214)
				OBJECT SET VISIBLE:C603(SD_l_AGENDA; False:C215)
				OBJECT SET VISIBLE:C603(SD_t_AgendaStartTime; False:C215)
				OBJECT SET VISIBLE:C603(SD_l_StartSlider; False:C215)
				OBJECT SET VISIBLE:C603(SD_t_AgendaEndTime; False:C215)
				OBJECT SET VISIBLE:C603(SD_l_EndSlider; False:C215)
				OBJECT SET VISIBLE:C603(CB_l_ScheduleFullPage; False:C215)
				OBJECT SET VISIBLE:C603(SD_l_IncAppointmentCo; True:C214)
				OBJECT SET ENABLED:C1123(SD_l_IncAppointmentCo; True:C214)
				OBJECT SET VISIBLE:C603(*; "SD_t_ScheduleLabel"; True:C214)
				If ($_bo_ShowEvents)
					OBJECT GET COORDINATES:C663(SD_at_Events; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				Else 
					OBJECT GET COORDINATES:C663(WS_at_DiaryVIewTab; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_ObjectRight:=$_l_WindowWidth-$_l_ObjectsArea
				End if 
				OBJECT MOVE:C664(*; "SD_t_ScheduleLabel"; $_l_ObjectLeft; $_l_ObjectBottom+1; $_l_ObjectRight; $_l_ObjectBottom+13; *)
				If ($_bo_ShowTasks)
					$_l_ScheduleHeight:=($_l_MaxTotalHeight-$_l_TaskHeight-15)-($_l_ObjectBottom+15)
					If ($_l_ScheduleHeight<$_l_MinScheduleHeight)
						$_l_ScheduleHeight:=$_l_MinScheduleHeight
					End if 
					
				End if 
				If ($_l_MaxTotalHeight>$_l_ScheduleHeight)
					$_l_ThisObjectWidth:=($_l_ObjectRight-$_l_ObjectLeft)
					OBJECT MOVE:C664(SD_l_HLDayTime; $_l_ObjectLeft; $_l_ObjectBottom+15; $_l_ThisObjectWidth; $_l_ObjectBottom+15+($_l_ScheduleHeight); *)
					//MOVE OBJECT(SD_l_HLDayTime;$_l_ObjectLeft;$_l_ObjectBottom+15;$_l_ObjectRight;($_l_ObjectBottom+15+$_l_MaxTotalHeight);*)
					//MOVE OBJECT(SD_l_AGENDA;$_l_ThisObjectWidth+1;$_l_ObjectBottom+15;$_l_ObjectRight;$_l_ObjectBottom+($_l_ScheduleHeight);*)
					
				End if 
			End if 
			
		Else 
			OBJECT SET VISIBLE:C603(SD_l_IncAppointmentCo; False:C215)
			OBJECT SET VISIBLE:C603(SD_l_HLDayTime; False:C215)
			OBJECT SET VISIBLE:C603(SD_l_AGENDA; False:C215)
			OBJECT SET VISIBLE:C603(SD_t_AgendaStartTime; False:C215)
			OBJECT SET VISIBLE:C603(SD_l_StartSlider; False:C215)
			OBJECT SET VISIBLE:C603(SD_t_AgendaEndTime; False:C215)
			OBJECT SET VISIBLE:C603(SD_l_EndSlider; False:C215)
			
			OBJECT SET VISIBLE:C603(*; "SD_t_ScheduleLabel"; False:C215)
			OBJECT SET VISIBLE:C603(CB_l_ScheduleFullPage; False:C215)
		End if 
		If ($_bo_ShowTasks)
			Case of 
				: ($_bo_ShowSchedule)
					If (SD_bo_AgendaEnabled)
						OBJECT GET COORDINATES:C663(SD_l_AGENDA; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					Else 
						OBJECT GET COORDINATES:C663(SD_l_HLDayTime; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					End if 
				: ($_bo_ShowEvents)
					If (SD_bo_AgendaEnabled)
						//GET OBJECT RECT(SD_l_AreaListEvents;$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
						OBJECT GET COORDINATES:C663(SD_at_Events; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					Else 
						OBJECT GET COORDINATES:C663(SD_at_Events; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					End if 
				Else 
					OBJECT GET COORDINATES:C663(WS_at_DiaryVIewTab; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_ObjectRight:=$_l_WindowWidth-$_l_ObjectsArea
			End case 
			OBJECT SET VISIBLE:C603(SD_at_ToDoSort; True:C214)
			OBJECT SET VISIBLE:C603(B_ChangeSortToDO; True:C214)
			OBJECT SET VISIBLE:C603(SD_Pic_ToDoSort; True:C214)
			OBJECT SET VISIBLE:C603(*; "Pic_Sort2"; True:C214)
			OBJECT SET VISIBLE:C603(SD_at_ToDoList; True:C214)
			OBJECT SET VISIBLE:C603(*; "oSD_t_TaskLabel"; True:C214)
			OBJECT SET ENABLED:C1123(B_ChangeSortToDO; True:C214)
			OBJECT MOVE:C664(*; "oSD_t_TaskLabel"; $_l_ObjectLeft; $_l_ObjectBottom+1; $_l_ObjectRight; $_l_ObjectBottom+13; *)
			$_l_ObjectWidth:=11
			OBJECT GET COORDINATES:C663(*; "Pic_Sort2"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			$_l_ObjectWidth:=11
			OBJECT MOVE:C664(*; "Pic_Sort2"; ($_l_ObjectRight-15)-$_l_ObjectWidth; $_l_ObjectBottom+2; $_l_ObjectRight-15; $_l_ObjectBottom+11+2; *)
			OBJECT MOVE:C664(SD_at_ToDoSort; ($_l_ObjectRight-15)-$_l_ObjectWidth; $_l_ObjectBottom+2; $_l_ObjectRight-15; $_l_ObjectBottom+11+2; *)
			
			OBJECT MOVE:C664(SD_Pic_ToDoSort; ($_l_ObjectRight-5)-$_l_ObjectWidth; $_l_ObjectBottom+2; $_l_ObjectRight-5; $_l_ObjectBottom+11+2; *)
			OBJECT MOVE:C664(B_ChangeSortToDO; ($_l_ObjectRight-5)-$_l_ObjectWidth; $_l_ObjectBottom+2; $_l_ObjectRight-5; ($_l_ObjectBottom+11+2); *)
			If (SD_bo_AgendaEnabled)
				//SET VISIBLE(SD_l_AreaListEvents;True)
				//SET VISIBLE(SD_at_ToDoList;False)
				//SET VISIBLE(SD_at_ToDoSort;False)
				//SET VISIBLE(B_ChangeSortToDO;False)
				//SET VISIBLE(SD_Pic_ToDoSort;False)
				//SET VISIBLE(*;"Pic_Sort2";False)
				
				//SET VISIBLE(*;"SD_t_TaskLabel";False)
				//MOVE OBJECT(SD_l_AreaListEvents;$_l_ObjectLeft;$_l_ObjectBottom+15;$_l_ObjectRight;($_l_WindowBottom-$_l_WindowTop)-5;*)
				OBJECT MOVE:C664(SD_at_ToDoList; $_l_ObjectLeft; $_l_ObjectBottom+15; $_l_ObjectRight; ($_l_WindowBottom-$_l_WindowTop)-5; *)
			Else 
				OBJECT MOVE:C664(SD_at_ToDoList; $_l_ObjectLeft; $_l_ObjectBottom+15; $_l_ObjectRight; ($_l_WindowBottom-$_l_WindowTop)-5; *)
			End if 
		Else 
			
			OBJECT SET VISIBLE:C603(SD_at_ToDoList; False:C215)
			
			//SET VISIBLE(SD_l_AreaListEvents;False)
			OBJECT SET VISIBLE:C603(SD_at_ToDoSort; False:C215)
			OBJECT SET VISIBLE:C603(B_ChangeSortToDO; False:C215)
			OBJECT SET VISIBLE:C603(SD_Pic_ToDoSort; False:C215)
			OBJECT SET VISIBLE:C603(*; "Pic_Sort2"; False:C215)
			OBJECT SET VISIBLE:C603(SD_at_ToDoList; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSD_t_TaskLabel"; False:C215)
		End if 
		
		SD_t_LabelNew:="New"  //1
		SD_t_LabelOpen:="Open"
		SD_t_LabelList:="List"
		SD_t_LabelFind:="Find"
		SD_t_LabelPerson:="Diary Owner"
		SD_t_LabelPriority:="Priority"
		Case of 
			: (SD_l_IncludeCompleted=1)
				SD_t_LabelTodo:="To Do"  //"All Items"  ` CONTEXTUAL
				SD_t_VIewingTodo:="All Items"
				$_l_LabelSpacing:=55
			Else 
				SD_t_LabelTodo:="All Items"  //"To Do"  ` CONTEXTUAL
				SD_t_VIewingTodo:="To Do"
				$_l_LabelSpacing:=35
		End case 
		
		SD_t_LabelToday:="Today"
		
		$_l_ObjectWidth:=$_l_WindowRight-$_l_WindowLeft
		$_l_MinWidth:=582
		$_l_Start:=10
		
		SD_SetViews_2
		
	End if 
End if 
ERR_MethodTrackerReturn("SD_SETViews"; $_t_oldMethodName)
If (False:C215)
	//object Name: [USER]SD2_ScheduleWindow.Invisible Button2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2013 15:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PAL_bo_ButtonSubFunction)
	C_DATE:C307($_d_EndDate; SD_D_DiaryDateGoto; SD2_D_CurrentDateEnd; SD2_D_CurrentDateStart; SD2_D_CurrentHighlightDay)
	C_LONGINT:C283($_l_AgendaArea; $_l_ButtonNumber; $_l_CallBackProcess; $_l_DayNumber; $_l_DayOf; $_l_event; $_l_FieldNumber; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_ObjectBottom)
	C_LONGINT:C283($_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_OpenLeft; $_l_OpenTop; $_l_popupDiaryProcess; $_l_TableNumber; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop)
	C_LONGINT:C283(SD2_l_CalenderArea; SD2_l_CurrentScheduleView; SD2_l_DatetoCal)
	C_POINTER:C301($_ptr_PalletButton; $_ptr_PopupButton)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; PAL_BUTTON)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.Invisible Button2"; Form event code:C388)
$_ptr_PalletButton:=Self:C308
RESOLVE POINTER:C394($_ptr_PalletButton; PAL_BUTTON; $_l_TableNumber; $_l_FieldNumber)
$_l_event:=Form event code:C388
$_l_ButtonNumber:=Num:C11(PAL_BUTTON)
Case of 
	: ($_l_event=On Long Click:K2:37)  //| ($_l_event=On Arrow Click )
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
		$_ptr_PopupButton:=Get pointer:C304("PAL_at_PopUpMenu"+String:C10($_l_ButtonNumber))
		PAL_bo_ButtonSubFunction:=True:C214
		$_t_ProcessName:="DiaryPopDateView"
		$_l_CallBackProcess:=Current process:C322
		$_l_popupDiaryProcess:=New process:C317("SD2_PopUpDiary"; 180000; $_t_ProcessName; $_l_CallBackProcess; SD2_D_CurrentDateStart; "SD2_D_CurrentDateStart"; "SD2_l_EventCall"; 11; $_l_WindowLeft+$_l_MouseX; $_l_WindowTop+$_l_MouseY; *)
		BRING TO FRONT:C326($_l_popupDiaryProcess)
		SHOW PROCESS:C325($_l_popupDiaryProcess)
		
	Else 
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		OBJECT GET COORDINATES:C663(SD2_l_DatetoCal; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_OpenLeft:=($_l_WindowLeft+$_l_ObjectLeft)+(318/2)
		$_l_OpenTop:=$_l_windowTop+$_l_ObjectTop+(120/2)
		SD_D_DiaryDateGoto:=Gen_RequestDate("Go to Date"; Is date:K8:7; Current date:C33; "Go"; "Stop"; $_l_OpenLeft; $_l_OpenTop; "Enter date to display")
		
		
		If (SD_D_DiaryDateGoto#!00-00-00!)
			
			
			$_l_AgendaArea:=SD2_l_CalenderArea
			
			Case of 
				: (SD2_l_CurrentScheduleView=1)  // Day view
					SD2_D_CurrentDateStart:=SD_D_DiaryDateGoto
					SD2_D_CurrentDateEnd:=SD2_D_CurrentDateStart
					SD2_D_CurrentHighlightDay:=SD2_D_CurrentDateStart
					Cal4D_OM_CalWithMinis_BTN("Day_Today"; SD2_D_CurrentDateStart)
				: (SD2_l_CurrentScheduleView=2)  // Week view
					SD2_D_CurrentDateStart:=SD_D_DiaryDateGoto
					Cal4D_OM_CalWithMinis_BTN("Week_Today"; SD2_D_CurrentDateStart)
					$_l_DayNumber:=Day number:C114(SD2_D_CurrentHighlightDay)
					Case of 
						: ($_l_DayNumber=7)
							SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart-6
						: ($_l_DayNumber=6)
							SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart-5
						: ($_l_DayNumber=5)
							SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart-4
						: ($_l_DayNumber=4)
							SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart-3
						: ($_l_DayNumber=3)
							SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart-2
						: ($_l_DayNumber=2)
							SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart-1
						Else 
							SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart
					End case 
					
					SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart-7
					SD2_D_CurrentDateEnd:=SD2_D_CurrentDateStart+1
				: (SD2_l_CurrentScheduleView=3)  // Month view
					SD2_D_CurrentDateStart:=SD_D_DiaryDateGoto
					//The following is the code of the button 'Month'
					Cal4D_OM_CalWithMinis_BTN("month_Today"; SD2_D_CurrentDateStart)
					$_l_DayOf:=Day of:C23(SD2_D_CurrentDateStart)
					SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart-($_l_DayOf-1)
					$_d_EndDate:=SD2_D_CurrentDateStart+28
					Repeat 
						If (Month of:C24($_d_EndDate)=Month of:C24(SD2_D_CurrentDateStart))
							$_d_EndDate:=$_d_EndDate+1
						End if 
					Until (Month of:C24($_d_EndDate)#Month of:C24(SD2_D_CurrentDateStart))
					$_d_EndDate:=$_d_EndDate-1
					SD2_D_CurrentDateEnd:=$_d_EndDate
					$_l_AgendaArea:=SD2_l_CalenderArea
					SD2_l_CurrentScheduleView:=3
			End case 
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.Invisible Button2"; $_t_oldMethodName)

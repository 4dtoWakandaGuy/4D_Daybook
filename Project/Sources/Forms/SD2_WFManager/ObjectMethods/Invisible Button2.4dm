If (False:C215)
	//object Name: Object Name:      SD2_WFManager.Invisible Button2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 12:36
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PAL_bo_ButtonSubFunction)
	C_DATE:C307($_d_EndDate; SD2_D_CurrentDateEnd; SD2_D_CurrentDateStart; SD2_D_CurrentHighlightDay)
	C_LONGINT:C283($_l_AgendaArea; $_l_ButtonNumber; $_l_CallBackProcess; $_l_DayNumber; $_l_DayOf; $_l_event; $_l_FieldNumber; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_PopUpProcess)
	C_LONGINT:C283($_l_TableNumber; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; SD2_l_CalenderArea; SD2_l_CurrentScheduleView)
	C_POINTER:C301($_ptr_PalletButton; $_Ptr_PopUpNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; PAL_BUTTON; SD_t_DiaryDateString)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ SD2_WFManager.Invisible Button2")

$_t_oldMethodName:=ERR_MethodTracker("OBJ SD2_WFManager.Invisible Button2"; Form event code:C388)
$_ptr_PalletButton:=Self:C308
RESOLVE POINTER:C394($_ptr_PalletButton; PAL_BUTTON; $_l_TableNumber; $_l_FieldNumber)
$_l_event:=Form event code:C388
$_l_ButtonNumber:=Num:C11(PAL_BUTTON)
Case of 
	: ($_l_event=On Long Click:K2:37)  //| ($_l_event=On Arrow Click )
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
		$_Ptr_PopUpNumber:=Get pointer:C304("PAL_at_PopUpMenu"+String:C10($_l_ButtonNumber))
		PAL_bo_ButtonSubFunction:=True:C214
		$_t_ProcessName:="DiaryPopDateView"
		$_l_CallBackProcess:=Current process:C322
		$_l_PopUpProcess:=New process:C317("SD2_PopUpDiary"; 64000; $_t_ProcessName; $_l_CallBackProcess; SD2_D_CurrentDateStart; "SD2_D_CurrentDateStart"; "SD2_l_EventCall"; 11; $_l_WindowLeft+$_l_MouseX; $_l_WindowTop+$_l_MouseY; *)
		BRING TO FRONT:C326($_l_PopUpProcess)
		SHOW PROCESS:C325($_l_PopUpProcess)
		
	Else 
		SD_t_DiaryDateString:=Gen_Request("Go to Date"; "")
		If (SD_t_DiaryDateString#"")
			If (Date:C102(SD_t_DiaryDateString)#!00-00-00!)
				$_l_AgendaArea:=SD2_l_CalenderArea
				
				Case of 
					: (SD2_l_CurrentScheduleView=1)  // Day view
						SD2_D_CurrentDateStart:=Date:C102(SD_t_DiaryDateString)
						SD2_D_CurrentDateEnd:=SD2_D_CurrentDateStart
						SD2_D_CurrentHighlightDay:=SD2_D_CurrentDateStart
					: (SD2_l_CurrentScheduleView=2)  // Week view
						SD2_D_CurrentDateStart:=Date:C102(SD_t_DiaryDateString)
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
						SD2_D_CurrentDateStart:=Date:C102(SD_t_DiaryDateString)
						//The following is the code of the button 'Month'
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
		End if 
End case 
ERR_MethodTrackerReturn("OBJ SD2_WFManager.Invisible Button2"; $_t_oldMethodName)

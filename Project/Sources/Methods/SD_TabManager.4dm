//%attributes = {}

If (False:C215)
	//Project Method Name:      SD_TabManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Redeye0735
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_DATE:C307($_d_EndDate; SD_D_CurrentviewDate; SD_D_CurrentViewDateOLD; SD_d_EndDate; SD_d_EndDateOLD; SD_d_StartDate; SD_d_StartDateOLD)
	C_LONGINT:C283($_l_DayNumber; $_l_Dayof; $_l_Event; $_l_PseudoEvent; $1; SD_l_DIaryPage; WS_l_SELECTEDDIARYVIEWTAB)
	C_TEXT:C284(<>HelpTip; $_t_oldMethodName; SD_t_CurrentDiaryInitials; SD_t_LastQuery; SD_t_Periodstr; SD_t_PeriodStrOLD)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_TabManager")

$_l_Event:=Form event code:C388

$_l_PseudoEvent:=0
If (Count parameters:C259>=1)
	$_l_PseudoEvent:=$1
End if 

Case of 
	: ($_l_Event=On Clicked:K2:4) | ($_l_PseudoEvent=On Clicked:K2:4)
		$_t_oldMethodName:=ERR_MethodTracker("SD_TabManager")
		$_l_DayNumber:=Day number:C114(SD_D_CurrentviewDate)
		Case of 
			: (WS_at_DiaryVIewTab=1)  //daily view
				If (SD_D_CurrentViewDate=!00-00-00!)
					SD_d_StartDate:=SD_d_StartDateOLD
					SD_d_EndDate:=SD_d_EndDateOLD
					SD_t_PeriodStrOLD:=SD_t_Periodstr
					SD_D_CurrentViewDate:=SD_D_CurrentViewDateOLD
				End if 
				
				ARRAY TEXT:C222(WS_at_DiaryVIewTab; 3)
				FORM GOTO PAGE:C247(SD_l_DIaryPage)
				SD_d_StartDate:=SD_D_CurrentviewDate
				SD_d_EndDate:=SD_D_CurrentviewDate
				SDiary_HL_QueryDiary(SD_t_CurrentDiaryInitials; SD_d_StartDate; SD_d_EndDate)
				SDiary_HL_DisplayDiary(SD_d_StartDate; SD_d_EndDate)
			: (WS_at_DiaryVIewTab=2)  //weekly view
				ARRAY TEXT:C222(WS_at_DiaryVIewTab; 3)
				FORM GOTO PAGE:C247(SD_l_DIaryPage)
				
				Case of 
					: ($_l_DayNumber=7)
						SD_d_StartDate:=SD_D_CurrentviewDate-6
					: ($_l_DayNumber=6)
						SD_d_StartDate:=SD_D_CurrentviewDate-5
					: ($_l_DayNumber=5)
						SD_d_StartDate:=SD_D_CurrentviewDate-4
					: ($_l_DayNumber=4)
						SD_d_StartDate:=SD_D_CurrentviewDate-3
					: ($_l_DayNumber=3)
						SD_d_StartDate:=SD_D_CurrentviewDate-2
					: ($_l_DayNumber=2)
						SD_d_StartDate:=SD_D_CurrentviewDate-1
					Else 
						SD_d_StartDate:=SD_D_CurrentviewDate
				End case 
				SD_d_EndDate:=SD_d_StartDate+6
				SDiary_HL_QueryDiary(SD_t_CurrentDiaryInitials; SD_d_StartDate; SD_d_EndDate)
				SDiary_HL_DisplayDiary(SD_d_StartDate; SD_d_EndDate)
			: (WS_at_DiaryVIewTab=3)  //monthly view
				ARRAY TEXT:C222(WS_at_DiaryVIewTab; 3)
				FORM GOTO PAGE:C247(SD_l_DIaryPage)
				<>HelpTip:="Go to this Month"
				$_l_Dayof:=Day of:C23(SD_D_CurrentviewDate)
				//NG APRIL 2004 this was built using strings
				SD_d_StartDate:=SD_D_CurrentviewDate-($_l_Dayof-1)
				$_d_EndDate:=SD_d_StartDate+28
				Repeat 
					If (Month of:C24($_d_EndDate)=Month of:C24(SD_d_StartDate))
						$_d_EndDate:=$_d_EndDate+1
					End if 
				Until (Month of:C24($_d_EndDate)#Month of:C24(SD_d_StartDate))
				$_d_EndDate:=$_d_EndDate-1
				SD_d_EndDate:=$_d_EndDate
				SDiary_HL_QueryDiary(SD_t_CurrentDiaryInitials; SD_d_StartDate; SD_d_EndDate)
				SDiary_HL_DisplayDiary(SD_d_StartDate; SD_d_EndDate)
			: (WS_at_DiaryVIewTab=4)  //QUERY view
				If (Count parameters:C259>=1)
					ARRAY TEXT:C222(WS_at_DiaryVIewTab; 3)
					WS_at_DiaryVIewTab:=1
					FORM GOTO PAGE:C247(SD_l_DIaryPage)
				End if 
				
		End case 
		WS_l_SELECTEDDIARYVIEWTAB:=WS_at_DiaryVIewTab
		SD_t_Periodstr:=Uppercase:C13(MonthName(SD_D_CurrentviewDate))+" "+String:C10(Year of:C25(SD_D_CurrentviewDate))
		Case of 
			: (WS_at_DiaryVIewTab=1)
				OBJECT SET VISIBLE:C603(SD_D_CurrentViewDate; True:C214)
				OBJECT SET VISIBLE:C603(SD_t_Periodstr; False:C215)
			: (WS_at_DiaryVIewTab=2)
				SD_t_Periodstr:=String:C10(SD_d_StartDate)+" -"+String:C10(SD_d_EndDate)
				OBJECT SET VISIBLE:C603(SD_D_CurrentViewDate; False:C215)
				OBJECT SET VISIBLE:C603(SD_t_Periodstr; True:C214)
			: (WS_at_DiaryVIewTab=3)
				OBJECT SET VISIBLE:C603(SD_D_CurrentViewDate; False:C215)
				OBJECT SET VISIBLE:C603(SD_t_Periodstr; True:C214)
			Else 
				SD_t_Periodstr:=SD_t_LastQuery
				SD_t_LastQuery:=""
				OBJECT SET VISIBLE:C603(SD_D_CurrentViewDate; False:C215)
				OBJECT SET VISIBLE:C603(SD_t_Periodstr; True:C214)
		End case 
		
End case 
ERR_MethodTrackerReturn("SD_TabManager"; $_t_oldMethodName)

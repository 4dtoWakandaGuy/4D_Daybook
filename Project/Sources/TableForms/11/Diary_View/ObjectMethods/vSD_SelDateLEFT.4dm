If (False:C215)
	//object Name: [PERSONNEL]Diary_View.vSD_SelDateLEFT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_DATE:C307($_d_ViewDate; SD_D_CurrentViewDate; SD_D_CurrentViewDateOLD; SD_d_EndDate; SD_d_EndDateOLD; SD_d_StartDate; SD_d_StartDateOLD)
	C_LONGINT:C283($_l_Dayof; SD_l_DIaryPage; WS_l_DiaryViewTABOld; WS_l_SELECTEDDIARYVIEWTAB)
	C_TEXT:C284($_t_oldMethodName; SD_t_Periodstr; SD_t_PeriodStrOLD; vDateString)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.vSD_SelDateLEFT"; Form event code:C388)
//vSD_SelDateLEFT: WT-17/08/01
//moves the selected/indicated date one day previous

Case of 
	: (WS_at_DiaryVIewTab=1)  //daily view
		If (WS_l_SELECTEDDIARYVIEWTAB=4)
			//back from Page_4
			SD_d_StartDate:=SD_d_StartDateOLD
			SD_d_StartDateOLD:=!00-00-00!
			SD_d_EndDate:=SD_d_EndDateOLD
			SD_d_EndDateOLD:=!00-00-00!
			SD_t_PeriodStrOLD:=SD_t_Periodstr
			SD_t_Periodstr:=""
			SD_D_CurrentViewDate:=SD_D_CurrentViewDateOLD
			SD_D_CurrentViewDateOLD:=!00-00-00!
		End if 
		
		ARRAY TEXT:C222(WS_at_DiaryVIewTab; 3)
		FORM GOTO PAGE:C247(SD_l_DIaryPage)
		SD_D_CurrentviewDate:=SD_D_CurrentviewDate-1
	: (WS_at_DiaryVIewTab=2)  //weekly view
		If (WS_l_SELECTEDDIARYVIEWTAB=4)
			//back from Page_4
			SD_d_StartDate:=SD_d_StartDateOLD
			SD_d_StartDateOLD:=!00-00-00!
			SD_d_EndDate:=SD_d_EndDateOLD
			SD_d_EndDateOLD:=!00-00-00!
			SD_t_PeriodStrOLD:=SD_t_Periodstr
			SD_t_Periodstr:=""
			SD_D_CurrentViewDate:=SD_D_CurrentViewDateOLD
			SD_D_CurrentViewDateOLD:=!00-00-00!
		End if 
		ARRAY TEXT:C222(WS_at_DiaryVIewTab; 3)
		FORM GOTO PAGE:C247(SD_l_DIaryPage)
		SD_D_CurrentviewDate:=SD_D_CurrentviewDate-7
	: (WS_at_DiaryVIewTab=3)  //monthly view
		If (WS_l_SELECTEDDIARYVIEWTAB=4)
			//back from Page_4
			SD_d_StartDate:=SD_d_StartDateOLD
			SD_d_EndDate:=SD_d_EndDateOLD
			SD_t_PeriodStrOLD:=SD_t_Periodstr
			SD_D_CurrentViewDate:=SD_D_CurrentViewDateOLD
		End if 
		ARRAY TEXT:C222(WS_at_DiaryVIewTab; 3)
		FORM GOTO PAGE:C247(SD_l_DIaryPage)
		$_d_ViewDate:=SD_D_CurrentviewDate-28
		If (Month of:C24($_d_ViewDate)=Month of:C24(SD_D_CurrentviewDate))
			Repeat 
				$_d_ViewDate:=$_d_ViewDate-1
			Until (Month of:C24($_d_ViewDate)#Month of:C24(SD_D_CurrentviewDate))
		End if 
		//SD_D_CurrentviewDate:=Date("1/"+String(Month of($_d_ViewDate))+"/"+String(Year of($_d_ViewDate)))
		$_l_Dayof:=Day of:C23($_d_ViewDate)
		//NG April 2004 this was built using a string
		SD_D_CurrentviewDate:=$_d_ViewDate-($_l_Dayof-1)
		
		
	: (WS_at_DiaryVIewTab=4)  //QUERY view
		SD_D_CurrentViewDate:=SD_D_CurrentViewDateOLD
		WS_at_DiaryVIewTab:=WS_l_DiaryViewTABOld
		SD_d_StartDate:=SD_d_StartDateOld
		SD_d_EndDate:=SD_d_EndDateOLD
		SD_t_Periodstr:=SD_t_PeriodStrOLD
		ARRAY TEXT:C222(WS_at_DiaryVIewTab; 3)
		FORM GOTO PAGE:C247(SD_l_DIaryPage)
		
End case 
WS_l_SELECTEDDIARYVIEWTAB:=WS_at_DiaryVIewTab
SD_t_Periodstr:=(MonthName(SD_D_CurrentviewDate))+" "+String:C10(Year of:C25(SD_D_CurrentviewDate))
vDateString:=String:C10(SD_D_CurrentviewDate; 7)
SD_DiaryViewCalc
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.vSD_SelDateLEFT"; $_t_oldMethodName)

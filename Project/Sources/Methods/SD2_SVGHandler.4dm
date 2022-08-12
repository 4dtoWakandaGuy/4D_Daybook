//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_SVGHandler
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/12/2009 08:53`Method: SD2_SVGHandler
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(Cal_at_1stDayOfWeek;0)
	//ARRAY TEXT(SD_at_NavTabs;0)
	//ARRAY TEXT(SD_t_NavTabs;0)
	//ARRAY TEXT(SD2_at_NavigationBar;0;0)
	//ARRAY TEXT(SD2_at_NavigationBar2;0;0)
	C_BOOLEAN:C305(Cal_bo_Initialized)
	C_DATE:C307($_d_BaseDate; $2)
	C_LONGINT:C283($_l_CharLeftArrow; $_l_CharRightArrow; $_l_MonthNumber; $_l_Monthof; $_l_Year; CAL_l_NavbarTab; SD2_l_CurrentCalendarView)
	C_PICTURE:C286(CAL_pic_MainMonth; SD2_pic_MonthDetail; SD2_pic_MonthMini; SD2_pic_NavigationBar; SD2_pic_NavigationBar2)
	C_POINTER:C301(CAL_ptr_4DFullCalendar)
	C_TEXT:C284(<>SYS_t_DefaultFontPlain; $_t_BackGroundRGB; $_t_MonthName; $_t_oldMethodName; $_t_YearName; $1; Cal_t_1stDayOfWeek; Cal_t_TimeZone; CAL_t_CalWeekStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_SVGHandler")
//;CalBanner_G;Mini_Month_1_G;MiniBanner_1_G;MiniCols_1_G)
If (Count parameters:C259>=2)
	$_d_BaseDate:=$2
Else 
	$_d_BaseDate:=Current date:C33(*)
End if 
Case of 
	: ($1="Init")
		//TRACE
		SD2_SVG_VarsInit
		
		Cal4D_Cal_SelectedDate($_d_BaseDate)  // // Modified by: Charles Vass (04/23/2009, 13:19)
		
		//TRACE
		$_t_BackGroundRGB:=Cal4D_Cal_Cell_BG("Pop_MouseOver")
		Cal4D_Cell_BG_MouseOver($_t_BackGroundRGB)
		Error:=0
		Cal_t_DisplayFont:=<>SYS_t_DefaultFontPlain
		
		Cal_t_TimeZone:=Cal4D_iCal_GetTimezone
		Cal_t_1stDayOfWeek:=DB_GetIndexedString(32000; 1)
		ARRAY TEXT:C222(Cal_at_1stDayOfWeek; 0)
		Cal_bo_Initialized:=True:C214
		ARRAY TEXT:C222(SD2_at_NavigationBar; 5; 5)
		CAL_l_NavbarTab:=4
		
		//========================    Method Actions    ==================================
		
		SD2_at_NavigationBar{1}{1}:="<"
		SD2_at_NavigationBar{1}{2}:="Day"
		SD2_at_NavigationBar{1}{3}:="Week"
		SD2_at_NavigationBar{1}{4}:="Month"
		SD2_at_NavigationBar{1}{5}:=">"
		
		SD2_at_NavigationBar{2}{1}:="24"
		SD2_at_NavigationBar{2}{2}:="100"
		SD2_at_NavigationBar{2}{3}:="100"
		SD2_at_NavigationBar{2}{4}:="100"
		SD2_at_NavigationBar{2}{5}:="24"
		
		SD2_at_NavigationBar{3}{1}:=""
		SD2_at_NavigationBar{3}{2}:=""
		SD2_at_NavigationBar{3}{3}:=""
		SD2_at_NavigationBar{3}{4}:=""
		SD2_at_NavigationBar{3}{5}:=""
		
		SD2_at_NavigationBar{4}{1}:="Up"
		SD2_at_NavigationBar{4}{2}:="Up"
		SD2_at_NavigationBar{4}{3}:="Up"
		SD2_at_NavigationBar{4}{4}:="Dn"
		SD2_at_NavigationBar{4}{5}:="Up"
		
		SD2_at_NavigationBar{5}{1}:=""
		SD2_at_NavigationBar{5}{2}:=""
		SD2_at_NavigationBar{5}{3}:=""
		SD2_at_NavigationBar{5}{4}:=""
		SD2_at_NavigationBar{5}{5}:=""
		
		//_Cal4D_NavBar(->SD2_at_NavigationBar;->SD2_p_NavigationBar;"Cal4D_NavBar_Handler")
		
		
		ARRAY TEXT:C222(SD2_at_NavigationBar2; 5; 5)
		
		
		//========================    Method Actions    ==================================
		If (False:C215)
			
			$_l_Monthof:=Month of:C24(Current date:C33(*))
			$_l_Year:=Year of:C25(Current date:C33(*))
			//$_t_MonthName:=MonthName ($_l_Monthof)
			$_t_YearName:=String:C10($_l_Year)
			SD2_at_NavigationBar2{1}{1}:="<"
			SD2_at_NavigationBar2{1}{2}:=$_t_MonthName+" "+$_t_YearName
			SD2_at_NavigationBar2{1}{3}:=$_t_MonthName+" "+$_t_YearName
			SD2_at_NavigationBar2{1}{4}:=$_t_MonthName+" "+$_t_YearName
			SD2_at_NavigationBar2{1}{5}:=">"
			
			SD2_at_NavigationBar2{2}{1}:="24"
			SD2_at_NavigationBar2{2}{2}:="60"
			SD2_at_NavigationBar2{2}{3}:="0"
			SD2_at_NavigationBar2{2}{4}:="0"
			
			SD2_at_NavigationBar2{2}{5}:="24"
			
			SD2_at_NavigationBar2{3}{1}:=""
			SD2_at_NavigationBar2{3}{2}:=""
			SD2_at_NavigationBar2{3}{3}:=""
			SD2_at_NavigationBar2{3}{4}:=""
			SD2_at_NavigationBar2{3}{5}:=""
			
			
			SD2_at_NavigationBar2{4}{1}:="Up"
			SD2_at_NavigationBar2{4}{2}:="Dn"
			SD2_at_NavigationBar2{4}{3}:="Up"
			SD2_at_NavigationBar2{4}{4}:="Up"
			SD2_at_NavigationBar2{4}{4}:="Up"
			
			
			SD2_at_NavigationBar2{5}{1}:=""
			SD2_at_NavigationBar2{5}{2}:=""
			SD2_at_NavigationBar2{5}{3}:=""
			SD2_at_NavigationBar2{5}{4}:=""
			SD2_at_NavigationBar2{5}{5}:=""
			//TRACE
			//_Cal4D_NavBar (->SD2_at_NavigationBar2;->SD2_p_NavigationBar2;"SD2_NavBarHandler")
			
		End if 
		CAL_t_CalWeekStart:=DB_GetIndexedString(32001; 1)
		Cal4D_Cal_GetFullCalendar(->CAL_pic_MainMonth)
		Cal4D_Cal_GetMiniCalendar(->SD2_pic_MonthMini; Current date:C33; 0)
		//Cal4D_Cal_GetWeekCalendar (->Cal_pic_MainWeek;->CAL_pic_weekBanner)
		//Cal4D_Cal_GetDayCalendar (->CAL_Pi_MainDay;->Cal_Pi_DayBanner)
		Cal4D_NavBar_Handler(On Load:K2:1; "Btn_Month")
		
		//SD2_l_CurrentCalendarView=1=Day Schedule
		//SD2_l_CurrentCalendarView=2=Wekk Schedule
		//SD2_l_CurrentCalendarView=3=MonthShedule
		//SD2_l_CurrentCalendarView=4=Year Schedule
		//SD2_l_CurrentCalendarView=5=Workflow Day
		//SD2_l_CurrentCalendarView=6=Workflow week
		//SD2_l_CurrentCalendarView=7=Workflow Month
		//SD2_l_CurrentCalendarView=8=Workflow Year
		//SD2_l_CurrentCalendarView=9=Listings
		
		If (SD2_l_CurrentCalendarView=0)
			SD2_l_CurrentCalendarView:=3
		End if 
		Case of 
			: (SD2_l_CurrentCalendarView=1)
			: (SD2_l_CurrentCalendarView=2)
			: (SD2_l_CurrentCalendarView=3)
				$_l_CharRightArrow:=9654
				$_l_CharLeftArrow:=9664
				ARRAY TEXT:C222(SD_at_NavTabs; 3)
				$_l_MonthNumber:=Month of:C24(Cal4D_Cal_SelectedDate)
				SD_at_NavTabs{1}:=Char:C90($_l_CharLeftArrow)
				SD_at_NavTabs{2}:=Get indexed string:C510(14001; $_l_MonthNumber)
				SD_at_NavTabs{3}:=Char:C90($_l_CharRightArrow)
				SD_at_NavTabs:=2
		End case 
	: ($1="Year")
	: ($1="Month")
		
		$_l_CharRightArrow:=9654
		$_l_CharLeftArrow:=9664
		ARRAY TEXT:C222(SD_at_NavTabs; 3)
		SD_at_NavTabs{1}:=Char:C90($_l_CharLeftArrow)
		SD_at_NavTabs{2}:=String:C10(Year of:C25(Current date:C33(*)))
		SD_at_NavTabs{3}:=Char:C90($_l_CharRightArrow)
		SD_at_NavTabs:=2
		
	: ($1="Week")
	: ($1="Day")
		
End case 
ERR_MethodTrackerReturn("SD2_SVGHandler"; $_t_oldMethodName)

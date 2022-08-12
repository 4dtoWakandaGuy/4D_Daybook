//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_NavBar_Handler
	//------------------ Method Notes ------------------
	//*****************************************************************************
	// //
	// //  Cal4D_NavBar_Handler
	// //
	// //  Written by Charles Vass - 04/17/2009, 11:42
	// //
	// //  Purpose:
	// //
	// //  $1 - type - purpose
	// //
	// //
	//*****************************************************************************
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 17:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(Cal4D_at_NavBar;0;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; SD2_bo_ShowCalenders)
	C_LONGINT:C283($_l_BannerHeight; $_l_BannerHeight2; $_l_BannerTop; $_l_Cal4DNavBar; $_l_CountParameters; $_l_DetailTop; $_l_DetailTop2; $_l_FormEvent; $_l_NavigationHeight; $_l_ObjectBottom; $_l_ObjectLeft)
	C_LONGINT:C283($_l_ObjectRight; $_l_ObjectTop; $_l_previousobjectBottom; $_l_PreviousobjectLeft; $_l_previousobjectRight; $_l_previousobjectTop; $_l_WindowBottom; $_l_WindowHeight; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop)
	C_LONGINT:C283($_l_WindowWIdth; $1; CAL_l_NavbarTab; SD2_l_CurrentScheduleView)
	C_PICTURE:C286(CAL_pic_DayBanner; CAL_pic_MainDay; CAL_pic_MainMonth; Cal_pic_MainWeek; Cal_pic_MonthBanner; Cal_pic_NavBar; CAL_pic_weekBanner)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; $_t_RefID; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_NavBar_Handler")


$_l_CountParameters:=Count parameters:C259
If ($_l_CountParameters=0)
	ARRAY TEXT:C222(Cal4D_at_NavBar; 5; 5)
	CAL_l_NavbarTab:=4
	
	//========================    Method Actions    ==================================
	
	Cal4D_at_NavBar{1}{1}:="<"
	Cal4D_at_NavBar{1}{2}:="Day"
	Cal4D_at_NavBar{1}{3}:="Week"
	Cal4D_at_NavBar{1}{4}:="Month"
	Cal4D_at_NavBar{1}{5}:=">"
	
	Cal4D_at_NavBar{2}{1}:="24"
	Cal4D_at_NavBar{2}{2}:="100"
	Cal4D_at_NavBar{2}{3}:="100"
	Cal4D_at_NavBar{2}{4}:="100"
	Cal4D_at_NavBar{2}{5}:="24"
	
	Cal4D_at_NavBar{3}{1}:=""
	Cal4D_at_NavBar{3}{2}:=""
	Cal4D_at_NavBar{3}{3}:=""
	Cal4D_at_NavBar{3}{4}:=""
	Cal4D_at_NavBar{3}{5}:=""
	
	Cal4D_at_NavBar{4}{1}:="Up"
	Cal4D_at_NavBar{4}{2}:="Up"
	Cal4D_at_NavBar{4}{3}:="Up"
	Cal4D_at_NavBar{4}{4}:="Dn"
	Cal4D_at_NavBar{4}{5}:="Up"
	
	Cal4D_at_NavBar{5}{1}:=""
	Cal4D_at_NavBar{5}{2}:=""
	Cal4D_at_NavBar{5}{3}:=""
	Cal4D_at_NavBar{5}{4}:=""
	Cal4D_at_NavBar{5}{5}:=""
	//TRACE
	//_Cal4D_NavBar (->Cal4D_at_NavBar;->Cal4D_NavBar_G;"Cal4d_NavBar_Handler")
	
Else 
	
	$_l_FormEvent:=$1
	//$_l_Cal4DNavBar:=Cal4D_NavBar_Tab
	$_l_Cal4DNavBar:=0
	If (Count parameters:C259>=2)
		$_t_RefID:=$2
		
		Case of 
			: ($_t_RefID="Btn_Prev")
				Case of 
					: ($_l_Cal4DNavBar=2)
						SD2_l_CurrentScheduleView:=1
						Cal4D_OM_CalWithMinis_BTN("Day_Previous")
						
					: ($_l_Cal4DNavBar=3)
						SD2_l_CurrentScheduleView:=2
						Cal4D_OM_CalWithMinis_BTN("Week_Previous")
						
					: ($_l_Cal4DNavBar=4)
						SD2_l_CurrentScheduleView:=3
						Cal4D_OM_CalWithMinis_BTN("Month_Previous")
						
				End case 
				
			: ($_t_RefID="Btn_Day")
				SD2_l_CurrentScheduleView:=1
				CAL_l_NavbarTab:=2
				OBJECT SET VISIBLE:C603(Cal_pic_MonthBanner; False:C215)
				OBJECT SET VISIBLE:C603(CAL_pic_MainMonth; False:C215)
				OBJECT SET VISIBLE:C603(CAL_pic_weekBanner; False:C215)
				OBJECT SET VISIBLE:C603(Cal_pic_MainWeek; False:C215)
				
				OBJECT SET VISIBLE:C603(CAL_pic_DayBanner; True:C214)
				OBJECT SET VISIBLE:C603(CAL_pic_MainDay; True:C214)
				
				Cal4D_Cal_RecolorMinis
				
			: ($_t_RefID="Btn_Week")
				SD2_l_CurrentScheduleView:=2
				CAL_l_NavbarTab:=3
				OBJECT SET VISIBLE:C603(Cal_pic_MonthBanner; False:C215)
				OBJECT SET VISIBLE:C603(CAL_pic_MainMonth; False:C215)
				OBJECT SET VISIBLE:C603(CAL_pic_DayBanner; False:C215)
				OBJECT SET VISIBLE:C603(CAL_pic_MainDay; False:C215)
				
				OBJECT SET VISIBLE:C603(CAL_pic_weekBanner; True:C214)
				OBJECT SET VISIBLE:C603(Cal_pic_MainWeek; True:C214)
				
				Cal4D_Cal_RecolorMinis
				
			: ($_t_RefID="Btn_Month")
				
				SD2_l_CurrentScheduleView:=3
				CAL_l_NavbarTab:=4
				OBJECT SET VISIBLE:C603(CAL_pic_weekBanner; False:C215)
				OBJECT SET VISIBLE:C603(Cal_pic_MainWeek; False:C215)
				OBJECT SET VISIBLE:C603(CAL_pic_DayBanner; False:C215)
				OBJECT SET VISIBLE:C603(CAL_pic_MainDay; False:C215)
				
				OBJECT SET VISIBLE:C603(Cal_pic_MonthBanner; True:C214)
				OBJECT SET VISIBLE:C603(CAL_pic_MainMonth; True:C214)
				
				//Cal4D_Cal_RecolorMinis
				
			: ($_t_RefID="Btn_Next")
				
				Case of 
					: (Cal_l_NavBarTab=2)
						SD2_l_CurrentScheduleView:=1
						Cal4D_OM_CalWithMinis_BTN("Day_Next")
						
					: (Cal_l_NavBarTab=3)
						SD2_l_CurrentScheduleView:=2
						Cal4D_OM_CalWithMinis_BTN("Week_Next")
						
					: (Cal_l_NavBarTab=4)
						SD2_l_CurrentScheduleView:=3
						Cal4D_OM_CalWithMinis_BTN("Month_Next")
						
				End case 
		End case 
		Cal4D_NavBar_Handler(On Resize:K2:27)
		
	Else 
		Case of 
			: ($_l_FormEvent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad)) | ($_l_FormEvent=On Resize:K2:27)
				
				If (SD2_bo_ShowCalenders)
				Else 
					
					OBJECT SET VISIBLE:C603(*; "oCalenders"; False:C215)
					//OBJECT SET VISIBLE(*;"ominibanner";False)
					//OBJECT SET VISIBLE(*;"oMonth_Mini";False)
					//OBJECT SET VISIBLE(*;"oMiniCalPrevPeriod";False)
					//OBJECT SET VISIBLE(*;"oMiniCalSelPeriod";False)
					//OBJECT SET VISIBLE(*;"oMiniCalNextPeriod";False)
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
					$_l_WindowWIdth:=$_l_WindowRight-$_l_WindowLeft
					$_l_WindowHeight:=$_l_WindowBottom-$_l_windowTop
					OBJECT GET COORDINATES:C663(*; "oStrapHeader1"; $_l_PreviousobjectLeft; $_l_previousobjectTop; $_l_previousobjectRight; $_l_previousobjectBottom)
					$_l_BannerTop:=$_l_previousobjectBottom+1
					OBJECT GET COORDINATES:C663(*; "oBanner_Day"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_BannerHeight:=32
					$_l_BannerHeight2:=45
					OBJECT GET COORDINATES:C663(*; "OAllNavBar"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_NavigationHeight:=$_l_ObjectBottom-$_l_ObjectTop
					OBJECT MOVE:C664(*; "OAllNavBar"; $_l_WindowWIdth-190; $_l_BannerTop; $_l_WindowWIdth-30; $_l_BannerTop+$_l_NavigationHeight; *)
					OBJECT MOVE:C664(*; "oBanner_Day"; 10; $_l_BannerTop; $_l_WindowWIdth-30; $_l_BannerTop+$_l_NavigationHeight; *)
					OBJECT MOVE:C664(*; "oBanner_Week"; 10; $_l_BannerTop; $_l_WindowWIdth-30; $_l_BannerTop+$_l_NavigationHeight; *)
					OBJECT MOVE:C664(*; "oBanner_Month"; 10; $_l_BannerTop; $_l_WindowWIdth-30; $_l_BannerTop+$_l_NavigationHeight; *)
					$_l_DetailTop:=$_l_BannerTop+$_l_BannerHeight
					$_l_DetailTop2:=$_l_BannerTop+$_l_BannerHeight2
					OBJECT GET COORDINATES:C663(*; "oDay_Detail"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					OBJECT MOVE:C664(*; "oDay_Detail"; 10; $_l_DetailTop2; $_l_WindowWIdth-10; $_l_WindowHeight; *)
					OBJECT MOVE:C664(*; "oCal_pic_MainWeek"; 10; $_l_DetailTop2; $_l_WindowWIdth-10; $_l_WindowHeight; *)
					OBJECT MOVE:C664(*; "oMonth_Detail"; 10; $_l_DetailTop; $_l_WindowWIdth-10; $_l_WindowHeight; *)
					
					SD2_l_CurrentScheduleView:=Cal_l_NavBarTab-1
					//SET VISIBLE(CAL_pic_weekBanner;False)
					//SET VISIBLE(Cal_pic_MainWeek;False)
					//SET VISIBLE(CAL_Pi_DayBanner;False)
					//SET VISIBLE(CAL_Pi_MainDay;False)
					
					//SET VISIBLE(Cal_pi_MonthBanner;True)
					//SET VISIBLE(Cal_pi_MainMonth;True)
				End if 
				
		End case 
	End if 
End if 

//========================    Clean up and Exit    =================================
ERR_MethodTrackerReturn("Cal4D_NavBar_Handler"; $_t_oldMethodName)
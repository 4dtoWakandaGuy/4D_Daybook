//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_NavBarHandler
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/13 10:31 AM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Cal4DNavBarTab; $_l_FormEvent; $1; CAL_l_NavbarTab)
	C_PICTURE:C286(CAL_pic_DayBanner; CAL_pic_MainDay; CAL_pic_MainMonth; Cal_pic_MainWeek; Cal_pic_MonthBanner; CAL_pic_weekBanner)
	C_TEXT:C284($_t_oldMethodName; $_t_RefID; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_NavBarHandler")

If (Count parameters:C259>=2)
	$_l_FormEvent:=$1
	$_t_RefID:=$2
	$_l_Cal4DNavBarTab:=0
	//$_l_Cal4DNavBarTab:=Cal4D_NavBar_Tab
	Case of 
		: ($_t_RefID="Btn_Prev")
			Case of 
				: ($_l_Cal4DNavBarTab=2)
					Cal4D_OM_CalWithMinis_BTN("Day_Previous")
					
				: ($_l_Cal4DNavBarTab=3)
					Cal4D_OM_CalWithMinis_BTN("Week_Previous")
					
				: ($_l_Cal4DNavBarTab=4)
					Cal4D_OM_CalWithMinis_BTN("Month_Previous")
					
			End case 
			
		: ($_t_RefID="Btn_Day")
			CAL_l_NavbarTab:=2
			OBJECT SET VISIBLE:C603(Cal_pic_MonthBanner; False:C215)
			OBJECT SET VISIBLE:C603(CAL_pic_MainMonth; False:C215)
			OBJECT SET VISIBLE:C603(CAL_pic_weekBanner; False:C215)
			OBJECT SET VISIBLE:C603(Cal_pic_MainWeek; False:C215)
			
			OBJECT SET VISIBLE:C603(CAL_pic_DayBanner; True:C214)
			OBJECT SET VISIBLE:C603(CAL_pic_MainDay; True:C214)
			
			Cal4D_Cal_RecolorMinis
			
		: ($_t_RefID="Btn_Week")
			CAL_l_NavbarTab:=3
			OBJECT SET VISIBLE:C603(Cal_pic_MonthBanner; False:C215)
			OBJECT SET VISIBLE:C603(CAL_pic_MainMonth; False:C215)
			
			OBJECT SET VISIBLE:C603(CAL_pic_DayBanner; False:C215)
			OBJECT SET VISIBLE:C603(CAL_pic_MainDay; False:C215)
			
			OBJECT SET VISIBLE:C603(CAL_pic_weekBanner; True:C214)
			OBJECT SET VISIBLE:C603(Cal_pic_MainWeek; True:C214)
			
			Cal4D_Cal_RecolorMinis
			
		: ($_t_RefID="Btn_Month")
			CAL_l_NavbarTab:=4
			OBJECT SET VISIBLE:C603(CAL_pic_weekBanner; False:C215)
			OBJECT SET VISIBLE:C603(Cal_pic_MainWeek; False:C215)
			
			OBJECT SET VISIBLE:C603(CAL_pic_DayBanner; False:C215)
			OBJECT SET VISIBLE:C603(CAL_pic_MainDay; False:C215)
			
			OBJECT SET VISIBLE:C603(Cal_pic_MonthBanner; True:C214)
			OBJECT SET VISIBLE:C603(CAL_pic_MainMonth; True:C214)
			
			Cal4D_Cal_RecolorMinis
			
		: ($_t_RefID="Btn_Next")
			Case of 
				: (Cal_l_NavBarTab=2)
					Cal4D_OM_CalWithMinis_BTN("Day_Next")
					
				: (Cal_l_NavBarTab=3)
					Cal4D_OM_CalWithMinis_BTN("Week_Next")
					
				: (Cal_l_NavBarTab=4)
					Cal4D_OM_CalWithMinis_BTN("Month_Next")
					
			End case 
	End case 
End if 
ERR_MethodTrackerReturn("SD_NavBarHandler"; $_t_oldMethodName)

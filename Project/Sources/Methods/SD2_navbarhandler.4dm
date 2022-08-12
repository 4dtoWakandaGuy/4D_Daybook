//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_navbarhandler
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/13 10:34 AM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Cal4DNavBarTab; $_l_FormEvent; $1; CAL_l_NavbarTab)
	C_TEXT:C284($_t_oldMethodName; $_t_RefID; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_navbarhandler")
//TRACE
$_l_FormEvent:=$1
$_t_RefID:=$2
$_l_Cal4DNavBarTab:=0
//$Cal4D_NavBar_Tab:=Cal4D_NavBar_Tab
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
		//SET VISIBLE(CalBanner_G;False)
		//SET VISIBLE(Main_Month_G;False)
		//SET VISIBLE(CalBanner_Week_G;False)
		//SET VISIBLE(Main_Week_G;False)
		//
		//SET VISIBLE(CalBanner_Day_G;True)
		//SET VISIBLE(Main_Day_G;True)
		
		Cal4D_Cal_RecolorMinis
		
	: ($_t_RefID="Btn_Week")
		CAL_l_NavbarTab:=3
		//SET VISIBLE(CalBanner_G;False)
		//SET VISIBLE(Main_Month_G;False)
		//SET VISIBLE(CalBanner_Day_G;False)
		//SET VISIBLE(Main_Day_G;False)
		
		//SET VISIBLE(CalBanner_Week_G;True)
		//SET VISIBLE(Main_Week_G;True)
		
		Cal4D_Cal_RecolorMinis
		
	: ($_t_RefID="Btn_Month")
		CAL_l_NavbarTab:=4
		//SET VISIBLE(CalBanner_Week_G;False)
		//SET VISIBLE(Main_Week_G;False)
		//SET VISIBLE(CalBanner_Day_G;False)
		//SET VISIBLE(Main_Day_G;False)
		//
		//SET VISIBLE(CalBanner_G;True)
		//SET VISIBLE(Main_Month_G;True)
		
		//Cal4D_Cal_RecolorMinis
		
		
	: ($_t_RefID="Btn_Next")
		//TRACE
		Case of 
			: (Cal_l_NavBarTab=2)
				Cal4D_OM_CalWithMinis_BTN("Day_Next")
				
			: (Cal_l_NavBarTab=3)
				Cal4D_OM_CalWithMinis_BTN("Week_Next")
				
			: (Cal_l_NavBarTab=4)
				
				Cal4D_OM_CalWithMinis_BTN("Month_Next")
				
				
		End case 
End case 
ERR_MethodTrackerReturn("SD2_navbarhandler"; $_t_oldMethodName)

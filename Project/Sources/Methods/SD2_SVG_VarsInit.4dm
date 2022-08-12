//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_SVG_VarsInit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 18:03`Method: SD2_SVG_VarsInit
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(Cal_lb_ListboxCalender;0)
	//ARRAY LONGINT(Cal_al_GroupID;0)
	//ARRAY LONGINT(Cal_al_RowFontColor;0)
	//ARRAY TEXT(Cal_at_Calendar;0)
	C_BOOLEAN:C305(SD2_bo_SVGVarsInited)
	C_PICTURE:C286(CAL_pic_DayBanner; CAL_pic_MainDay; CAL_pic_MainMonth; Cal_pic_MainWeek; Cal_pic_MonthBanner; CAL_pic_weekBanner; SD2_pic_MiniBanner; SD2_P_SuperMini; SD2_P_UsersGroups; SD2_pic_NavigationBar; SD2_pic_NavigationBarMini)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_SVG_VarsInit")
If (Not:C34(SD2_bo_SVGVarsInited))
	ARRAY BOOLEAN:C223(Cal_lb_ListboxCalender; 0)
	ARRAY TEXT:C222(Cal_at_Calendar; 0)
	ARRAY LONGINT:C221(Cal_al_RowFontColor; 0)
	ARRAY LONGINT:C221(Cal_al_GroupID; 0)
End if 
ERR_MethodTrackerReturn("SD2_SVG_VarsInit"; $_t_oldMethodName)

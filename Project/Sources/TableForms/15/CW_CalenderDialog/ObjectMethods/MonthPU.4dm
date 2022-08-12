If (False:C215)
	//object Name: [USER]CW_CalenderDialog.MonthPU
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CW_at_MonthNames;0)
	C_DATE:C307(CW_d_SelectDate)
	C_LONGINT:C283(<>cwStartWeekOn; $_l_AddMonths; $_l_ColourID; $_l_LastMonthPosition; cwLastIndex)
	C_POINTER:C301($_ptr_CalenderButton; $_ptr_CalenderObject)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CW_CalenderDialog.MonthPU"; Form event code:C388)
//Object Method:  CW_at_MonthNames
//Created:  3/11/98 - Pelican Software Incorporated
//Last Modified:  3/11/98 - Pelican Software Incorporated
//Resets the calendar based on the selected month

If (CW_at_MonthNames{CW_at_MonthNames}#CW_at_MonthNames{0})
	$_ptr_CalenderObject:=Get pointer:C304("DayText"+String:C10(cwLastIndex))
	OBJECT SET FONT STYLE:C166($_ptr_CalenderObject->; Plain:K14:1)
	//$_l_ColourID:=-(Black+(256*745))
	//_O_OBJECT SET COLOR($_ptr_CalenderObject->;$_l_ColourID)
	OBJECT SET RGB COLORS:C628(*; "oStrapHeader"; UTIL_4DColorToRGB(Black:K11:16); UTIL_4DColorToRGB(745))
	
	$_ptr_CalenderButton:=Get pointer:C304("bDay"+String:C10(cwLastIndex))
	$_ptr_CalenderButton->:=0
	$_l_LastMonthPosition:=Find in array:C230(CW_at_MonthNames; CW_at_MonthNames{0})
	$_l_AddMonths:=CW_at_MonthNames-$_l_LastMonthPosition
	CW_d_SelectDate:=Add to date:C393(CW_d_SelectDate; 0; $_l_AddMonths; 0)
	CW_SetCalendar(CW_d_SelectDate; <>cwStartWeekOn)
End if 
ERR_MethodTrackerReturn("OBJ [USER].CW_CalenderDialog.MonthPU"; $_t_oldMethodName)

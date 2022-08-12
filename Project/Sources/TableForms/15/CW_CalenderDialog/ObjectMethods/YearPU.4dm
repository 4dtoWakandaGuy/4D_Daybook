If (False:C215)
	//object Name: [USER]CW_CalenderDialog.YearPU
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
	//ARRAY LONGINT(CW_al_Years;0)
	C_DATE:C307(CW_d_SelectDate)
	C_LONGINT:C283(<>cwStartWeekOn; $_l_AddYears; $_l_ColourID; $_l_LastYearPosition; cwLastIndex)
	C_POINTER:C301($_ptr_CalenderButton; $_ptr_CalenderObject)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CW_CalenderDialog.YearPU"; Form event code:C388)
//Object Method:  CW_al_Years
//Created:  3/11/98 - Pelican Software Incorporated
//Last Modified:  3/11/98 - Pelican Software Incorporated
//Resets the calendar based on the selected year

If (CW_al_Years{CW_al_Years}#CW_al_Years{0})
	$_ptr_CalenderObject:=Get pointer:C304("DayText"+String:C10(cwLastIndex))
	OBJECT SET FONT STYLE:C166($_ptr_CalenderObject->; Plain:K14:1)
	//$_l_ColourID:=-(Black+(256*745))
	//_O_OBJECT SET COLOR($_ptr_CalenderObject->;$_l_ColourID)
	
	OBJECT SET RGB COLORS:C628(*; "oStrapHeader"; UTIL_4DColorToRGB(Black:K11:16); UTIL_4DColorToRGB(745))
	
	$_ptr_CalenderButton:=Get pointer:C304("bDay"+String:C10(cwLastIndex))
	$_ptr_CalenderButton->:=0
	$_l_LastYearPosition:=Find in array:C230(CW_al_Years; CW_al_Years{0})
	$_l_AddYears:=CW_al_Years-$_l_LastYearPosition
	CW_d_SelectDate:=Add to date:C393(CW_d_SelectDate; $_l_AddYears; 0; 0)
	CW_SetCalendar(CW_d_SelectDate; <>cwStartWeekOn)
End if 
ERR_MethodTrackerReturn("OBJ [USER].CW_CalenderDialog.YearPU"; $_t_oldMethodName)

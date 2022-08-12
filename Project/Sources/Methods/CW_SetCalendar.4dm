//%attributes = {}
If (False:C215)
	//Project Method Name:      CW_SetCalendar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/01/2010 19:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(CW_al_Years;0)
	ARRAY TEXT:C222($_at_Labels; 0)
	//ARRAY TEXT(CW_at_MonthNames;0)
	C_DATE:C307($_d_FirstDayDate; $1; CW_d_SelectDate)
	C_LONGINT:C283(<>cwSelectColor; <>cwSelectStyle; <>cwStartWeekOn; $_l_Colour; $_l_CountParameters; $_l_DayNumber; $_l_Index; $_l_NumberofDays; $_l_StartOffset; $_l_WeekStartsDayNumber; $_l_Year)
	C_LONGINT:C283(cwLastIndex; cwOffset)
	C_POINTER:C301($_ptr_Button; $_ptr_DayObject; $_ptr_DayText; $_ptr_DayTextObject; $_ptr_LabelVariable)
	C_REAL:C285($2)
	C_TEXT:C284($_t_DayText; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CW_SetCalendar")
//Project Method: CW_SetCalendar
//Sets up the calendar widget based on the specified date
//Created:  3/11/98 - Pelican Software Incorporated

ARRAY TEXT:C222(CW_at_MonthNames; 12)
ARRAY LONGINT:C221(CW_al_Years; 7)
If (<>cwStartWeekOn<1)
	<>cwStartWeekOn:=[USER:15]CalenderWeekStartDay:244
End if 
If (<>cwSelectColor<1)
	<>cwSelectColor:=[USER:15]CalenderColor:242
End if 
If (<>cwSelectStyle<1)
	<>cwSelectStyle:=[USER:15]CalenderStyle:243
End if 
ARRAY TEXT:C222($_at_Labels; 7)

$_l_CountParameters:=Count parameters:C259
If ($_l_CountParameters>0)
	CW_d_SelectDate:=$1  //use this date
Else 
	If (CW_d_SelectDate=!00-00-00!)  //no date specified use the current date
		CW_d_SelectDate:=Current date:C33(*)
	End if 
End if 

$_l_DayNumber:=Day of:C23(CW_d_SelectDate)  //get the day number for the selected date
$_d_FirstDayDate:=Add to date:C393(CW_d_SelectDate; 0; 0; (1-$_l_DayNumber))  //get the date of the first of month
$_l_DayNumber:=Day number:C114($_d_FirstDayDate)  //get day of week for the first of the month
$_l_NumberofDays:=Day of:C23(Add to date:C393($_d_FirstDayDate; 0; 1; -1))  //get the number of days in the month
//determine the offset
$_l_StartOffset:=8-<>cwStartWeekOn
If ($_l_StartOffset=7)
	$_l_StartOffset:=0
End if 
cwOffset:=$_l_DayNumber+$_l_StartOffset-1
If (cwOffset>=7)
	cwOffset:=cwOffset-7
End if 
//fill the week day labels based on ◊cwStartWeekOn
$_l_WeekStartsDayNumber:=<>cwStartWeekOn
$_at_Labels{1}:="Su"
$_at_Labels{2}:="M"
$_at_Labels{3}:="T"
$_at_Labels{4}:="W"
$_at_Labels{5}:="Th"
$_at_Labels{6}:="F"
$_at_Labels{7}:="S"
For ($_l_Index; 1; 7)
	$_ptr_LabelVariable:=Get pointer:C304("cwWeekDay"+String:C10($_l_Index))
	$_ptr_LabelVariable->:=$_at_Labels{$_l_WeekStartsDayNumber}
	$_l_WeekStartsDayNumber:=$_l_WeekStartsDayNumber+1
	If ($_l_WeekStartsDayNumber>7)
		$_l_WeekStartsDayNumber:=1
	End if 
End for 
//hide/show the correct calendar squares
For ($_l_Index; 1; 42)
	$_ptr_Button:=Get pointer:C304("bDay"+String:C10($_l_Index))
	$_ptr_DayText:=Get pointer:C304("DayText"+String:C10($_l_Index))
	$_l_DayNumber:=$_l_Index-cwOffset
	If (($_l_DayNumber<=0) | ($_l_DayNumber>$_l_NumberofDays))
		$_t_DayText:=""
	Else 
		$_t_DayText:=String:C10($_l_DayNumber)
	End if 
	$_ptr_DayText->:=$_t_DayText
	If ($_t_DayText="")
		OBJECT SET VISIBLE:C603($_ptr_Button->; False:C215)
	Else 
		OBJECT SET VISIBLE:C603($_ptr_Button->; True:C214)
	End if 
End for 
//fill the month popup
For ($_l_Index; 1; 12)
	CW_at_MonthNames{$_l_Index}:=DB_GetIndexedString(14001; 12+$_l_Index)
End for 
CW_at_MonthNames:=Month of:C24(CW_d_SelectDate)
CW_at_MonthNames{0}:=CW_at_MonthNames{CW_at_MonthNames}
//fill the year popup 3 years before and after the current year
$_l_Year:=Year of:C25(CW_d_SelectDate)
For ($_l_Index; 1; 7)
	CW_al_Years{$_l_Index}:=$_l_Year-4+$_l_Index
End for 
CW_al_Years:=4
CW_al_Years{0}:=CW_al_Years{CW_al_Years}
//select the current date
cwLastIndex:=Day of:C23(CW_d_SelectDate)+cwOffset
$_ptr_DayTextObject:=Get pointer:C304("DayText"+String:C10(cwLastIndex))
$_ptr_button:=Get pointer:C304("bDay"+String:C10(cwLastIndex))
$_ptr_button->:=1
OBJECT SET FONT STYLE:C166($_ptr_DayTextObject->; <>cwSelectStyle)
//$_l_Colour:=-(<>cwSelectColor+(256*745))
//_O_OBJECT SET COLOR($_ptr_DayTextObject->;$_l_Colour)
//$_l_ForegroundColour:=UTIL_4DColorToRGB (<>cwSelectColor)
//$_l_BackgroundColour:=UTIL_4DColorToRGB (745)
If (Not:C34(Is nil pointer:C315($_ptr_DayObject)))
	OBJECT SET RGB COLORS:C628($_ptr_DayObject->; UTIL_4DColorToRGB(<>cwSelectColor); UTIL_4DColorToRGB(745))
End if 
ERR_MethodTrackerReturn("CW_SetCalendar"; $_t_oldMethodName)

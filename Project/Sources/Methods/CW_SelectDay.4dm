//%attributes = {}
If (False:C215)
	//Project Method Name:      CW_SelectDay
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(CW_d_SelectDate)
	C_LONGINT:C283(<>cwSelectColor; <>cwSelectStyle; $_l_addDays; $_l_Colour; $_l_FieldNumber; $_l_LastIndex; $_l_TableNumber; cwLastIndex)
	C_POINTER:C301($_ptr_Button; $_ptr_DayObject; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CW_SelectDay")
//Project Method: CW_SelectDay
//Marks the selected calendar day
//Created:  3/11/98 - Pelican Software Incorporated

$_ptr_Button:=$1
$_ptr_DayObject:=Get pointer:C304("DayText"+String:C10(cwLastIndex))  //get a pointer to the previous selected day
OBJECT SET FONT STYLE:C166($_ptr_DayObject->; Plain:K14:1)  //reset the font style
//$_l_Colour:=-(Black+(256*745))
//_O_OBJECT SET COLOR($_ptr_DayObject->;$_l_Colour)  //reset the font color
//OBJECT SET RGB COLORS($_ptr_DayObject->;Black;745)
//$_l_ForegroundColour:=UTIL_4DColorToRGB (<>cwSelectColor)
//$_l_BackgroundColour:=UTIL_4DColorToRGB (745)

OBJECT SET RGB COLORS:C628($_ptr_DayObject->; UTIL_4DColorToRGB(Black:K11:16); UTIL_4DColorToRGB(745))

RESOLVE POINTER:C394($_ptr_Button; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)  //get the name for the selected button
$_l_LastIndex:=cwLastIndex  //index for previous selected
cwLastIndex:=Num:C11($_t_VariableName)  //index for selcted day
$_l_addDays:=cwLastIndex-$_l_LastIndex  //days between old and new
CW_d_SelectDate:=Add to date:C393(CW_d_SelectDate; 0; 0; $_l_addDays)  //set the selected date
$_ptr_DayObject:=Get pointer:C304("DayText"+String:C10(cwLastIndex))  //get a pointer to new day text object
OBJECT SET FONT STYLE:C166($_ptr_DayObject->; <>cwSelectStyle)  //set selected font style
//$_l_Colour:=-(<>cwSelectColor+(256*745))
//_O_OBJECT SET COLOR($_ptr_DayObject->;$_l_Colour)  //set selected font color
//OBJECT SET RGB COLORS($_ptr_DayObject->;<>cwSelectColor;745)
//$_l_ForegroundColour:=UTIL_4DColorToRGB (<>cwSelectColor)
//$_l_BackgroundColour:=UTIL_4DColorToRGB (745)

OBJECT SET RGB COLORS:C628($_ptr_DayObject->; UTIL_4DColorToRGB(<>cwSelectColor); UTIL_4DColorToRGB(745))

//Add your code here to execute a custom method when a day changes
ERR_MethodTrackerReturn("CW_SelectDay"; $_t_oldMethodName)
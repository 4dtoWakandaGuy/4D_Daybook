//%attributes = {}
If (False:C215)
	//Project Method Name:      CW_SetPrefs
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
	C_LONGINT:C283(<>cwSelectColor; <>cwSelectStyle; <>cwStartWeekOn; $1; $2; $3; $SELECTCOLOR; $SELECTSTYLE; $STARTWEEKDAY)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CW_SetPrefs")
//Project Method: CW_SetPrefs
//Sets the preferences for the calendar widget
//Created: 3/11/99

Case of 
	: (<>cwStartWeekOn>0)
		$StartWeekDay:=<>cwStartWeekOn
	Else 
		$StartWeekDay:=$1
End case 
Case of 
	: (<>cwSelectColor>0)
		$SelectColor:=<>cwSelectColor
	Else 
		$SelectColor:=$2
End case 
Case of 
	: (<>cwSelectStyle>0)
		$SelectStyle:=<>cwSelectStyle
	Else 
		$SelectStyle:=$3
End case 

If ($StartWeekDay#-1)
	<>cwStartWeekOn:=$StartWeekDay
	[USER:15]CalenderWeekStartDay:244:=<>cwStartWeekOn
End if 
If ($SelectColor#-1)
	<>cwSelectColor:=$SelectColor
	[USER:15]CalenderColor:242:=<>cwSelectColor
End if 
If ($SelectStyle#-1)
	<>cwSelectStyle:=$SelectStyle
	[USER:15]CalenderStyle:243:=<>cwSelectStyle
End if 
ERR_MethodTrackerReturn("CW_SetPrefs"; $_t_oldMethodName)
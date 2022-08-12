//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_TestNewDiaryScreens
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 17:29
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_AdditionalPersons;0)
	C_LONGINT:C283($1; SD2_l_InputActionClass)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle; SD2_t_SELInputFormName; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_TestNewDiaryScreens")
If (Count parameters:C259>=1)
	Case of 
			
		: ($1=1)
			ARRAY TEXT:C222(SD2_at_AdditionalPersons; 0)
			WIN_t_CurrentInputForm:="SD2_DefScheduleEntry"
			SD2_t_SELInputFormName:="Standard Scheduled Item Entry"
			SD2_l_InputActionClass:=1
			Start_Process
			$_t_WindowTitle:="Enter to Shedule"
			Open_Pro_Window($_t_WindowTitle; 0; 2; ->[DIARY:12]; WIN_t_CurrentInputForm)
			FORM SET INPUT:C55([DIARY:12]; WIN_t_CurrentInputForm)
			ADD RECORD:C56([DIARY:12]; *)
			
	End case 
Else 
	ARRAY TEXT:C222(SD2_at_AdditionalPersons; 0)
	WIN_t_CurrentInputForm:="SD2_DefScheduleEntry"
	SD2_t_SELInputFormName:="Standard Scheduled Item Entry"
	SD2_l_InputActionClass:=1
	Start_Process
	$_t_WindowTitle:="Enter to Shedule"
	Open_Pro_Window($_t_WindowTitle; 0; 2; ->[DIARY:12]; WIN_t_CurrentInputForm)
	FORM SET INPUT:C55([DIARY:12]; WIN_t_CurrentInputForm)
	ADD RECORD:C56([DIARY:12]; *)
	
End if 
ERR_MethodTrackerReturn("SD2_TestNewDiaryScreens"; $_t_oldMethodName)

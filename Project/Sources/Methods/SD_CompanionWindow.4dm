//%attributes = {}

If (False:C215)
	//Project Method Name:      SD_CompanionWindow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_CurrentDiaryInitials;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_CompanionWindow")


//NG December 2007
//This just opens a Diary_In screen. The only additional things it does are set a flag so the window  knows it it 'belongs to' the other process. There are outside calls to hide and show the process and a timer to make sure it hides/shows with the main process
$_t_oldMethodName:=ERR_MethodTracker("SD_CompanionWindow")
//Diary_In
ARRAY TEXT:C222(SD2_at_CurrentDiaryInitials; 0)
ERR_MethodTrackerReturn("SD_CompanionWindow"; $_t_oldMethodName)
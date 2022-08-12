//%attributes = {}
If (False:C215)
	//Project Method Name:      Ask_PersonFunctions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_WindowReferenceRow; bd20; SD3_l_CalendarStartDayNumber; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Ask_PersonFunctions")
//Ask_PersonFunctions

If (SD3_l_CalendarStartDayNumber=0) & (False:C215)
	bd20:=5
Else 
	Open_Any_Window(310; 210)
	DIALOG:C40([PERSONNEL:11]; "dAsk_Function")
	
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	WS_KeepFocus
	
End if 
READ WRITE:C146([PERSONNEL:11])
LOAD RECORD:C52([PERSONNEL:11])
If ([PERSONNEL:11]Functionality:33=0)
	[PERSONNEL:11]Functionality:33:=[PERSONNEL:11]Functionality:33 ?? 5
End if 

DB_SaveRecord(->[PERSONNEL:11])
AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
READ ONLY:C145([PERSONNEL:11])
UNLOAD RECORD:C212([PERSONNEL:11])
LOAD RECORD:C52([PERSONNEL:11])
ERR_MethodTrackerReturn("Ask_PersonFunctions"; $_t_oldMethodName)

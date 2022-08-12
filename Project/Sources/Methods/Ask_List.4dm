//%attributes = {}
If (False:C215)
	//Project Method Name:      Ask_List
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
	C_LONGINT:C283($_l_WindowReferenceRow; ch1; s1; s2; s3; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Ask_List")
//Ask_List

Open_Sml_Window
DIALOG:C40([COMPANIES:2]; "dAsk_List")
CLOSE WINDOW:C154
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
WS_KeepFocus

If (ch1=1)
	Case of 
		: (s1=1)
			DB_t_CurrentFormUsage:="All"
		: (s2=1)
			DB_t_CurrentFormUsage:="ToDo"
		: (s3=1)
			DB_t_CurrentFormUsage:="Last"
	End case 
Else 
	ONE RECORD SELECT:C189([DIARY:12])
	UNLOAD RECORD:C212([DIARY:12])
	DB_t_CurrentFormUsage:=""
End if 
ERR_MethodTrackerReturn("Ask_List"; $_t_oldMethodName)

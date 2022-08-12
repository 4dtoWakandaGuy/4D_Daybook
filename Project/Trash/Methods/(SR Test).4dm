//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      SR Test
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:52
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
	C_LONGINT:C283($_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SR Test")
READ WRITE:C146([DOCUMENTS:7])
FORM SET INPUT:C55([DOCUMENTS:7]; "Reports Test")

Open_Any_Window(400; 600)
ADD RECORD:C56([DOCUMENTS:7]; *)
CLOSE WINDOW:C154
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
ERR_MethodTrackerReturn("SR Test"; $_t_oldMethodName)
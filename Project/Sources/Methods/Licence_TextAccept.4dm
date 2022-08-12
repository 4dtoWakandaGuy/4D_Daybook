//%attributes = {}
If (False:C215)
	//Project Method Name:      Licence_TextAccept
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 21:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305($0; WIN_bo_TrackerInited; yAccepted)
	C_LONGINT:C283($_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Licence_TextAccept")
// Licence_textAccept
// User must accept the licence agreement before they can input a licence code
// 22/03/03 pb

Licence_LoadPrefs
Open_AnyTypeWindow(500; 520; Movable form dialog box:K39:8; "Daybook Licence")
DIALOG:C40([USER:15]; "Licence_Accept")
CLOSE WINDOW:C154
$0:=yAccepted
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
ERR_MethodTrackerReturn("Licence_TextAccept"; $_t_oldMethodName)
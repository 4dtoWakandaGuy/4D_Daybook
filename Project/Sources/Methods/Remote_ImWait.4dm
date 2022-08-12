//%attributes = {}
If (False:C215)
	//Project Method Name:      Remote_ImWait
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:01
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
	C_TEXT:C284(<>ButtOK; $_t_oldMethodName; vConfirm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote_ImWait")
vConfirm:="The Download and Upload have now"+Char:C90(13)+"been completed"+Char:C90(13)+Char:C90(13)+"If you are currently online,"+Char:C90(13)+"please disconnect"
<>ButtOK:=""
Open_AnyTypeWindow(142; 312; 5; "Remote Access Message")
DIALOG:C40([COMPANIES:2]; "dAlert")
CLOSE WINDOW:C154
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
ERR_MethodTrackerReturn("Remote_ImWait"; $_t_oldMethodName)
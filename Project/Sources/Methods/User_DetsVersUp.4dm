//%attributes = {}
If (False:C215)
	//Project Method Name:      User_DetsVersUp
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
	C_LONGINT:C283($_l_WindowReferenceRow; $_l_WindowRow; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_DetsVersUp")
//User_DetsVersUp
Gen_Confirm("Daybook Version Updating is taking place on another Client.  Do you want to "+"Wait or "+Quit_Name+"?"; "Wait"; Quit_Name; -1984)
If (OK=0)
	QUIT 4D:C291
Else 
	UNLOAD RECORD:C212([USER:15])
	Open_Any_Window(90; 205; -1984)
	MESSAGE:C88(Char:C90(13)+"   Version Updating in progress"+Char:C90(13)+"   Please wait ...")
	While (Semaphore:C143("VersUp"))
		DelayTicks(60)
	End while 
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	ALL RECORDS:C47([USER:15])
	LOAD RECORD:C52([USER:15])
End if 
ERR_MethodTrackerReturn("User_DetsVersUp"; $_t_oldMethodName)
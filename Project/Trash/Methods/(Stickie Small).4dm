//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Stickie Small
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($H; $_l_CurrentWinRefOLD; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Stickie Small")
Start_Process
If (Diary_File)  //NG modified June 2004
	FORM SET INPUT:C55([DIARY:12]; "Stickie Small")
	$H:=Screen height:C188
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(20; $H-113; 193; $H-20; 4; "Note"; "Close_Process")
	ADD RECORD:C56([DIARY:12]; *)
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
End if 
ERR_MethodTrackerReturn("Stickie Small"; $_t_oldMethodName)
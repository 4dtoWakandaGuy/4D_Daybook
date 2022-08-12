If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.BAlternativeEmails1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; Bsave; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.BAlternativeEmails1"; Form event code:C388)
PER_GetEmailHosts([PERSONNEL:11]Initials:1; [PERSONNEL:11]Personnel_ID:48)
GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
OBJECT GET COORDINATES:C663([PERSONNEL:11]Email_Address:36; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
WIN_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef

WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft+$_l_ObjectLeft; $_l_WindowTop+$_l_ObjectBottom; $_l_WindowLeft+$_l_ObjectRight; $_l_WindowTop+$_l_ObjectBottom+100; 1)
DIALOG:C40([USER:15]; "Per_EmailHosts")
If (Bsave=1)
	PER_SetEmailHosts([PERSONNEL:11]Initials:1; [PERSONNEL:11]Personnel_ID:48)
End if 
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=WIN_l_CurrentWinRefOLD
ERR_MethodTrackerReturn("OBJ:Personnel_In,Variable8"; $_t_oldMethodName)
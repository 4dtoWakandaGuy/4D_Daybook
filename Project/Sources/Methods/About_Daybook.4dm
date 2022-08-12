//%attributes = {}

If (False:C215)
	//Project Method Name:      About_Daybook
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
	C_BOOLEAN:C305($1; WS_bo_FromMenu)
	C_LONGINT:C283($_l_CurrentWinRefOLD; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("About_Daybook")

//$_t_oldMethodName:=ERR_MethodTracker ("About_Daybook")
//About Vector
//
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1984)
If (Count parameters:C259>=1)
	Menu_Record("About_Daybook"; "About_Daybook ...")
	WS_bo_FromMenu:=$1
Else 
	WS_bo_FromMenu:=False:C215
End if 

DIALOG:C40([COMPANIES:2]; "dAbout_VectorW")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD

WS_KeepFocus
//ERR_MethodTrackerReturn ("About_Daybook";$_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      DOC_EmailChoices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $1; $2; $3; $4; DOC_l_Callback; DOC_l_CallEvent; EmailChoiceProc; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOC_EmailChoices")
//This method will display a window as a small process when entering names in the
//email
//the names are in an array ◊DOC_at_EmailChoices
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153($1; $2; $3; $2; -3)
DOC_l_Callback:=$4
DOC_l_CallEvent:=0
DIALOG:C40([USER:15]; "Email_Choice")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
EmailChoiceProc:=0
SET PROCESS VARIABLE:C370(DOC_l_CallBack; EmailChoiceProc; EmailChoiceProc)
ERR_MethodTrackerReturn("DOC_EmailChoices"; $_t_oldMethodName)
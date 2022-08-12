//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_OpenWordDoc
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
	C_LONGINT:C283($_l_CurrentWinRefOLD; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_OpenWordDoc")
//this will open a word document in a 4D write area
//First Get the user to select the document

$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(100+10; 100+10; 100+10; 10+10; -3)
DIALOG:C40([USER:15]; "PseudoWord")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
ERR_MethodTrackerReturn("DB_OpenWordDoc"; $_t_oldMethodName)
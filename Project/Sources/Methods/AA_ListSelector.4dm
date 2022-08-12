//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_ListSelector
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(AA_at_ListPickItem;0)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Index; $0; AA_l_ListSelectedItem; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $2; AA_t_SelectText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_ListSelector")

$0:=0

If (Count parameters:C259>=2)
	AA_t_SelectText:=$2
	ARRAY TEXT:C222(AA_at_ListPickItem; Size of array:C274($1->))
	For ($_l_Index; 1; Size of array:C274($1->))
		AA_at_ListPickItem{$_l_Index}:=$1->{$_l_Index}
	End for 
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; 1)
	DIALOG:C40([USER:15]; "List_Picker")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	$0:=AA_l_ListSelectedItem
	
End if 
ERR_MethodTrackerReturn("AA_ListSelector"; $_t_oldMethodName)

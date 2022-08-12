//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessIndexutility
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>IDX_l_IndexingProcess; $_l_CurrentWinRefOLD; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessIndexutility")
// ProcessIndexUtility
// 25/2/00 pb
FORM SET INPUT:C55([USER:15]; "IndexUtility"; *)
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(50; 213; 301+50; 663; -Palette window:K34:3; ""; "DEI_CloseBox")
//Open window(50;50;-1;-1;0;"Index Utility")
DIALOG:C40([USER:15]; "IndexUtility")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
<>IDX_l_IndexingProcess:=0
ERR_MethodTrackerReturn("ProcessIndexutility"; $_t_oldMethodName)
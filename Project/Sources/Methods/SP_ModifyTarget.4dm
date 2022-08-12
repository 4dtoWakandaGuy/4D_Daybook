//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_ModifyTarget
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
	C_LONGINT:C283($1; $2; $_l_CurrentWinRefOLD; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; $3; $4; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_ModifyTarget")
READ WRITE:C146([SALES_PROJECTION:113])
FORM SET INPUT:C55([SALES_PROJECTION:113]; "Target_EntryForm")
WIN_t_CurrentInputForm:="Target_EntryForm"
If (Count parameters:C259>=1)
	QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1=$1)
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 4)
	MODIFY RECORD:C57([SALES_PROJECTION:113]; *)
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
End if 
ERR_MethodTrackerReturn("SP_ModifyTarget"; $_t_oldMethodName)
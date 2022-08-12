//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check Prod2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(GEN_ar_Value;0)
	C_LONGINT:C283(<>SYS_l_WindowTop; $_l_CurrentWinRefOLD; $_l_WindowReference; $1; $2; CHK_l_OnLoad; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check Prod2")
//Check Prod2
If (Count parameters:C259>=2)
	$_l_WindowReference:=Open window:C153($1; $2; $1; $2; 1987; "Select a Product"; "Close_Cancel")
	
Else 
	$_l_WindowReference:=Open window:C153(Screen width:C187-464; <>SYS_l_WindowTop+60; Screen width:C187-4; <>SYS_l_WindowTop+270; 1987; "Select a Product"; "Close_Cancel")
End if 
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=$_l_WindowReference
//`CHK_l_OnLoad:=0 `On load is getting triggered twice???
DIALOG:C40([PRODUCTS:9]; "dAsk Product")
CHK_l_OnLoad:=0
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
Array_LCx(0)

ARRAY REAL:C219(GEN_ar_Value; 0)
WS_KeepFocus
ERR_MethodTrackerReturn("Check Prod2"; $_t_oldMethodName)
//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check_Company2
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
	C_LONGINT:C283(<>SYS_l_WindowTop; $_l_CurrentWinRefOLD; $_l_DockRight; $_l_WindowReference; $1; $2; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; vCompCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_Company2")
//Check_Company2
vCompCode:=""
CREATE SET:C116([COMPANIES:2]; "Master2")

If (Count parameters:C259=0)
	$_l_DockRight:=INT_GetDock("R")
	$_l_WindowReference:=Open window:C153((Screen width:C187-$_l_DockRight)-369; <>SYS_l_WindowTop+50; Screen width:C187-$_l_DockRight; <>SYS_l_WindowTop+50; 4; "Select a Company"; "Close_Cancel")
Else 
	//open using the left and top($1, $2)
	$_l_WindowReference:=Open window:C153($1; $2; $1; $2; 4; "Select a Company"; "Close_Cancel")
	
End if 
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=$_l_WindowReference
//TRACE
DIALOG:C40([COMPANIES:2]; "dAsk Company")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
WS_KeepFocus

Array_LCx(0)
ERR_MethodTrackerReturn("Check_Company2"; $_t_oldMethodName)
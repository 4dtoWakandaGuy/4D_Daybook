//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_QuickAddButtons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2012 07:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_WindowLeft; $_l_windowTop; $1; $2; $3; ORD_l_CallBackProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_QuickAddButtons")

ORD_l_CallBackProcess:=$1
$_l_WindowLeft:=$2
$_l_windowTop:=$3
Open window:C153($_l_WindowLeft; $_l_windowTop; $_l_WindowLeft+177; $_l_windowTop+72; -(Palette window:K34:3))
DIALOG:C40("ORD_QuickAddButton")
CLOSE WINDOW:C154
ERR_MethodTrackerReturn("ORD_QuickAddButtons"; $_t_oldMethodName)

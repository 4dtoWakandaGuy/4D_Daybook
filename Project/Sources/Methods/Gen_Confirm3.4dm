//%attributes = {}

If (False:C215)
	//Project Method Name:      Gen_Confirm3
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
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_ScreenCentreVertical; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>ButtCanc; <>ButtNext; <>ButtOK; $_t_oldMethodName; $1; $2; $3; $4; vConfirm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Confirm3")

SHOW PROCESS:C325(Current process:C322)
BRING TO FRONT:C326(Current process:C322)


//Gen_Confirm 3 buttons
<>SYS_bo_CurrentWindowModal:=True:C214
vConfirm:=$1
$_l_ScreenCentreVertical:=Screen width:C187/2
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-162; 110; $_l_ScreenCentreVertical+162; 252)
If (Count parameters:C259>1)
	<>ButtOK:=$2
	<>ButtCanc:=$3
	<>ButtNext:=$4
Else 
	<>ButtOK:=""
	<>ButtCanc:=""
	<>ButtNext:=""
End if 
DIALOG:C40([COMPANIES:2]; "dConfirm3")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
<>SYS_bo_CurrentWindowModal:=False:C215
ERR_MethodTrackerReturn("Gen_Confirm3"; $_t_oldMethodName)
//%attributes = {}

If (False:C215)
	//Project Method Name:      Gen_ConfirmT
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
	//Array LONGINT(WIN_al_CalledFromReference;0)
	//Array LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_Process; $_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>ButtCanc; <>ButtOK; $_t_oldMethodName; $1; $2; $3; $4; $5; vConfirm; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ConfirmT")

SHOW PROCESS:C325(Current process:C322)
BRING TO FRONT:C326(Current process:C322)
$_t_oldMethodName:=ERR_MethodTracker("Gen_ConfirmT")

//Gen_ConfirmT
vConfirm:=$1
vTitle:=""
Open_Any_Window(302; 450)
If (Count parameters:C259>1)
	<>ButtOK:=$2
	<>ButtCanc:=$3
	If (Count parameters:C259>3)
		vTitle:=$4
		If (Count parameters:C259>4)
			If ($5#"")
				$_l_Process:=New process:C317("ConfirmT_Cancel"; DB_ProcessMemoryinit(2); "$"+$5+Char:C90(9)+String:C10(Current process:C322))
			End if 
		End if 
	End if 
Else 
	<>ButtOK:=""
	<>ButtCanc:=""
End if 
DIALOG:C40([COMPANIES:2]; "dConfirmT")
CLOSE WINDOW:C154
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
ERR_MethodTrackerReturn("Gen_ConfirmT"; $_t_oldMethodName)
//%attributes = {}

If (False:C215)
	//Project Method Name:      Gen_Confirm
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
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; IME_bo_FromWebRequest)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_ScreenCentreHorizontal; $_l_ScreenCentreVertical; $_l_WindowReference; WIN_l_CurrentWinRef)
	C_REAL:C285($4)
	C_TEXT:C284(<>ButtCanc; <>ButtOK; $_t_oldMethodName; $1; $2; $3; vConfirm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Confirm")


//SHOW PROCESS(Current process)
//BRING TO FRONT(Current process)
$_t_oldMethodName:=ERR_MethodTracker("Gen_Confirm")

IME_WebMessagesInit

If (IME_bo_FromWebRequest=False:C215)
	//Gen_Confirm
	<>SYS_bo_CurrentWindowModal:=True:C214
	vConfirm:=$1
	$_l_ScreenCentreHorizontal:=Screen height:C188/2
	$_l_ScreenCentreVertical:=Screen width:C187/2
	If (Count parameters:C259<4)
		$_l_WindowReference:=Open window:C153($_l_ScreenCentreVertical; $_l_ScreenCentreHorizontal; $_l_ScreenCentreVertical; $_l_ScreenCentreHorizontal; 1)
	Else 
		$_l_WindowReference:=Open window:C153($_l_ScreenCentreVertical; 110; $_l_ScreenCentreVertical; 110; $4)
	End if 
	If (False:C215)
		$_l_ScreenCentreVertical:=Screen width:C187/2
		If (Count parameters:C259<4)
			$_l_WindowReference:=Open window:C153($_l_ScreenCentreVertical; $_l_ScreenCentreVertical; $_l_ScreenCentreVertical; $_l_ScreenCentreVertical; 1)
		Else 
			$_l_WindowReference:=Open window:C153($_l_ScreenCentreVertical; 110; $_l_ScreenCentreVertical; 110; $4)
		End if 
	End if 
	
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=$_l_WindowReference
	
	If (Count parameters:C259>1)
		
		<>ButtOK:=$2
		If (Count parameters:C259>2)
			<>ButtCanc:=$3
		Else 
			<>ButtCanc:=""
		End if 
	Else 
		<>ButtOK:=""
		<>ButtCanc:=""
	End if 
	
	DIALOG:C40([COMPANIES:2]; "dConfirm")
	
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	<>SYS_bo_CurrentWindowModal:=False:C215
Else 
	IME_WebMessagesAddWarning("Confirmation Warning"; "Warning. From the web, the system couldn't ask the user to confirm the following."+".. '"+$1+".' Assumed user would have selected 'No/Cancel'.")
	OK:=0
End if 
ERR_MethodTrackerReturn("Gen_Confirm"; $_t_oldMethodName)
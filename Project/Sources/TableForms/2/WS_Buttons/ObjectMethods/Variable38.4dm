If (False:C215)
	//object Name: [COMPANIES]WS_Buttons.Variable38
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(BUT_bo_Floating)
	C_LONGINT:C283(<>BUTTPROC; $_l_FieldNumber; $_l_TableNumber; DB_l_ButtonClickedFunction)
	C_POINTER:C301($_ptr_PalletButton)
	C_TEXT:C284($_t_MachineName; $_t_oldMethodName; DB_t_ButtonClickedFunction; PAL_BUTTON)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].WS_Buttons.Variable38"; Form event code:C388)
$_ptr_PalletButton:=Self:C308
RESOLVE POINTER:C394($_ptr_PalletButton; PAL_BUTTON; $_l_TableNumber; $_l_FieldNumber)
BUT_bo_Floating:=True:C214
DB_l_ButtonClickedFunction:=0
DB_t_ButtonClickedFunction:=""
$_t_MachineName:=Current machine:C483
If (False:C215)
	<>ButtProc:=New process:C317("Input_ButtonsWin"; 256000; "Buttons_"+$_t_MachineName; *)  //see In_ButtProc
End if 
CANCEL:C270
ERR_MethodTrackerReturn("OBJ:WS_Buttons,PAL_but_FirstRecord9"; $_t_oldMethodName)
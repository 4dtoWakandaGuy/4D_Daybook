If (False:C215)
	//object Name: [DIARY]SD2_Input.oDateToButtonP3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ButtonNumber; $_l_CallBackProcess; $_l_event; $_l_FieldNumber; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_PopUpProcess; $_l_TableNumber; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRight; $_l_WindowTop)
	C_POINTER:C301($_ptr_PalletButton)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; PAL_BUTTON)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_Input.oDateToButtonP3"; Form event code:C388)
$_ptr_PalletButton:=Self:C308
RESOLVE POINTER:C394($_ptr_PalletButton; PAL_BUTTON; $_l_TableNumber; $_l_FieldNumber)
$_l_event:=Form event code:C388
$_l_ButtonNumber:=Num:C11(PAL_BUTTON)
Case of 
	: ($_l_event=On Long Click:K2:37)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
		$_t_ProcessName:="DiaryPopDateTo"
		$_l_CallBackProcess:=Current process:C322
		$_l_PopUpProcess:=New process:C317("SD2_PopUpDiary"; 64000; $_t_ProcessName; $_l_CallBackProcess; [DIARY:12]Display_Date_To:52; "SD2_D_DisplayDateTo"; "SD2_l_EventCall"; 11; $_l_WindowLeft+$_l_MouseX; $_l_WindowTop+$_l_MouseY; *)
		
		BRING TO FRONT:C326($_l_PopUpProcess)
	Else 
		[DIARY:12]Display_Date_To:52:=Current date:C33(*)
		SD2_DiaryinLPX(->[DIARY:12]Display_Date_To:52)
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_Input.oDateToButtonP3"; $_t_oldMethodName)

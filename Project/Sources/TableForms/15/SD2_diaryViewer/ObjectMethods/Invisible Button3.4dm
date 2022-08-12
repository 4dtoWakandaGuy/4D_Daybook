If (False:C215)
	//object Name: [USER]SD2_diaryViewer.Invisible Button3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PAL_bo_ButtonSubFunction)
	C_DATE:C307(SD2_D_DatetoFilter)
	C_LONGINT:C283($_l_ButtonNumber; $_l_CallBackProcess; $_l_event; $_l_FieldNumber; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_PopUpProcess; $_l_TableNumber; $_l_WIndowBottom; $_l_WIndowLeft)
	C_LONGINT:C283($_l_WIndowRight; $_l_WIndowTop)
	C_POINTER:C301($_ptr_PalletButton; $_Ptr_PopUpNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; PAL_BUTTON)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.Invisible Button3"; Form event code:C388)
$_ptr_PalletButton:=Self:C308
RESOLVE POINTER:C394($_ptr_PalletButton; PAL_BUTTON; $_l_TableNumber; $_l_FieldNumber)
$_l_event:=Form event code:C388
$_l_ButtonNumber:=Num:C11(PAL_BUTTON)
Case of 
	: ($_l_event=On Long Click:K2:37)
		GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowBottom)
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
		$_Ptr_PopUpNumber:=Get pointer:C304("PAL_at_PopUpMenu"+String:C10($_l_ButtonNumber))
		PAL_bo_ButtonSubFunction:=True:C214
		//$_t_ProcessName:="DiaryPopDateFrom"
		$_t_ProcessName:="DiaryPopDateTo"  //-changed Process_Name from "DiaryPopDateFrom" to "DiaryPopDateTo" -kmw, 01/7/08
		$_l_CallBackProcess:=Current process:C322
		$_l_PopUpProcess:=New process:C317("SD2_PopUpDiary"; 64000; $_t_ProcessName; $_l_CallBackProcess; SD2_D_DatetoFilter; "SD2_D_DatetoFilter"; "SD2_l_EventCall"; 11; $_l_WIndowLeft+$_l_MouseX; $_l_WIndowTop+$_l_MouseY)
		BRING TO FRONT:C326($_l_PopUpProcess)
	Else 
		//SD2_D_DateFromFilter:=Current date(*)
		SD2_D_DatetoFilter:=Current date:C33(*)  //-corrected so it sets "to" date instead of "from" -kmw, 01/7/08
		
		
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_diaryViewer.Invisible Button3"; $_t_oldMethodName)

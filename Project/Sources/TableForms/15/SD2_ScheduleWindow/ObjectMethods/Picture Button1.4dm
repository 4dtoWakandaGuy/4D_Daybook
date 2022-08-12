If (False:C215)
	//object Name: [USER]SD2_ScheduleWindow.Picture Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2013 15:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_PersonClass;0)
	//ARRAY TEXT(SD_at_DiaryOwners;0)
	//ARRAY TEXT(SD_at_PersonInitials;0)
	C_BOOLEAN:C305(SD2_bo_ShowCalenders; SD2_bo_ShowMonth)
	C_LONGINT:C283($_l_CallBackProcess; $_l_event; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectTop)
	C_LONGINT:C283($_l_PopSelectProcess; $_l_Retries; $_l_Width; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; SD_l_ProcessReady)
	C_PICTURE:C286(SD_Pic_Today)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.Picture Button1"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SD2_bo_ShowCalenders=False:C215)
			If (SD2_bo_ShowMonth)  // we have a mini. Month view option switched on.
				OBJECT SET VISIBLE:C603(*; "oMiniCal@"; True:C214)
				OBJECT SET VISIBLE:C603(SD_Pic_Today; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCalender@"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oCalenders"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				If ($_l_WindowRight-$_l_WindowLeft>150)
					//$_l_WindowRight:=150
				End if 
				OBJECT GET COORDINATES:C663(*; "oSD2CalanderView"; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectBottom)
				$_l_Width:=$_l_ObjectRight-$_l_ObjectLeft
				OBJECT MOVE:C664(*; "oSD2CalanderView"; $_l_ObjectRight+3; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectBottom; *)
				OBJECT MOVE:C664(*; "oCalenders"; $_l_ObjectLeft; $_l_ObjectTop+16; $_l_ObjectRight; $_l_ObjectBottom-145; *)
				OBJECT MOVE:C664(*; "oMiniCalBorder"; $_l_ObjectLeft; $_l_ObjectBottom-143; $_l_ObjectRight; $_l_ObjectBottom; *)
				SD2_MoveMinCalObjects($_l_ObjectLeft; $_l_ObjectBottom-143; $_l_ObjectRight; $_l_ObjectBottom)
				
				SD2_bo_ShowCalenders:=True:C214
			Else 
				//Mini Month view not displayed
				OBJECT SET VISIBLE:C603(*; "oMiniCal@"; False:C215)
				OBJECT SET VISIBLE:C603(SD_Pic_Today; False:C215)
				OBJECT SET VISIBLE:C603(*; "oCalender@"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oCalenders"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT GET COORDINATES:C663(*; "oSD2CalanderView"; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectBottom)
				$_l_Width:=$_l_ObjectRight-$_l_ObjectLeft
				OBJECT MOVE:C664(*; "oSD2CalanderView"; $_l_ObjectRight+3; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectBottom; *)
				SD2_bo_ShowCalenders:=True:C214
			End if 
			
		Else 
			SD2_bo_ShowCalenders:=False:C215
			OBJECT GET COORDINATES:C663(*; "oSD2CalanderView"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_Width:=$_l_ObjectRight-$_l_ObjectLeft
			OBJECT MOVE:C664(*; "oSD2CalanderView"; 1; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom; *)
			OBJECT SET VISIBLE:C603(*; "OCalender@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "OminiCal@"; False:C215)
			OBJECT SET VISIBLE:C603(SD_Pic_Today; False:C215)
			
		End if 
	: ($_l_event=On Long Click:K2:37)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
		$_t_ProcessName:="DiaryPopCalenderSelect"
		$_l_CallBackProcess:=Current process:C322
		
		$_l_PopSelectProcess:=New process:C317("SD2_PopCalenderSelect"; 64000; $_t_ProcessName; $_l_CallBackProcess; $_l_WindowLeft+$_l_MouseX; $_l_WindowTop+$_l_MouseY)
		BRING TO FRONT:C326($_l_PopSelectProcess)
		SD_l_ProcessReady:=0
		$_l_Retries:=0
		While (SD_l_ProcessReady=0)
			GET PROCESS VARIABLE:C371($_l_PopSelectProcess; SD_l_ProcessReady; SD_l_ProcessReady)
			If (SD_l_ProcessReady=0)
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*$_l_Retries)
				
			End if 
		End while 
		
		VARIABLE TO VARIABLE:C635($_l_PopSelectProcess; SD_at_PersonInitials; SD_at_PersonInitials; SD_at_DiaryOwners; SD_at_DiaryOwners; SD_al_PersonClass; SD_al_PersonClass)
		SD_l_ProcessReady:=2
		SET PROCESS VARIABLE:C370($_l_PopSelectProcess; SD_l_ProcessReady; SD_l_ProcessReady)
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.Picture Button1"; $_t_oldMethodName)

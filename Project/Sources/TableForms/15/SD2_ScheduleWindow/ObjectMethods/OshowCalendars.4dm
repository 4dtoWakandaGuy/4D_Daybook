If (False:C215)
	//object Method Name: Object Name:      [USER].SD2_ScheduleWindow.OshowCalendars
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2013 10:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_CheckBox;0)
	//ARRAY TEXT(SD_at_AvailableViews;0)
	C_BOOLEAN:C305(SD2_bo_CalShowCalendars)
	C_LONGINT:C283($_l_event; $_l_MonthMiniSize; $_l_NextBottom; $_l_NextObject; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectLeft; $_l_ObjectLeft3; $_l_ObjectRight; $_l_ObjectRight2)
	C_LONGINT:C283($_l_ObjectRight3; $_l_ObjectTop; $_l_ObjectTop2; $_l_ObjectTop3; $_l_SizeofGroups)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; SD_t_AvailableView4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.OshowCalendars"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (SD2_bo_CalShowCalendars)
				SD2_bo_CalShowCalendars:=False:C215
			Else 
				SD2_bo_CalShowCalendars:=True:C214
		End case 
		Case of 
			: (SD2_bo_CalShowCalendars)
				SD_SetSchedDiaries(<>PER_t_CurrentUserInitials)
				//SD2_at_ScheduleActionNames
				//SD2_at_SheduleActionCodes
				
				Case of 
					: (SD_at_AvailableViews=1)  //Day
					: (SD_at_AvailableViews=2)  //Week
						
					: (SD_at_AvailableViews=3)  //Month
						OBJECT GET COORDINATES:C663(*; "oMonth_Detail"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
						$_l_MonthMiniSize:=160
						$_l_SizeofGroups:=100  //Size of array(SD2_at_ScheduleActionNames)*16
						If (Size of array:C274(SD2_abo_CheckBox)>1)
							OBJECT MOVE:C664(*; "oSelectedDiariesLabel"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+163; $_l_ObjectTop+14; *)
							$_l_NextObject:=$_l_ObjectTop+14+5
							$_l_NextBottom:=$_l_ObjectBottom-(160+$_l_SizeofGroups+5+14+5+14+5)
							OBJECT MOVE:C664(*; "oCalenders"; $_l_ObjectLeft; $_l_NextObject; $_l_ObjectLeft+163; $_l_NextBottom; *)
							$_l_NextObject:=$_l_NextBottom+5
							OBJECT MOVE:C664(*; "oMultipleDiaries"; $_l_ObjectLeft; $_l_NextObject; $_l_ObjectLeft+163; $_l_NextObject+14; *)
							$_l_NextObject:=$_l_NextObject+14+5
							If ($_l_SizeofGroups>0) | (True:C214)
								$_l_NextObject:=$_l_NextObject+5
								OBJECT MOVE:C664(*; "oSelectedActionsLabel"; $_l_ObjectLeft; $_l_NextObject; $_l_ObjectLeft+163; $_l_NextObject+14; *)
								$_l_NextObject:=$_l_NextObject+14+5
								$_l_NextBottom:=$_l_ObjectBottom-160
								OBJECT MOVE:C664(*; "oActions"; $_l_ObjectLeft; $_l_NextObject; $_l_ObjectLeft+163; $_l_NextBottom; *)
								$_l_NextObject:=$_l_NextBottom+5
								OBJECT SET VISIBLE:C603(*; "oSelectedActionsLabel"; True:C214)
								OBJECT SET VISIBLE:C603(*; "oActions"; True:C214)
								
							End if 
							$_l_NextObject:=$_l_NextObject+5
							//OBJECT MOVE(*;"oMiniCalSelPeriod";$_l_ObjectLeft;$_l_NextObject;$_l_ObjectLeft+163;$_l_NextObject+21;*)
							OBJECT MOVE:C664(*; "oMiniCalButtonPrevious"; $_l_ObjectLeft; $_l_NextObject+1; $_l_ObjectLeft+34; $_l_NextObject+22; *)
							OBJECT MOVE:C664(*; "oMiniCalButtonNext"; $_l_ObjectLeft+(163-33); $_l_NextObject+1; $_l_ObjectLeft+163; $_l_NextObject+22; *)
							OBJECT MOVE:C664(*; "oMiniCalSelCurrent"; $_l_ObjectLeft+35; $_l_NextObject+1; $_l_ObjectLeft+(163-33); $_l_NextObject+22; *)
							//$_l_NextObject:=$_l_NextObject+21+5
							OBJECT MOVE:C664(*; "oMiniCalSelbanner"; $_l_ObjectLeft-5; $_l_NextObject+4; $_l_ObjectLeft+153; $_l_NextObject+20; *)
							OBJECT MOVE:C664(*; "oMiniCalSelMini"; $_l_ObjectLeft; $_l_NextObject; $_l_ObjectLeft+163; $_l_ObjectBottom; *)
							
							OBJECT MOVE:C664(*; "oMonth_Detail"; $_l_ObjectLeft+168; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom; *)
							OBJECT GET COORDINATES:C663(*; "oBanner_Month"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
							OBJECT MOVE:C664(*; "oBanner_Month"; $_l_ObjectLeft+168; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3; *)
							
							OBJECT SET VISIBLE:C603(*; "oCalenders"; True:C214)
							OBJECT SET VISIBLE:C603(*; "oSelectedDiariesLabel"; True:C214)
							OBJECT SET VISIBLE:C603(*; "oMultipleDiaries"; True:C214)
							OBJECT SET VISIBLE:C603(*; "oMiniCal@"; True:C214)
							
						End if 
					: (SD_at_AvailableViews=4)  //Year
				End case 
				
				
			Else 
				Case of 
					: (SD_at_AvailableViews=1)  //Day
					: (SD_at_AvailableViews=2)  //Week
						
					: (SD_at_AvailableViews=3)  //Month
						OBJECT GET COORDINATES:C663(*; "oMonth_Detail"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
						OBJECT GET COORDINATES:C663(*; "oCalenders"; $_l_ObjectLeft; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
						OBJECT GET COORDINATES:C663(*; "oBanner_Month"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
						OBJECT MOVE:C664(*; "oMonth_Detail"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom; *)
						OBJECT MOVE:C664(*; "oBanner_Month"; $_l_ObjectLeft; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3; *)
						
						OBJECT SET VISIBLE:C603(*; "oCalenders"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oSelectedDiariesLabel"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oMultipleDiaries"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oSelectedActionsLabel"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oActions"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oMiniCal@"; False:C215)
						
					: (SD_at_AvailableViews=4)  //Year
				End case 
				
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.OshowCalendars"; $_t_oldMethodName)

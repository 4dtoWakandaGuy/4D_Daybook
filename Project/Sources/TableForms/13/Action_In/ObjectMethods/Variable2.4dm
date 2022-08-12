If (False:C215)
	//object Method Name:      SD_at_ActionTypes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/01/2013 15:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_DiaryLocationsSEL;0)
	//ARRAY BOOLEAN(SD2_lb_ActionStatus;0)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	//ARRAY LONGINT(SD_al_Actiontypes;0)
	//ARRAY LONGINT(SD2_al_DiaryDone;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeDiary;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeIDS;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeOriginal;0)
	//ARRAY LONGINT(SD2_AL_DiaryTypeSettings;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeThreaded;0)
	//ARRAY LONGINT(SD2_al_rTableNUMs;0)
	//ARRAY TEXT(SD_at_ActionTypes;0)
	//ARRAY TEXT(SD2_at_DiaryTypes;0)
	C_BOOLEAN:C305($_bo_SetFormNames)
	C_LONGINT:C283($_l_ActionTypeRow; $_l_ButtonBottom; $_l_ButtonHeight; $_l_ButtonLeft; $_l_ButtonRight; $_l_ButtonTop; $_l_ButtonWidth; $_l_event; $_l_LBBottom; $_l_LBLeft; $_l_LBRight)
	C_LONGINT:C283($_l_LBTop; $_l_LocationRow; $_l_LocationsIndex; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ShowPost; $_l_ShowThread; $_l_SpaceFree; $_l_SpaceRequired)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_l_WindowWidth; SD2_l_ActionTypeID; SD2_l_CBPostAction; SD2_l_CBThreaded; SD2_l_CurrentDiaryType; sRB_l_Diary; sRB_l_Original)
	C_TEXT:C284($_t_oldMethodName; SD_t_ViewActionClassNM; SD2_t_EntryForm)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Variable2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SD_at_ActionTypes>0)
			
			If (SD_al_Actiontypes{SD_at_ActionTypes}>0)
				SD_al_Actiontypes:=SD_at_ActionTypes
				$_bo_SetFormNames:=False:C215
				SD2_l_ActionTypeID:=SD_al_Actiontypes{SD_al_Actiontypes}
				$_l_ActionTypeRow:=Find in array:C230(SD2_al_DiaryTypeIDS; SD2_l_ActionTypeID)
				If ($_l_ActionTypeRow>0)
					SD_t_ViewActionClassNM:=SD2_at_DiaryTypes{$_l_ActionTypeRow}
					//SD2_al_DiaryLocations;->SD2_at_DiaryLocations
					For ($_l_LocationsIndex; 1; Size of array:C274(SD2_aI_DiaryLocationsSEL))
						If (Size of array:C274(SD2_AL_DiaryTypeSettings{$_l_ActionTypeRow})>=$_l_LocationsIndex)
							$_l_LocationRow:=Find in array:C230(SD2_al_DiaryLocations; SD2_AL_DiaryTypeSettings{$_l_ActionTypeRow}{$_l_LocationsIndex})
							If ($_l_LocationRow>0)  //it should be
								SD2_aI_DiaryLocationsSEL{$_l_LocationRow}:=1
								SD2_abo_DiaryLocationsSEL{$_l_LocationRow}:=(SD2_aI_DiaryLocationsSEL{$_l_LocationRow}=1)
								
								
							End if 
						End if 
						
					End for 
					$_l_LocationRow:=Find in array:C230(SD2_al_DiaryLocations; 1)  //because these are hard coded IDS
					$_l_ShowThread:=0
					If ($_l_LocationRow>0)
						//$_l_ShowThread:=SD2_aI_DiaryLocationsSEL{$Ref3}
						If ($_l_ShowThread=0)
							$_l_LocationRow:=Find in array:C230(SD2_al_DiaryLocations; 2)
							If ($_l_LocationRow>0)
								$_l_ShowThread:=SD2_aI_DiaryLocationsSEL{$_l_LocationRow}
							End if 
						End if 
					End if 
					If ($_l_ShowThread>0)
						SD2_l_CBThreaded:=SD2_al_DiaryTypeThreaded{$_l_ActionTypeRow}
						sRB_l_Original:=SD2_al_DiaryTypeOriginal{$_l_ActionTypeRow}
						sRB_l_Diary:=SD2_al_DiaryTypeDiary{$_l_ActionTypeRow}
						If (sRB_l_Original=1)
							$_bo_SetFormNames:=True:C214
						Else 
							$_bo_SetFormNames:=True:C214
						End if 
						OBJECT SET VISIBLE:C603(SD2_l_CBThreaded; True:C214)
						OBJECT SET VISIBLE:C603(sRB_l_Original; True:C214)
						OBJECT SET VISIBLE:C603(sRB_l_Diary; True:C214)
					Else 
						OBJECT SET VISIBLE:C603(SD2_l_CBThreaded; False:C215)
						OBJECT SET VISIBLE:C603(sRB_l_Original; False:C215)
						OBJECT SET VISIBLE:C603(sRB_l_Diary; False:C215)
						$_bo_SetFormNames:=True:C214
					End if 
					
					
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
					$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
					OBJECT GET COORDINATES:C663(*; "oLBActionLocations"; $_l_LBLeft; $_l_LBTop; $_l_LBRight; $_l_LBBottom)
					OBJECT GET COORDINATES:C663(*; "oTabBox"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_SpaceRequired:=286+10+10
					$_l_SpaceFree:=$_l_WindowWidth-($_l_LBRight-$_l_WindowLeft)
					$_l_LBTop:=$_l_ObjectTop
					If ($_l_ShowThread=0)
						OBJECT SET VISIBLE:C603(SD2_lb_ActionStatus; False:C215)
						OBJECT SET VISIBLE:C603(*; "oStatusEdit"; False:C215)
						
						$_l_SpaceRequired:=10
						$_l_SpaceFree:=$_l_WindowWidth-$_l_LBRight
						If ($_l_SpaceFree>$_l_SpaceRequired)
							SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowLeft+($_l_ObjectRight+$_l_SpaceRequired); $_l_WindowBottom)
						End if 
						OBJECT GET COORDINATES:C663(*; "oLBActionLocations"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
						OBJECT GET COORDINATES:C663(*; "oStatusEdit"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_ButtonBottom)
						$_l_ButtonWidth:=$_l_ButtonRight-$_l_ButtonLeft
						$_l_ButtonHeight:=$_l_ButtonBottom-$_l_ButtonTop
						OBJECT MOVE:C664(*; "oWorkflowBehaviour"; $_l_ObjectRight+10; $_l_ObjectTop; ($_l_ObjectRight+10); ($_l_LBTop-5)-($_l_ButtonHeight+5); *)
						OBJECT MOVE:C664(*; "oStatusEdit"; (($_l_ObjectRight+10))-$_l_ButtonWidth; ($_l_LBTop-5)-($_l_ButtonHeight); ($_l_ObjectRight+10); ($_l_LBTop-5); *)
						
					Else 
						OBJECT SET VISIBLE:C603(SD2_lb_ActionStatus; True:C214)
						OBJECT SET VISIBLE:C603(*; "oStatusEdit"; True:C214)
						$_l_SpaceRequired:=286+10+10
						$_l_SpaceFree:=$_l_WindowWidth-$_l_LBRight
						If ($_l_SpaceFree<$_l_SpaceRequired)
							SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowLeft+($_l_LBRight+$_l_SpaceRequired); $_l_WindowBottom)
						End if 
						OBJECT GET COORDINATES:C663(*; "oLBActionLocations"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
						OBJECT GET COORDINATES:C663(*; "oStatusEdit"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_ButtonBottom)
						$_l_ButtonWidth:=$_l_ButtonRight-$_l_ButtonLeft
						$_l_ButtonHeight:=$_l_ButtonBottom-$_l_ButtonTop
						OBJECT MOVE:C664(*; "oWorkflowBehaviour"; $_l_ObjectRight+10; $_l_ObjectTop; ($_l_ObjectRight+10)+286; ($_l_LBTop-5)-($_l_ButtonHeight+5); *)
						OBJECT MOVE:C664(*; "oStatusEdit"; (($_l_ObjectRight+10)+286)-$_l_ButtonWidth; ($_l_LBTop-5)-($_l_ButtonHeight); ($_l_ObjectRight+10)+286; ($_l_LBTop-5); *)
						
					End if 
					
					
					$_l_ShowPost:=0
					$_l_LocationRow:=Find in array:C230(SD2_al_DiaryLocations; 3)  //because these are hard coded IDS
					If ($_l_LocationRow>0)
						$_l_ShowPost:=SD2_aI_DiaryLocationsSEL{$_l_LocationRow}
					End if 
					If ($_l_ShowPost>0)
						$_bo_SetFormNames:=True:C214
						SD2_l_CBPostAction:=SD2_al_DiaryDone{$_l_ActionTypeRow}
					Else 
						$_bo_SetFormNames:=True:C214
						
						
					End if 
					
				Else 
					SD2_l_CurrentDiaryType:=0
					
				End if 
				If (SD2_l_CBThreaded=1)
					//OBJECT SET VISIBLE(*;"oThreadOption";True)
					//Set the available forms to use here
				Else 
					//OBJECT SET VISIBLE(*;"oThreadOption";False)
					//Set the available forms to use here
				End if 
				//Other objects to be hidden/disabled here.
				If ($_bo_SetFormNames)
					SD2_LoadDiaryFormNames(SD2_l_CBPostAction; sRB_l_Original; SD2_t_EntryForm; ->SD2_al_rTableNUMs)
					
				End if 
				[ACTIONS:13]xActionTypeID:10:=SD_al_Actiontypes{SD_al_Actiontypes}
			Else 
				SD2_EditDiaryActionClasses
				SD2_LoadDiaryTypes
				SD_al_Actiontypes:=0
				$_l_ActionTypeRow:=Find in array:C230(SD2_at_DiaryTypes; SD_t_ViewActionClassNM)
				If ($_l_ActionTypeRow>0)
					SD2_at_DiaryTypes:=$_l_ActionTypeRow
					SD_al_Actiontypes:=SD_at_ActionTypes
					$_bo_SetFormNames:=False:C215
					SD2_l_ActionTypeID:=SD_al_Actiontypes{SD_al_Actiontypes}
					$_l_ActionTypeRow:=Find in array:C230(SD2_al_DiaryTypeIDS; SD2_l_ActionTypeID)
					If ($_l_ActionTypeRow>0)
						SD_t_ViewActionClassNM:=SD2_at_DiaryTypes{$_l_ActionTypeRow}
						//SD2_al_DiaryLocations;->SD2_at_DiaryLocations
						For ($_l_LocationsIndex; 1; Size of array:C274(SD2_aI_DiaryLocationsSEL))
							If (Size of array:C274(SD2_AL_DiaryTypeSettings{$_l_ActionTypeRow})>=$_l_LocationsIndex)
								$_l_LocationRow:=Find in array:C230(SD2_al_DiaryLocations; SD2_AL_DiaryTypeSettings{$_l_ActionTypeRow}{$_l_LocationsIndex})
								If ($_l_LocationRow>0)  //it should be
									SD2_aI_DiaryLocationsSEL{$_l_LocationRow}:=1
									SD2_abo_DiaryLocationsSEL{$_l_LocationRow}:=(SD2_aI_DiaryLocationsSEL{$_l_LocationRow}=1)
								End if 
							End if 
						End for 
						$_l_LocationRow:=Find in array:C230(SD2_al_DiaryLocations; 1)  //because these are hard coded IDS
						$_l_ShowThread:=0
						If ($_l_LocationRow>0)
							//$_l_ShowThread:=SD2_aI_DiaryLocationsSEL{$_l_LocationRow}
							If ($_l_ShowThread=0)
								$_l_LocationRow:=Find in array:C230(SD2_al_DiaryLocations; 2)
								If ($_l_LocationRow>0)
									$_l_ShowThread:=SD2_aI_DiaryLocationsSEL{$_l_LocationRow}
								End if 
							End if 
						End if 
						If ($_l_ShowThread>0)
							SD2_l_CBThreaded:=SD2_al_DiaryTypeThreaded{$_l_ActionTypeRow}
							sRB_l_Original:=SD2_al_DiaryTypeOriginal{$_l_ActionTypeRow}
							sRB_l_Diary:=SD2_al_DiaryTypeDiary{$_l_ActionTypeRow}
							If (sRB_l_Original=1)
								$_bo_SetFormNames:=True:C214
							Else 
								$_bo_SetFormNames:=True:C214
							End if 
							OBJECT SET VISIBLE:C603(SD2_l_CBThreaded; True:C214)
							OBJECT SET VISIBLE:C603(sRB_l_Original; True:C214)
							OBJECT SET VISIBLE:C603(sRB_l_Diary; True:C214)
						Else 
							OBJECT SET VISIBLE:C603(SD2_l_CBThreaded; False:C215)
							OBJECT SET VISIBLE:C603(sRB_l_Original; False:C215)
							OBJECT SET VISIBLE:C603(sRB_l_Diary; False:C215)
							$_bo_SetFormNames:=True:C214
						End if 
						
						
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
						OBJECT GET COORDINATES:C663(*; "oLBActionLocations"; $_l_LBLeft; $_l_LBTop; $_l_LBRight; $_l_LBBottom)
						OBJECT GET COORDINATES:C663(*; "oTabBox"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
						$_l_SpaceRequired:=286+10+10
						$_l_SpaceFree:=$_l_WindowWidth-($_l_LBRight-$_l_WindowLeft)
						$_l_LBTop:=$_l_ObjectTop
						If ($_l_ShowThread=0)
							OBJECT SET VISIBLE:C603(SD2_lb_ActionStatus; False:C215)
							OBJECT SET VISIBLE:C603(*; "oStatusEdit"; False:C215)
							
							$_l_SpaceRequired:=10
							$_l_SpaceFree:=$_l_WindowWidth-$_l_LBRight
							If ($_l_SpaceFree>$_l_SpaceRequired)
								SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowLeft+($_l_ObjectRight+$_l_SpaceRequired); $_l_WindowBottom)
							End if 
							OBJECT GET COORDINATES:C663(*; "oLBActionLocations"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
							OBJECT GET COORDINATES:C663(*; "oStatusEdit"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_ButtonBottom)
							$_l_ButtonWidth:=$_l_ButtonRight-$_l_ButtonLeft
							$_l_ButtonHeight:=$_l_ButtonBottom-$_l_ButtonTop
							OBJECT MOVE:C664(*; "oWorkflowBehaviour"; $_l_ObjectRight+10; $_l_ObjectTop; ($_l_ObjectRight+10); ($_l_LBTop-5)-($_l_ButtonHeight+5); *)
							OBJECT MOVE:C664(*; "oStatusEdit"; (($_l_ObjectRight+10))-$_l_ButtonWidth; ($_l_LBTop-5)-($_l_ButtonHeight); ($_l_ObjectRight+10); ($_l_LBTop-5); *)
							
						Else 
							OBJECT SET VISIBLE:C603(SD2_lb_ActionStatus; True:C214)
							OBJECT SET VISIBLE:C603(*; "oStatusEdit"; True:C214)
							$_l_SpaceRequired:=286+10+10
							$_l_SpaceFree:=$_l_WindowWidth-$_l_LBRight
							If ($_l_SpaceFree<$_l_SpaceRequired)
								SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowLeft+($_l_LBRight+$_l_SpaceRequired); $_l_WindowBottom)
							End if 
							OBJECT GET COORDINATES:C663(*; "oDiaryLocations"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
							OBJECT GET COORDINATES:C663(*; "oStatusEdit"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_ButtonBottom)
							$_l_ButtonWidth:=$_l_ButtonRight-$_l_ButtonLeft
							$_l_ButtonHeight:=$_l_ButtonBottom-$_l_ButtonTop
							OBJECT MOVE:C664(*; "oWorkflowBehaviour"; $_l_ObjectRight+10; $_l_ObjectTop; ($_l_ObjectRight+10)+286; ($_l_LBTop-5)-($_l_ButtonHeight+5); *)
							OBJECT MOVE:C664(*; "oStatusEdit"; (($_l_ObjectRight+10)+286)-$_l_ButtonWidth; ($_l_LBTop-5)-($_l_ButtonHeight); ($_l_ObjectRight+10)+286; ($_l_LBTop-5); *)
							
						End if 
						
						
						
						
						$_l_ShowPost:=0
						$_l_LocationRow:=Find in array:C230(SD2_al_DiaryLocations; 3)  //because these are hard coded IDS
						If ($_l_LocationRow>0)
							$_l_ShowPost:=SD2_aI_DiaryLocationsSEL{$_l_LocationRow}
						End if 
						If ($_l_ShowPost>0)
							$_bo_SetFormNames:=True:C214
							SD2_l_CBPostAction:=SD2_al_DiaryDone{$_l_ActionTypeRow}
						Else 
							$_bo_SetFormNames:=True:C214
							OBJECT SET VISIBLE:C603(SD2_l_CBThreaded; False:C215)
						End if 
						
					Else 
						SD2_l_CurrentDiaryType:=0
						
					End if 
					If (SD2_l_CBThreaded=1)
						//OBJECT SET VISIBLE(*;"oThreadOption";True)
						//Set the available forms to use here
					Else 
						//OBJECT SET VISIBLE(*;"oThreadOption";False)
						//Set the available forms to use here
					End if 
					//Other objects to be hidden/disabled here.
					If ($_bo_SetFormNames)
						SD2_LoadDiaryFormNames(SD2_l_CBPostAction; sRB_l_Original; SD2_t_EntryForm; ->SD2_al_rTableNUMs)
						
					End if 
				End if 
				
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Variable2"; $_t_oldMethodName)

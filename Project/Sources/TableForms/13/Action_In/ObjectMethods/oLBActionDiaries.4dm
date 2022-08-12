If (False:C215)
	//object Name: [ACTIONS]Action_In.oLBActionDiaries
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
	//ARRAY BOOLEAN(LOC_lb_Actionviewin;0)
	//ARRAY BOOLEAN(SD2_abo_DiaryLocationsSEL;0)
	//ARRAY BOOLEAN(SD2_lb_ActionStatus;0)
	//ARRAY INTEGER(SD2_ai_DiaryLocationsSEL;0)
	//ARRAY TEXT(SD_at_Nonmodifiable;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	C_BOOLEAN:C305($_bo_ShowWorkflowStatus; $_bo_Stop)
	C_LONGINT:C283($_l_ButtonBottom; $_l_ButtonHeight; $_l_ButtonLeft; $_l_ButtonRight; $_l_ButtonTop; $_l_ButtonWidth; $_l_ColumnNumber; $_l_event; $_l_LBBottom; $_l_LBLeft; $_l_LBRIght)
	C_LONGINT:C283($_l_LBTop; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_Row; $_l_SpaceFree; $_l_SpaceRequired; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_windowTop; $_l_WindowWidth; $_l_WorflowRow)
	C_TEXT:C284($_t_oldMethodName; SD_t_ViewActionClassNM)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.oLBActionLocations"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(LOC_lb_Actionviewin; $_l_ColumnNumber; $_l_Row)
		
		If ($_l_Row>0)
			If (SD_t_ViewActionClassNM#"")
				$_bo_Stop:=(Find in array:C230(SD_at_Nonmodifiable; SD_t_ViewActionClassNM)>0)
			Else 
				$_bo_Stop:=False:C215
			End if 
			
			LISTBOX SELECT ROW:C912(LOC_lb_Actionviewin; $_l_Row)
			If (Not:C34($_bo_Stop))
				SD2_abo_DiaryLocationsSEL{$_l_Row}:=Not:C34(SD2_abo_DiaryLocationsSEL{$_l_Row})
				
				//If ($_l_ColumnNumber=1)
				SD2_ai_DiaryLocationsSEL{$_l_Row}:=Num:C11(SD2_abo_DiaryLocationsSEL{$_l_Row})
				SD2_abo_DiaryLocationsSEL{$_l_Row}:=(SD2_ai_DiaryLocationsSEL{$_l_Row}=1)
				
				//End if
				//SD2_ai_DiaryLocationsSEL{$_l_Row}:=(Abs(SD2_ai_DiaryLocationsSEL{$_l_Row}-1))
				$_l_WorflowRow:=Find in array:C230(SD2_at_DiaryLocations; "Workflow")
				$_bo_ShowWorkflowStatus:=False:C215
				If ($_l_WorflowRow>0)
					If (SD2_aI_DiaryLocationsSEL{$_l_WorflowRow}=1)
						$_bo_ShowWorkflowStatus:=True:C214
					End if 
				End if 
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
				OBJECT GET COORDINATES:C663(*; "oLBActionLocations"; $_l_LBLeft; $_l_LBTop; $_l_LBRIght; $_l_LBBottom)
				OBJECT GET COORDINATES:C663(*; "oTabBox"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_SpaceRequired:=286+10+10
				$_l_SpaceFree:=$_l_WindowWidth-($_l_LBRIght-$_l_WindowLeft)
				$_l_LBTop:=$_l_ObjectTop
				If (Not:C34($_bo_ShowWorkflowStatus))
					OBJECT SET VISIBLE:C603(SD2_lb_ActionStatus; False:C215)
					OBJECT SET VISIBLE:C603(*; "oStatusEdit"; False:C215)
					
					$_l_SpaceRequired:=10
					$_l_SpaceFree:=$_l_WindowWidth-$_l_LBRIght
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
					$_l_SpaceFree:=$_l_WindowWidth-$_l_LBRIght
					If ($_l_SpaceFree<$_l_SpaceRequired)
						SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowLeft+($_l_LBRIght+$_l_SpaceRequired); $_l_WindowBottom)
					End if 
					OBJECT GET COORDINATES:C663(*; "oLBActionLocations"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					OBJECT GET COORDINATES:C663(*; "oStatusEdit"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_ButtonBottom)
					$_l_ButtonWidth:=$_l_ButtonRight-$_l_ButtonLeft
					$_l_ButtonHeight:=$_l_ButtonBottom-$_l_ButtonTop
					OBJECT MOVE:C664(*; "oWorkflowBehaviour"; $_l_ObjectRight+10; $_l_ObjectTop; ($_l_ObjectRight+10)+286; ($_l_LBTop-5)-($_l_ButtonHeight+5); *)
					OBJECT MOVE:C664(*; "oStatusEdit"; (($_l_ObjectRight+10)+286)-$_l_ButtonWidth; ($_l_LBTop-5)-($_l_ButtonHeight); ($_l_ObjectRight+10)+286; ($_l_LBTop-5); *)
					
				End if 
				
				
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.oLBActionLocations"; $_t_oldMethodName)

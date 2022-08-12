If (False:C215)
	//object Method Name: Object Name:      [ACTIONS].Action_In.oLBActionLocations
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
	C_LONGINT:C283($_l_ActionLBBottom; $_l_ActionLBLeft; $_l_ActionLBRight; $_l_ActionLBTop; $_l_ButtonHeight; $_l_ButtonWidth; $_l_ColumnNumber; $_l_FormEvent; $_l_NextObjectBottom; $_l_NextObjectLeft; $_l_NextObjectRight)
	C_LONGINT:C283($_l_NextObjectTop; $_l_RowNumber; $_l_SpaceFree; $_l_SpaceRequired; $_l_StatusButtonBottom; $_l_StatusButtonLeft; $_l_StatusButtonRight; $_l_StatusButtonTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_WindowTop; $_l_WindowWidth; $_l_WorflowPosition)
	C_TEXT:C284($_t_oldMethodName; SD_t_ViewActionClassNM)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.oLBActionLocations"; Form event code:C388)

$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(LOC_lb_Actionviewin; $_l_ColumnNumber; $_l_RowNumber)
		
		If ($_l_RowNumber>0)
			If (SD_t_ViewActionClassNM#"")
				$_bo_Stop:=(Find in array:C230(SD_at_Nonmodifiable; SD_t_ViewActionClassNM)>0)
			Else 
				$_bo_Stop:=False:C215
			End if 
			
			LISTBOX SELECT ROW:C912(LOC_lb_Actionviewin; $_l_RowNumber)
			If (Not:C34($_bo_Stop))
				SD2_abo_DiaryLocationsSEL{$_l_RowNumber}:=Not:C34(SD2_abo_DiaryLocationsSEL{$_l_RowNumber})
				
				//If ($_l_ColumnNumber=1)
				SD2_ai_DiaryLocationsSEL{$_l_RowNumber}:=Num:C11(SD2_abo_DiaryLocationsSEL{$_l_RowNumber})
				SD2_abo_DiaryLocationsSEL{$_l_RowNumber}:=(SD2_ai_DiaryLocationsSEL{$_l_RowNumber}=1)
				
				//End if
				//SD2_ai_DiaryLocationsSEL{$_l_RowNumber}:=(Abs(SD2_ai_DiaryLocationsSEL{$_l_RowNumber}-1))
				$_l_WorflowPosition:=Find in array:C230(SD2_at_DiaryLocations; "Workflow")
				$_bo_ShowWorkflowStatus:=False:C215
				If ($_l_WorflowPosition>0)
					If (SD2_aI_DiaryLocationsSEL{$_l_WorflowPosition}=1)
						$_bo_ShowWorkflowStatus:=True:C214
					End if 
				End if 
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
				OBJECT GET COORDINATES:C663(*; "oLBActionLocations"; $_l_NextObjectLeft; $_l_NextObjectTop; $_l_NextObjectRight; $_l_NextObjectBottom)
				OBJECT GET COORDINATES:C663(*; "oTabBox"; $_l_ActionLBLeft; $_l_ActionLBTop; $_l_ActionLBRight; $_l_ActionLBBottom)
				$_l_SpaceRequired:=286+10+10
				$_l_SpaceFree:=$_l_WindowWidth-($_l_NextObjectRight-$_l_WindowLeft)
				$_l_NextObjectTop:=$_l_ActionLBTop
				If (Not:C34($_bo_ShowWorkflowStatus))
					OBJECT SET VISIBLE:C603(SD2_lb_ActionStatus; False:C215)
					OBJECT SET VISIBLE:C603(*; "oStatusEdit"; False:C215)
					
					$_l_SpaceRequired:=10
					$_l_SpaceFree:=$_l_WindowWidth-$_l_NextObjectRight
					If ($_l_SpaceFree>$_l_SpaceRequired)
						SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft+($_l_ActionLBRight+$_l_SpaceRequired); $_l_WindowBottom)
					End if 
					OBJECT GET COORDINATES:C663(*; "oLBActionLocations"; $_l_ActionLBLeft; $_l_ActionLBTop; $_l_ActionLBRight; $_l_ActionLBBottom)
					OBJECT GET COORDINATES:C663(*; "oStatusEdit"; $_l_StatusButtonLeft; $_l_StatusButtonTop; $_l_StatusButtonRight; $_l_StatusButtonBottom)
					$_l_ButtonWidth:=$_l_StatusButtonRight-$_l_StatusButtonLeft
					$_l_ButtonHeight:=$_l_StatusButtonBottom-$_l_StatusButtonTop
					OBJECT MOVE:C664(*; "oWorkflowBehaviour"; $_l_ActionLBRight+10; $_l_ActionLBTop; ($_l_ActionLBRight+10); ($_l_NextObjectTop-5)-($_l_ButtonHeight+5); *)
					OBJECT MOVE:C664(*; "oStatusEdit"; (($_l_ActionLBRight+10))-$_l_ButtonWidth; ($_l_NextObjectTop-5)-($_l_ButtonHeight); ($_l_ActionLBRight+10); ($_l_NextObjectTop-5); *)
					
				Else 
					OBJECT SET VISIBLE:C603(SD2_lb_ActionStatus; True:C214)
					OBJECT SET VISIBLE:C603(*; "oStatusEdit"; True:C214)
					$_l_SpaceRequired:=286+10+10
					$_l_SpaceFree:=$_l_WindowWidth-$_l_NextObjectRight
					If ($_l_SpaceFree<$_l_SpaceRequired)
						SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft+($_l_NextObjectRight+$_l_SpaceRequired); $_l_WindowBottom)
					End if 
					OBJECT GET COORDINATES:C663(*; "oLBActionLocations"; $_l_ActionLBLeft; $_l_ActionLBTop; $_l_ActionLBRight; $_l_ActionLBBottom)
					OBJECT GET COORDINATES:C663(*; "oStatusEdit"; $_l_StatusButtonLeft; $_l_StatusButtonTop; $_l_StatusButtonRight; $_l_StatusButtonBottom)
					$_l_ButtonWidth:=$_l_StatusButtonRight-$_l_StatusButtonLeft
					$_l_ButtonHeight:=$_l_StatusButtonBottom-$_l_StatusButtonTop
					OBJECT MOVE:C664(*; "oWorkflowBehaviour"; $_l_ActionLBRight+10; $_l_ActionLBTop; ($_l_ActionLBRight+10)+286; ($_l_NextObjectTop-5)-($_l_ButtonHeight+5); *)
					OBJECT MOVE:C664(*; "oStatusEdit"; (($_l_ActionLBRight+10)+286)-$_l_ButtonWidth; ($_l_NextObjectTop-5)-($_l_ButtonHeight); ($_l_ActionLBRight+10)+286; ($_l_NextObjectTop-5); *)
					
				End if 
				
				
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.oLBActionLocations"; $_t_oldMethodName)

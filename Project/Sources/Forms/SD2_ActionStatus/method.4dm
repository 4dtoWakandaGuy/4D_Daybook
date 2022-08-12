If (False:C215)
	//Project Form Method Name: SD2_ActionStatus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/01/2013 23:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_StatusApplied;0)
	//ARRAY BOOLEAN(SD2_lb_StatusSettings;0)
	//ARRAY LONGINT(S2_al_ActionStatusIDS;0)
	//ARRAY LONGINT(SD2_al_ActionColours;0)
	//ARRAY LONGINT(SD2_al_ActionTime;0)
	//ARRAY LONGINT(SD2_al_ActionTymeType;0)
	//ARRAY LONGINT(SD2_al_StatusRGB;0)
	//ARRAY LONGINT(SD2_al_StatusTime;0)
	//ARRAY LONGINT(SD2_al_WorkflowStatus;0)
	//ARRAY PICTURE(SD2_apic_StatusColour;0)
	//ARRAY TEXT(SD2_at_aimePopup;0)
	//ARRAY TEXT(SD2_at_StatusTimes;0)
	//ARRAY TEXT(SD2_at_WorkflowStatus;0)
	C_BOOLEAN:C305($_bo_ShowTrimmings; DB_bo_NoLoad; SD_bo_ShowEmptyTimings; SD2_ab_EditedSettings)
	C_LONGINT:C283($_l_Colour; $_l_event; $_l_Height; $_l_Index; $_l_WFRow; $_l_Width; SD2_l_ActionStatusList; SD2_l_BUT1; SD2_l_But2; SD2_l_BUT3; SD2_l_BUT4)
	C_LONGINT:C283(SD2_l_BUT5; SD2_l_BUT6; SD2_l_BUT7; SD2_l_BUT8; SD2_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; SD2_t_ActionName; SD2_t_COL1; SD2_t_COL2; SD2_t_COL3; SD2_t_COL4; SD2_t_COL5; SD2_t_COL6; SD2_t_COL7; SD2_t_COL8; SD2_t_COL9)
	C_TEXT:C284(SD2_t_HED1; SD2_t_HED2; SD2_t_HED3; SD2_t_HED4; SD2_t_HED5; SD2_t_HED6; SD2_t_HED7; SD2_t_HED8; SD2_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM SD2_ActionStatus"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		//ARRAY LONGINT(SD2_al_ActionColours;0)
		//`ARRAY LONGINT(S2_al_ActionStatusIDS;0)
		
		ARRAY TEXT:C222(SD2_at_WorkflowStatus; 0)
		ARRAY LONGINT:C221(SD2_al_WorkflowStatus; 0)
		
		SD2_l_ActionStatusList:=AA_LoadListByName("Action Status"; ->SD2_at_WorkflowStatus; ->SD2_al_WorkflowStatus)
		If (Size of array:C274(SD2_at_WorkflowStatus)=0)
			AA_ListAddItembyID(SD2_l_ActionStatusList; "Awaiting Action"; "Overdue"; "Urgent")
			SD2_l_ActionStatusList:=AA_LoadListByName("Action Status"; ->SD2_at_WorkflowStatus; ->SD2_al_WorkflowStatus)
			
		End if 
		If (SD2_t_ActionName="")
			OBJECT SET VISIBLE:C603(*; "oHeaderLabel"; False:C215)
		End if 
		ARRAY BOOLEAN:C223(SD2_abo_StatusApplied; 0)
		ARRAY BOOLEAN:C223(SD2_abo_StatusApplied; Size of array:C274(SD2_at_WorkflowStatus))
		ARRAY PICTURE:C279(SD2_apic_StatusColour; 0)
		ARRAY PICTURE:C279(SD2_apic_StatusColour; Size of array:C274(SD2_at_WorkflowStatus))
		ARRAY LONGINT:C221(SD2_al_StatusRGB; 0)
		ARRAY LONGINT:C221(SD2_al_StatusRGB; Size of array:C274(SD2_at_WorkflowStatus))
		ARRAY TEXT:C222(SD2_at_StatusTimes; 0)
		ARRAY LONGINT:C221(SD2_al_StatusTime; 0)
		
		//if we have been passed an array of applicable status and colours we can show them
		If (Size of array:C274(S2_al_ActionStatusIDS)>0)
			For ($_l_Index; 1; Size of array:C274(S2_al_ActionStatusIDS))
				$_l_WFRow:=Find in array:C230(SD2_al_WorkflowStatus; S2_al_ActionStatusIDS{$_l_Index})
				If ($_l_WFRow>0)
					SD2_abo_StatusApplied{$_l_WFRow}:=True:C214
					$_l_Colour:=-(0+(256*(SD2_al_ActionColours{$_l_Index})))
					SD2_al_StatusRGB{$_l_WFRow}:=SD2_al_ActionColours{$_l_Index}
					SD2_apic_StatusColour{$_l_WFRow}:=SD2_PicMakeSVGcircle(SD2_al_StatusRGB{$_l_WFRow}; 88; 12)
				End if 
			End for 
		End if 
		$_bo_ShowTrimmings:=SD_bo_ShowEmptyTimings
		ARRAY TEXT:C222(SD2_at_aimePopup; 3)
		SD2_at_aimePopup{1}:="Mins"
		SD2_at_aimePopup{2}:="Hrs"
		SD2_at_aimePopup{3}:="Days"
		ARRAY TEXT:C222(SD2_at_StatusTimes; Size of array:C274(SD2_al_StatusRGB))
		ARRAY LONGINT:C221(SD2_al_StatusTime; Size of array:C274(SD2_al_StatusRGB))
		If (Size of array:C274(SD2_al_ActionTime)>0)
			$_bo_ShowTrimmings:=True:C214
			For ($_l_Index; 1; Size of array:C274(SD2_al_ActionTymeType))
				Case of 
					: (SD2_al_ActionTymeType{$_l_Index}=0)
						SD2_at_StatusTimes{$_l_Index}:="Mins"
					: (SD2_al_ActionTymeType{$_l_Index}=1)
						SD2_at_StatusTimes{$_l_Index}:="Days"
					: (SD2_al_ActionTymeType{$_l_Index}=3)
						SD2_at_StatusTimes{$_l_Index}:="Hours"
				End case 
				SD2_al_StatusTime{$_l_Index}:=SD2_al_ActionTime{$_l_Index}
			End for 
			
		End if 
		$_l_Height:=(272-195)+12*(Size of array:C274(SD2_al_StatusTime))
		
		
		LB_SetupListbox(->SD2_lb_StatusSettings; "SD2_t"; "SD2_L"; 1; ->SD2_abo_StatusApplied; ->SD2_at_WorkflowStatus; ->SD2_apic_StatusColour; ->SD2_al_StatusTime; ->SD2_at_StatusTimes; ->SD2_al_StatusRGB; ->SD2_al_WorkflowStatus)
		
		
		LB_SetColumnHeaders(->SD2_lb_StatusSettings; "SD2_L"; 1; "Apply"; "Name"; "Color"; "Time"; "TimeType"; "ColourNum"; "StatusID")
		LB_SetEnterable(->SD2_lb_StatusSettings; False:C215; 0)
		LB_SetEnterable(->SD2_lb_StatusSettings; True:C214; 1)
		LB_SetEnterable(->SD2_lb_StatusSettings; True:C214; 3)
		If ($_bo_ShowTrimmings)
			LB_SetChoiceList("WFtimes"; ->SD2_at_aimePopup; ->SD2_at_StatusTimes)
			LB_SetColumnWidths(->SD2_lb_StatusSettings; "SD2_t"; 1; 87; 187; 88; 50; 100; 2; 0)
			$_l_Width:=(459-355)+(87+187+88+50+100+20)+10
			WS_AutoscreenSize(3; $_l_Height; $_l_Width)
			LB_SetEnterable(->SD2_lb_StatusSettings; True:C214; 4)
			LB_SetEnterable(->SD2_lb_StatusSettings; True:C214; 5)
		Else 
			LB_SetColumnWidths(->SD2_lb_StatusSettings; "SD2_t"; 1; 87; 187; 88; 0; 0; 0; 0)
			$_l_Width:=(459-355)+(87+187+88)+10
			WS_AutoscreenSize(3; $_l_Height; $_l_Width)
		End if 
		LB_SetScroll(->SD2_lb_StatusSettings; -3; -2)
		LB_StyleSettings(->SD2_lb_StatusSettings; "Black"; 9; "SD2_t"; ->[DIARY:12])
		INT_SetDialog
		SD2_ab_EditedSettings:=False:C215
		
		
		
End case 
ERR_MethodTrackerReturn("FM SD2_ActionStatus"; $_t_oldMethodName)

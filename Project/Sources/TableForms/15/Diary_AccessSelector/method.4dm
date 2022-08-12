If (False:C215)
	//Table Form Method Name: Object Name:      [USER].Diary_AccessSelector
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DA_lb_PerSelectP1;0)
	//ARRAY BOOLEAN(DA_LB_PerSelectP2;0)
	//ARRAY BOOLEAN(DA_lb_PerSelectP3;0)
	//ARRAY BOOLEAN(WS_abo_GroupsSelected;0)
	//ARRAY BOOLEAN(WS_abo_Selected;0)
	//ARRAY LONGINT(SD3_al_SelectedDiaryOwners;0)
	//ARRAY LONGINT(WS_al_SelectedSetGroups;0)
	//ARRAY TEXT(SM_at_SendSetControl;0)
	//ARRAY TEXT(WS_at_DiaryOwnersPeople;0)
	//ARRAY TEXT(WS_at_PersonellGroupName;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; $_l_MaxHeight; $_l_personindex; $_l_WindowHeight; DA_l_BUT1; DA_l_But2; DA_l_BUT3; DA_l_BUT4; DA_l_BUT5; DA_l_BUT6)
	C_LONGINT:C283(DA_l_BUT7; DA_l_BUT8; DA_l_BUT9; DA2_l_BUT1; DA2_l_But2; DA2_l_BUT3; DA2_l_BUT4; DA2_l_BUT5; DA2_l_BUT6; DA2_l_BUT7; DA2_l_BUT8)
	C_LONGINT:C283(DA2_l_BUT9; SM_CB_l_RetainList; SM_l_SetSend)
	C_OBJECT:C1216($_Obj_GetUser)
	C_TEXT:C284(<>PER_t_CurrentUserName; $_t_oldMethodName; DA_t_COL1; DA_t_COL2; DA_t_COL3; DA_t_COL4; DA_t_COL5; DA_t_COL6; DA_t_COL7; DA_t_COL8; DA_t_COL9)
	C_TEXT:C284(DA_t_HED1; DA_t_HED2; DA_t_HED3; DA_t_HED4; DA_t_HED5; DA_t_HED6; DA_t_HED7; DA_t_HED8; DA_t_HED9; DA2_t_COL1; DA2_t_COL2)
	C_TEXT:C284(DA2_t_COL3; DA2_t_COL4; DA2_t_COL5; DA2_t_COL6; DA2_t_COL7; DA2_t_COL8; DA2_t_COL9; DA2_t_HED1; DA2_t_HED2; DA2_t_HED3; DA2_t_HED4)
	C_TEXT:C284(DA2_t_HED5; DA2_t_HED6; DA2_t_HED7; DA2_t_HED8; DA2_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].Diary_AccessSelector"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "Diary_AccessSelector")
		WS_at_DiaryOwnersPeople:=0
		INT_SetLongintCheckFormat(->SD3_al_SelectedDiaryOwners)
		INT_SetLongintCheckFormat(->WS_al_SelectedSetGroups)
		$_Obj_GetUser:=New object:C1471("personID"; <>PER_l_CurrentUserID; "userName"; "")  //<-this is not right
		
		SYS_GetCurrentUserSetting($_Obj_GetUser)
		OBJECT SET TITLE:C194(*; "oRetainCheckbox"; "Retain List for "+$_Obj_GetUser.userName)
		OBJECT SET TITLE:C194(*; "oRetainCheckbox2"; "Retain List for "+$_Obj_GetUser.userName)
		$_l_MaxHeight:=Screen height:C188-100
		If (SM_l_SetSend=1)
			ARRAY TEXT:C222(SM_at_SendSetControl; 2)
			SM_at_SendSetControl{1}:="People"
			SM_at_SendSetControl{2}:="Groups"
			SM_at_SendSetControl:=1
			OBJECT SET TITLE:C194(SM_CB_l_RetainList; "Retain List for "+$_Obj_GetUser.userName)
			SM_CB_l_RetainList:=1
			SM_l_SetSend:=0
			FORM GOTO PAGE:C247(2)
			ARRAY BOOLEAN:C223(WS_abo_Selected; 0)
			ARRAY BOOLEAN:C223(WS_abo_Selected; Size of array:C274(SD3_al_SelectedDiaryOwners))
			For ($_l_personindex; 1; Size of array:C274(SD3_al_SelectedDiaryOwners))
				WS_abo_Selected{$_l_personindex}:=(SD3_al_SelectedDiaryOwners{$_l_personindex}=1)
			End for 
			ARRAY BOOLEAN:C223(WS_abo_GroupsSelected; 0)
			ARRAY BOOLEAN:C223(WS_abo_GroupsSelected; Size of array:C274(WS_al_SelectedSetGroups))
			For ($_l_personindex; 1; Size of array:C274(WS_al_SelectedSetGroups))
				WS_abo_GroupsSelected{$_l_personindex}:=(WS_al_SelectedSetGroups{$_l_personindex}=1)
			End for 
			
			LB_SetupListbox(->DA_LB_PerSelectP2; "DA_t"; "DA_L"; 1; ->WS_abo_Selected; ->WS_at_DiaryOwnersPeople; ->SD3_al_SelectedDiaryOwners)
			LB_SetColumnHeaders(->DA_LB_PerSelectP2; "DA_L"; 1; "Selected"; "Person"; "selected")
			LB_SetEnterable(->DA_LB_PerSelectP2; False:C215; 0)
			LB_SetEnterable(->DA_LB_PerSelectP2; True:C214; 1)
			LB_SetColumnWidths(->DA_LB_PerSelectP2; "DA_t"; 1; 40; 240; 0)
			LB_SetScroll(->DA_LB_PerSelectP2; -3; -2)
			LB_StyleSettings(->DA_LB_PerSelectP2; "Black"; 9; "DA_t"; ->[COMPANIES:2])
			$_l_WindowHeight:=21*Size of array:C274(WS_at_DiaryOwnersPeople)+57
			If ($_l_WindowHeight<210)
				$_l_WindowHeight:=210
			End if 
			If ($_l_WindowHeight>500)
				$_l_WindowHeight:=500
			End if 
			WS_AutoscreenSize(3; $_l_WindowHeight; 370)
			
			LB_SetupListbox(->DA_lb_PerSelectP3; "DA2_t"; "DA2_L"; 1; ->WS_abo_GroupsSelected; ->WS_at_PersonellGroupName; ->WS_al_SelectedSetGroups)
			LB_SetColumnHeaders(->DA_lb_PerSelectP3; "DA2_L"; 1; "Selected"; "Group"; "selected")
			LB_SetEnterable(->DA_lb_PerSelectP3; False:C215; 0)
			LB_SetEnterable(->DA_lb_PerSelectP3; True:C214; 1)
			LB_SetColumnWidths(->DA_lb_PerSelectP3; "DA2_t"; 1; 40; 240; 0)
			LB_SetScroll(->DA_lb_PerSelectP3; -3; -2)
			LB_StyleSettings(->DA_lb_PerSelectP3; "Black"; 9; "DA2_t"; ->[COMPANIES:2])
		Else 
			ARRAY TEXT:C222(SM_at_SendSetControl; 0)
			LB_SetupListbox(->DA_lb_PerSelectP1; "DA_t"; "DA_L"; 1; ->WS_abo_Selected; ->WS_at_DiaryOwnersPeople; ->SD3_al_SelectedDiaryOwners)
			LB_SetColumnHeaders(->DA_lb_PerSelectP1; "DA_L"; 1; "Selected"; "Person"; "selected")
			LB_SetEnterable(->DA_lb_PerSelectP1; False:C215; 0)
			LB_SetEnterable(->DA_lb_PerSelectP1; True:C214; 1)
			LB_SetColumnWidths(->DA_lb_PerSelectP1; "DA_t"; 1; 40; 240; 0)
			LB_SetScroll(->DA_lb_PerSelectP1; -3; -2)
			LB_StyleSettings(->DA_lb_PerSelectP1; "Black"; 9; "DA_t"; ->[COMPANIES:2])
			$_l_WindowHeight:=21*Size of array:C274(WS_at_DiaryOwnersPeople)+57
			If ($_l_WindowHeight<210)
				$_l_WindowHeight:=210
			End if 
			If ($_l_WindowHeight>500)
				$_l_WindowHeight:=500
			End if 
			WS_AutoscreenSize(3; $_l_WindowHeight; 370)
			
			FORM GOTO PAGE:C247(1)
			
		End if 
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:Diary_AccessSelector"; $_t_oldMethodName)

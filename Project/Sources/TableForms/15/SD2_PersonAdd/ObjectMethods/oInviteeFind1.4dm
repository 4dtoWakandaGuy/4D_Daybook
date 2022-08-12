If (False:C215)
	//object Name: [USER]SD2_PersonAdd.oInviteeFind1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_lb_People;0)
	//ARRAY BOOLEAN(SD2_abo_FoundNameSelect;0)
	//ARRAY BOOLEAN(SD2_lb_CalendersList;0)
	//ARRAY LONGINT(SD2_al_FoundNameCLass;0)
	//ARRAY LONGINT(SD2_al_FoundNameID;0)
	//ARRAY TEXT(SD2_at_FoundDataInfo;0)
	//ARRAY TEXT(SD2_at_FoundNameCode;0)
	//ARRAY TEXT(SD2_at_FoundNames;0)
	C_BOOLEAN:C305(SD2_bo_FindActive; SD2_bo_FindVisible)
	C_LONGINT:C283($_l_AvailableWidth; $_l_ColumnWIdth1; $_l_ColumnWIdth2; $_l_event; $_l_KeepTopAt; $_l_Nul; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectHeight; $_l_ObjectHeight2; $_l_ObjectLeft)
	C_LONGINT:C283($_l_ObjectLeft2; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectTop; $_l_ObjectTop2; $_l_ObjectWidth; $_l_WindowBottom; $_l_WindowHeight; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop)
	C_LONGINT:C283($_l_WindowWidth; SD2_l_winHeight; SD2_l_winWidth; SD2b_l_BUT1; SD2b_l_But2; SD2b_l_BUT3; SD2b_l_BUT4; SD2b_l_BUT5; SD2b_l_BUT6; SD2b_l_BUT7; SD2b_l_BUT8)
	C_LONGINT:C283(SD2b_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; SD2_T_SearchValue; SD2b_t_COL1; SD2b_t_COL2; SD2b_t_COL3; SD2b_t_COL4; SD2b_t_COL5; SD2b_t_COL6; SD2b_t_COL7; SD2b_t_COL8; SD2b_t_COL9)
	C_TEXT:C284(SD2b_t_HED1; SD2b_t_HED2; SD2b_t_HED3; SD2b_t_HED4; SD2b_t_HED5; SD2b_t_HED6; SD2b_t_HED7; SD2b_t_HED8; SD2b_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_PersonAdd.oInviteeFind1"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		OBJECT SET VISIBLE:C603(*; "oSearch@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oFocus@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oRound@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oAddressBook"; True:C214)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_AvailableWidth:=($_l_WindowRight-$_l_WindowLeft)-20
		$_l_ColumnWIdth1:=$_l_AvailableWidth/2
		$_l_ColumnWIdth2:=$_l_AvailableWidth/2
		ARRAY TEXT:C222(SD2_at_FoundNames; 0)
		ARRAY LONGINT:C221(SD2_al_FoundNameCLass; 0)
		ARRAY LONGINT:C221(SD2_al_FoundNameID; 0)
		ARRAY TEXT:C222(SD2_at_FoundNameCode; 0)
		ARRAY TEXT:C222(SD2_at_FoundDataInfo; 0)
		ARRAY BOOLEAN:C223(SD2_abo_FoundNameSelect; 0)
		LB_SetupListbox(->SD_lb_People; "SD2b_t"; "SD2b_L"; 1; ->SD2_abo_FoundNameSelect; ->SD2_at_FoundNames; ->SD2_at_FoundDataInfo; ->SD2_al_FoundNameCLass; ->SD2_al_FoundNameID; ->SD2_at_FoundNameCode)
		LB_SetColumnHeaders(->SD_lb_People; "SD2b_L"; 1; "Select"; "Name"; "Info"; "Class"; "ID"; "Code")
		LB_SetColumnWidths(->SD_lb_People; "SD2b_t"; 1; 0; $_l_ColumnWIdth1; $_l_ColumnWIdth2; 0; 0; 0)
		LB_SetEnterable(->SD_lb_People; False:C215; 0)
		LB_SetEnterable(->SD_lb_People; True:C214; 1)
		LB_SetScroll(->SD_lb_People; -3; -2)
		
		LB_StyleSettings(->SD2_lb_CalendersList; "Black"; 9; "SD2b_t"; ->[DIARY:12])
		LB_Setdividers(->SD_lb_People; 0; 0)  //Both off
		LBI_Scrollonresize(->SD_lb_People)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_WindowHeight:=$_l_WindowBottom-$_l_windowTop
		If ($_l_WindowHeight<260)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_windowTop+260+15)
		End if 
		OBJECT GET COORDINATES:C663(*; "oInvitees"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT GET COORDINATES:C663(*; "oAddressBook"; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectBottom)
		OBJECT MOVE:C664(*; "oAddressBook"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom; *)
		
		LBI_Scrollonresize(->SD_lb_People)
		SD2_bo_FindActive:=True:C214
		SD2_bo_FindVisible:=True:C214
		GOTO OBJECT:C206(SD2_T_SearchValue)
		SET TIMER:C645(0)  //turn off the auto timer
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		OBJECT GET COORDINATES:C663(*; "oBexitInvitees"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		
		$_l_WindowHeight:=$_l_WindowBottom-$_l_windowTop
		$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
		$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop
		$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
		OBJECT GET COORDINATES:C663(*; "oInvitees"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
		
		If (($_l_WindowHeight-$_l_ObjectBottom2)<145)
			$_l_ObjectHeight2:=145-($_l_WindowHeight-$_l_ObjectBottom2)
			Gen_SetobjectPositionByname("oInvitees"; $_l_ObjectTop2; $_l_ObjectLeft2; $_l_ObjectTop2+$_l_ObjectHeight2; $_l_ObjectRight2)
		End if 
		SD2_l_winHeight:=$_l_WindowHeight
		SD2_l_winWidth:=$_l_WindowWidth
		
		Gen_SetobjectPositionByname("oBexitInvitees"; $_l_WindowHeight-($_l_ObjectHeight+10); $_l_WindowWidth-($_l_ObjectWidth+15))
		
		Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oInvitees"; "oRoundArea"; 8; 1; 3)
		Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oInvitees"; "oFocusRing"; 8; 1; 3)
		Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oInvitees"; "oSearchCriteriaButton1"; 8; 1; 9)
		//oSearchCriteria
		Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oInvitees"; "oSearchCriteria"; 8; 1; 11)
		Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oInvitees"; "oSearchvalue"; 8; 1; 11)
		//oSearchClearButton
		Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oInvitees"; "oSearchClearButton"; 8; 1; 11)
		OBJECT GET COORDINATES:C663(*; "oRoundArea"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oRoundArea"; "oAddressBook"; 8; 1; 3)
		
		$_l_Nul:=0
		OBJECT GET COORDINATES:C663(*; "oAddressBook"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_KeepTopAt:=$_l_ObjectTop
		Gen_SetobjectPositionRelativity(->$_l_Nul; ->$_l_Nul; "oBexitInvitees"; "oAddressBook"; 13; 1; 10)
		OBJECT GET COORDINATES:C663(*; "oAddressBook"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		Gen_SetobjectPositionByname("oAddressBook"; $_l_KeepTopAt; 1; $_l_ObjectBottom; $_l_ObjectRight)
		
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_PersonAdd.oInviteeFind1"; $_t_oldMethodName)

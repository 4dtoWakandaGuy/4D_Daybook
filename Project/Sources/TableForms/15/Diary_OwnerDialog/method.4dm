If (False:C215)
	//Table Form Method Name: Object Name:      [USER].Diary_OwnerDialog
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
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(DA_lb_PerSelectP1;0)
	//ARRAY BOOLEAN(WS_abo_Selected;0)
	//ARRAY INTEGER(SD3_al_SelectedDiaryResources;0)
	//ARRAY LONGINT(SD3_al_DiaryOwners_Resources;0)
	//ARRAY LONGINT(SD3_al_DiaryOwnersPersonIDS;0)
	//ARRAY LONGINT(SD3_al_PreSelDiaryItemOwners;0)
	//ARRAY LONGINT(SD3_al_SelectedDiaryOwners;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(SM_at_SendSetControl;0)
	//ARRAY TEXT(WS_at_DiaryOwnersPeople;0)
	//ARRAY TEXT(WS_at_DiaryOwnersResources;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; WS_bo_HideResources)
	C_LONGINT:C283($_l_event; $_l_FormSizeRequired; $_l_Index; $_l_ListboxPeopleSizeRequired; $_l_OBottom; $_l_OLeft; $_l_ORight; $_l_OTop; $_l_PersonRow; DA_l_BUT1; DA_l_But2)
	C_LONGINT:C283(DA_l_BUT3; DA_l_BUT4; DA_l_BUT5; DA_l_BUT6; DA_l_BUT7; DA_l_BUT8; DA_l_BUT9; WS_l_KEYDiaryItemOwner)
	C_TEXT:C284($_t_oldMethodName; DA_t_COL1; DA_t_COL2; DA_t_COL3; DA_t_COL4; DA_t_COL5; DA_t_COL6; DA_t_COL7; DA_t_COL8; DA_t_COL9; DA_t_HED1)
	C_TEXT:C284(DA_t_HED2; DA_t_HED3; DA_t_HED4; DA_t_HED5; DA_t_HED6; DA_t_HED7; DA_t_HED8; DA_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].Diary_OwnerDialog"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "Diary_OwnerDialog")
		
		ARRAY TEXT:C222(WS_at_DiaryOwnersPeople; 0)
		ARRAY LONGINT:C221(SD3_al_DiaryOwnersPersonIDS; 0)
		ARRAY LONGINT:C221(SD3_al_SelectedDiaryOwners; 0)
		ARRAY TEXT:C222(WS_at_DiaryOwnersResources; 0)
		ARRAY LONGINT:C221(SD3_al_DiaryOwners_Resources; 0)
		ARRAY INTEGER:C220(SD3_al_SelectedDiaryResources; 0)
		
		INT_SetLongintCheckFormat(->SD3_al_SelectedDiaryOwners)
		INT_SetLongintCheckFormat(->SD3_al_SelectedDiaryResources)
		
		READ ONLY:C145([PERSONNEL:11])
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38#1; *)
		QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Global_Access:47=False:C215; *)
		QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Startup_List:15=True:C214; *)
		If (WS_l_KEYDiaryItemOwner>0)
			QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Personnel_ID:48#WS_l_KEYDiaryItemOwner)
		Else 
			QUERY:C277([PERSONNEL:11])
		End if 
		SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; SD3_al_DiaryOwnersPersonIDS; [PERSONNEL:11]Name:2; WS_at_DiaryOwnersPeople)
		ARRAY LONGINT:C221(SD3_al_SelectedDiaryOwners; Size of array:C274(SD3_al_DiaryOwnersPersonIDS))
		For ($_l_Index; 1; Size of array:C274(SD3_al_PreSelDiaryItemOwners))
			$_l_PersonRow:=Find in array:C230(SD3_al_DiaryOwnersPersonIDS; SD3_al_PreSelDiaryItemOwners{$_l_Index})
			If ($_l_PersonRow>0)
				SD3_al_SelectedDiaryOwners{$_l_PersonRow}:=1
			End if 
		End for 
		SORT ARRAY:C229(WS_at_DiaryOwnersPeople; SD3_al_DiaryOwnersPersonIDS; SD3_al_SelectedDiaryOwners)
		ARRAY TEXT:C222(SM_at_SendSetControl; 0)
		ARRAY BOOLEAN:C223(WS_abo_Selected; 0)
		ARRAY BOOLEAN:C223(WS_abo_Selected; Size of array:C274(WS_at_DiaryOwnersPeople))
		LB_SetupListbox(->DA_lb_PerSelectP1; "DA_t"; "DA_L"; 1; ->WS_abo_Selected; ->WS_at_DiaryOwnersPeople; ->SD3_al_SelectedDiaryOwners)
		LB_SetColumnHeaders(->DA_lb_PerSelectP1; "DA_L"; 1; "Selected"; "Person"; "selected")
		LB_SetEnterable(->DA_lb_PerSelectP1; False:C215; 0)
		LB_SetEnterable(->DA_lb_PerSelectP1; True:C214; 1)
		LB_SetColumnWidths(->DA_lb_PerSelectP1; "DA_t"; 1; 40; 240; 0)
		LB_SetScroll(->DA_lb_PerSelectP1; -3; -2)
		LB_StyleSettings(->DA_lb_PerSelectP1; "Black"; 9; "DA_t"; ->[COMPANIES:2])
		$_l_FormSizeRequired:=21*Size of array:C274(WS_at_DiaryOwnersPeople)+57
		$_l_ListboxPeopleSizeRequired:=21*Size of array:C274(WS_at_DiaryOwnersPeople)
		If ($_l_ListboxPeopleSizeRequired<153)
			$_l_ListboxPeopleSizeRequired:=153
		End if 
		If ($_l_ListboxPeopleSizeRequired>(500-57))
			$_l_ListboxPeopleSizeRequired:=(500-57)
		End if 
		If ($_l_FormSizeRequired<210)
			$_l_FormSizeRequired:=210
		End if 
		If ($_l_FormSizeRequired>500)
			$_l_FormSizeRequired:=500
		End if 
		//ARRAY TEXT($_at_ColumnNames;0)
		///ARRAY TEXT($_at_HeaderNames;0)
		//ARRAY POINTER($_aptr_ColumnVariables;0)
		//ARRAY POINTER($_aptr_HeaderVariables;0)
		//ARRAY BOOLEAN($_abo_ColumnsVisible;0)
		//ARRAY POINTER($_aptr_ColumnStyles;0)
		//LISTBOX GET ARRAYS(*;"OLBDiary";$_at_ColumnNames;$_at_HeaderNames;$_aptr_ColumnVariables;$_aptr_HeaderVariables;$_abo_ColumnsVisible;$_aptr_ColumnStyles)
		//TRACE
		
		
		WS_AutoscreenSize(3; $_l_FormSizeRequired; 370)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38#1; *)
		QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Global_Access:47=True:C214; *)
		If (WS_l_KEYDiaryItemOwner>0)
			QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Personnel_ID:48#WS_l_KEYDiaryItemOwner)
		Else 
			QUERY:C277([PERSONNEL:11])
		End if 
		SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; SD3_al_DiaryOwners_Resources; [PERSONNEL:11]Name:2; WS_at_DiaryOwnersResources)
		ARRAY INTEGER:C220(SD3_al_SelectedDiaryResources; Size of array:C274(SD3_al_DiaryOwners_Resources))
		For ($_l_Index; 1; Size of array:C274(SD3_al_PreSelDiaryItemOwners))
			$_l_PersonRow:=Find in array:C230(SD3_al_DiaryOwners_Resources; SD3_al_PreSelDiaryItemOwners{$_l_Index})
			If ($_l_PersonRow>0)
				SD3_al_SelectedDiaryResources{$_l_PersonRow}:=1
			End if 
		End for 
		SORT ARRAY:C229(WS_at_DiaryOwnersResources; SD3_al_DiaryOwners_Resources; SD3_al_SelectedDiaryResources)
		If (Size of array:C274(SD3_al_DiaryOwners_Resources)>0) & (WS_bo_HideResources=False:C215)
			WS_AutoscreenSize(3; 390; 370)
			//FORM GOTO PAGE(2)
			OBJECT GET COORDINATES:C663(*; "OLBDiary"; $_l_OLeft; $_l_OTop; $_l_ORight; $_l_OBottom)
			OBJECT SET COORDINATES:C1248(*; "OLBDiary"; $_l_OLeft; $_l_OTop; $_l_ORight; $_l_OTOp+$_l_ListboxPeopleSizeRequired)
			
		Else 
			WS_AutoscreenSize(3; 220; 370)
			FORM GOTO PAGE:C247(2)
			OBJECT GET COORDINATES:C663(*; "OLBDiary"; $_l_OLeft; $_l_OTop; $_l_ORight; $_l_OBottom)
			OBJECT SET COORDINATES:C1248(*; "OLBDiary"; $_l_OLeft; $_l_OTop; $_l_ORight; $_l_OTOp+$_l_ListboxPeopleSizeRequired)
			
		End if 
		WS_bo_HideResources:=False:C215
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:Diary_OwnerDialog"; $_t_oldMethodName)

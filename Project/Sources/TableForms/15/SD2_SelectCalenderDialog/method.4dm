If (False:C215)
	//Table Form Method Name: [USER]SD2_SelectCalenderDialog
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/10/2012 11:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_Lb_DiaryOwnersPeople;0)
	//ARRAY BOOLEAN(SD2_Lb_DiaryOwnersResource;0)
	//ARRAY LONGINT(SD_al_PersonClass;0)
	//ARRAY TEXT(SD_at_DiaryOwners;0)
	//ARRAY TEXT(SD_at_PersonInitials;0)
	//ARRAY TEXT(SD2_at_DiaryOwnersPeople;0)
	//ARRAY TEXT(SD2_at_DiaryOwnersResources;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_PersonIndex; TC2_l_BUT1; TC2_l_But2; TC2_l_BUT3; TC2_l_BUT4; TC2_l_BUT5; TC2_l_BUT6; TC2_l_BUT7; TC2_l_BUT8; TC2_l_BUT9)
	C_LONGINT:C283(TC3_l_BUT1; TC3_l_But2; TC3_l_BUT3; TC3_l_BUT4; TC3_l_BUT5; TC3_l_BUT6; TC3_l_BUT7; TC3_l_BUT8; TC3_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; TC2_t_COL1; TC2_t_COL2; TC2_t_COL3; TC2_t_COL4; TC2_t_COL5; TC2_t_COL6; TC2_t_COL7; TC2_t_COL8; TC2_t_COL9; TC2_t_HED1)
	C_TEXT:C284(TC2_t_HED2; TC2_t_HED3; TC2_t_HED4; TC2_t_HED5; TC2_t_HED6; TC2_t_HED7; TC2_t_HED8; TC2_t_HED9; TC3_t_COL1; TC3_t_COL2; TC3_t_COL3)
	C_TEXT:C284(TC3_t_COL4; TC3_t_COL5; TC3_t_COL6; TC3_t_COL7; TC3_t_COL8; TC3_t_COL9; TC3_t_HED1; TC3_t_HED2; TC3_t_HED3; TC3_t_HED4; TC3_t_HED5)
	C_TEXT:C284(TC3_t_HED6; TC3_t_HED7; TC3_t_HED8; TC3_t_HED9)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SD2_SelectCalenderDialog"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "Diary_OwnerDialog")
		
		ARRAY TEXT:C222(SD2_at_DiaryOwnersPeople; 0)
		ARRAY TEXT:C222(SD2_at_DiaryOwnersPeople; 0)
		
		ARRAY TEXT:C222(SD2_at_DiaryOwnersResources; 0)
		ARRAY TEXT:C222(SD2_at_DiaryOwnersResources; 0)
		READ ONLY:C145([PERSONNEL:11])
		For ($_l_PersonIndex; 1; Size of array:C274(SD_at_PersonInitials))  //This array was created before the form is opened
			If (SD_at_PersonInitials{$_l_PersonIndex}#"")
				If (SD_al_PersonClass{$_l_PersonIndex}=3)
					//resource
					APPEND TO ARRAY:C911(SD2_at_DiaryOwnersResources; SD_at_DiaryOwners{$_l_PersonIndex})
					APPEND TO ARRAY:C911(SD2_at_DiaryOwnersResources; SD_at_PersonInitials{$_l_PersonIndex})
				Else 
					APPEND TO ARRAY:C911(SD2_at_DiaryOwnersPeople; SD_at_DiaryOwners{$_l_PersonIndex})
					APPEND TO ARRAY:C911(SD2_at_DiaryOwnersPeople; SD_at_PersonInitials{$_l_PersonIndex})
				End if 
			End if 
		End for 
		
		SORT ARRAY:C229(SD2_at_DiaryOwnersPeople; SD2_at_DiaryOwnersPeople)
		SORT ARRAY:C229(SD2_at_DiaryOwnersResources; SD2_at_DiaryOwnersResources)
		SD2_at_DiaryOwnersPeople:=0
		SD2_at_DiaryOwnersResources:=0
		
		
		LB_SetupListbox(->SD2_Lb_DiaryOwnersPeople; "TC2_t"; "TC2_L"; 1; ->SD2_at_DiaryOwnersPeople)
		
		LB_SetColumnHeaders(->SD2_Lb_DiaryOwnersPeople; "TC2_L"; 1; "People")
		LB_SetColumnWidths(->SD2_Lb_DiaryOwnersPeople; "TC2_t"; 1; 216)
		LB_SetEnterable(->SD2_Lb_DiaryOwnersPeople; False:C215; 0)
		LB_StyleSettings(->SD2_Lb_DiaryOwnersPeople; "Black"; 9; "TC2_t"; ->[DIARY:12])
		
		LB_SetupListbox(->SD2_Lb_DiaryOwnersResource; "TC3_t"; "TC3_L"; 1; ->SD2_at_DiaryOwnersResources)
		
		LB_SetColumnHeaders(->SD2_Lb_DiaryOwnersResource; "TC3_L"; 1; "Resources")
		LB_SetColumnWidths(->SD2_Lb_DiaryOwnersResource; "TC3_t"; 1; 216)
		LB_SetEnterable(->SD2_Lb_DiaryOwnersResource; False:C215; 0)
		LB_StyleSettings(->SD2_Lb_DiaryOwnersResource; "Black"; 9; "TC3_t"; ->[DIARY:12])
		
		
		WS_AutoscreenSize(3; 390; 370)
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [USER].SD2_SelectCalenderDialog"; $_t_oldMethodName)

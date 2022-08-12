If (False:C215)
	//Table Form Method Name: Object Name:      [DIARY].SD2_Viewer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_lb_Workflow;0)
	//ARRAY LONGINT(LB_al_ConfigureSD2;0)
	//ARRAY LONGINT(SD2_al_DiaryDefaultTabIDs;0)
	//ARRAY LONGINT(SD2_al_DiaryTabIDS;0)
	//ARRAY LONGINT(SD2_al_DocIncludes;0)
	//ARRAY LONGINT(SD2_al_formsIds;0)
	//ARRAY LONGINT(SD2_AL_TabDefs;0)
	//ARRAY LONGINT(SD2_al_TabIds;0)
	//ARRAY LONGINT(SD2_al_TabIncludes;0;0)
	//ARRAY LONGINT(SD2_al_TabsIds;0)
	//ARRAY LONGINT(SD2_al_ThreadLevels;0)
	//ARRAY LONGINT(SD2_al_ThreadStates;0)
	//ARRAY LONGINT(SD2_al_ViewTabsFormSettings;0)
	//ARRAY POINTER(SD2_aptr_ListControl;0)
	//ARRAY TEXT(LB_at_ConfigureSD2;0)
	//ARRAY TEXT(SD2_at_DiaryTabs;0)
	//ARRAY TEXT(SD2_at_TabNames;0)
	C_BOOLEAN:C305($_bo_addDocuments; $_bo_newLevel; DB_bo_NoLoad)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ButtonPressed; $_l_DefaultDeinitions; $_l_DiaryTabRow; $_l_event; $_l_index; $_l_ModuleAccess; $_l_TableID; SD2_DefaultTabID; SD2_l_CurrentTab; SD2_l_DefaultTabIDOLD)
	C_LONGINT:C283(SD2_l_InfoColumn; SD2_l_PREFSROW; SD2_l_ThreadColumn; vALLevels)
	C_PICTURE:C286(SD2_Pi_Configure)
	C_TEXT:C284($_t_oldMethodName; INT_T_OutputTitle; WIN_t_CurrentInputForm)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].SD2_Viewer"; Form event code:C388)

$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Timer:K2:25)
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DIARY:12]); "SD2_Viewer")
		//NG December 2006. Remember when you go from here to set up the tabs to only include diary actions that are to appear in workflow
		WS_AutoscreenSize(1; 375; 800; Table name:C256(->[DIARY:12])+"_"+WIN_t_CurrentInputForm)
		
		ARRAY TEXT:C222(SD2_at_DiaryTabs; 0)
		ARRAY TEXT:C222(SD2_at_TabNames; 0)
		
		ARRAY LONGINT:C221(SD2_al_ViewTabsFormSettings; 0)
		ARRAY LONGINT:C221(SD2_al_TabsIds; 0)
		ARRAY LONGINT:C221(SD2_al_formsIds; 0)
		ARRAY LONGINT:C221(SD2_al_TabIncludes; 0; 0)
		ARRAY LONGINT:C221(SD2_al_DocIncludes; 0)
		SD2_l_DefaultTabIDOLD:=0
		$_l_DefaultDeinitions:=12
		//First we have to load the tab configuration
		//this tells us the default tab
		//next do a search based on that tab
		//and we set up the  columns
		SD2_LoadTabSetting(True:C214; Table:C252(->[DIARY:12]); ->SD2_at_TabNames; ->SD2_al_TabIncludes; ->SD2_al_DocIncludes; ->SD2_al_TabsIds; ->SD2_al_formsIds)
		SD2_LoadActionGroups
		SD2_l_PREFSROW:=SD2_LoadDiaryTabPrefs(True:C214; -><>PER_l_CurrentUserID)  // This gives us a reference to a row of the preferences to use
		
		If (Size of array:C274(SD2_at_TabNames)>0)
			$_bo_addDocuments:=False:C215
			APPEND TO ARRAY:C911(SD2_at_DiaryTabs; "ALL")
			APPEND TO ARRAY:C911(SD2_al_ViewTabsFormSettings; 12)
			ARRAY POINTER:C280(SD2_aptr_ListControl; 0)
			For ($_l_index; 1; Size of array:C274(SD2_at_TabNames))
				APPEND TO ARRAY:C911(SD2_at_DiaryTabs; SD2_at_TabNames{$_l_index})
				If (SD2_l_PREFSROW>0)
					$_l_TableID:=SD2_al_TabIds{$_l_index}
					$_l_DiaryTabRow:=Find in array:C230(SD2_al_DiaryTabIDS{SD2_l_PREFSROW}; $_l_TableID)
					If ($_l_DiaryTabRow>0)
						//APPEND TO ARRAY(SD2_al_ViewTabsFormSettings; SD2_AL_TabDefs{$_l_index})<--this is wrong
					Else 
						APPEND TO ARRAY:C911(SD2_al_ViewTabsFormSettings; $_l_DefaultDeinitions)
					End if 
				Else 
					APPEND TO ARRAY:C911(SD2_al_ViewTabsFormSettings; $_l_DefaultDeinitions)
				End if 
				If (SD2_al_DocIncludes{$_l_index}=0)
					$_bo_addDocuments:=True:C214
				End if 
			End for 
			If ($_bo_addDocuments)  // at least one tab does not show documents
				$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
				If ($_l_ModuleAccess>1)
					
					APPEND TO ARRAY:C911(SD2_at_DiaryTabs; "Documents")
					APPEND TO ARRAY:C911(SD2_al_ViewTabsFormSettings; 12)
					
					
				End if 
			End if 
			
		Else 
			APPEND TO ARRAY:C911(SD2_at_DiaryTabs; "Diary")
			APPEND TO ARRAY:C911(SD2_al_ViewTabsFormSettings; 12)
			$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_WPManager)
			If ($_l_ModuleAccess>1)
				APPEND TO ARRAY:C911(SD2_at_DiaryTabs; "Documents")
				APPEND TO ARRAY:C911(SD2_al_ViewTabsFormSettings; 12)
				
				
			End if 
		End if 
		//That sets up the tabs
		SD2_l_CurrentTab:=1  //always default to 1
		If (SD2_l_PREFSROW>0)
			//First do a check to make sure ALL the tabs are there
			SD2_DefaultTabID:=SD2_al_DiaryDefaultTabIDs{SD2_l_PREFSROW}
			If (SD2_DefaultTabID=0)
				//No default
				
			End if 
			
			$_l_DiaryTabRow:=Find in array:C230(SD2_al_TabIds; SD2_DefaultTabID)
			If ($_l_DiaryTabRow>0)
				$_l_DiaryTabRow:=Find in array:C230(SD2_at_DiaryTabs; SD2_at_TabNames{$_l_DiaryTabRow})
				If ($_l_DiaryTabRow>0)
					SD2_l_CurrentTab:=$_l_DiaryTabRow
				End if 
			End if 
		Else 
			
		End if 
		//Here search for diary items
		//SD2_SearchforWorkFlow (->◊userID;SD2_DefaultTabID)
		If (Size of array:C274(SD2_aptr_ListControl)=0) & (vALLevels>0)
			$_bo_newLevel:=True:C214
		Else 
			$_bo_newLevel:=False:C215
		End if 
		If (Size of array:C274(SD2_aptr_ListControl)=0) | (SD2_l_DefaultTabIDOLD#SD2_DefaultTabID)
			SD2_l_DefaultTabIDOLD:=SD2_DefaultTabID
			If (SD2_DefaultTabID>0)
				LBi_ArrDefFill(->SD2_aptr_ListControl; ->SD_lb_Workflow; ->[DIARY:12]Diary_Code:3; ->[DIARY:12]Diary_Code:3; "411111000"; "SDDiary"; SD2_al_ViewTabsFormSettings{SD2_DefaultTabID}; "Diary Items"; "Diary item"; ""; $_bo_newLevel)
				
				
			Else 
				LBi_ArrDefFill(->SD2_aptr_ListControl; ->SD_lb_Workflow; ->[DIARY:12]Diary_Code:3; ->[DIARY:12]Diary_Code:3; "411111000"; "SDDiary"; 12; "Diary Items"; "Diary item"; ""; $_bo_newLevel)
			End if 
			
		End if 
		SD2_l_ThreadColumn:=LBI_InsertarrPicture(->SD2_aptr_ListControl; ->SD_lb_Workflow; 1)
		SD2_l_InfoColumn:=LBI_InsertarrPicture(->SD2_aptr_ListControl; ->SD_lb_Workflow; 0; 21)  //This one is added at the end of the row
		//OK so here i want some additional arrays that match the
		LBI_InsertArr(->SD2_aptr_ListControl; ->SD_lb_Workflow; 0; ->[DIARY:12]x_Is_Thread:68; 0)
		LBI_InsertArr(->SD2_aptr_ListControl; ->SD_lb_Workflow; 0; ->[DIARY:12]x_ID:50; 0)
		LBI_InsertArr(->SD2_aptr_ListControl; ->SD_lb_Workflow; 0; ->[DIARY:12]ThreadID:64; 0)
		//I also want some arrays that don't relate to fields-so the handling of these is slightly outside the norm
		ARRAY LONGINT:C221(SD2_al_ThreadLevels; 0)
		ARRAY LONGINT:C221(SD2_al_ThreadStates; 0)
		
		
		LBi_LoadSetup(->SD2_aptr_ListControl; "B")
		LB_Setdividers(->SD_lb_Workflow; 0; 0)  //Both off
		//Now we need to find which array the thread IDs are in and set up the Picture
		SD2_WorkflowSetThreads(->SD2_aptr_ListControl; ->SD_lb_Workflow)
		
		//PICTURE PROPERTIES(picture;width;height{;hOffset{;vOffset{;mode}}})
		//SET FORMAT(SD_pi_ThreadView;On Background )
		
		ARRAY TEXT:C222(LB_at_ConfigureSD2; 0)
		ARRAY LONGINT:C221(LB_al_ConfigureSD2; 0)
		LBi_SetListBoxOptions(->LB_at_ConfigureSD2; ->LB_al_ConfigureSD2; ->SD2_Pi_Configure; True:C214)
		
		
		//NOTE THAT WE TREAT THIS FORM AS AN INPUT FORM(Really it is a dialogue)
		
		INT_SetInput(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		INT_T_OutputTitle:="Current Work Tasks"
		SET WINDOW TITLE:C213("Workflow")
		//Here we need to 'register' the current diary scope.
		
	: ($_l_event=On Outside Call:K2:11)
		SD_WorkflowButtonHandler($_l_ButtonPressed)
	: ($_l_event=On Data Change:K2:15)
		
End case 
ERR_MethodTrackerReturn("FM:SD2_Viewer"; $_t_oldMethodName)

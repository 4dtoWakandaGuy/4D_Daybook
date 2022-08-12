//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetFormMenuoptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     15/05/2010 18:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_CurrentSelectionID;0)
	//ARRAY LONGINT(DB_al_CurrentTableSetsRefs;0)
	//ARRAY LONGINT(DB_al_TableCurrentSelections;0)
	C_BOOLEAN:C305(DB_bo_CacheIntited; DB_bo_DisplayFilters; DB_bo_DisplaySelections; DB_bo_DisplayStats; DB_bo_RecordsinNewProcess)
	C_LONGINT:C283($_l_CurrentSelectionRow; $_l_FormRow; $_l_processpalleteproc; $_l_SelectionsRow; DB_l_CurrentDisplayedForm; DB_l_ViewType; PAL_BUTTON_286; PAL_BUTTON_287; PAL_BUTTON_288; PAL_BUTTON_289)
	C_TEXT:C284($_t_FileMenuName; $_t_FiltersMenuName; $_t_FiltersMenuNameOLD; $_t_MenuITableName; $_t_MenuItemName; $_t_MenuItemNameOLD; $_t_MenuItemString; $_t_NameNextSelMenuName; $_t_NamePrevSelMenuName; $_t_NewWindowMenuName; $_t_oldMethodName)
	C_TEXT:C284($_t_RecordsMenuName; $_t_SelectionsMenuName; $_t_TableName; $_t_ViewasListMenuName; $_t_ViewGraphMenuName; $_t_ViewStatisticsMenuName; $_t_WindowPaletteMenuName; DB_t_CurrentContext; DB_t_CUrrentMenuReference)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetFormMenuoptions")
$_t_SelectionsMenuName:=Get localized string:C991("Menu_Selections")
$_t_NameNextSelMenuName:=Get localized string:C991("MenuItem_NextSelection")
$_t_NamePrevSelMenuName:=Get localized string:C991("MenuItem_PreviousSelection")
If (DB_l_CurrentDisplayedForm>0)
	If (DB_bo_CacheIntited)
		$_l_FormRow:=Find in array:C230(DB_al_TableCurrentSelections; DB_l_CurrentDisplayedForm)  //this finds the table in the arrray
		If ($_l_FormRow>0)  //if not there is a problem
			
			$_l_CurrentSelectionRow:=DB_al_CurrentSelectionID{$_l_FormRow}
			$_l_SelectionsRow:=Find in array:C230(DB_al_CurrentTableSetsRefs; $_l_CurrentSelectionRow)
			If ($_l_SelectionsRow>0)
				If ($_l_SelectionsRow=Size of array:C274(DB_al_CurrentTableSetsRefs))
					//disable the selections next selection
					OBJECT SET ENABLED:C1123(PAL_BUTTON_288; False:C215)
					OBJECT SET ENABLED:C1123(PAL_BUTTON_289; False:C215)
					DB_MenuAction($_t_SelectionsMenuName; $_t_NameNextSelMenuName; 3; ""; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
				Else 
					OBJECT SET ENABLED:C1123(PAL_BUTTON_288; True:C214)
					OBJECT SET ENABLED:C1123(PAL_BUTTON_289; True:C214)
					DB_MenuAction($_t_SelectionsMenuName; $_t_NameNextSelMenuName; 2; ""; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
				End if 
				If ($_l_SelectionsRow<=1)
					OBJECT SET ENABLED:C1123(PAL_BUTTON_287; False:C215)
					OBJECT SET ENABLED:C1123(PAL_BUTTON_286; False:C215)
					//disable the previous selection
					DB_MenuAction($_t_SelectionsMenuName; $_t_NamePrevSelMenuName; 3; ""; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
				Else 
					OBJECT SET ENABLED:C1123(PAL_BUTTON_287; True:C214)
					OBJECT SET ENABLED:C1123(PAL_BUTTON_286; True:C214)
					DB_MenuAction($_t_SelectionsMenuName; $_t_NamePrevSelMenuName; 2; ""; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
				End if 
			Else 
				OBJECT SET ENABLED:C1123(PAL_BUTTON_288; False:C215)
				OBJECT SET ENABLED:C1123(PAL_BUTTON_287; False:C215)
				OBJECT SET ENABLED:C1123(PAL_BUTTON_289; False:C215)
				OBJECT SET ENABLED:C1123(PAL_BUTTON_286; False:C215)
				DB_MenuAction($_t_SelectionsMenuName; $_t_NameNextSelMenuName; 3; ""; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
				DB_MenuAction($_t_SelectionsMenuName; $_t_NamePrevSelMenuName; 3; ""; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
				//disable the selections next selection
				//disable the previous selection
			End if 
		Else 
			OBJECT SET ENABLED:C1123(PAL_BUTTON_288; False:C215)
			OBJECT SET ENABLED:C1123(PAL_BUTTON_287; False:C215)
			OBJECT SET ENABLED:C1123(PAL_BUTTON_289; False:C215)
			OBJECT SET ENABLED:C1123(PAL_BUTTON_286; False:C215)
			DB_MenuAction($_t_SelectionsMenuName; $_t_NameNextSelMenuName; 3; ""; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
			DB_MenuAction($_t_SelectionsMenuName; $_t_NamePrevSelMenuName; 3; ""; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
			
			//disable the selections next selection
			//disable the previous selection
		End if 
		$_t_RecordsMenuName:=Get localized string:C991("Menu_Records")
		$_t_NewWindowMenuName:=Get localized string:C991("MenuItem_Recordsinprocess")
		If (DB_bo_RecordsinNewProcess)
			DB_MenuAction($_t_RecordsMenuName; $_t_NewWindowMenuName; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
			
		Else 
			DB_MenuAction($_t_RecordsMenuName; $_t_NewWindowMenuName; 4; ""; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
			
		End if 
		If (DB_bo_DisplaySelections)
			$_t_MenuItemName:=Get localized string:C991("MenuItem_HideSelections")
			$_t_MenuItemNameOLD:=Get localized string:C991("MenuItem_ShowSelections")
			DB_MenuAction($_t_SelectionsMenuName; $_t_MenuItemNameOLD; 1; $_t_MenuItemName; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
		Else 
			$_t_MenuItemName:=Get localized string:C991("MenuItem_ShowSelections")
			$_t_MenuItemNameOLD:=Get localized string:C991("MenuItem_HideSelections")
			DB_MenuAction($_t_SelectionsMenuName; $_t_MenuItemNameOLD; 1; $_t_MenuItemName; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
			
		End if 
		If (DB_bo_DisplayFilters)
			$_t_FiltersMenuName:=Get localized string:C991("MenuItem_HideFilters")
			$_t_FiltersMenuNameOLD:=Get localized string:C991("MenuItem_ShowFilters")
			DB_MenuAction($_t_RecordsMenuName; $_t_FiltersMenuNameOLD; 1; $_t_FiltersMenuName; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
			
		Else 
			$_t_FiltersMenuName:=Get localized string:C991("MenuItem_ShowFilters")
			$_t_FiltersMenuNameOLD:=Get localized string:C991("MenuItem_HideFilters")
			DB_MenuAction($_t_RecordsMenuName; $_t_FiltersMenuNameOLD; 1; $_t_FiltersMenuName; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
			
		End if 
		
		
		
		
		$_t_TableName:=Table name:C256(DB_l_CurrentDisplayedForm)
		$_t_TableName:=Uppers1(Lowercase:C14($_t_TableName))
		
		$_t_MenuItemString:="MenuItem_"+$_t_TableName
		$_t_MenuITableName:=Get localized string:C991($_t_MenuItemString)
		$_t_ViewasListMenuName:=Get localized string:C991("MenuItem_View")+" "+$_t_MenuITableName+" "+Get localized string:C991("MenuItem_List")
		
		$_t_ViewStatisticsMenuName:=Get localized string:C991("MenuItem_View")+" "+$_t_MenuITableName+" "+Get localized string:C991("MenuItem_Statistics")
		$_t_ViewGraphMenuName:=Get localized string:C991("MenuItem_View")+" "+$_t_MenuITableName+" "+Get localized string:C991("MenuItem_Graph")
		
		Case of 
			: (DB_l_ViewType=1)
				
				DB_MenuAction($_t_RecordsMenuName; $_t_ViewasListMenuName; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
				DB_MenuAction($_t_RecordsMenuName; $_t_ViewStatisticsMenuName; 4; ""; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
				DB_MenuAction($_t_RecordsMenuName; $_t_ViewGraphMenuName; 4; ""; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
			: (DB_l_ViewType=2)  //View Stats only..probably not now
				DB_MenuAction($_t_RecordsMenuName; $_t_ViewasListMenuName; 4; ""; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
				DB_MenuAction($_t_RecordsMenuName; $_t_ViewStatisticsMenuName; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
				DB_MenuAction($_t_RecordsMenuName; $_t_ViewGraphMenuName; 4; ""; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
			: (DB_l_ViewType=3)  //View graph only probably not now
				DB_MenuAction($_t_RecordsMenuName; $_t_ViewasListMenuName; 4; ""; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
				DB_MenuAction($_t_RecordsMenuName; $_t_ViewStatisticsMenuName; 4; ""; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
				DB_MenuAction($_t_RecordsMenuName; $_t_ViewGraphMenuName; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
		End case 
		If (DB_bo_DisplayStats)
			DB_MenuAction($_t_RecordsMenuName; $_t_ViewStatisticsMenuName; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
		End if 
		
		$_t_FileMenuName:=Get indexed string:C510(79; 1)
		$_t_WindowPaletteMenuName:=Get localized string:C991("MenuItem_WindowsPalette")
		
		$_l_processpalleteproc:=Process number:C372("$Processes")
		If ($_l_processpalleteproc>0)
			
			DB_MenuAction($_t_FileMenuName; $_t_WindowPaletteMenuName; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
		Else 
			DB_MenuAction($_t_FileMenuName; $_t_WindowPaletteMenuName; 4; ""; Current process:C322; False:C215; DB_t_CUrrentMenuReference)
		End if 
		DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
	End if 
	
End if 
ERR_MethodTrackerReturn("DB_SetFormMenuoptions"; $_t_oldMethodName)
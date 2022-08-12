//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetFormmenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 21:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_MenuShortCutsUsed;0)
	//ARRAY LONGINT(DB_al_ModuleMenuShortCuts;0)
	//ARRAY TEXT(DB_at_ModuleMenuNames;0)
	//ARRAY TEXT(DB_at_ModuleMenuReferences;0)
	C_BOOLEAN:C305($_bo_ModuleChange; $3; DB_bo_MenuContextsinited; DB_bo_MenusInited)
	C_LONGINT:C283($_l_Event; $_l_Index; DB_l_CurrentMenuContext; DB_l_CurrentMenuTable)
	C_REAL:C285($1)
	C_TEXT:C284($_t_FunctionsMenuName; $_t_oldMethodName; $_t_RecordsMenuName; $_t_ReportsMenuName; $_t_SelectionsMenuName; $2; DB_t_CurrentEditMenuReference; DB_t_CurrentFileMenuReference; DB_t_CurrentFunctionsMenu; DB_T_CurrentMenuContext; DB_t_CUrrentMenuReference)
	C_TEXT:C284(DB_t_CurrentRecMenuReference; DB_t_CurrentRepMenuReference; DB_t_CurrentSelMenuReference; DB_T_CurrentWindowMenu)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetFormmenu")
If (Count parameters:C259>0)
	//First we must clear the menu if the context or table changes
	If (Not:C34(DB_bo_MenuContextsinited))
		
		
		
	End if 
	If (Count parameters:C259>=3)
		$_bo_ModuleChange:=$3
	Else 
		$_bo_ModuleChange:=False:C215
	End if 
	
	//We will have a FILE,( EDIT), Records, Selections, Views, Reports and a Functions Menu
	//in the file menu will be close window,(command-W) , open new browser(new window), windows palette,  report an issue, debug window
	
	//in the records menu we will have, new record, open selected record, Delete record , all records, select records, sort records, total records, show/hide filters.
	// in the selections menu we will have Next selection, previous selection, Save selection show/hide selections. for tables with a state we will have a menu item for each state(which will also go in the side bar of user selections)
	// for products show also catalogue names., and a list of the current  users save selection names(as long as there are less than 10.. more than 10 a more item...(and let them set which ones appear on menu)z
	//in the Views menu we will have statitistics, graph and any other alternative views
	//in the reports menu we will have the built in reports that are currently on the menu as seperate views, Super-reports assigned to the current table, and macros that are designated as reports(a macro class). we will probably ned to add access control for macro reports(does it exist for SRs att the moment)
	//we will also have create report which will give the option of creating a macro, sr or quick report. Investigate sucking the QR reports back into the system for sharing.
	//on the functions menu we will have APPLY TO SELECTED RECORDS.RUN SCRIPT(PLAY MACRO) and a list macros attached to the table
	
	COPY ARRAY:C226(DB_al_ModuleMenuShortCuts; DB_al_MenuShortCutsUsed)
	DB_bo_MenusInited:=False:C215
	//
	
	If ($1#DB_l_CurrentMenuTable) | (DB_T_CurrentMenuContext#$2) | ($_bo_ModuleChange)
		DB_t_CurrentSelMenuReference:=""
		DB_t_CurrentRepMenuReference:=""
		DB_t_CurrentRecMenuReference:=""
		DB_t_CurrentFunctionsMenu:=""
		DB_l_CurrentMenuTable:=$1
		DB_T_CurrentMenuContext:=$2
		If (DB_t_CUrrentMenuReference#"")
			RELEASE MENU:C978(DB_t_CUrrentMenuReference)
		End if 
		
		DB_T_CurrentWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentWindowMenu)
		DB_t_CUrrentMenuReference:=Create menu:C408  //Create  New Menu
		DB_t_CurrentFileMenuReference:=DB_MenuCreateFileMenu(DB_l_CurrentMenuTable; DB_T_CurrentMenuContext)
		
		DB_t_CurrentEditMenuReference:=DB_MenuCreateEditMenu(DB_l_CurrentMenuTable; DB_T_CurrentMenuContext)
		
		If ($2#"Select Records")
			DB_t_CurrentRecMenuReference:=DB_MenuCreateRecordsMenu(DB_l_CurrentMenuTable; DB_T_CurrentMenuContext)
			
			
			DB_t_CurrentSelMenuReference:=DB_MenuCreateSelectionsMenu(DB_l_CurrentMenuTable; DB_T_CurrentMenuContext)
			
			
			DB_t_CurrentRepMenuReference:=DB_MenuCreateReportsMenu(DB_l_CurrentMenuTable; DB_T_CurrentMenuContext)
			
			DB_t_CurrentFunctionsMenu:=DB_MenuCreateFunctionsMenu(DB_l_CurrentMenuTable; DB_T_CurrentMenuContext)
			
			
			// FileMenu will contain the File menu reference
			
			INSERT MENU ITEM:C412(DB_t_CUrrentMenuReference; -1; Get indexed string:C510(79; 1); DB_t_CurrentFileMenuReference)
			INSERT MENU ITEM:C412(DB_t_CUrrentMenuReference; -1; Get indexed string:C510(79; 5); DB_t_CurrentEditMenuReference)
			$_t_RecordsMenuName:=Get localized string:C991("Menu_Records")
			
			INSERT MENU ITEM:C412(DB_t_CUrrentMenuReference; -1; $_t_RecordsMenuName; DB_t_CurrentRecMenuReference)
			$_t_SelectionsMenuName:=Get localized string:C991("Menu_Selections")
			If (DB_t_CurrentSelMenuReference#"")
				INSERT MENU ITEM:C412(DB_t_CUrrentMenuReference; -1; $_t_SelectionsMenuName; DB_t_CurrentSelMenuReference)
			End if 
			If (DB_t_CurrentRepMenuReference#"")
				$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
				INSERT MENU ITEM:C412(DB_t_CUrrentMenuReference; -1; $_t_ReportsMenuName; DB_t_CurrentRepMenuReference)
			End if 
			If (DB_t_CurrentFunctionsMenu#"")
				$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
				INSERT MENU ITEM:C412(DB_t_CUrrentMenuReference; -1; $_t_FunctionsMenuName; DB_t_CurrentFunctionsMenu)
			End if 
			If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
				For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
					INSERT MENU ITEM:C412(DB_t_CUrrentMenuReference; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
				End for 
			End if 
		Else 
			INSERT MENU ITEM:C412(DB_t_CUrrentMenuReference; -1; Get indexed string:C510(79; 1); DB_t_CurrentFileMenuReference)
			INSERT MENU ITEM:C412(DB_t_CUrrentMenuReference; -1; Get indexed string:C510(79; 5); DB_t_CurrentEditMenuReference)
			
		End if 
		INSERT MENU ITEM:C412(DB_t_CUrrentMenuReference; -1; "Form Windows"; DB_T_CurrentWindowMenu)
		
		
		SET MENU BAR:C67(DB_t_CUrrentMenuReference)
		
	Else 
		$_l_Event:=Form event code:C388
		Case of 
			: ($_l_Event=On Activate:K2:9)
				//TRACE
				DB_T_CurrentWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentWindowMenu)
				//DELETE MENU ITEM(DB_t_CUrrentMenuReference;-1)
				//"Form Windows";DB_T_CurrentWindowMenu)
				//INSERT MENU ITEM(DB_t_CUrrentMenuReference;-1;"Form Windows";DB_T_CurrentWindowMenu)
				
				
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				
		End case 
		
	End if 
End if 
DB_bo_MenusInited:=True:C214
ERR_MethodTrackerReturn("DB_SetFormmenu"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetInputFormMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:       25/01/2011 12:41 v7.0.0/B45
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
	C_BOOLEAN:C305(DB_bo_MenusInited)
	C_LONGINT:C283(<>SCPT_l_PaletteWIndow; $_l_Index; DB_l_CurrentDisplayedForm)
	C_OBJECT:C1216($_obj_WindowPrefs)
	C_REAL:C285($1)
	C_TEXT:C284($_t_FunctionsMenuName; $_t_oldMethodName; $_t_ReportsMenuName; $_t_SubAreaName; $2; $3; DB_t_CurrentInputFileMenuRef; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; DB_t_CurrettInputEditMenuRef; DB_t_CurrettInputFctMenuRef)
	C_TEXT:C284(DB_t_CurrettInputRprtMenuRef; DB_t_CurrettInputViewsMenuRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetInputFormMenu")

DB_t_CurrentInputFileMenuRef:=""
DB_t_CurrettInputEditMenuRef:=""
DB_t_CurrettInputViewsMenuRef:=""
DB_t_CurrettInputFctMenuRef:=""
DB_t_CurrettInputRprtMenuRef:=""
//DB_bo_RecordsinNewProcess:=True
$_obj_WindowPrefs:=New object:C1471
$_obj_WindowPrefs:=DB_GetWindowPrefs
If ($_obj_WindowPrefs.SetInputOpeninNewWindow=Null:C1517)
	$_obj_WindowPrefs.SetInputOpeninNewWindow:=False:C215
End if 

DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)

COPY ARRAY:C226(DB_al_ModuleMenuShortCuts; DB_al_MenuShortCutsUsed)
DB_bo_MenusInited:=False:C215
If (DB_l_CurrentDisplayedForm=0)
	DB_l_CurrentDisplayedForm:=$1
	
End if 
If (DB_t_CUrrentInputMenuRef#"")
	RELEASE MENU:C978(DB_t_CUrrentInputMenuRef)
End if 
Case of 
	: ($1=Table:C252(->[COMPANIES:2]))
		
		Case of 
			: ($2="Company_In")
				//Menu bar was 26
				//File
				//SET MENU BAR(0)
				If (Count parameters:C259>=3)
					$_t_SubAreaName:=$3
				Else 
					$_t_SubAreaName:=""
				End if 
				
				DB_t_CUrrentInputMenuRef:=Create menu:C408
				DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; $_t_SubAreaName)
				DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
				DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu($1; $2)
				DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
				DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
				
				//Edit
				//View
				//Functions
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
				$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
				$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
				If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
					For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
						INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
					End for 
				End if 
				SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				
		End case 
		
	: ($1=Table:C252(->[ACCOUNTS:32]))
		Case of 
			: ($2="Accounts_in")
				
				DB_t_CUrrentInputMenuRef:=Create menu:C408
				DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
				DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
				//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
				DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
				DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
				
				//Edit
				//View
				//Functions
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
				If (DB_t_CurrettInputViewsMenuRef#"")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
				End if 
				If (DB_t_CurrettInputRprtMenuRef#"")
					$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
				End if 
				If (DB_t_CurrettInputFctMenuRef#"")
					$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
				End if 
				If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
					For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
						INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
					End for 
				End if 
				SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		End case 
		
	: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
		Case of 
			: ($2="AccBal_in")
				DB_t_CUrrentInputMenuRef:=Create menu:C408
				DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
				DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
				//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
				DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
				DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
				
				//Edit
				//View
				//Functions
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
				If (DB_t_CurrettInputViewsMenuRef#"")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
				End if 
				If (DB_t_CurrettInputRprtMenuRef#"")
					$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
				End if 
				If (DB_t_CurrettInputFctMenuRef#"")
					$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
				End if 
				If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
					For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
						INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
					End for 
				End if 
				SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				
			: ($2="Accounts_in")
				
				DB_t_CUrrentInputMenuRef:=Create menu:C408
				DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
				DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
				//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
				DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
				DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
				
				//Edit
				//View
				//Functions
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
				If (DB_t_CurrettInputViewsMenuRef#"")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
				End if 
				If (DB_t_CurrettInputRprtMenuRef#"")
					$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
				End if 
				If (DB_t_CurrettInputFctMenuRef#"")
					$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
				End if 
				If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
					For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
						INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
					End for 
				End if 
				SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		End case 
		
	: ($1=Table:C252(->[ACTIONS:13]))
		Case of 
			: ($2="Action_In")
				
				DB_t_CUrrentInputMenuRef:=Create menu:C408
				DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
				DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
				//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
				DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
				DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
				
				//Edit
				//View
				//Functions
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
				If (DB_t_CurrettInputViewsMenuRef#"")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
				End if 
				If (DB_t_CurrettInputRprtMenuRef#"")
					$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
				End if 
				If (DB_t_CurrettInputFctMenuRef#"")
					$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
				End if 
				If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
					For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
						INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
					End for 
				End if 
				SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		End case 
		
	: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
		Case of 
			: ($2="Types_In")
				
				DB_t_CUrrentInputMenuRef:=Create menu:C408
				DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
				DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
				//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
				DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
				DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
				
				//Edit
				//View
				//Functions
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
				If (DB_t_CurrettInputViewsMenuRef#"")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
				End if 
				If (DB_t_CurrettInputRprtMenuRef#"")
					$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
				End if 
				If (DB_t_CurrettInputFctMenuRef#"")
					$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
				End if 
				If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
					For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
						INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
					End for 
				End if 
				SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		End case 
		
	: ($1=Table:C252(->[ANALYSES:36]))
		Case of 
			: ($2="Analysis_In")
				
				DB_t_CUrrentInputMenuRef:=Create menu:C408
				DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
				DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
				//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
				DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
				DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
				
				//Edit
				//View
				//Functions
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
				If (DB_t_CurrettInputViewsMenuRef#"")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
				End if 
				If (DB_t_CurrettInputRprtMenuRef#"")
					$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
				End if 
				If (DB_t_CurrettInputFctMenuRef#"")
					$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
				End if 
				If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
					For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
						INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
					End for 
				End if 
				SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		End case 
	: ($1=Table:C252(->[AREAS:3]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[ACC_Bank_Statements:198]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
		
	: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[CATALOGUE:108]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[COMPONENTS:86]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[CONTACTS:1]))
		//SET MENU BAR(0)
		Case of 
			: ($2="Contact_In")
				//Menu bar was 27
				//File
				//SET MENU BAR(0)
				If (Count parameters:C259>=3)
					$_t_SubAreaName:=$3
				Else 
					$_t_SubAreaName:=""
				End if 
				
				DB_t_CUrrentInputMenuRef:=Create menu:C408
				DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; $_t_SubAreaName)
				DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
				DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu($1; $2)
				DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
				DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
				
				//Edit
				//View
				//Functions
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
				$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
				$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
				If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
					For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
						INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
					End for 
				End if 
				SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				
		End case 
	: ($1=Table:C252(->[CONTRACT_TYPES:19]))
		Case of 
			: ($2="ContractType_In")
				DB_t_CUrrentInputMenuRef:=Create menu:C408
				DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
				DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
				//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
				DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
				DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
				
				//Edit
				//View
				//Functions
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
				If (DB_t_CurrettInputViewsMenuRef#"")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
				End if 
				If (DB_t_CurrettInputRprtMenuRef#"")
					$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
				End if 
				If (DB_t_CurrettInputFctMenuRef#"")
					$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
				End if 
				If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
					For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
						INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
					End for 
				End if 
				SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				
				
		End case 
		
	: ($1=Table:C252(->[CONTRACTS:17]))
		//SET MENU BAR(0)
		Case of 
			: ($2="Contract_in")
				//Menu bar was 43
				//File
				//SET MENU BAR(0)
				If (Count parameters:C259>=3)
					$_t_SubAreaName:=$3
				Else 
					$_t_SubAreaName:=""
				End if 
				
				DB_t_CUrrentInputMenuRef:=Create menu:C408
				DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; $_t_SubAreaName)
				DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
				DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu($1; $2)
				DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
				DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
				
				//Edit
				//View
				//Functions
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
				$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
				$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
				If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
					For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
						INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
					End for 
				End if 
				SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				
		End case 
	: ($1=Table:C252(->[COUNTRIES:73]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[CREDIT_STAGES:54]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[CURRENCIES:71]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[CURRENT_STOCK:62]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu($1; $2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[DIARY:12]))
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
		
	: ($1=Table:C252(->[DOCUMENTS:7]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		Case of 
			: ($2="Report_in")
				
				
				//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
				//DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu ($1;"Input";$2)
				//DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu ($1;"Input";$2)
			: ($2="Letters_inW")
				DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		End case 
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[PRODUCT_GROUPS:10]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[HEADINGS:84]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[INVOICES_ITEMS:161]))
		$_t_SubAreaName:=""
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
	: ($1=Table:C252(->[INVOICES:39]))
		//SET MENU BAR(0)
		Case of 
			: ($2="Invoice_In")
				//Menu bar was 28
				//File
				//SET MENU BAR(0)
				If (Count parameters:C259>=3)
					$_t_SubAreaName:=$3
				Else 
					$_t_SubAreaName:=""
				End if 
				
				DB_t_CUrrentInputMenuRef:=Create menu:C408
				DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; $_t_SubAreaName)
				DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
				DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu($1; $2)
				DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
				DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
				
				//Edit
				//View
				//Functions
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
				$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
				$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
				If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
					For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
						INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
					End for 
				End if 
				SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				
			: ($2="Invoice_inP")
				DB_t_CUrrentInputMenuRef:=Create menu:C408
				DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
				DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
				//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
				DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
				DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
				
				//Edit
				//View
				//Functions
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
				If (DB_t_CurrettInputViewsMenuRef#"")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
				End if 
				If (DB_t_CurrettInputRprtMenuRef#"")
					$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
				End if 
				If (DB_t_CurrettInputFctMenuRef#"")
					$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
				End if 
				If (False:C215)
					If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
						For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
							INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
						End for 
					End if 
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
		End case 
	: ($1=Table:C252(->[LAYERS:76]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[LOCATIONS:61]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[SCRIPTS:80]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		//DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu ($1;"Input";$2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[ORDER_ITEMS:25]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[ORDERS:24]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu($1; $2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[PERIODS:33]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[PERSONNEL:11]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu($1; $2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[PICTURES:85]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[POSTAL_CODES:50]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[PRICE_GROUPS:18]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[PRICE_TABLE:28]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[PROBLEMS:22]))
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[PRODUCTS:9]))
		//SET MENU BAR(0)
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu($1; $2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[PROJECTS:89]))
		//SET MENU BAR(0)
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu($1; $2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[PUBLICATIONS:52]))
		//SET MENU BAR(0)
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
		//SET MENU BAR(0)
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu($1; $2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
		//SET MENU BAR(0)
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[PURCHASE_INVOICES:37]))
		//SET MENU BAR(0)
		Case of 
			: ($2="Purchases_in")
				
				DB_t_CUrrentInputMenuRef:=Create menu:C408
				DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
				DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
				DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu($1; $2)
				DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
				DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
				
				//Edit
				//View
				//Functions
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
				If (DB_t_CurrettInputViewsMenuRef#"")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
				End if 
				If (DB_t_CurrettInputRprtMenuRef#"")
					$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
				End if 
				If (DB_t_CurrettInputFctMenuRef#"")
					$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
				End if 
				If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
					For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
						INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
					End for 
				End if 
				SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				
			: ($2="Purchases_inP")
				
				DB_t_CUrrentInputMenuRef:=Create menu:C408
				DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
				DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
				//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
				DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
				DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
				
				//Edit
				//View
				//Functions
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
				If (DB_t_CurrettInputViewsMenuRef#"")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
				End if 
				If (DB_t_CurrettInputRprtMenuRef#"")
					$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
				End if 
				If (DB_t_CurrettInputFctMenuRef#"")
					$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
					INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
				End if 
				If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
					For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
						INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
					End for 
				End if 
				SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		End case 
	: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
		
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[RESULTS:14]))
		
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[ROLES:87]))
		
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[SERVICE_CALLS:20]))
		SET MENU BAR:C67(24)
		
	: ($1=Table:C252(->[SOLUTIONS:23]))
		
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[SOURCES:6]))
		
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[STAGES:45]))
		
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[STATUS:4]))
		
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
		
		
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
		
		
		If ($2="Movements_in")
		Else 
		End if 
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu($1; $2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[STOCK_LEVELS:58]))
		
		
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[STOCK_TYPES:59]))
		
		
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
		
		
	: ($1=Table:C252(->[TAX_CODES:35]))
		
		
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[TERMINOLOGY:75]))
		
		
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))
		
		
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
		
	: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
		
		
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
	: ($1=Table:C252(->[TRANSACTIONS:29]))
		
		
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[TYPES:5]))
		
		
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
	: ($1=Table:C252(->[WORKFLOW_CONTROL:51]))
		
		
		
		DB_t_CUrrentInputMenuRef:=Create menu:C408
		DB_t_CurrentInputFileMenuRef:=DB_MenuCreateFileMenu($1; "Input"; "NUL")
		DB_t_CurrettInputEditMenuRef:=DB_MenuCreateEditMenu($1; "Input")
		//DB_t_CurrettInputViewsMenuRef:=DB_MenuCreateViewsMenu ($1;$2)
		DB_t_CurrettInputRprtMenuRef:=DB_MenuCreateReportsMenu($1; "Input"; $2)
		DB_t_CurrettInputFctMenuRef:=DB_MenuCreateFunctionsMenu($1; "Input"; $2)
		
		//Edit
		//View
		//Functions
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 1); DB_t_CurrentInputFileMenuRef)
		INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get indexed string:C510(79; 5); DB_t_CurrettInputEditMenuRef)
		If (DB_t_CurrettInputViewsMenuRef#"")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; Get localized string:C991("MenuItem_View"); DB_t_CurrettInputViewsMenuRef)
		End if 
		If (DB_t_CurrettInputRprtMenuRef#"")
			$_t_ReportsMenuName:=Get localized string:C991("Menu_Reports")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_ReportsMenuName; DB_t_CurrettInputRprtMenuRef)
		End if 
		If (DB_t_CurrettInputFctMenuRef#"")
			$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")
			INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; $_t_FunctionsMenuName; DB_t_CurrettInputFctMenuRef)
		End if 
		If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
			For ($_l_Index; 1; Size of array:C274(DB_at_ModuleMenuReferences))
				INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; DB_at_ModuleMenuNames{$_l_Index}; DB_at_ModuleMenuReferences{$_l_Index})
			End for 
		End if 
		SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
		
End case 
DB_bo_MenusInited:=True:C214
If (DB_t_CUrrentInputMenuRef#"")
	INSERT MENU ITEM:C412(DB_t_CUrrentInputMenuRef; -1; "Form Windows"; DB_T_CurrentInputWindowMenu)
	SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
End if 

If (<>SCPT_l_PaletteWIndow>0)
	While (Semaphore:C143("SCPT_TalkingToPalette"))
		DelayTicks(2)
	End while 
	SET PROCESS VARIABLE:C370(<>SCPT_l_PaletteWIndow; SCPT_l_ParentProcess; Current process:C322)
	SET PROCESS VARIABLE:C370(<>SCPT_l_PaletteWIndow; DB_l_CURRENTDISPLAYEDFORM; DB_l_CURRENTDISPLAYEDFORM)
	POST OUTSIDE CALL:C329(<>SCPT_l_PaletteWIndow)
	CLEAR SEMAPHORE:C144("SCPT_TalkingToPalette")
End if 
ERR_MethodTrackerReturn("DB_SetInputFormMenu"; $_t_oldMethodName)

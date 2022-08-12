//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_UserData
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/01/2012 10:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(<>Mod_abo_HasIcon;0)
	//ARRAY INTEGER(<>MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(<>Mod_al_ModuleOrder;0)
	ARRAY LONGINT:C221($_al_CurrentSelection; 0)
	ARRAY LONGINT:C221($_al_ModuleSort; 0)
	ARRAY LONGINT:C221($_al_WebEnabledModules; 0)
	ARRAY LONGINT:C221($_al_webEnabledState; 0)
	//ARRAY LONGINT(DB_al_WSModuleAvailable;0)
	//ARRAY LONGINT(DBWS_al_BarNumber;0)
	//ARRAY LONGINT(DBWS_al_CachedCurSubselection;0;0)
	//ARRAY LONGINT(DBWS_al_CachedRecordSelection;0;0)
	//ARRAY LONGINT(DBWS_al_DisplayedModule;0)
	//ARRAY LONGINT(DBWS_al_ModuleAccess;0)
	//ARRAY LONGINT(DBWS_al_RecordCacheIDS;0)
	//ARRAY LONGINT(DBWS_al_RecordCachTableNum;0)
	//ARRAY LONGINT(DBWS_al_ShowIcon;0)
	//ARRAY LONGINT(DBWS_al_TableCacheID;0)
	//ARRAY LONGINT(MOD_aI_ModuleShowIcon;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	ARRAY POINTER:C280($_aPtr_ColumnArrayPointers; 0)
	ARRAY POINTER:C280($_aPtr_FieldPointers; 0)
	//ARRAY POINTER(DBWS_aptr_FieldPointers;0;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	ARRAY TEXT:C222($_at_ColumnFormula; 0)
	ARRAY TEXT:C222($_at_WebClassName; 0)
	//ARRAY TEXT(DBWS_at_ColumnFormulas;0;0)
	//ARRAY TEXT(DBWS_at_ColumnLabels;0)
	//ARRAY TEXT(DBWS_at_FiltersContext;0)
	//ARRAY TEXT(DBWS_at_FiltersJson;0)
	//ARRAY TEXT(DBWS_at_GridSettingsJSON;0)
	//ARRAY TEXT(DBWS_at_GridsJSON;0)
	//ARRAY TEXT(DBWS_at_LabelsJSON;0;0)
	//ARRAY TEXT(DBWS_at_MenuContext;0)
	//ARRAY TEXT(DBWS_at_MenuJson;0)
	//ARRAY TEXT(DBWS_at_ModuleIconPath;0)
	//ARRAY TEXT(DBWS_at_ModuleName;0)
	//ARRAY TEXT(DBWS_at_ModuleText;0)
	//ARRAY TEXT(DBWS_at_TabsContext;0)
	//ARRAY TEXT(DBWS_at_TabsJson;0)
	//ARRAY TEXT(DBWS_at_WebName;0)
	//ARRAY TEXT(Mod_at_ToolTips;0)
	C_BLOB:C604($_blb_Picture)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_Exit; $_bo_hasIcon; DB_bo_ModuleSettingsinited; DBWS_bo_DataManagerEdit; DBWS_bo_EditProductPrices; DBWS_bo_MacroGroupToDo; DBWS_bo_NoButtonGrey; DBWS_bo_NoButtonHIDE; DBWS_bo_PersonnelAnalOnly; DBWS_bo_PersonnelAnalOverride)
	C_BOOLEAN:C305(DBWS_bo_RunAcceptMacro; DBWS_bo_ToolbarConfigured)
	C_LONGINT:C283($_l_BarNumberRow; $_l_CacheRow; $_l_CurrentModuleID; $_l_CurrentTableCacheID; $_l_CutOffEnd; $_l_CutOffStart; $_l_EndingPoint; $_l_ExistingStringInsertionPoint; $_l_FirstModuleRow; $_l_FormReferenceRow; $_l_GridReferenceRow)
	C_LONGINT:C283($_l_IconHeight; $_l_ImageWidth; $_l_index; $_l_ModuleContextRow; $_l_ModuleNumber; $_l_NumbertoCut; $_l_Origin; $_l_PictureNumberoffset; $_l_ShowIcon; $_l_SizeofArray; $_l_SortReferenceRow)
	C_LONGINT:C283($_l_StartingPoint; $_l_StringPosition; $_l_WebEnabledRow; $1; DB_l_currentContextReference; DB_l_currentSelectedModuleID; DBWS_l_AccessLevel; DBWS_l_CallAction; DBWS_l_CallBack; DBWS_l_CallContext; DBWS_l_CallModule)
	C_LONGINT:C283(DBWS_l_CurrentTable; DBWS_l_HomeTable; DBWS_l_NumberofRows; DBWS_l_PageNumber; DBWS_l_PersFunc; DBWS_l_RecordCacheIDS; DBWS_l_TableNumber; DBWS_l_UserModNo; SD2_l_DiaryStartups)
	C_PICTURE:C286($_Pic_Icon; $_pic_PicIconDisable; $_pic_PicIconNormal; $_Pic_PicIconRollover; $_Pic_PicIconSelect)
	C_POINTER:C301($_ptr_SortField; $_ptr_SortTable; $_ptr_Table)
	C_TEXT:C284($_t_ExistingString; $_t_FormReference; $_t_IconLAbel; $_t_IconPath; $_t_InsertionHeader; $_t_JSONString; $_t_JSONTYPE; $_t_LabelLabel; $_t_MenuBar; $_t_ModuleFullName; $_t_ModuleLabel)
	C_TEXT:C284($_t_ModuleMenuString; $_t_ModuleName; $_t_oldMethodName; $_t_PathtoDocInternal; $_t_PathtoImages; $_t_ResourcesPath; $_t_WebName; $DBWS_t_JsonIconBar; DB_t_currentContextFormName; DB_t_currentSelectedModuleIdent; DB_t_MenusFormat)
	C_TEXT:C284(Db_t_MenuType; DBWS_t_CurrentContext; DBWS_t_currentContextForm; DBWS_t_CurrentForm; DBWS_t_CurrentGridReference; DBWS_t_DataGridJSON; DBWS_t_FirstModuleName; DBWS_t_GridJSON; DBWS_t_GridLabels; DBWS_t_JsonCurrentModule; DBWS_t_JsonIconBar)
	C_TEXT:C284(DBWS_t_LogedinUser; DBWS_t_loginUserInitials; DBWS_t_ModuleMenuJSON; DBWS_T_PersonnelAnalysis; DBWS_T_PersonnelGroup; DBWS_t_SortCell; DBWS_t_SortDirection; DBWS_T_TableContext; DBWS_T_TableForm; DBWS_T_TableName; DBWS_t_XMLData)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_UserData")
ARRAY LONGINT:C221($_al_WebEnabledModules; 0)  //if you change this make sure you also change in DB_GetModuleSettingByNum
ARRAY LONGINT:C221($_al_webEnabledState; 0)  //0=Read only 2=Read and write 3)=read write and report
ARRAY TEXT:C222($_at_WebClassName; 0)

//Here add the modules as we do them
//APPEND TO ARRAY($_al_WebEnabledModules;Module_DiaryManager)
//APPEND TO ARRAY($_al_webEnabledState;2)

APPEND TO ARRAY:C911($_al_WebEnabledModules; Module_Companies)
APPEND TO ARRAY:C911($_al_webEnabledState; 2)
APPEND TO ARRAY:C911($_at_WebClassName; "modulecos")
APPEND TO ARRAY:C911($_al_WebEnabledModules; Module_SalesOrders)
APPEND TO ARRAY:C911($_al_webEnabledState; 3)
APPEND TO ARRAY:C911($_at_WebClassName; "moduleorders")
APPEND TO ARRAY:C911($_al_WebEnabledModules; Module_Products)
APPEND TO ARRAY:C911($_al_webEnabledState; 0)
APPEND TO ARRAY:C911($_at_WebClassName; "moduleproducts")
//Note that data from other modules such as stock control/price table etc etc may well be used within those modules and that is fine-this just prevents
//menus and tabs existing for these items


//This method is the server side login cache for a user. this will load the user settings and preferences. these can then be passed to the web serving method.
//This can handle calls to get menus. form settings etc. it will cache the settings for speed
If (Count parameters:C259>=1)
	
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$1)
	DBWS_l_PersFunc:=[PERSONNEL:11]Functionality:33
	If (DBWS_l_PersFunc=0)  //a further check due to peculiar probs with no saving the above
		
		DBWS_l_PersFunc:=DBWS_l_PersFunc ?+ 6
		
	End if 
	DBWS_t_loginUserInitials:=[PERSONNEL:11]Initials:1
	DBWS_t_LogedinUser:=[PERSONNEL:11]Name:2
	DBWS_bo_NoButtonGrey:=Not:C34((DBWS_l_PersFunc ?? 5))
	DBWS_bo_NoButtonHIDE:=True:C214
	DBWS_bo_DataManagerEdit:=[PERSONNEL:11]DM_Additions:21
	DBWS_bo_EditProductPrices:=[PERSONNEL:11]Product_Updates:22
	DBWS_T_PersonnelAnalysis:=[PERSONNEL:11]Analysis_Code:20
	DBWS_bo_PersonnelAnalOverride:=[PERSONNEL:11]Analysis_Override:24
	DBWS_bo_PersonnelAnalOnly:=[PERSONNEL:11]Analysis_Only:25
	DBWS_T_PersonnelGroup:=[PERSONNEL:11]Group_Code:28
	DBWS_bo_RunAcceptMacro:=[PERSONNEL:11]Macro_Accept:27
	SD2_l_DiaryStartups:=[PERSONNEL:11]Startup_Diary:16
	DBWS_bo_MacroGroupToDo:=([PERSONNEL:11]Group_ToDo:34)
	If ([PERSONNEL:11]Start_Module:29="")
		$_l_FirstModuleRow:=0
	Else 
		$_l_FirstModuleRow:=Find in array:C230(<>Mod_at_ModuleName; [PERSONNEL:11]Start_Module:29)
	End if 
	//DBWS_t_userGroup
	DBWS_t_FirstModuleName:=[PERSONNEL:11]Start_Module:29
	DBWS_l_HomeTable:=[PERSONNEL:11]HomeTable:52
	DB_bo_ModuleSettingsinited:=False:C215
	Check_Modules($_l_FirstModuleRow; "JSON")
	ARRAY TEXT:C222(DBWS_at_MenuContext; 0)  //This is a string containing Module+"_"+Context+"_"+Form" `the menus etc cached for this user for that view as JSON for speedy response
	ARRAY TEXT:C222(DBWS_at_MenuJson; 0)  //Each concatenated context will have one menu
	ARRAY TEXT:C222(DBWS_at_TabsContext; 0)  //this will contain the context and form for the tabs
	ARRAY TEXT:C222(DBWS_at_TabsJson; 0)  //this is the JSON for the tabs-to navigate to other tables in either an input or output form
	ARRAY TEXT:C222(DBWS_at_FiltersContext; 0)  //this contains the context for the filters
	ARRAY TEXT:C222(DBWS_at_FiltersJson; 0)  //this contains the filters
	ARRAY TEXT:C222(DBWS_at_GridsJSON; 0)  // this contains the reference(listbox form e 02401 etc)
	ARRAY TEXT:C222(DBWS_at_GridSettingsJSON; 0)  //note that this can be recalculated it the user changes it.
	ARRAY TEXT:C222(DBWS_at_LabelsJSON; 0; 0)
	ARRAY POINTER:C280(DBWS_aptr_FieldPointers; 0; 0)  //array of field pointers for the columns
	ARRAY TEXT:C222(DBWS_at_ColumnFormulas; 0; 0)  //array of formulas for the columns
	ARRAY LONGINT:C221(DBWS_al_TableCacheID; 0)  //tells us the current cache ID loaded in the grid
	
	ARRAY LONGINT:C221(DBWS_al_RecordCacheIDS; 0)
	ARRAY LONGINT:C221(DBWS_al_RecordCachTableNum; 0)  //just for safety
	ARRAY LONGINT:C221(DBWS_al_CachedCurSubselection; 0; 0)  //this first an last selected record numbers within the selection
	ARRAY LONGINT:C221(DBWS_al_CachedRecordSelection; 0; 0)
	
	
	
	DBWS_t_CurrentContext:=""
	DB_t_currentSelectedModuleIdent:=""
	DB_l_currentSelectedModuleID:=0
	DB_l_currentContextReference:=0  //Current Viewed table
	DBWS_t_currentContextForm:=""  //contains the name of the 4D form represented on the web page.
	DBWS_t_CurrentForm:=""
	Case of 
		: (Current user:C182="Designer")
			DBWS_l_AccessLevel:=0
		: ((Current user:C182="Manager") | (Current user:C182="ManagerWP") | (Current user:C182="Administrator") | (Current user:C182="AdministratorWP") | (Current user:C182="Demo") | (Current user:C182="DemoWP") | (Current user:C182="DTK"))
			DBWS_l_AccessLevel:=1
		: ((Current user:C182="User") | (Current user:C182="UserWP"))
			DBWS_l_AccessLevel:=2
		: (User in group:C338(Current user:C182; "Designer"))
			DBWS_l_AccessLevel:=0
		: ((User in group:C338(Current user:C182; "Manager")) | (User in group:C338(Current user:C182; "Administrator")) | (Current user:C182="Demo@"))
			DBWS_l_AccessLevel:=1
		: ((User in group:C338(Current user:C182; "User")) | (User in group:C338(Current user:C182; "4D write Group")))
			DBWS_l_AccessLevel:=2
		Else 
			DBWS_l_AccessLevel:=3
	End case 
	
	DBWS_l_CallAction:=1  //on startup
	DBWS_l_CallContext:=0
	DBWS_l_CallModule:=0
	DBWS_l_CallBack:=0
	//notice that when you call this you dont HAVE to set the context of module-if they are not called they will remain the same
	$_bo_Exit:=False:C215
	
	Repeat 
		While (Semaphore:C143("WebHandler_"+String:C10(Current process:C322)))
			DelayTicks(2)
		End while 
		
		Case of 
			: (DBWS_l_CallAction=1)
				
				
				If (Not:C34(DBWS_bo_ToolbarConfigured))
					ARRAY LONGINT:C221(DB_al_WSModuleAvailable; 0)  //These are the only modules that can currently be displayed on the web
					ARRAY LONGINT:C221(DB_al_WSModuleAvailable; 1)
					$_l_SizeofArray:=Size of array:C274(<>MOD_al_ModuleBarNum)
					$_t_JSONString:="Module"
					$_t_ResourcesPath:=Get 4D folder:C485(Current resources folder:K5:16)
					$_l_StringPosition:=Position:C15("Resources"; $_t_ResourcesPath)
					$_t_PathtoDocInternal:=Substring:C12($_t_ResourcesPath; 1; $_l_StringPosition-1)
					$_t_PathtoImages:=$_t_PathtoDocInternal+"WebFolder:Images:"
					
					$_l_PictureNumberoffset:=19800
					For ($_l_index; 1; $_l_SizeofArray)
						If (<>MOD_al_ModuleBarNum{$_l_index}#30) & ($_l_index#12) & ($_l_index#32)
							Case of 
								: ((<>MOD_al_ModuleBarNum{$_l_index}=32) | (<>MOD_al_ModuleBarNum{$_l_index}=21) | (<>MOD_al_ModuleBarNum{$_l_index}=43))  //An exception
									$_t_ModuleFullName:="COMMUNICATIONS"
								: (<>MOD_al_ModuleBarNum{$_l_index}=1)
									$_t_ModuleFullName:="DIARY & ACCOUNTS"
								: (<>MOD_al_ModuleBarNum{$_l_index}=30)
									$_t_ModuleFullName:=Term_StoWT("SOP & STOCK CONTROL")
								Else 
									$_t_ModuleFullName:=Uppercase:C13(Term_AllWT(<>Mod_at_ModuleName{<>MOD_al_ModuleBarNum{$_l_index}}))  //Module Name as def in Modules Array
							End case 
							$_l_ModuleNumber:=<>MOD_al_ModuleBarNum{$_l_index}
							$_l_ShowIcon:=MOD_aI_ModuleShowIcon{$_l_ModuleNumber}
							$_t_ModuleName:=$_t_ModuleFullName
							If ($_t_ModuleName="")
								//TRACE
							End if 
							$_l_PictureNumberoffset:=19800
							$_t_ModuleName:=Replace string:C233($_t_ModuleName; " "; "")
							$_t_ModuleName:=EXP_XMLCOMPLIANCE($_t_ModuleName)
							//GET PICTURE FROM LIBRARY($_l_PictureNumberoffset+$_l_ModuleNumber; $_Pic_Icon)
							$_Pic_Icon:=Get_Picture($_l_PictureNumberoffset+$_l_ModuleNumber)
							
							PICTURE PROPERTIES:C457($_Pic_Icon; $_l_ImageWidth; $_l_ImageWidth)
							$_t_IconPath:=$_t_PathtoImages+$_t_ModuleName+"_Combined"+".jpg"
							If (Not:C34(Is a document:K24:1=Test path name:C476($_t_IconPath)))  // | (True)
								
								PICTURE TO BLOB:C692($_Pic_Icon; $_blb_Picture; "JPEG")
								$_ti_DocumentRef:=Create document:C266($_t_IconPath; "JPEG")
								CLOSE DOCUMENT:C267($_ti_DocumentRef)  // We don't need to keep it open
								BLOB TO DOCUMENT:C526(Document; $_blb_Picture)
							End if 
							$_pic_PicIconNormal:=$_Pic_Icon
							$_Pic_PicIconRollover:=$_Pic_Icon
							$_Pic_PicIconSelect:=$_Pic_Icon
							$_pic_PicIconDisable:=$_Pic_Icon
							$_l_IconHeight:=$_l_ImageWidth/4
							$_l_Origin:=0
							TRANSFORM PICTURE:C988($_pic_PicIconNormal; Crop:K61:7; 0; $_l_Origin; $_l_ImageWidth; $_l_IconHeight)
							$_l_Origin:=$_l_Origin+$_l_IconHeight
							$_t_IconPath:=$_t_PathtoImages+$_t_ModuleName+".jpg"
							If (Not:C34(Is a document:K24:1=Test path name:C476($_t_IconPath)))  //| (True)
								
								PICTURE TO BLOB:C692($_pic_PicIconNormal; $_blb_Picture; "JPEG")
								$_ti_DocumentRef:=Create document:C266($_t_IconPath; "JPEG")
								CLOSE DOCUMENT:C267($_ti_DocumentRef)  // We don't need to keep it open
								BLOB TO DOCUMENT:C526(Document; $_blb_Picture)
							End if 
							TRANSFORM PICTURE:C988($_Pic_PicIconRollover; Crop:K61:7; 0; $_l_Origin; $_l_ImageWidth; $_l_IconHeight)
							$_l_Origin:=$_l_Origin+$_l_IconHeight
							$_t_IconPath:=$_t_PathtoImages+$_t_ModuleName+"_rollover.jpg"
							If (Not:C34(Is a document:K24:1=Test path name:C476($_t_IconPath)))  //| (True)
								
								PICTURE TO BLOB:C692($_Pic_PicIconRollover; $_blb_Picture; "JPEG")
								$_ti_DocumentRef:=Create document:C266($_t_IconPath; "JPEG")
								CLOSE DOCUMENT:C267($_ti_DocumentRef)  // We don't need to keep it open
								BLOB TO DOCUMENT:C526(Document; $_blb_Picture)
							End if 
							TRANSFORM PICTURE:C988($_Pic_PicIconSelect; Crop:K61:7; 0; $_l_Origin; $_l_ImageWidth; $_l_IconHeight)
							$_l_Origin:=$_l_Origin+$_l_IconHeight
							$_t_IconPath:=$_t_PathtoImages+$_t_ModuleName+"_selected.jpg"
							If (Not:C34(Is a document:K24:1=Test path name:C476($_t_IconPath)))  //| (True)
								
								PICTURE TO BLOB:C692($_Pic_PicIconSelect; $_blb_Picture; "JPEG")
								$_ti_DocumentRef:=Create document:C266($_t_IconPath; "JPEG")
								CLOSE DOCUMENT:C267($_ti_DocumentRef)  // We don't need to keep it open
								BLOB TO DOCUMENT:C526(Document; $_blb_Picture)
							End if 
							TRANSFORM PICTURE:C988($_pic_PicIconDisable; Crop:K61:7; 0; $_l_Origin; $_l_ImageWidth; $_l_IconHeight)
							$_l_Origin:=$_l_Origin+$_l_IconHeight
							$_t_IconPath:=$_t_PathtoImages+$_t_ModuleName+"_disabled.jpg"
							If (Not:C34(Is a document:K24:1=Test path name:C476($_t_IconPath)))  //| (True)
								
								PICTURE TO BLOB:C692($_pic_PicIconDisable; $_blb_Picture; "JPEG")
								$_ti_DocumentRef:=Create document:C266($_t_IconPath; "JPEG")
								CLOSE DOCUMENT:C267($_ti_DocumentRef)  // We don't need to keep it open
								BLOB TO DOCUMENT:C526(Document; $_blb_Picture)
							End if 
							
							
						End if 
					End for 
					//the above makes sure we have the icons in the folder.
					//now we set up the tool bar for the user. in this context this means setting up a json string. the json string will contain the path to the image, the image label, and the module number.
					ARRAY LONGINT:C221($_al_ModuleSort; 50)
					$_l_SizeofArray:=0
					//DBWS_al_ModuleAccess{$_l_index}:=<>Mod_al_ModuleAccessType{$_l_index}
					
					//DBWS_at_ModuleText{$_l_index}:=<>Mod_at_ModuleName{$_l_index}
					
					ARRAY LONGINT:C221(DBWS_al_BarNumber; 50)
					ARRAY TEXT:C222(Mod_at_ToolTips; 50)
					ARRAY TEXT:C222(DBWS_at_WebName; 50)
					
					
					For ($_l_index; 1; Size of array:C274(DBWS_al_ModuleAccess))
						$_l_WebEnabledRow:=Find in array:C230($_al_WebEnabledModules; $_l_index)
						If ($_l_WebEnabledRow>0)
							If ((DB_GetModuleSettingByNUM($_l_index; "WEB"))>1)  //If the Module is available
								If (<>Mod_al_ModuleOrder{$_l_index}#0)  //If it is a Module with a Menu Bar
									If ($_l_index<=Size of array:C274(<>Mod_al_ModuleOrder))
										If (($_l_index=32) | ($_l_index=Module_IntServer))
											//An exception for Telephony so that it doesn't repeat
											$_l_BarNumberRow:=Find in array:C230(DBWS_al_BarNumber; 21)
											If ($_l_BarNumberRow<1)
												$_l_SizeofArray:=$_l_SizeofArray+1
												DBWS_al_BarNumber{$_l_SizeofArray}:=$_l_index
												$_al_ModuleSort{$_l_SizeofArray}:=<>Mod_al_ModuleOrder{$_l_index}
												Mod_at_ToolTips{$_l_SizeofArray}:=DBWS_at_ModuleText{DBWS_al_BarNumber{$_l_SizeofArray}}
												DBWS_at_WebName{$_l_SizeofArray}:=$_at_WebClassName{$_l_WebEnabledRow}
											End if 
										Else 
											$_l_SizeofArray:=$_l_SizeofArray+1
											DBWS_al_BarNumber{$_l_SizeofArray}:=$_l_index
											$_al_ModuleSort{$_l_SizeofArray}:=<>Mod_al_ModuleOrder{$_l_index}
											Mod_at_ToolTips{$_l_SizeofArray}:=DBWS_at_ModuleText{DBWS_al_BarNumber{$_l_SizeofArray}}
											DBWS_at_WebName{$_l_SizeofArray}:=$_at_WebClassName{$_l_WebEnabledRow}
										End if 
									End if 
								End if 
							End if 
						End if 
					End for 
					ARRAY LONGINT:C221(DBWS_al_BarNumber; $_l_SizeofArray)
					ARRAY LONGINT:C221($_al_ModuleSort; $_l_SizeofArray)
					ARRAY TEXT:C222(Mod_at_ToolTips; $_l_SizeofArray)
					ARRAY TEXT:C222(DBWS_at_WebName; $_l_SizeofArray)
					SORT ARRAY:C229($_al_ModuleSort; DBWS_al_BarNumber; Mod_at_ToolTips; >)
					$_l_SizeofArray:=Size of array:C274(DBWS_al_BarNumber)
					ARRAY LONGINT:C221(MOD_al_ModuleBarOffsets; 0)
					ARRAY TEXT:C222(DBWS_at_ModuleIconPath; 0)
					ARRAY TEXT:C222(DBWS_at_ModuleName; 0)
					ARRAY LONGINT:C221(DBWS_al_DisplayedModule; 0)
					For ($_l_index; 1; $_l_SizeofArray)
						If (DBWS_al_BarNumber{$_l_index}#30)
							$_l_ModuleNumber:=DBWS_al_BarNumber{$_l_index}
							$_l_ShowIcon:=DBWS_al_ShowIcon{$_l_ModuleNumber}
							If ($_l_ShowIcon=1)
								APPEND TO ARRAY:C911(DBWS_al_DisplayedModule; $_l_ModuleNumber)
								APPEND TO ARRAY:C911(MOD_al_ModuleBarOffsets; DBWS_al_BarNumber{$_l_index})
								Case of 
									: ((DBWS_al_BarNumber{$_l_index}=32) | (DBWS_al_BarNumber{$_l_index}=21) | (DBWS_al_BarNumber{$_l_index}=43))  //An exception
										$_t_ModuleFullName:="COMMUNICATIONS"
									: (DBWS_al_BarNumber{$_l_index}=1)
										$_t_ModuleFullName:="DIARY & ACCOUNTS"
									: (DBWS_al_BarNumber{$_l_index}=30)
										$_t_ModuleFullName:=Term_StoWT("SOP & STOCK CONTROL")
									Else 
										$_t_ModuleFullName:=Uppercase:C13(Term_AllWT(<>Mod_at_ModuleName{DBWS_al_BarNumber{$_l_index}}))  //Module Name as def in Modules Array
								End case 
								$_l_ModuleNumber:=DBWS_al_BarNumber{$_l_index}
								$_l_ShowIcon:=DBWS_al_ShowIcon{$_l_ModuleNumber}
								$_t_ModuleName:=$_t_ModuleFullName
								If ($_t_ModuleName="")
									//TRACE
								End if 
								$_l_PictureNumberoffset:=19800
								$_t_ModuleName:=Replace string:C233($_t_ModuleName; " "; "")
								$_t_ModuleName:=EXP_XMLCOMPLIANCE($_t_ModuleName)
								APPEND TO ARRAY:C911(DBWS_at_ModuleIconPath; "/Images/"+$_t_ModuleName+"_Combined.jpg")
								
								Case of 
									: ((DBWS_al_BarNumber{$_l_index}=32) | (DBWS_al_BarNumber{$_l_index}=21) | (DBWS_al_BarNumber{$_l_index}=43))  //An exception
										APPEND TO ARRAY:C911(DBWS_at_ModuleName; "COMMUNICATIONS")
									: (DBWS_al_BarNumber{$_l_index}=1)
										APPEND TO ARRAY:C911(DBWS_at_ModuleName; "DIARY & ACCOUNTS")
									: (DBWS_al_BarNumber{$_l_index}=30)
										APPEND TO ARRAY:C911(DBWS_at_ModuleName; Term_StoWT("SOP & STOCK CONTROL"))
									Else 
										APPEND TO ARRAY:C911(DBWS_at_ModuleName; Uppercase:C13(Term_AllWT(<>Mod_at_ModuleName{DBWS_al_BarNumber{$_l_index}})))
										//Module Name as def in Modules Array
								End case 
								DBWS_at_ModuleName{Size of array:C274(DBWS_at_ModuleName)}:=Lowercase:C14(DBWS_at_ModuleName{Size of array:C274(DBWS_at_ModuleName)})
								DBWS_at_ModuleName{Size of array:C274(DBWS_at_ModuleName)}:=Uppercase:C13(DBWS_at_ModuleName{Size of array:C274(DBWS_at_ModuleName)}[[1]]+Substring:C12(DBWS_at_ModuleName{Size of array:C274(DBWS_at_ModuleName)}; 2))
								
								
								//$WS_BARHELP{$CurrentButton}:=Mod_at_ToolTips{$_l_index}
								
								
								
								
								
							End if 
							
						End if 
					End for 
					DBWS_t_JsonIconBar:=""
					$_t_JSONTYPE:="STRING"
					$_t_ExistingString:=""
					
					$_l_ExistingStringInsertionPoint:=0
					$_t_InsertionHeader:="Modules"
					$_t_ModuleLabel:="Module"
					$_t_LabelLabel:="Label"
					$_t_IconLAbel:="Iconpath"
					$_t_WebName:="webclass"
					$DBWS_t_JsonIconBar:=DBWS_DatatoJSON(->$_t_JSONTYPE; ->$_t_ExistingString; ->$_l_ExistingStringInsertionPoint; ->$_t_InsertionHeader; ->$_t_ModuleLabel; ->DBWS_al_DisplayedModule; ->$_t_LabelLabel; ->DBWS_at_ModuleName; ->$_t_IconLAbel; ->DBWS_at_ModuleIconPath; ->$_t_WebName; ->DBWS_at_WebName)
					//$_t_PathtoImages:=Create document("JSONforTest.txt";"TEXT")
					//SEND PACKET($_t_PathtoImages;$DBWS_t_JsonIconBar)
					//Close DocUMENT($_t_PathtoImages)
					DBWS_bo_ToolbarConfigured:=True:C214
					If (DBWS_l_CallBack>0)
						SET PROCESS VARIABLE:C370(DBWS_l_CallBack; DBWS_t_JsonIconBar; $DBWS_t_JsonIconBar)
					End if 
				Else 
					If (DBWS_l_CallBack>0)
						SET PROCESS VARIABLE:C370(DBWS_l_CallBack; DBWS_t_JsonIconBar; $DBWS_t_JsonIconBar)
					End if 
				End if 
			: (DBWS_l_CallAction=1100)
				
				//First check that DBWS_t_FirstModuleName is a module with a flippin icon!!!
				If (DBWS_t_FirstModuleName#"")
					$_bo_hasIcon:=<>Mod_abo_HasIcon{Find in array:C230(<>Mod_at_ModuleName; DBWS_t_FirstModuleName)}
					If ($_bo_hasIcon=False:C215)
						For ($_l_index; 1; Size of array:C274(<>Mod_abo_HasIcon))
							If (<>Mod_abo_HasIcon{$_l_index})
								$_l_WebEnabledRow:=Find in array:C230($_al_WebEnabledModules; $_l_index)
								If ($_l_WebEnabledRow>0)
									DBWS_t_FirstModuleName:=<>Mod_at_ModuleName{$_l_index}
									$_l_index:=99999
								End if 
							End if 
						End for 
					End if 
				End if 
				
				//Returns the logged in users module, context(table) and form name
				If (DBWS_l_CallBack>0)
					If (DB_t_currentSelectedModuleIdent="")
						DB_t_currentSelectedModuleIdent:=DBWS_t_FirstModuleName
						If (DBWS_t_FirstModuleName#"")
							DB_l_currentSelectedModuleID:=Find in array:C230(<>Mod_at_ModuleName; DBWS_t_FirstModuleName)
						Else 
							For ($_l_index; 1; Size of array:C274($_al_WebEnabledModules))
								DB_l_currentSelectedModuleID:=$_al_WebEnabledModules{$_l_index}
								$_bo_hasIcon:=<>Mod_abo_HasIcon{DB_l_currentSelectedModuleID}
								If ($_bo_hasIcon)
									DBWS_t_FirstModuleName:=<>Mod_at_ModuleName{DB_l_currentSelectedModuleID}
									DB_t_currentSelectedModuleIdent:=DBWS_t_FirstModuleName
									$_l_index:=999999
								End if 
							End for 
							
						End if 
						
						$_l_WebEnabledRow:=Find in array:C230($_al_WebEnabledModules; DB_l_currentSelectedModuleID)
						If ($_l_WebEnabledRow<0)  //swith the default to the first module...
							For ($_l_index; 1; Size of array:C274($_al_WebEnabledModules))
								DB_l_currentSelectedModuleID:=$_al_WebEnabledModules{$_l_index}
								$_bo_hasIcon:=<>Mod_abo_HasIcon{DB_l_currentSelectedModuleID}
								If ($_bo_hasIcon)
									DBWS_t_FirstModuleName:=<>Mod_at_ModuleName{DB_l_currentSelectedModuleID}
									DB_t_currentSelectedModuleIdent:=DBWS_t_FirstModuleName
									$_l_index:=999999
								End if 
							End for 
							
							
						End if 
						DB_l_currentContextReference:=0  //Current Viewed table
						DB_t_currentContextFormName:=""
						SET PROCESS VARIABLE:C370(DBWS_l_CallBack; DBWS_t_CurrentContext; DBWS_t_CurrentContext)
						SET PROCESS VARIABLE:C370(DBWS_l_CallBack; DBWS_t_CurrentForm; DBWS_t_CurrentForm)
						SET PROCESS VARIABLE:C370(DBWS_l_CallBack; DBWS_t_JsonCurrentModule; DBWS_t_FirstModuleName)
						
					Else 
						$_l_CurrentModuleID:=DB_l_currentSelectedModuleID  //make sure when you click on a module this is changed BEFORE you get the new menu
						If ($_l_CurrentModuleID>0)
							SET PROCESS VARIABLE:C370(DBWS_l_CallBack; DBWS_t_CurrentContext; DBWS_t_CurrentContext)
							SET PROCESS VARIABLE:C370(DBWS_l_CallBack; DBWS_t_CurrentForm; DBWS_t_CurrentForm)
							SET PROCESS VARIABLE:C370(DBWS_l_CallBack; DBWS_t_JsonCurrentModule; <>Mod_at_ModuleName{$_l_CurrentModuleID})
							
						Else 
							
							DB_t_currentSelectedModuleIdent:=DBWS_t_FirstModuleName
							DB_l_currentSelectedModuleID:=Find in array:C230(<>Mod_at_ModuleName; DBWS_t_FirstModuleName)
							$_l_WebEnabledRow:=Find in array:C230($_al_WebEnabledModules; DB_l_currentSelectedModuleID)
							If ($_l_WebEnabledRow<0)  //swith the default to the first module...
								DB_l_currentSelectedModuleID:=$_al_WebEnabledModules{1}
								DBWS_t_FirstModuleName:=<>Mod_at_ModuleName{DB_l_currentSelectedModuleID}
							End if 
							DB_l_currentContextReference:=0  //Current Viewed table
							DB_t_currentContextFormName:=""
							SET PROCESS VARIABLE:C370(DBWS_l_CallBack; DBWS_t_CurrentContext; DBWS_t_CurrentContext)
							SET PROCESS VARIABLE:C370(DBWS_l_CallBack; DBWS_t_CurrentForm; DBWS_t_CurrentForm)
							SET PROCESS VARIABLE:C370(DBWS_l_CallBack; DBWS_t_JsonCurrentModule; DBWS_t_FirstModuleName)
							
						End if 
						
					End if 
				End if 
			: (DBWS_l_CallAction=2)  //Get menu-gets the menu associated with the current view incorporating the menu for the current module
				
				$_t_ModuleMenuString:=DB_t_currentSelectedModuleIdent+"_"+String:C10(DB_l_currentContextReference)+"_"+DBWS_t_CurrentForm
				$_l_ModuleContextRow:=Find in array:C230(DBWS_at_MenuContext; $_t_ModuleMenuString)
				If ($_l_ModuleContextRow>0)
					
				Else 
					
					DB_t_MenusFormat:="JSON"
					Db_t_MenuType:="menu string"
					$_t_MenuBar:=""
					DBWS_t_ModuleMenuJSON:=""
					If (DB_l_currentContextReference=0)  //we do not have a table open
						Modules_MenuExe(<>Mod_at_ProcessFunction{DB_l_currentSelectedModuleID}; Current process:C322; "menu string"; "JSON"; "WEB")
						If (DBWS_t_ModuleMenuJSON#"")
							DBWS_t_ModuleMenuJSON:="{"+DBWS_t_ModuleMenuJSON+"}"
							SET PROCESS VARIABLE:C370(DBWS_l_CallBack; DBWS_t_ModuleMenuJSON; DBWS_t_ModuleMenuJSON)
							
							SET TEXT TO PASTEBOARD:C523($_t_MenuBar)
						End if 
						
					Else 
						//we have a table open..what form...
					End if 
					
				End if 
				If (DB_l_currentContextReference>0)  //Current viewed table
				End if 
				
				//Append to
				//ARRAY TEXT(DBWS_at_MenuContext;0)  //This is a string containing Module+"_"+Context+"_"+Form" `the menus etc cached for this user for that view as JSON for speedy response
				//ARRAY TEXT(DBWS_at_MenuJson;0)  //Each concatenated context will have one menu
				
			: (DBWS_l_CallAction=3) | (DBWS_l_CallAction=4)  // get data grid
				
				
				If (DBWS_T_TableName#"")  //note that here we may also pass a context
					//note also that table name is actually the menu item name.
					//So we must Translate the table name, context and form to a number for the form consistent with
					$_t_FormReference:=DBWS_FormNametoIdentity(DBWS_T_TableName; DBWS_T_TableContext; DBWS_T_TableForm)
					$_l_FormReferenceRow:=Find in array:C230(DBWS_at_GridsJSON; $_t_FormReference)
					If ($_l_FormReferenceRow<0)
						//So here we load the 'list layouts' not exactly the same way we do in daybook
						DBWS_t_GridLabels:=""
						ARRAY POINTER:C280($_aPtr_FieldPointers; 0)
						ARRAY TEXT:C222($_at_ColumnFormula; 0)
						ARRAY TEXT:C222(DBWS_at_ColumnLabels; 0)
						DBWS_t_GridJSON:=LB_LayoutstoJson($_t_FormReference; DBWS_t_loginUserInitials; ->DBWS_at_ColumnLabels; ->$_aPtr_FieldPointers; ->$_at_ColumnFormula)
						
						
						APPEND TO ARRAY:C911(DBWS_at_GridsJSON; $_t_FormReference)
						APPEND TO ARRAY:C911(DBWS_at_GridSettingsJSON; DBWS_t_GridLabels)
						INSERT IN ARRAY:C227(DBWS_at_LabelsJSON; Size of array:C274(DBWS_at_LabelsJSON)+1; 1)
						COPY ARRAY:C226(DBWS_at_ColumnLabels; DBWS_at_LabelsJSON{Size of array:C274(DBWS_at_LabelsJSON)})
						
						
						//APPEND TO ARRAY(DBWS_at_LabelsJSON;DBWS_at_ColumnLabels)
						APPEND TO ARRAY:C911(DBWS_al_TableCacheID; 0)
						$_l_SizeofArray:=Size of array:C274(DBWS_aptr_FieldPointers)+1
						INSERT IN ARRAY:C227(DBWS_aptr_FieldPointers; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(DBWS_at_ColumnFormulas; $_l_SizeofArray; 1)
						For ($_l_index; 1; Size of array:C274($_aPtr_FieldPointers))
							APPEND TO ARRAY:C911(DBWS_aptr_FieldPointers{$_l_SizeofArray}; $_aPtr_FieldPointers{$_l_index})
							APPEND TO ARRAY:C911(DBWS_at_ColumnFormulas{$_l_SizeofArray}; $_at_ColumnFormula{$_l_index})
							
						End for 
						
					Else 
						//this view is already cached for this user in this session-note that we will need a way to un-cache it if its altered.
						DBWS_t_GridJSON:=DBWS_at_GridSettingsJSON{$_l_FormReferenceRow}
						
					End if 
					
					
					If (DBWS_l_CallAction=3)
						
						SET PROCESS VARIABLE:C370(DBWS_l_CallBack; DBWS_t_DataGridJSON; DBWS_t_DataGridJSON)
					Else 
						//SET TEXT TO PASTEBOARD(DBWS_t_GridJSON)
						SET PROCESS VARIABLE:C370(DBWS_l_CallBack; DBWS_t_DataGridJSON; DBWS_t_GridJSON)
						
					End if 
					DBWS_t_CurrentGridReference:=$_t_FormReference
					//ARRAY TEXT(DBWS_at_GridsJSON;0)  // this contains the reference(listbox form e 02401 etc)
					//ARRAY TEXT(DBWS_at_GridSettingsJSON;0)  //note that this can be recalculated it the user changes it.
					
				End if 
				
			: (DBWS_l_CallAction=4)  //Get filters
			: (DBWS_l_CallAction=5)  //Get selection of Data does not cache into json format
				
				If (DBWS_l_TableNumber=0)  // we are getting a selection of records for the main listing window
					If (DBWS_l_CurrentTable>0)  //this value is set in DBWS_FormNametoIdentity
						If (DBWS_t_CurrentGridReference#"")  //this is set by action 3/4
							$_l_GridReferenceRow:=Find in array:C230(DBWS_at_GridsJSON; DBWS_t_CurrentGridReference)
							If ($_l_GridReferenceRow>0)  //it should be!!
								$_l_CurrentTableCacheID:=DBWS_al_TableCacheID{$_l_GridReferenceRow}
								ARRAY POINTER:C280($_aPtr_ColumnArrayPointers; 0)
								ARRAY TEXT:C222($_at_ColumnFormula; 0)
								COPY ARRAY:C226(DBWS_aptr_FieldPointers{$_l_GridReferenceRow}; $_aPtr_ColumnArrayPointers)
								COPY ARRAY:C226(DBWS_at_ColumnFormulas{$_l_GridReferenceRow}; $_at_ColumnFormula)
								If ($_l_CurrentTableCacheID=0)
									//no records loaded
									$_ptr_Table:=Table:C252(DBWS_l_CurrentTable)
									ALL RECORDS:C47($_ptr_Table->)
									If (DBWS_t_SortCell#"")
										$_l_SortReferenceRow:=Find in array:C230(DBWS_at_LabelsJSON{$_l_GridReferenceRow}; DBWS_t_SortCell)
										If ($_l_SortReferenceRow>0)
											$_ptr_SortField:=DBWS_aptr_FieldPointers{$_l_GridReferenceRow}{$_l_SortReferenceRow}
											$_ptr_SortTable:=Table:C252(DBWS_l_CurrentTable)
											ORDER BY:C49($_ptr_SortTable->; $_ptr_SortField->)
										End if 
									End if 
									DBWS_l_RecordCacheIDS:=AA_GetNextID(->DBWS_l_RecordCacheIDS)
									APPEND TO ARRAY:C911(DBWS_al_RecordCacheIDS; DBWS_l_RecordCacheIDS)
									APPEND TO ARRAY:C911(DBWS_al_RecordCachTableNum; DBWS_l_CurrentTable)
									$_l_SizeofArray:=Size of array:C274(DBWS_al_CachedCurSubselection)
									INSERT IN ARRAY:C227(DBWS_al_CachedRecordSelection; $_l_SizeofArray+1; 1)
									INSERT IN ARRAY:C227(DBWS_al_CachedCurSubselection; $_l_SizeofArray+1; 1)
									INSERT IN ARRAY:C227(DBWS_al_CachedCurSubselection{$_l_SizeofArray+1}; 1; 2)
									DBWS_al_CachedCurSubselection{$_l_SizeofArray+1}{1}:=0  //CURRENT= SUB  SELECTION(PAGED)STARTS AT ZERO
									DBWS_al_CachedCurSubselection{$_l_SizeofArray+1}{2}:=0  //CURRENT= SUB  SELECTION(PAGED)ENDS AT ZERO
									LONGINT ARRAY FROM SELECTION:C647($_ptr_Table->; DBWS_al_CachedRecordSelection{$_l_SizeofArray+1})
									$_l_CurrentTableCacheID:=DBWS_l_RecordCacheIDS
									DBWS_al_TableCacheID{$_l_GridReferenceRow}:=$_l_CurrentTableCacheID
									
								End if 
								$_l_CacheRow:=Find in array:C230(DBWS_al_RecordCacheIDS; $_l_CurrentTableCacheID)
								If ($_l_CacheRow>0)
									ARRAY LONGINT:C221($_al_CurrentSelection; 0)
									//COPY THE ARRAY SO WE CAN MANIPULATE IT
									COPY ARRAY:C226(DBWS_al_CachedRecordSelection{$_l_CacheRow}; $_al_CurrentSelection)
									
									$_l_StartingPoint:=((DBWS_l_PageNumber*DBWS_l_NumberofRows)-DBWS_l_NumberofRows)
									$_l_EndingPoint:=$_l_StartingPoint+DBWS_l_NumberofRows
									$_l_CutOffStart:=$_l_StartingPoint
									$_l_CutOffEnd:=$_l_EndingPoint
									//DBWS_al_CachedCurSubselection{$_l_CacheRow}{1}:
									//$_l_CutOffEnd:=DBWS_al_CachedCurSubselection{$_l_CacheRow}{2}
									//If ($_l_CutOffEnd>0)
									$_l_NumbertoCut:=$_l_CutOffEnd-$_l_CutOffStart
									If ($_l_StartingPoint>0)
										DELETE FROM ARRAY:C228($_al_CurrentSelection; 1; $_l_StartingPoint)
									End if 
									ARRAY LONGINT:C221($_al_CurrentSelection; DBWS_l_NumberofRows)
									$_ptr_Table:=Table:C252(DBWS_l_CurrentTable)
									CREATE SELECTION FROM ARRAY:C640($_ptr_Table->; $_al_CurrentSelection)
									//TRACE
									//SELECTION TO ARRAY([COMPANIES]Company Code;$_at_CodesS)
									
									DBWS_t_XMLData:=DB_CurrentSelectiontoXML(DBWS_l_CurrentTable; $_l_StartingPoint; DBWS_l_PageNumber; ->$_aPtr_ColumnArrayPointers; ->$_at_ColumnFormula)
									SET PROCESS VARIABLE:C370(DBWS_l_CallBack; DBWS_t_XMLData; DBWS_t_XMLData)
									
								End if 
								
							End if 
							//ARRAY LONGINT(DBWS_al_RecordCacheIDS;0)
							//ARRAY LONGINT(DBWS_al_RecordCachTableNum;0)  //just for safety
							//ARRAY LONGINT(DBWS_al_CachedCurSubselection;0;0)  //this first an last selected record numbers within the selection
							//ARRAY LONGINT(DBWS_al_CachedRecordSelection;0;0)
							
							
						End if 
						
					Else 
						//some error
						
					End if 
					
					
				Else 
					//we are getting a set of 'related' records for the current loaded record in the main table
					
				End if 
				
			: (DBWS_l_CallAction=6)  //on connection-re-establish connection
				If (DB_l_currentContextReference>0)
					//SET PROCESS VARIABLE(
				Else 
				End if 
			: (DBWS_l_CallAction=8)
				If (DBWS_T_TableName#"")  //note that here we may also pass a context
					//note also that table name is actually the menu item name.
					//So we must Translate the table name, context and form to a number TABLE NUMBER
					//$_t_FormReference:=DBWS_FormNametonumber(DBWS_T_TableName;DBWS_T_TableContext;DBWS_T_TableForm)
				End if 
			: (DBWS_l_CallAction=-1)
				$_bo_Exit:=True:C214
				
		End case 
		CLEAR SEMAPHORE:C144("WebHandler_"+String:C10(Current process:C322))
		If (Not:C34($_bo_Exit)) & (Not:C34(<>SYS_bo_QuitCalled))
			
			PAUSE PROCESS:C319(Current process:C322)
		End if 
		
	Until (<>SYS_bo_QuitCalled) | ($_bo_Exit)
	
	
	
	
End if 
ERR_MethodTrackerReturn("DBWS_UserData"; $_t_oldMethodName)

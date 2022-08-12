If (False:C215)
	//object Method Name: Object Name:      DB_OutputForm.oSelectionsAdd1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	//ARRAY BOOLEAN(DB_lb_Setsandselections;0)
	ARRAY LONGINT:C221($_al_Lines; 0)
	ARRAY LONGINT:C221($_al_SetClassID; 0)
	//ARRAY LONGINT(DB_al_SetID;0)
	//ARRAY PICTURE(DB_apic_SetPicture;0)
	ARRAY TEXT:C222($_at_SetClass; 0)
	ARRAY TEXT:C222($_at_SetTypes; 0)
	//ARRAY TEXT(DB_at_ConfigureOptions;0)
	//ARRAY TEXT(DB_at_MethodParameters;0)
	//ARRAY TEXT(DB_at_SetMethod;0)
	//ARRAY TEXT(DB_at_SetName;0)
	C_BOOLEAN:C305($_bo_Create; $_bo_CurrentSelection; $_bo_OptionKey; DB_bo_ShowArrayBased; SEL_SelectionsShare)
	C_LONGINT:C283($_l_ActionRowSelected; $_l_ClassRow; $_l_event; $_l_Index; $_l_ItemID; $_l_ItemParent; $_l_NumberofSets; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_objectTop)
	C_LONGINT:C283($_l_ObjectWIdth; $_l_Process; $_l_SelectedRecords; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; DB_l_CurrentDisplayedForm; DB_l_MyTempMacro; Sel_ConfigSelection; SM_l_ContextItemID)
	C_PICTURE:C286($_pic_Nul; DB_pic_BuiltSet; DB_pic_GroupedSetList; DB_pic_SelectedSet)
	C_POINTER:C301($_ptr_CUrrentObject; $_ptr_Table)
	C_REAL:C285(DB_l_newSetClass)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_NewSetName; $_t_oldMethodName; $_t_ProcessName; $_t_ScriptCode; $_t_ScriptName; $_t_SetType; DB_t_CurrentContext; SM_t_loadedsetName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oSelectionsAdd1"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_l_NumberofSets:=Size of array:C274(DB_at_SetName)
		If (DB_al_SetID{$_l_NumberofSets}=999999)  //new Record not saved
			Case of 
				: (DB_at_SetName{$_l_NumberofSets}="New Set")
					$_t_NewSetName:=Gen_Request("Enter Name for new set"; "New Set")
					If (OK=1)
						DB_at_SetName{$_l_NumberofSets}:=$_t_NewSetName
					End if 
				: (DB_at_SetName{$_l_NumberofSets}="New Group")
					$_t_NewSetName:=Gen_Request("Enter Name for new group"; "New Group")
					If (OK=1)
						DB_at_SetName{$_l_NumberofSets}:=$_t_NewSetName
					End if 
			End case 
			ARRAY TEXT:C222($_at_SetClass; 4)
			ARRAY LONGINT:C221($_al_SetClassID; 4)
			$_at_SetClass{1}:="Fixed List"
			$_at_SetClass{2}:="Dynamic List"
			$_at_SetClass{3}:="Fixed List with Dynamic Query"
			$_at_SetClass{4}:="List Group Folder"
			$_al_SetClassID{1}:=853
			$_al_SetClassID{2}:=854
			$_al_SetClassID{3}:=852
			$_al_SetClassID{3}:=855
			$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
			$_l_ItemID:=-(AA_GetNextIDinMethod(->SM_l_ContextItemID))
			DB_al_SetID{$_l_NumberofSets}:=$_l_ItemID
			DB_at_SetMethod{$_l_NumberofSets}:="DB_SelectSet"
			DB_at_MethodParameters{$_l_NumberofSets}:=String:C10($_l_ItemID)
			If (DB_l_newSetClass=0)
				DB_l_newSetClass:=853
			End if 
			$_l_ClassRow:=Find in array:C230($_al_SetClassID; DB_l_newSetClass)
			SM_UpdateArrays("PER"; DB_at_SetName{$_l_NumberofSets}; $_l_ItemID; $_l_ItemParent; ""; 0; $_at_SetClass{$_l_ClassRow}; $_al_SetClassID{$_l_ClassRow})
			Case of 
				: (DB_l_newSetClass=853)
					SM_saveSet("DB_NewSet"; $_l_ItemID)
				: (DB_l_newSetClass=852) | (DB_l_newSetClass=854)
					If (DB_l_MyTempMacro=0)
						DB_l_MyTempMacro:=AA_GetNextID(->DB_l_MyTempMacro)
					End if 
					$_t_ScriptCode:=String:C10(DB_l_MyTempMacro; "######")
					$_t_ScriptName:="Data Query "+"Temp"
					READ WRITE:C146([SCRIPTS:80])
					QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ScriptCode)
					If (Records in selection:C76([SCRIPTS:80])=1)
						[SCRIPTS:80]Script_Code:1:=String:C10(DB_al_SetID{$_l_NumberofSets})
						[SCRIPTS:80]Script_Name:2:="Data Query "+DB_at_SetName{$_l_NumberofSets}
						DB_SaveRecord(->[SCRIPTS:80])
						
					End if 
				: (DB_l_newSetClass=855)  //group list
					Gen_Alert("Drag Selections to add them to this group")
					
			End case 
			//the above saves the data to the arrays. now save the arrays.
			//START TRANSACTION
			SM_UPDATEDATA
			LB_SetEnterable(->DB_lb_Setsandselections; False:C215; 0)
			GOTO OBJECT:C206(Sel_ConfigSelection)
			
		End if 
		If (DB_al_SetID{$_l_NumberofSets}=0)  // not user sets yet
			APPEND TO ARRAY:C911(DB_at_SetName; "")
			APPEND TO ARRAY:C911(DB_apic_SetPicture; $_pic_Nul)
			APPEND TO ARRAY:C911(DB_al_SetID; 9999998)
			APPEND TO ARRAY:C911(DB_at_SetMethod; "")
			APPEND TO ARRAY:C911(DB_at_MethodParameters; "")
			$_l_NumberofSets:=Size of array:C274(DB_at_SetName)
		End if 
		//```
		$_bo_CurrentSelection:=False:C215
		If (DB_bo_ShowArrayBased)
			ARRAY LONGINT:C221($_al_Lines; 0)
			LB_GetSelect(->DB_lb_OutputArrays; ->$_al_Lines)
			If (Size of array:C274($_al_Lines)>1)
				$_bo_CurrentSelection:=True:C214
			End if 
			$_l_SelectedRecords:=Size of array:C274($_al_Lines)
			
		Else 
			If (Records in set:C195("ListboxSet0")>0)
				$_bo_CurrentSelection:=True:C214
			End if 
			$_l_SelectedRecords:=Records in set:C195("ListboxSet0")
		End if 
		$_ptr_CUrrentObject:=Self:C308
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		OBJECT GET COORDINATES:C663($_ptr_CUrrentObject->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRIght; $_l_ObjectBottom)
		ARRAY TEXT:C222($_at_SetTypes; 0)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		OBJECT GET COORDINATES:C663($_ptr_CUrrentObject->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRIght; $_l_ObjectBottom)
		ARRAY TEXT:C222($_at_SetTypes; 0)
		$_bo_OptionKey:=Gen_Option
		If ($_bo_CurrentSelection)
			If (User in group:C338(Current user:C182; "Administrators")) | (User in group:C338(Current user:C182; "Designers")) | ($_bo_OptionKey)
				APPEND TO ARRAY:C911($_at_SetTypes; "Create Set from Current Highlighted Selection ("+String:C10($_l_SelectedRecords)+"Records)")
				APPEND TO ARRAY:C911($_at_SetTypes; "Create Set from Current records")
				APPEND TO ARRAY:C911($_at_SetTypes; "Create Search Criteria")
				APPEND TO ARRAY:C911($_at_SetTypes; "Create Query Script")
				APPEND TO ARRAY:C911($_at_SetTypes; "Load Set From Disk")
				APPEND TO ARRAY:C911($_at_SetTypes; "Save Current Records to Disk")
				APPEND TO ARRAY:C911($_at_SetTypes; "Create Group Folder")
			Else 
				APPEND TO ARRAY:C911($_at_SetTypes; "Create Set from Current Highlighted Selection ("+String:C10($_l_SelectedRecords)+"Records)")
				APPEND TO ARRAY:C911($_at_SetTypes; "Create Set from Current records")
				APPEND TO ARRAY:C911($_at_SetTypes; "Create Search Criteria")
				APPEND TO ARRAY:C911($_at_SetTypes; "Create Group Folder")
			End if 
		Else 
			
			If (User in group:C338(Current user:C182; "Administrators")) | (User in group:C338(Current user:C182; "Designers")) | ($_bo_OptionKey)
				
				APPEND TO ARRAY:C911($_at_SetTypes; "Create Set from Current records")
				APPEND TO ARRAY:C911($_at_SetTypes; "Create Search Criteria")
				APPEND TO ARRAY:C911($_at_SetTypes; "Create Query Script")
				APPEND TO ARRAY:C911($_at_SetTypes; "Load Set From Disk")
				APPEND TO ARRAY:C911($_at_SetTypes; "Save Current Records to Disk")
				APPEND TO ARRAY:C911($_at_SetTypes; "Create Group Folder")
			Else 
				
				APPEND TO ARRAY:C911($_at_SetTypes; "Create Set from Current records")
				APPEND TO ARRAY:C911($_at_SetTypes; "Create Search Criteria")
				APPEND TO ARRAY:C911($_at_SetTypes; "Create Group Folder")
				
			End if 
		End if 
		//```
		$_bo_Create:=False:C215
		$_l_ActionRowSelected:=GEN_RequestViaPopUp(->$_at_SetTypes; ->$_pic_Nul; "Select Seletion type to create"; False:C215; ->$_bo_Create; "None"; "Continue")
		ARRAY TEXT:C222(DB_at_ConfigureOptions; 0)
		If ($_l_ActionRowSelected>0)
			If ($_at_SetTypes{$_l_ActionRowSelected}#"Load Set From Disk") & ($_at_SetTypes{$_l_ActionRowSelected}#"Save Current Records to Disk")
				
				If ($_at_SetTypes{$_l_ActionRowSelected}#"Create Group Folder")
					APPEND TO ARRAY:C911(DB_at_SetName; "New Set")
					
					APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_SelectedSet)
				Else 
					APPEND TO ARRAY:C911(DB_at_SetName; "New Group")
					
					APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_GroupedSetList)
				End if 
				APPEND TO ARRAY:C911(DB_al_SetID; 999999)
				APPEND TO ARRAY:C911(DB_at_SetMethod; "")  //note we leave this blank at this moment so it wont try to select anything
				APPEND TO ARRAY:C911(DB_at_MethodParameters; "")
			End if 
			If (False:C215)
				If ($_bo_CurrentSelection)
					If (User in group:C338(Current user:C182; "Administrators")) | (User in group:C338(Current user:C182; "Designers"))
						APPEND TO ARRAY:C911($_at_SetTypes; "Create Set from Current Highlighted Selection ("+String:C10($_l_SelectedRecords)+"Records)")
						APPEND TO ARRAY:C911($_at_SetTypes; "Create Set from Current records")
						APPEND TO ARRAY:C911($_at_SetTypes; "Create Search Criteria")
						APPEND TO ARRAY:C911($_at_SetTypes; "Create Query Script")
					Else 
						APPEND TO ARRAY:C911($_at_SetTypes; "Create Set from Current Highlighted Selection ("+String:C10($_l_SelectedRecords)+"Records)")
						APPEND TO ARRAY:C911($_at_SetTypes; "Create Set from Current records")
						APPEND TO ARRAY:C911($_at_SetTypes; "Create Search Criteria")
						
					End if 
				Else 
					$_bo_OptionKey:=Gen_Option
					If (User in group:C338(Current user:C182; "Administrators")) | (User in group:C338(Current user:C182; "Designers")) | ($_bo_OptionKey)
						
						APPEND TO ARRAY:C911($_at_SetTypes; "Create Set from Current records")
						APPEND TO ARRAY:C911($_at_SetTypes; "Create Search Criteria")
						APPEND TO ARRAY:C911($_at_SetTypes; "Create Query Script")
					Else 
						
						APPEND TO ARRAY:C911($_at_SetTypes; "Create Set from Current records")
						APPEND TO ARRAY:C911($_at_SetTypes; "Create Search Criteria")
						
					End if 
				End if 
			End if 
			DB_l_newSetClass:=0
			
			$_t_SetType:=$_at_SetTypes{$_l_ActionRowSelected}
			Case of 
				: ($_t_SetType="Create Group Folder")
					DB_l_newSetClass:=855
					DB_apic_SetPicture{Size of array:C274(DB_apic_SetPicture)}:=DB_pic_GroupedSetList
					
				: ($_t_SetType="Create Query Script")
					DB_l_newSetClass:=854
					DB_apic_SetPicture{Size of array:C274(DB_apic_SetPicture)}:=DB_pic_BuiltSet
					If (DB_l_MyTempMacro=0)
						DB_l_MyTempMacro:=AA_GetNextID(->DB_l_MyTempMacro)
					End if 
					$_t_ScriptCode:=String:C10(DB_l_MyTempMacro; "######")
					$_t_ScriptName:="Data Query "+"Temp"
					QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ScriptCode)
					If (Records in selection:C76([SCRIPTS:80])=0)  //there should not be a record
						CREATE RECORD:C68([SCRIPTS:80])
						[SCRIPTS:80]Script_Code:1:=$_t_ScriptCode
						[SCRIPTS:80]Script_Name:2:="LM "+$_t_ScriptName
						[SCRIPTS:80]Person:5:=<>PER_t_CurrentUserInitials
						[SCRIPTS:80]Table_Number:8:=DB_l_CurrentDisplayedForm
						[SCRIPTS:80]Script_Class:11:=SM Macro
						DB_SaveRecord(->[SCRIPTS:80])
						UNLOAD RECORD:C212([SCRIPTS:80])
					End if 
					$_t_ProcessName:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Macro")
					$_l_Process:=New process:C317("DBI_DisplayRecord"; DB_ProcessMemoryinit(2); $_t_ProcessName; Current process:C322; Table:C252(->[SCRIPTS:80]); ""; $_t_ScriptCode)
					APPEND TO ARRAY:C911(DB_at_ConfigureOptions; "Edit Query")
					OBJECT SET VISIBLE:C603(DB_at_ConfigureOptions; True:C214)
				: ($_t_SetType="Create Search Criteria")
					DB_l_newSetClass:=854
					DB_apic_SetPicture{Size of array:C274(DB_apic_SetPicture)}:=DB_pic_BuiltSet
					If (DB_l_MyTempMacro=0)
						DB_l_MyTempMacro:=AA_GetNextID(->DB_l_MyTempMacro)
					End if 
					$_t_ScriptCode:=String:C10(DB_l_MyTempMacro; "######")
					$_t_ScriptName:="Data Query "+"Temp"
					$_l_Process:=New process:C317("SM_EditMacro"; DB_ProcessMemoryinit(1); "Query WIzard"; Current process:C322; $_t_ScriptCode; $_t_ScriptName; <>PER_t_CurrentUserInitials; DB_l_CurrentDisplayedForm; DB_T_CurrentMenuContext)
					APPEND TO ARRAY:C911(DB_at_ConfigureOptions; "Edit Query")
					OBJECT SET VISIBLE:C603(DB_at_ConfigureOptions; True:C214)
				: ($_t_SetType="Create Set from Current records")
					DB_l_newSetClass:=853
					CREATE SET:C116(Table:C252(DB_l_CurrentDisplayedForm)->; "DB_NewSet")
					OBJECT SET VISIBLE:C603(DB_at_ConfigureOptions; False:C215)
				: ($_t_SetType="Load Set From Disk")
					$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
					SM_t_loadedsetName:="TempSet"
					LOAD SET:C185($_ptr_Table->; SM_t_loadedsetName; "")
					USE SET:C118("TempSet")
					CREATE SET:C116($_ptr_Table->; "DB_NewSet")
					If (OK=1)
						Gen_Confirm("Add this to the selection manager?"; "No"; "Yes")
						If (OK=0)
							APPEND TO ARRAY:C911(DB_at_SetName; "New Set")
							APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_SelectedSet)
							APPEND TO ARRAY:C911(DB_al_SetID; 999999)
							APPEND TO ARRAY:C911(DB_at_SetMethod; "")  //note we leave this blank at this moment so it wont try to select anything
							APPEND TO ARRAY:C911(DB_at_MethodParameters; "")
							DB_l_newSetClass:=853
							OBJECT SET VISIBLE:C603(DB_at_ConfigureOptions; False:C215)
						End if 
						OK:=1
					End if 
					If (Records in selection:C76($_ptr_Table->)>0)
						SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
					End if 
					$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
					SRCH_Applyfilterstoselection($_ptr_Table)
					DB_SetFormMenuoptions
					DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
					DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
				: ($_t_SetType="Save Current Records to Disk")
					$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
					COPY NAMED SELECTION:C331($_ptr_Table->; "$Temp")
					If (DB_bo_ShowArrayBased)
						$_l_SelectedRecords:=Size of array:C274($_al_Lines)
						For ($_l_Index; 1; Size of array:C274($_al_Lines))
						End for 
					Else 
						If (Records in set:C195("ListboxSet0")>0)
							Gen_Confirm("Use Highlighted Selection?"; "Yes"; "No")
							If (OK=1)
								USE SET:C118("ListboxSet0")
							End if 
						End if 
						CREATE SET:C116($_ptr_Table->; "DB_NewSet")
						SAVE SET:C184("DB_NewSet"; "")
					End if 
					USE NAMED SELECTION:C332("$Temp")
					
				Else 
					DB_l_newSetClass:=853
					$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
					COPY NAMED SELECTION:C331($_ptr_Table->; "$Temp")
					If (DB_bo_ShowArrayBased)
						$_l_SelectedRecords:=Size of array:C274($_al_Lines)
						For ($_l_Index; 1; Size of array:C274($_al_Lines))
						End for 
					Else 
						USE SET:C118("ListboxSet0")
						CREATE SET:C116($_ptr_Table->; "DB_NewSet")
					End if 
					USE NAMED SELECTION:C332("$Temp")
					
					//SET VISIBLE(DB_at_ConfigureOptions;False)
			End case 
			
			
			
			OBJECT SET VISIBLE:C603(SEL_SelectionsShare; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSelectionsOptions"; False:C215)
			
			OBJECT GET COORDINATES:C663(*; "oSelectionsListbox"; $_l_ObjectLeft; $_l_objectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_ObjectWIdth:=$_l_ObjectRight-$_l_ObjectLeft
			LB_SetColumnWidths(->DB_lb_Setsandselections; "SMGR_t"; 1; 30; $_l_ObjectWIdth-(30+20); 0; 0; 0)
			LB_SetEnterable(->DB_lb_Setsandselections; True:C214; 2)
			GOTO OBJECT:C206(DB_lb_Setsandselections)
			LB_SetScroll(->DB_lb_Setsandselections; $_l_NumberofSets; 0)
			LB_GoToCell(->DB_lb_Setsandselections; 2; $_l_NumberofSets+1)
			APPEND TO ARRAY:C911(DB_at_ConfigureOptions; "Save Set")
			
			OBJECT SET ENABLED:C1123(SEL_configselection; True:C214)
			OBJECT SET VISIBLE:C603(SEL_configselection; True:C214)
		End if 
		
		
		
		
		
		//
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oSelectionsAdd1"; $_t_oldMethodName)

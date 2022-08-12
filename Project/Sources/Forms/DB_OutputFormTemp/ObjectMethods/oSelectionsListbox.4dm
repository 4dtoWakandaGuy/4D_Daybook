If (False:C215)
	//object Method Name: Object Name:      DB_OutputForm.oSelectionsListbox
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
	//ARRAY BOOLEAN(DB_abo_GroupExpandTracker;0)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	//ARRAY BOOLEAN(DB_lb_Setsandselections;0)
	ARRAY LONGINT:C221($_al_Lines; 0)
	ARRAY LONGINT:C221($_al_SelectedLines; 0)
	ARRAY LONGINT:C221($_al_SetClassID; 0)
	//ARRAY LONGINT(DB_al_SelectionFuntions;0)
	//ARRAY LONGINT(DB_al_SetID;0)
	//ARRAY LONGINT(SM_al_SetContextItemContextID;0)
	//ARRAY LONGINT(SM_al_SetitemsClassID;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	//ARRAY PICTURE(DB_apic_SetPicture;0)
	ARRAY TEXT:C222($_at_ActiveTypes; 0)
	ARRAY TEXT:C222($_at_DocumentSIgnatures; 0)
	ARRAY TEXT:C222($_at_FormatNames; 0)
	ARRAY TEXT:C222($_at_SetClass; 0)
	//ARRAY TEXT(DB_at_ConfigureOptions;0)
	//ARRAY TEXT(DB_at_MethodParameters;0)
	//ARRAY TEXT(DB_at_SelectionOptions;0)
	//ARRAY TEXT(DB_at_SetMethod;0)
	//ARRAY TEXT(DB_at_SetName;0)
	//ARRAY TEXT(SM_at_SetContextitemOwnerIDs;0)
	//ARRAY TEXT(SM_at_SetitemSharesList;0)
	//ARRAY TEXT(SM_at_SetItemsName;0)
	C_BOOLEAN:C305($_bo_Add; $_bo_AltKey; $_bo_CurrentSelection; $_bo_CurrentSelectionAsked; $_bo_EditShares; $_bo_Expanded; $_bo_OneLineSelected; $_bo_Option; $_bo_SelectRecords; $_bo_Shared; $_bo_UseHighlighted)
	C_BOOLEAN:C305(DB_bo_DisplayStats; DB_bo_GroupReady; DB_bo_ShowArrayBased; SEL_SelectionsShare)
	C_LONGINT:C283($_l_Column; $_l_ContextID; $_l_DragRow; $_l_DropRow; $_l_event; $_l_FieldNumber; $_l_GroupContext; $_l_GroupID; $_l_GroupRow; $_l_Icon; $_l_Index)
	C_LONGINT:C283($_l_ItemID; $_l_ItemParent; $_l_ItemPostion; $_l_ItemPostion2; $_l_ItemPostion3; $_l_ItemPostion4; $_l_ItemRef; $_l_NumberofSets; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight)
	C_LONGINT:C283($_l_objectTop; $_l_ObjectWidth; $_l_Process; $_l_Retries; $_l_RO; $_l_Row; $_l_SelectedRecords; $_l_SetID; $_l_SourceProcess; $_l_SourceRow; $_l_SubItemID)
	C_LONGINT:C283($_l_TableNumber; $0; DB_l_CurrentDisplayedForm; DB_l_MyTempMacro; Sel_ConfigSelection; SEL_l_Delselection; SEL_selectionActions; SM_l_ContextItemID)
	C_PICTURE:C286($_pic_Icon; $_pic_nul; $_pic_Space; DB_pic_BuiltSet; DB_pic_GroupedSetList; DB_pic_SelectedPlusSet; DB_pic_SelectedSet)
	C_POINTER:C301($_ptr_SourceObject; $_ptr_Table)
	C_REAL:C285(DB_l_newSetClass)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_DocumentPath; $_t_DocumentType; $_t_NewSetName; $_t_oldMethodName; $_t_OwnerName; $_t_Parameters; $_t_ScriptCode; $_t_ScriptName; $_t_VariableName; DB_t_CurrentContext)
	C_TEXT:C284(DB_t_CurrentUserGroup; DB_t_FirstSetName; DB_t_SeccondSetName; SM_t_loadedsetName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_OutputForm/oSelectionsListbox"; Form event code:C388)
$_l_event:=Form event code:C388
ARRAY BOOLEAN:C223(DB_abo_GroupExpandTracker; Size of array:C274(DB_al_SetID))
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_bo_AltKey:=(Gen_Option)
		$_bo_Option:=(Windows Ctrl down:C562 | Macintosh command down:C546) | Shift down:C543 | ($_bo_AltKey)
		
		
		$_l_NumberofSets:=Size of array:C274(DB_at_SetName)
		
		If (Not:C34($_bo_Option))
			$_bo_SelectRecords:=True:C214
			$_bo_OneLineSelected:=True:C214
		Else 
			ARRAY LONGINT:C221($_al_SelectedLines; 0)
			LB_GetSelect(->DB_lb_Setsandselections; ->$_al_SelectedLines)
			$_bo_OneLineSelected:=(Size of array:C274($_al_SelectedLines)=1)
			$_bo_SelectRecords:=False:C215
		End if 
		LISTBOX GET CELL POSITION:C971(DB_lb_Setsandselections; $_l_Column; $_l_Row)
		OBJECT SET VISIBLE:C603(SEL_l_Delselection; False:C215)
		If ($_l_Row>0)
			$_l_SetID:=DB_al_SetID{$_l_Row}
			SEL_SelectionsShare:=False:C215
			If ($_l_SetID#0)
				If ($_l_SetID#999999)
					$_l_NumberofSets:=Size of array:C274(DB_at_SetName)
					If (DB_al_SetID{$_l_NumberofSets}=999999)  //new Record not saved
						Case of 
							: (DB_at_SetName{$_l_NumberofSets}="New Set")
								$_t_NewSetName:=Gen_Request("Enter Name for new set"; "New Set")
								If (OK=1)
									DB_at_SetName{$_l_NumberofSets}:=$_t_NewSetName
								End if 
							: (DB_at_SetName{$_l_NumberofSets}="New Group")
								$_t_NewSetName:=Gen_Request("Enter Name for the new Group"; "New Group")
								If (OK=1)
									DB_at_SetName{$_l_NumberofSets}:=$_t_NewSetName
								End if 
						End case 
						
						ARRAY TEXT:C222($_at_SetClass; 4)
						ARRAY LONGINT:C221($_al_SetClassID; 4)
						$_at_SetClass{1}:="Fixed List"
						$_at_SetClass{2}:="Dynamic List"
						$_at_SetClass{3}:="Fixed List with Dynamic Query"
						$_at_SetClass{4}:="Group"
						$_al_SetClassID{1}:=853
						$_al_SetClassID{2}:=854
						$_al_SetClassID{3}:=852
						$_al_SetClassID{4}:=855
						$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
						$_l_ItemRef:=-(AA_GetNextIDinMethod(->SM_l_ContextItemID))
						DB_al_SetID{$_l_NumberofSets}:=$_l_ItemRef
						DB_at_SetMethod{$_l_NumberofSets}:="DB_SelectSet"
						DB_at_MethodParameters{$_l_NumberofSets}:=String:C10($_l_ItemRef)
						If (DB_l_newSetClass=0)
							DB_l_newSetClass:=853
						End if 
						$_l_ItemPostion3:=Find in array:C230($_al_SetClassID; DB_l_newSetClass)
						SM_UpdateArrays("PER"; DB_at_SetName{$_l_NumberofSets}; $_l_ItemRef; $_l_ItemParent; ""; 0; $_at_SetClass{$_l_ItemPostion3}; $_al_SetClassID{$_l_ItemPostion3})
						Case of 
							: (DB_l_newSetClass=853)
								SM_saveSet("DB_NewSet"; $_l_ItemRef)
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
						End case 
						//the above saves the data to the arrays. now save the arrays.
						//START TRANSACTION
						SM_UPDATEDATA
						LB_SetEnterable(->DB_lb_Setsandselections; False:C215; 0)
						GOTO OBJECT:C206(Sel_ConfigSelection)
						
					End if 
					If ($_l_SetID#-9999998)
						LB_SetEnterable(->DB_lb_Setsandselections; False:C215; 0)
						$_t_OwnerName:=""
						$_l_ItemPostion:=Find in array:C230(SM_al_SetitemsID; ($_l_SetID))
						If (SM_al_SetitemsClassID{$_l_ItemPostion}=855)  //Group
						Else 
							$_t_OwnerName:=SM_at_SetContextitemOwnerIDs{$_l_ItemPostion}
							$_bo_Shared:=(SM_at_SetitemSharesList{$_l_ItemPostion}#"")
							SEL_SelectionsShare:=$_bo_Shared
							$_bo_EditShares:=True:C214
							Case of 
								: ($_t_OwnerName="UNI")  //this was being used to designate a list as shared with everyone..so there was no owner(this will not be the case from now on)
									If (User in group:C338(Current user:C182; "Administrators"))
										$_bo_EditShares:=True:C214
									Else 
										$_bo_EditShares:=True:C214
									End if 
								: (Position:C15("GRP_"; $_t_OwnerName)>0)  //this was being used to designate a list as shared with everyone in a group..so there was no owner(this will not be the case from now on)
									DB_bo_GroupReady:=False:C215
									DB_t_CurrentUserGroup:=""
									$_l_Process:=New process:C317("Get_UserGroup"; 128000; "User Group"; Current process:C322; <>PER_t_CurrentUserInitials)
									$_l_Retries:=0
									While (Not:C34(DB_bo_GroupReady))
										$_l_Retries:=$_l_Retries+1
										DelayTicks($_l_Retries*2)
									End while 
									If (DB_t_CurrentUserGroup=Substring:C12($_t_OwnerName; 5))
										
										$_bo_EditShares:=True:C214
									Else 
										$_bo_EditShares:=True:C214
									End if 
									
								Else   //owned by a person. is the person the current user.
									If (User in group:C338(Current user:C182; "Administrators")) | ($_t_OwnerName=<>PER_t_CurrentUserInitials)
										$_bo_EditShares:=True:C214
									Else 
										$_bo_EditShares:=False:C215
									End if 
									
							End case 
							If ($_bo_OneLineSelected)
								DB_t_FirstSetName:=SM_at_SetItemsName{$_l_ItemPostion}
								DB_t_SeccondSetName:=""
								If (Not:C34($_bo_AltKey))
									OBJECT SET VISIBLE:C603(SEL_SelectionsShare; True:C214)
									
									OBJECT SET ENABLED:C1123(SEL_SelectionsShare; $_bo_EditShares)
									
								Else 
									OBJECT SET VISIBLE:C603(SEL_SelectionsShare; False:C215)
								End if 
								OBJECT SET VISIBLE:C603(SEL_configselection; True:C214)
								If ($_bo_Shared)
									SEL_SelectionsShare:=True:C214
								End if 
								
							Else 
								If (DB_t_SeccondSetName="")
									DB_t_SeccondSetName:=SM_at_SetItemsName{$_l_ItemPostion}
								Else 
									DB_t_SeccondSetName:="Multiple Sets"
								End if 
								OBJECT SET VISIBLE:C603(SEL_SelectionsShare; False:C215)
								OBJECT SET VISIBLE:C603(SEL_selectionActions; True:C214)
							End if 
							
							ARRAY TEXT:C222(DB_at_ConfigureOptions; 0)
							If ($_bo_OneLineSelected)
								Case of 
									: (SM_al_SetitemsClassID{$_l_ItemPostion}=853)  //static set
										If ($_bo_EditShares)
											If ($_bo_Shared)
												APPEND TO ARRAY:C911(DB_at_ConfigureOptions; "Edit Sharing")
											End if 
											OBJECT SET VISIBLE:C603(SEL_l_Delselection; True:C214)
											//APPEND TO ARRAY(DB_at_ConfigureOptions;"Delete List")
										End if 
									: (SM_al_SetitemsClassID{$_l_ItemPostion}=852)  //set with macro as well
										If ($_bo_EditShares)
											If ($_bo_Shared)
												APPEND TO ARRAY:C911(DB_at_ConfigureOptions; "Edit Sharing")
											End if 
											APPEND TO ARRAY:C911(DB_at_ConfigureOptions; "Edit Query")
											OBJECT SET VISIBLE:C603(SEL_l_Delselection; True:C214)
											//APPEND TO ARRAY(DB_at_ConfigureOptions;"Delete List")
										End if 
									: (SM_al_SetitemsClassID{$_l_ItemPostion}=854)  //macro set
										If ($_bo_EditShares)
											If ($_bo_Shared)
												APPEND TO ARRAY:C911(DB_at_ConfigureOptions; "Edit Sharing")
											End if 
											APPEND TO ARRAY:C911(DB_at_ConfigureOptions; "Edit Query")
											OBJECT SET VISIBLE:C603(SEL_l_Delselection; True:C214)
											//APPEND TO ARRAY(DB_at_ConfigureOptions;"Delete List")
										End if 
								End case 
							End if 
							If ($_bo_SelectRecords)
								If (DB_at_SetMethod{$_l_Row}#"")
									$_t_Parameters:=DB_at_MethodParameters{$_l_Row}
									If ($_t_Parameters#"")
										Case of 
											: (DB_at_SetMethod{$_l_Row}="DB_SelectSet")
												
												$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
												DB_SelectSet($_t_Parameters; $_l_ItemParent)
												
											: (DB_at_SetMethod{$_l_Row}="SEL_AllRecords")
												SEL_AllRecords($_t_Parameters)
												
											Else 
												//EXECUTE FORMULA(DB_at_SetMethod{$_l_Row}+"("+$_t_Parameters+")")
												EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_Row}; *; $_t_Parameters)
										End case 
									Else 
										//EXECUTE FORMULA(DB_at_SetMethod{$_l_Row})
										EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_Row})
									End if 
									DB_HideShowSearch(DB_l_CurrentDisplayedForm)
									
									DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								End if 
								If (Size of array:C274(DB_at_ConfigureOptions)>0)
									OBJECT SET VISIBLE:C603(SEL_configselection; True:C214)
								Else 
									OBJECT SET VISIBLE:C603(SEL_configselection; False:C215)
								End if 
								OBJECT SET ENABLED:C1123(SEL_configselection; True:C214)
								//_O_ENABLE BUTTON(SEL_configselection)
							Else 
								If (Size of array:C274(DB_at_ConfigureOptions)>0)
									OBJECT SET VISIBLE:C603(SEL_configselection; True:C214)
								Else 
									OBJECT SET VISIBLE:C603(SEL_configselection; False:C215)
								End if 
							End if 
							OBJECT SET ENABLED:C1123(SEL_selectionActions; True:C214)
							
							//_O_ENABLE BUTTON(SEL_selectionActions)
							If ($_bo_OneLineSelected)
								ARRAY TEXT:C222(DB_at_SelectionOptions; 0)
								ARRAY LONGINT:C221(DB_al_SelectionFuntions; 0)
								
								If (DB_t_FirstSetName#"")
									APPEND TO ARRAY:C911(DB_at_SelectionOptions; "Save current displayed records to new saved selection")
									APPEND TO ARRAY:C911(DB_al_SelectionFuntions; 1)
									APPEND TO ARRAY:C911(DB_at_SelectionOptions; "Select Records only in both current displayed records and saved selection "+DB_t_FirstSetName)
									APPEND TO ARRAY:C911(DB_al_SelectionFuntions; 2)  //intersection with current selection
									APPEND TO ARRAY:C911(DB_at_SelectionOptions; "Add saved selection "+DB_t_FirstSetName+" to current displayed records")
									APPEND TO ARRAY:C911(DB_al_SelectionFuntions; 3)  //union with current seleciton
									APPEND TO ARRAY:C911(DB_at_SelectionOptions; "Show saved selection "+DB_t_FirstSetName+" minus records in current displayed records")
									APPEND TO ARRAY:C911(DB_al_SelectionFuntions; 4)  //Difference
									APPEND TO ARRAY:C911(DB_at_SelectionOptions; "Remove saved selection "+DB_t_FirstSetName+" from current displayed records")
									APPEND TO ARRAY:C911(DB_al_SelectionFuntions; 5)  //Difference
								End if 
								//here the action is to save the current selection to a new list(same as a menu)
								//update the current list from current(highlighted selection-only is a static list
							Else 
								//more than one line selected
								ARRAY TEXT:C222(DB_at_SelectionOptions; 0)
								ARRAY LONGINT:C221(DB_al_SelectionFuntions; 0)
								If (DB_t_SeccondSetName#"multiple sets")
									DB_t_FirstSetName:=Uppers2(DB_t_FirstSetName)
									DB_t_SeccondSetName:=Uppers2(DB_t_SeccondSetName)
									
									APPEND TO ARRAY:C911(DB_at_SelectionOptions; "Display only records in both saved selection "+DB_t_FirstSetName+" and  saved selection "+DB_t_SeccondSetName)
									APPEND TO ARRAY:C911(DB_al_SelectionFuntions; 6)  //Interseciton
									APPEND TO ARRAY:C911(DB_at_SelectionOptions; "Display records from both saved selection "+DB_t_FirstSetName+" and saved selection "+DB_t_SeccondSetName)
									APPEND TO ARRAY:C911(DB_al_SelectionFuntions; 7)  //union
									APPEND TO ARRAY:C911(DB_at_SelectionOptions; "Display records In saved selection "+DB_t_FirstSetName+" and not in saved selection "+DB_t_SeccondSetName)
									APPEND TO ARRAY:C911(DB_al_SelectionFuntions; 8)  //difference A
									APPEND TO ARRAY:C911(DB_at_SelectionOptions; "Display records In saved selection "+DB_t_SeccondSetName+" and not in saved selection "+DB_t_FirstSetName)
									APPEND TO ARRAY:C911(DB_al_SelectionFuntions; 9)  //difference b
								Else 
									DB_t_SeccondSetName:=Uppers2(DB_t_SeccondSetName)
									DB_t_FirstSetName:=Uppers2(DB_t_FirstSetName)
									APPEND TO ARRAY:C911(DB_at_SelectionOptions; "Display records in "+DB_t_FirstSetName)
									APPEND TO ARRAY:C911(DB_al_SelectionFuntions; 10)
									APPEND TO ARRAY:C911(DB_at_SelectionOptions; "Display records from "+"multiple"+" saved selections")
									APPEND TO ARRAY:C911(DB_al_SelectionFuntions; 11)
									APPEND TO ARRAY:C911(DB_at_SelectionOptions; "Display records In Saved selection "+DB_t_FirstSetName+" and not in other saved selecitons")
									APPEND TO ARRAY:C911(DB_al_SelectionFuntions; 12)
								End if 
							End if 
						End if 
					End if 
				Else 
					//this is a new set. it does not actually exist in the system.
					OBJECT SET VISIBLE:C603(SEL_SelectionsShare; False:C215)
					OBJECT SET VISIBLE:C603(DB_at_SelectionOptions; False:C215)
					LB_SetEnterable(->DB_lb_Setsandselections; True:C214; 2)
					APPEND TO ARRAY:C911(DB_at_ConfigureOptions; "Save displayed records to new Saved Selection")
					OBJECT SET ENABLED:C1123(SEL_configselection; True:C214)
					
					OBJECT SET VISIBLE:C603(SEL_configselection; True:C214)
					
				End if 
			Else 
				If ($_bo_SelectRecords)
					If (DB_at_SetMethod{$_l_Row}#"")
						$_t_Parameters:=DB_at_MethodParameters{$_l_Row}
						If ($_t_Parameters#"")
							Case of 
								: (DB_at_SetMethod{$_l_Row}="DB_SelectSet")
									$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
									DB_SelectSet($_t_Parameters; $_l_ItemParent)
									
								: (DB_at_SetMethod{$_l_Row}="SEL_AllRecords")
									SEL_AllRecords($_t_Parameters)
									
								Else 
									//EXECUTE FORMULA(DB_at_SetMethod{$_l_Row}+"("+$_t_Parameters+")")
									EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_Row}; *; $_t_Parameters)
									$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
									SRCH_Applyfilterstoselection($_ptr_Table)
									DB_SetFormMenuoptions
									DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
									DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
									If (DB_bo_DisplayStats)
										//stats are displayed
										StatsView_Cal1
										StatsView_Cal2
									End if 
							End case 
						Else 
							//EXECUTE FORMULA(DB_at_SetMethod{$_l_Row})
							EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_Row})
							$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
							SRCH_Applyfilterstoselection($_ptr_Table)
							DB_SetFormMenuoptions
							DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							If (DB_bo_DisplayStats)
								//stats are displayed
								StatsView_Cal1
								StatsView_Cal2
							End if 
						End if 
						
					End if 
				End if 
				ARRAY TEXT:C222(DB_at_ConfigureOptions; 0)
				ARRAY LONGINT:C221(DB_al_SelectionFuntions; 0)
				OBJECT SET VISIBLE:C603(SEL_SelectionsShare; False:C215)
				OBJECT SET VISIBLE:C603(SEL_configselection; False:C215)
				OBJECT SET ENABLED:C1123(SEL_selectionActions; True:C214)
				//_O_ENABLE BUTTON(SEL_selectionActions)
				//here the action is to save the current selection to a new list(same as a menu)
				ARRAY TEXT:C222(DB_at_SelectionOptions; 0)
				APPEND TO ARRAY:C911(DB_at_SelectionOptions; "Save displayed records to new Saved Selection")
				APPEND TO ARRAY:C911(DB_al_SelectionFuntions; 1)
				
			End if 
		Else 
			ARRAY TEXT:C222(DB_at_ConfigureOptions; 0)
			ARRAY LONGINT:C221(DB_al_SelectionFuntions; 0)
			OBJECT SET ENABLED:C1123(SEL_SelectionsShare; False:C215)
			OBJECT SET ENABLED:C1123(SEL_configselection; False:C215)
			OBJECT SET ENABLED:C1123(SEL_selectionActions; False:C215)
			//_O_DISABLE BUTTON(SEL_SelectionsShare)
			//_O_DISABLE BUTTON(SEL_configselection)
			//_O_ENABLE BUTTON(SEL_selectionActions)
			OBJECT SET VISIBLE:C603(SEL_selectionActions; True:C214)
			ARRAY TEXT:C222(DB_at_SelectionOptions; 0)
			APPEND TO ARRAY:C911(DB_at_SelectionOptions; "Save displayed records to new Saved Selection")
			APPEND TO ARRAY:C911(DB_al_SelectionFuntions; 1)
			//here the action is to save the current selection to a new list(same as a menu)
		End if 
		
		
		
	: ($_l_event=On Double Clicked:K2:5)
		$_bo_AltKey:=(Gen_Option)
		$_bo_Option:=(Windows Ctrl down:C562 | Macintosh command down:C546) | Shift down:C543 | $_bo_AltKey
		
		
		$_l_NumberofSets:=Size of array:C274(DB_at_SetName)
		
		If (Not:C34($_bo_Option))
			$_bo_SelectRecords:=True:C214
			$_bo_OneLineSelected:=True:C214
		Else 
			ARRAY LONGINT:C221($_al_SelectedLines; 0)
			LB_GetSelect(->DB_lb_Setsandselections; ->$_al_SelectedLines)
			$_bo_OneLineSelected:=(Size of array:C274($_al_SelectedLines)=1)
			$_bo_SelectRecords:=False:C215
		End if 
		LISTBOX GET CELL POSITION:C971(DB_lb_Setsandselections; $_l_Column; $_l_Row)
		OBJECT SET VISIBLE:C603(SEL_l_Delselection; False:C215)
		If ($_l_Row>0)
			$_l_SetID:=DB_al_SetID{$_l_Row}
			$_bo_Expanded:=DB_abo_GroupExpandTracker{$_l_Row}
			SEL_SelectionsShare:=False:C215
			If ($_l_SetID#0)
				If ($_l_SetID#999999)
					$_l_NumberofSets:=Size of array:C274(DB_at_SetName)
					If (DB_al_SetID{$_l_NumberofSets}=999999)  //new Record not saved
						If (DB_at_SetName{$_l_NumberofSets}="New Set")
							$_t_NewSetName:=Gen_Request("Enter Name for new set"; "New Set")
							If (OK=1)
								DB_at_SetName{$_l_NumberofSets}:=$_t_NewSetName
							End if 
						End if 
						ARRAY TEXT:C222($_at_SetClass; 4)
						ARRAY LONGINT:C221($_al_SetClassID; 4)
						$_at_SetClass{1}:="Fixed List"
						$_at_SetClass{2}:="Dynamic List"
						$_at_SetClass{3}:="Fixed List with Dynamic Query"
						$_at_SetClass{4}:="Group"
						$_al_SetClassID{1}:=853
						$_al_SetClassID{2}:=854
						$_al_SetClassID{3}:=852
						$_al_SetClassID{4}:=855
						$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
						$_l_ItemRef:=-(AA_GetNextIDinMethod(->SM_l_ContextItemID))
						DB_al_SetID{$_l_NumberofSets}:=$_l_ItemRef
						DB_at_SetMethod{$_l_NumberofSets}:="DB_SelectSet"
						DB_at_MethodParameters{$_l_NumberofSets}:=String:C10($_l_ItemRef)
						If (DB_l_newSetClass=0)
							DB_l_newSetClass:=853
						End if 
						$_l_ItemPostion3:=Find in array:C230($_al_SetClassID; DB_l_newSetClass)
						SM_UpdateArrays("PER"; DB_at_SetName{$_l_NumberofSets}; $_l_ItemRef; $_l_ItemParent; ""; 0; $_at_SetClass{$_l_ItemPostion3}; $_al_SetClassID{$_l_ItemPostion3})
						Case of 
							: (DB_l_newSetClass=853)
								SM_saveSet("DB_NewSet"; $_l_ItemRef)
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
						End case 
						//the above saves the data to the arrays. now save the arrays.
						//START TRANSACTION
						SM_UPDATEDATA
						LB_SetEnterable(->DB_lb_Setsandselections; False:C215; 0)
						GOTO OBJECT:C206(Sel_ConfigSelection)
						
					End if 
					If ($_l_SetID#-9999998)
						LB_SetEnterable(->DB_lb_Setsandselections; False:C215; 0)
						$_t_OwnerName:=""
						$_l_ItemPostion:=Find in array:C230(SM_al_SetitemsID; ($_l_SetID))
						If (SM_al_SetitemsClassID{$_l_ItemPostion}=855)  //Group
							//is it expanded or collapsed?
							
							If ($_bo_Expanded)
								DB_abo_GroupExpandTracker{$_l_Row}:=False:C215
								//it is expanded)
								//DB_al_SetID{$_l_Row}:=-(DB_al_SetID{$_l_Row})
								//Now removed any items from the array that have this same context id
								$_l_ContextID:=DB_al_SetID{$_l_Row}*SM_al_SetContextItemContextID{$_l_ItemPostion}
								For ($_l_Index; 1; Size of array:C274(SM_al_SetitemsID))
									If (SM_al_SetContextItemContextID{$_l_Index}=$_l_ContextID)
										$_l_SubItemID:=SM_al_SetitemsID{$_l_Index}
										$_l_ItemPostion:=Find in array:C230(DB_al_SetID; $_l_SubItemID)
										If ($_l_ItemPostion>0)
											DELETE FROM ARRAY:C228(DB_at_SetName; $_l_ItemPostion; 1)
											DELETE FROM ARRAY:C228(DB_apic_SetPicture; $_l_ItemPostion; 1)
											DELETE FROM ARRAY:C228(DB_al_SetID; $_l_ItemPostion; 1)
											DELETE FROM ARRAY:C228(DB_at_SetMethod; $_l_ItemPostion; 1)
											DELETE FROM ARRAY:C228(DB_at_MethodParameters; $_l_ItemPostion; 1)
										End if 
									End if 
								End for 
							Else 
								$_l_ContextID:=DB_al_SetID{$_l_Row}*SM_al_SetContextItemContextID{$_l_ItemPostion}
								DB_abo_GroupExpandTracker{$_l_Row}:=True:C214
								For ($_l_Index; 1; Size of array:C274(SM_al_SetitemsID))
									If (SM_al_SetContextItemContextID{$_l_Index}=$_l_ContextID) & (SM_al_SetitemsClassID{$_l_Index}#855)
										$_l_SubItemID:=SM_al_SetitemsID{$_l_Index}
										$_l_ItemPostion:=Find in array:C230(SM_al_SetitemsID; $_l_SubItemID)
										If ($_l_ItemPostion>0)
											INSERT IN ARRAY:C227(DB_at_SetName; $_l_Row+1; 1)
											INSERT IN ARRAY:C227(DB_apic_SetPicture; $_l_Row+1; 1)
											INSERT IN ARRAY:C227(DB_al_SetID; $_l_Row+1; 1)
											INSERT IN ARRAY:C227(DB_at_SetMethod; $_l_Row+1; 1)
											INSERT IN ARRAY:C227(DB_at_MethodParameters; $_l_Row+1; 1)
											$_l_Row:=$_l_Row+1
											$_l_Icon:=SM_al_SetitemsClassID{$_l_ItemPostion}
											If ($_l_Icon=0)
												$_l_Icon:=853
											End if 
											Case of 
												: ($_l_Icon=853)
													$_pic_Icon:=DB_pic_SelectedSet
													
												: ($_l_Icon=854)
													$_pic_Icon:=DB_pic_BuiltSet
													
												: ($_l_Icon=852)
													$_pic_Icon:=DB_pic_SelectedPlusSet
													
												: ($_l_Icon=855)
													$_pic_Icon:=DB_pic_GroupedSetList
													
												Else 
													$_pic_Icon:=DB_pic_SelectedSet
													
											End case 
											//GET PICTURE FROM LIBRARY(22552; $_pic_Space)
											$_pic_Space:=Get_Picture(22552)
											COMBINE PICTURES:C987($_pic_Icon; $_pic_Space; Horizontal concatenation:K61:8; $_pic_Icon)
											DB_apic_SetPicture{$_l_Row}:=$_pic_Icon
											DB_al_SetID{$_l_Row}:=SM_al_SetitemsID{$_l_ItemPostion}
											DB_at_SetMethod{$_l_Row}:="DB_SelectSet"
											DB_at_MethodParameters{$_l_Row}:=String:C10(SM_al_SetitemsID{$_l_ItemPostion})
											DB_at_SetName{$_l_Row}:=SM_at_SetItemsName{$_l_ItemPostion}
											
											
										End if 
									End if 
								End for 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	: ($_l_event=On Drag Over:K2:13)
		OBJECT GET COORDINATES:C663(*; "oSelectionsListbox"; $_l_ObjectLeft; $_l_objectTop; $_l_ObjectRight; $_l_ObjectBottom)
		$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
		LB_SetColumnWidths(->DB_lb_Setsandselections; "SMGR_t"; 1; 30; $_l_ObjectWidth-(30+20); 0; 0; 0)
		
		_O_DRAG AND DROP PROPERTIES:C607($_ptr_SourceObject; $_l_SourceRow; $_l_SourceProcess)
		RESOLVE POINTER:C394($_ptr_SourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		If ($_l_SourceRow=-1)
			GET PASTEBOARD DATA TYPE:C958($_at_DocumentSIgnatures; $_at_ActiveTypes; $_at_FormatNames)
			If (Size of array:C274($_at_DocumentSIgnatures)>0)
				If ($_at_DocumentSIgnatures{1}="com.4d.private.file.url")
					$0:=0
				Else 
					$0:=-1
				End if 
			Else 
				$0:=-1
			End if 
		Else 
			If ($_l_SourceProcess=Current process:C322)
				Case of 
					: ($_t_VariableName="DB_lb_OutputArrays") | ($_t_VariableName="DB_l_LBOutputForm")
						$0:=0
					: ($_t_VariableName="DB_lb_Setsandselections")  //Drag From Self
						$0:=0  //We will validate the source object is an item on drop
					Else 
						$0:=-1
				End case 
			Else 
				$0:=-1
			End if 
		End if 
	: ($_l_event=On Drop:K2:12)
		
		
		//GET PASTEBOARD DATA TYPE
		_O_DRAG AND DROP PROPERTIES:C607($_ptr_SourceObject; $_l_SourceRow; $_l_SourceProcess)
		If ($_l_SourceRow=-1)
			ARRAY TEXT:C222($_at_DocumentSIgnatures; 0)
			ARRAY TEXT:C222($_at_ActiveTypes; 0)
			ARRAY TEXT:C222($_at_FormatNames; 0)
			
			GET PASTEBOARD DATA TYPE:C958($_at_DocumentSIgnatures; $_at_ActiveTypes; $_at_FormatNames)
			If (Size of array:C274($_at_DocumentSIgnatures)>0)
				If ($_at_DocumentSIgnatures{1}="com.4d.private.file.url")
					$_t_DocumentPath:=Get file from pasteboard:C976(1)
					$_t_DocumentType:=Substring:C12($_t_DocumentPath; Length:C16($_t_DocumentPath)-2)
					Case of 
						: ($_t_DocumentType="4st")
							$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
							SM_t_loadedsetName:="TempSet"
							LOAD SET:C185($_ptr_Table->; SM_t_loadedsetName; $_t_DocumentPath)
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
									OBJECT SET VISIBLE:C603(SEL_SelectionsShare; False:C215)
									OBJECT SET VISIBLE:C603(*; "oSelectionsOptions"; False:C215)
									
									OBJECT GET COORDINATES:C663(*; "oSelectionsListbox"; $_l_ObjectLeft; $_l_objectTop; $_l_ObjectRight; $_l_ObjectBottom)
									$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
									LB_SetColumnWidths(->DB_lb_Setsandselections; "SMGR_t"; 1; 30; $_l_ObjectWidth-(30+20); 0; 0; 0)
									LB_SetEnterable(->DB_lb_Setsandselections; True:C214; 2)
									GOTO OBJECT:C206(DB_lb_Setsandselections)
									$_l_NumberofSets:=Size of array:C274(DB_apic_SetPicture)
									LB_SetScroll(->DB_lb_Setsandselections; $_l_NumberofSets; 0)
									LB_GoToCell(->DB_lb_Setsandselections; 2; $_l_NumberofSets)
									APPEND TO ARRAY:C911(DB_at_ConfigureOptions; "Save Set")
									OBJECT SET ENABLED:C1123(SEL_configselection; True:C214)
									OBJECT SET VISIBLE:C603(SEL_configselection; True:C214)
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
							If (DB_bo_DisplayStats)
								//stats are displayed
								StatsView_Cal1
								StatsView_Cal2
							End if 
					End case 
					
				End if 
			Else 
				
			End if 
		Else 
			RESOLVE POINTER:C394($_ptr_SourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			If ($_l_SourceProcess=Current process:C322)
				Case of 
					: ($_t_VariableName="DB_lb_OutputArrays") | ($_t_VariableName="DB_l_LBOutputForm")
						$_l_DropRow:=Drop position:C608
						If ($_l_DropRow<=0)
							//Create a new selection..
							
							$_bo_UseHighlighted:=True:C214
							$_bo_CurrentSelection:=False:C215
							$_bo_CurrentSelectionAsked:=False:C215
							
							
							
							$_l_NumberofSets:=Size of array:C274(DB_at_SetName)
							If (DB_al_SetID{$_l_NumberofSets}=999999)  //new Record not saved
								Case of 
									: (DB_at_SetName{$_l_NumberofSets}="New Set")
										$_t_NewSetName:=Gen_Request("Enter Name for previously created new saved selection"; "New Set")
										If (OK=1)
											DB_at_SetName{$_l_NumberofSets}:=$_t_NewSetName
										End if 
									: (DB_at_SetName{$_l_NumberofSets}="New Group")
										$_t_NewSetName:=Gen_Request("Enter Name for group"; "New Group")
										If (OK=1)
											DB_at_SetName{$_l_NumberofSets}:=$_t_NewSetName
										End if 
								End case 
								ARRAY TEXT:C222($_at_SetClass; 4)
								ARRAY LONGINT:C221($_al_SetClassID; 4)
								$_at_SetClass{1}:="Fixed List"
								$_at_SetClass{2}:="Dynamic List"
								$_at_SetClass{3}:="Fixed List with Dynamic Query"
								$_at_SetClass{4}:="Group"
								$_al_SetClassID{1}:=853
								$_al_SetClassID{2}:=854
								$_al_SetClassID{3}:=852
								$_al_SetClassID{4}:=855
								
								$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
								$_l_ItemRef:=-(AA_GetNextIDinMethod(->SM_l_ContextItemID))
								DB_al_SetID{$_l_NumberofSets}:=$_l_ItemRef
								DB_at_SetMethod{$_l_NumberofSets}:="DB_SelectSet"
								DB_at_MethodParameters{$_l_NumberofSets}:=String:C10($_l_ItemRef)
								If (DB_l_newSetClass=0)
									DB_l_newSetClass:=853
								End if 
								$_l_ItemPostion3:=Find in array:C230($_al_SetClassID; DB_l_newSetClass)
								SM_UpdateArrays("PER"; DB_at_SetName{$_l_NumberofSets}; $_l_ItemRef; $_l_ItemParent; ""; 0; $_at_SetClass{$_l_ItemPostion3}; $_al_SetClassID{$_l_ItemPostion3})
								Case of 
									: (DB_l_newSetClass=853)
										SM_saveSet("DB_NewSet"; $_l_ItemRef)
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
								End case 
								//the above saves the data to the arrays. now save the arrays.
								//START TRANSACTION
								SM_UPDATEDATA
								LB_SetEnterable(->DB_lb_Setsandselections; False:C215; 0)
								GOTO OBJECT:C206(Sel_ConfigSelection)
								
							End if 
							If (DB_al_SetID{$_l_NumberofSets}=0)  // not user sets yet
								APPEND TO ARRAY:C911(DB_at_SetName; "")
								APPEND TO ARRAY:C911(DB_apic_SetPicture; $_pic_nul)
								APPEND TO ARRAY:C911(DB_al_SetID; 9999998)
								APPEND TO ARRAY:C911(DB_at_SetMethod; "")
								APPEND TO ARRAY:C911(DB_at_MethodParameters; "")
								$_l_NumberofSets:=Size of array:C274(DB_at_SetName)
							End if 
							APPEND TO ARRAY:C911(DB_at_SetName; "New Set")
							APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_SelectedSet)
							APPEND TO ARRAY:C911(DB_al_SetID; 999999)
							APPEND TO ARRAY:C911(DB_at_SetMethod; "")  //note we leave this blank at this moment so it wont try to select anything
							APPEND TO ARRAY:C911(DB_at_MethodParameters; "")
							
							//$_bo_CurrentSelection:=False
							DB_l_newSetClass:=853
							$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
							COPY NAMED SELECTION:C331($_ptr_Table->; "$Temp")
							
							If (DB_bo_ShowArrayBased)
								ARRAY LONGINT:C221($_al_Lines; 0)
								LB_GetSelect(->DB_lb_OutputArrays; ->$_al_Lines)
								If (Size of array:C274($_al_Lines)>1)
									$_bo_CurrentSelection:=True:C214
								End if 
								
								$_l_SelectedRecords:=Size of array:C274($_al_Lines)
								For ($_l_Index; 1; Size of array:C274($_al_Lines))
								End for 
							Else 
								USE SET:C118("ListboxSet0")
								CREATE SET:C116($_ptr_Table->; "DB_NewSet")
							End if 
							DB_l_newSetClass:=853
							USE NAMED SELECTION:C332("$Temp")
							OBJECT SET VISIBLE:C603(SEL_SelectionsShare; False:C215)
							OBJECT SET VISIBLE:C603(*; "oSelectionsOptions"; False:C215)
							
							OBJECT GET COORDINATES:C663(*; "oSelectionsListbox"; $_l_ObjectLeft; $_l_objectTop; $_l_ObjectRight; $_l_ObjectBottom)
							$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
							LB_SetColumnWidths(->DB_lb_Setsandselections; "SMGR_t"; 1; 30; $_l_ObjectWidth-(30+20); 0; 0; 0)
							LB_SetEnterable(->DB_lb_Setsandselections; True:C214; 2)
							GOTO OBJECT:C206(DB_lb_Setsandselections)
							LB_SetScroll(->DB_lb_Setsandselections; $_l_NumberofSets; 0)
							LB_GoToCell(->DB_lb_Setsandselections; 2; $_l_NumberofSets+1)
							APPEND TO ARRAY:C911(DB_at_ConfigureOptions; "Save Set")
							OBJECT SET ENABLED:C1123(SEL_configselection; True:C214)
							OBJECT SET VISIBLE:C603(SEL_configselection; True:C214)
							USE NAMED SELECTION:C332("$Temp")
						Else 
							$_l_NumberofSets:=Size of array:C274(DB_al_SetID)
							
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
								$_at_SetClass{4}:="Group"
								$_al_SetClassID{1}:=853
								$_al_SetClassID{2}:=854
								$_al_SetClassID{3}:=852
								$_al_SetClassID{4}:=855
								$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
								$_l_ItemRef:=-(AA_GetNextIDinMethod(->SM_l_ContextItemID))
								DB_al_SetID{$_l_NumberofSets}:=$_l_ItemRef
								DB_at_SetMethod{$_l_NumberofSets}:="DB_SelectSet"
								DB_at_MethodParameters{$_l_NumberofSets}:=String:C10($_l_ItemRef)
								If (DB_l_newSetClass=0)
									DB_l_newSetClass:=853
								End if 
								$_l_ItemPostion3:=Find in array:C230($_al_SetClassID; DB_l_newSetClass)
								SM_UpdateArrays("PER"; DB_at_SetName{$_l_NumberofSets}; $_l_ItemRef; $_l_ItemParent; ""; 0; $_at_SetClass{$_l_ItemPostion3}; $_al_SetClassID{$_l_ItemPostion3})
								Case of 
									: (DB_l_newSetClass=853)
										SM_saveSet("DB_NewSet"; $_l_ItemRef)
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
								End case 
								//the above saves the data to the arrays. now save the arrays.
								//START TRANSACTION
								SM_UPDATEDATA
								LB_SetEnterable(->DB_lb_Setsandselections; False:C215; 0)
								GOTO OBJECT:C206(Sel_ConfigSelection)
								
							End if 
							$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
							$_l_Row:=$_l_DropRow
							$_l_SetID:=DB_al_SetID{$_l_Row}
							$_l_ItemPostion:=Find in array:C230(SM_al_SetitemsID; $_l_SetID)
							Case of 
								: ($_l_SetID=-9999998)
									//Create a new selection..
									
									$_bo_UseHighlighted:=True:C214
									$_bo_CurrentSelection:=False:C215
									$_bo_CurrentSelectionAsked:=False:C215
									
									
									
									$_l_NumberofSets:=Size of array:C274(DB_at_SetName)
									If (DB_al_SetID{$_l_NumberofSets}=999999)  //new Record not saved
										Case of 
											: (DB_at_SetName{$_l_NumberofSets}="New Set")
												$_t_NewSetName:=Gen_Request("Enter Name for previously created new saved selection"; "New Set")
												If (OK=1)
													DB_at_SetName{$_l_NumberofSets}:=$_t_NewSetName
												End if 
											: (DB_at_SetName{$_l_NumberofSets}="New Group")
												$_t_NewSetName:=Gen_Request("Enter Name for Group"; "New Group")
												If (OK=1)
													DB_at_SetName{$_l_NumberofSets}:=$_t_NewSetName
												End if 
										End case 
									End if 
									ARRAY TEXT:C222($_at_SetClass; 4)
									ARRAY LONGINT:C221($_al_SetClassID; 4)
									$_at_SetClass{1}:="Fixed List"
									$_at_SetClass{2}:="Dynamic List"
									$_at_SetClass{3}:="Fixed List with Dynamic Query"
									$_at_SetClass{4}:="Group"
									$_al_SetClassID{1}:=853
									$_al_SetClassID{2}:=854
									$_al_SetClassID{3}:=852
									$_al_SetClassID{4}:=855
									$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
									$_l_ItemRef:=-(AA_GetNextIDinMethod(->SM_l_ContextItemID))
									DB_al_SetID{$_l_NumberofSets}:=$_l_ItemRef
									DB_at_SetMethod{$_l_NumberofSets}:="DB_SelectSet"
									DB_at_MethodParameters{$_l_NumberofSets}:=String:C10($_l_ItemRef)
									If (DB_l_newSetClass=0)
										DB_l_newSetClass:=853
									End if 
									$_l_ItemPostion3:=Find in array:C230($_al_SetClassID; DB_l_newSetClass)
									SM_UpdateArrays("PER"; DB_at_SetName{$_l_NumberofSets}; $_l_ItemRef; $_l_ItemParent; ""; 0; $_at_SetClass{$_l_ItemPostion3}; $_al_SetClassID{$_l_ItemPostion3})
									Case of 
										: (DB_l_newSetClass=853)
											SM_saveSet("DB_NewSet"; $_l_ItemRef)
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
									End case 
									//the above saves the data to the arrays. now save the arrays.
									//START TRANSACTION
									SM_UPDATEDATA
									LB_SetEnterable(->DB_lb_Setsandselections; False:C215; 0)
									GOTO OBJECT:C206(Sel_ConfigSelection)
									
									If (DB_al_SetID{$_l_NumberofSets}=0)  // not user sets yet
										APPEND TO ARRAY:C911(DB_at_SetName; "")
										APPEND TO ARRAY:C911(DB_apic_SetPicture; $_pic_nul)
										APPEND TO ARRAY:C911(DB_al_SetID; 9999998)
										APPEND TO ARRAY:C911(DB_at_SetMethod; "")
										APPEND TO ARRAY:C911(DB_at_MethodParameters; "")
										$_l_NumberofSets:=Size of array:C274(DB_at_SetName)
									End if 
									APPEND TO ARRAY:C911(DB_at_SetName; "New Set")
									APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_SelectedSet)
									APPEND TO ARRAY:C911(DB_al_SetID; 999999)
									APPEND TO ARRAY:C911(DB_at_SetMethod; "")  //note we leave this blank at this moment so it wont try to select anything
									APPEND TO ARRAY:C911(DB_at_MethodParameters; "")
									
									//$_bo_CurrentSelection:=False
									DB_l_newSetClass:=853
									$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
									COPY NAMED SELECTION:C331($_ptr_Table->; "$Temp")
									
									If (DB_bo_ShowArrayBased)
										ARRAY LONGINT:C221($_al_Lines; 0)
										LB_GetSelect(->DB_lb_OutputArrays; ->$_al_Lines)
										If (Size of array:C274($_al_Lines)>1)
											$_bo_CurrentSelection:=True:C214
										End if 
										
										$_l_SelectedRecords:=Size of array:C274($_al_Lines)
										For ($_l_Index; 1; Size of array:C274($_al_Lines))
										End for 
									Else 
										USE SET:C118("ListboxSet0")
										CREATE SET:C116($_ptr_Table->; "DB_NewSet")
									End if 
									USE NAMED SELECTION:C332("$Temp")
									OBJECT SET VISIBLE:C603(SEL_SelectionsShare; False:C215)
									OBJECT SET VISIBLE:C603(*; "oSelectionsOptions"; False:C215)
									
									OBJECT GET COORDINATES:C663(*; "oSelectionsListbox"; $_l_ObjectLeft; $_l_objectTop; $_l_ObjectRight; $_l_ObjectBottom)
									$_l_ObjectWidth:=$_l_ObjectRight-$_l_ObjectLeft
									LB_SetColumnWidths(->DB_lb_Setsandselections; "SMGR_t"; 1; 30; $_l_ObjectWidth-(30+20); 0; 0; 0)
									LB_SetEnterable(->DB_lb_Setsandselections; True:C214; 2)
									GOTO OBJECT:C206(DB_lb_Setsandselections)
									LB_SetScroll(->DB_lb_Setsandselections; $_l_NumberofSets; 0)
									LB_GoToCell(->DB_lb_Setsandselections; 2; $_l_NumberofSets+1)
									APPEND TO ARRAY:C911(DB_at_ConfigureOptions; "Save Set")
									OBJECT SET ENABLED:C1123(SEL_configselection; True:C214)
									OBJECT SET VISIBLE:C603(SEL_configselection; True:C214)
									USE NAMED SELECTION:C332("$Temp")
									
								: (SM_al_SetitemsClassID{$_l_ItemPostion}=853) | (SM_al_SetitemsClassID{$_l_ItemPostion}=852)  //static set
									COPY NAMED SELECTION:C331($_ptr_Table->; "$Temp")
									If (DB_bo_ShowArrayBased)
										$_l_SelectedRecords:=Size of array:C274($_al_Lines)
										For ($_l_Index; 1; Size of array:C274($_al_Lines))
										End for 
									Else 
										USE SET:C118("ListboxSet0")
										CREATE SET:C116($_ptr_Table->; "TempSet1")
									End if 
									If (DB_at_SetMethod{$_l_Row}#"")
										$_t_Parameters:=DB_at_MethodParameters{$_l_Row}
										If ($_t_Parameters#"")
											Case of 
												: (DB_at_SetMethod{$_l_Row}="DB_SelectSet")
													$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
													DB_SelectSet($_t_Parameters; $_l_ItemParent)
												: (DB_at_SetMethod{$_l_Row}="SEL_AllRecords")
													SEL_AllRecords($_t_Parameters)
													
												Else 
													//EXECUTE FORMULA(DB_at_SetMethod{$_l_Row}+"("+$_t_Parameters+")")
													EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_Row}; *; $_t_Parameters)
													$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
													SRCH_Applyfilterstoselection($_ptr_Table)
													DB_SetFormMenuoptions
													DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
													DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
													If (DB_bo_DisplayStats)
														//stats are displayed
														StatsView_Cal1
														StatsView_Cal2
													End if 
											End case 
										Else 
											//EXECUTE FORMULA(DB_at_SetMethod{$_l_Row})
											EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_Row})
											$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
											SRCH_Applyfilterstoselection($_ptr_Table)
											DB_SetFormMenuoptions
											DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
											DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
											If (DB_bo_DisplayStats)
												//stats are displayed
												StatsView_Cal1
												StatsView_Cal2
											End if 
										End if 
										
									End if 
									CREATE SET:C116($_ptr_Table->; "TempSet2")
									$_bo_Add:=False:C215
									If (Records in set:C195("TempSet1")>1)
										Gen_Confirm("Add  Records to saved selection, or replace saved selection"; "Add"; "Replace")
										$_bo_Add:=(OK=1)
									Else 
										Gen_Confirm("Add  Record to saved selection, or replace saved selection"; "Add"; "Replace")
										$_bo_Add:=(OK=1)
									End if 
									
									If ($_bo_Add)
										//add
										UNION:C120("TempSet2"; "TempSet1"; "TempSet1")
										
									End if 
									USE SET:C118("TempSet1")
									SM_saveSet("TempSet1"; $_l_SetID)
									USE NAMED SELECTION:C332("$Temp")
									
									
								: (SM_al_SetitemsClassID{$_l_ItemPostion}=854)  //macro set
									Gen_Alert("This type of saved selection may not be modified by dragging a selection of records to the selection")
									
							End case 
						End if 
					: ($_t_VariableName="DB_lb_Setsandselections")
						$_l_DragRow:=$_l_SourceRow
						If ($_l_DragRow>0)
							$_l_DropRow:=Drop position:C608
							If ($_l_DropRow>0)
								$_l_SetID:=DB_al_SetID{$_l_DragRow}
								If ($_l_SetID#0)
									If ($_l_SetID#-9999998)
										$_l_ItemPostion:=Find in array:C230(SM_al_SetitemsID; $_l_SetID)
										If (SM_al_SetitemsClassID{$_l_ItemPostion}=855)  //Group
											Gen_Alert("You may only Drag selections onto groups, not groups!")
										Else 
											
											//if this is expanded. collapse it here.
											$_l_GroupID:=(DB_al_SetID{$_l_DropRow})
											$_l_ItemPostion2:=Find in array:C230(SM_al_SetitemsID; ($_l_GroupID))
											If ($_l_ItemPostion2>0)
												If (SM_al_SetitemsClassID{$_l_ItemPostion2}=855)  //Group
													$_bo_Expanded:=DB_abo_GroupExpandTracker{$_l_DropRow}
													If ($_bo_Expanded)
														$_l_ContextID:=DB_al_SetID{$_l_DropRow}*SM_al_SetContextItemContextID{$_l_ItemPostion2}
														For ($_l_Index; 1; Size of array:C274(SM_al_SetitemsID))
															If (SM_al_SetContextItemContextID{$_l_Index}=$_l_ContextID)
																$_l_SubItemID:=SM_al_SetitemsID{$_l_Index}
																$_l_ItemPostion:=Find in array:C230(DB_al_SetID; $_l_SubItemID)
																If ($_l_ItemPostion>0)
																	DELETE FROM ARRAY:C228(DB_at_SetName; $_l_ItemPostion; 1)
																	DELETE FROM ARRAY:C228(DB_apic_SetPicture; $_l_ItemPostion; 1)
																	DELETE FROM ARRAY:C228(DB_al_SetID; $_l_ItemPostion; 1)
																	DELETE FROM ARRAY:C228(DB_at_SetMethod; $_l_ItemPostion; 1)
																	DELETE FROM ARRAY:C228(DB_at_MethodParameters; $_l_ItemPostion; 1)
																End if 
															End if 
														End for 
													End if 
													$_l_GroupContext:=$_l_GroupID*SM_al_SetContextItemContextID{$_l_ItemPostion2}  //this is the context the item is now to be set to.
													$_l_ItemPostion3:=Find in array:C230(SM_al_SetitemsID; $_l_SetID)  //the dragged set
													If ($_l_ItemPostion3>0)
														
														SM_al_SetContextItemContextID{$_l_ItemPostion3}:=$_l_GroupContext
														$_l_ItemPostion4:=Find in array:C230(DB_al_SetID; $_l_SetID)
														If ($_l_ItemPostion4>0)
															
															//now delete the item from the parent view
															DELETE FROM ARRAY:C228(DB_apic_SetPicture; $_l_ItemPostion4; 1)
															DELETE FROM ARRAY:C228(DB_al_SetID; $_l_ItemPostion4; 1)
															DELETE FROM ARRAY:C228(DB_at_SetMethod; $_l_ItemPostion4; 1)
															DELETE FROM ARRAY:C228(DB_at_SetName; $_l_ItemPostion4; 1)
															DELETE FROM ARRAY:C228(DB_at_MethodParameters; $_l_ItemPostion4; 1)
														End if 
														SM_UPDATEDATA
														
														
													End if 
													If ($_bo_Expanded)
														//$_l_ContextID:=$_l_GroupContext*SM_al_SetContextItemContextID{$_l_ItemPostion2}
														
														$_l_Row:=Find in array:C230(DB_al_SetID; $_l_GroupID)
														For ($_l_Index; 1; Size of array:C274(SM_al_SetitemsID))
															If (SM_al_SetContextItemContextID{$_l_Index}=$_l_ContextID) & (SM_al_SetitemsClassID{$_l_Index}#855)
																$_l_SubItemID:=SM_al_SetitemsID{$_l_Index}
																$_l_ItemPostion:=Find in array:C230(SM_al_SetitemsID; $_l_SubItemID)
																If ($_l_ItemPostion>0)
																	INSERT IN ARRAY:C227(DB_at_SetName; $_l_Row+1; 1)
																	INSERT IN ARRAY:C227(DB_apic_SetPicture; $_l_Row+1; 1)
																	INSERT IN ARRAY:C227(DB_al_SetID; $_l_Row+1; 1)
																	INSERT IN ARRAY:C227(DB_at_SetMethod; $_l_Row+1; 1)
																	INSERT IN ARRAY:C227(DB_at_MethodParameters; $_l_Row+1; 1)
																	$_l_Row:=$_l_Row+1
																	$_l_Icon:=SM_al_SetitemsClassID{$_l_ItemPostion}
																	If ($_l_Icon=0)
																		$_l_Icon:=853
																	End if 
																	Case of 
																		: ($_l_Icon=853)
																			$_pic_Icon:=DB_pic_SelectedSet
																			
																		: ($_l_Icon=854)
																			$_pic_Icon:=DB_pic_BuiltSet
																			
																		: ($_l_Icon=852)
																			$_pic_Icon:=DB_pic_SelectedPlusSet
																			
																		: ($_l_Icon=855)
																			$_pic_Icon:=DB_pic_GroupedSetList
																			
																		Else 
																			$_pic_Icon:=DB_pic_SelectedSet
																			
																	End case 
																	//GET PICTURE FROM LIBRARY(22552; $_pic_Space)
																	$_pic_Space:=Get_Picture(22552)
																	COMBINE PICTURES:C987($_pic_Icon; $_pic_Space; Horizontal concatenation:K61:8; $_pic_Icon)
																	DB_apic_SetPicture{$_l_Row}:=$_pic_Icon
																	DB_al_SetID{$_l_Row}:=SM_al_SetitemsID{$_l_ItemPostion}
																	DB_at_SetMethod{$_l_Row}:="DB_SelectSet"
																	DB_at_MethodParameters{$_l_Row}:=String:C10(SM_al_SetitemsID{$_l_ItemPostion})
																	DB_at_SetName{$_l_Row}:=SM_at_SetItemsName{$_l_ItemPostion}
																	
																	
																End if 
															End if 
														End for 
													End if 
												Else 
													Gen_Alert("You may only drop lists onto groups, not selections")
												End if 
											Else 
												$_l_ItemPostion3:=Find in array:C230(SM_al_SetitemsID; $_l_SetID)  //the dragged set
												If (SM_al_SetContextItemContextID{$_l_ItemPostion3}<0)
													$_l_ContextID:=SM_al_SetContextItemContextID{$_l_ItemPostion3}
													$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
													$_l_GroupID:=SM_al_SetContextItemContextID{$_l_ItemPostion3}/$_l_ItemParent
													$_l_GroupRow:=Find in array:C230(DB_al_SetID; $_l_GroupID)
													$_l_ItemID:=SM_al_SetitemsID{$_l_ItemPostion3}
													//it must be expanded
													SM_al_SetContextItemContextID{$_l_ItemPostion3}:=$_l_ItemParent
													SM_UPDATEDATA
													//Now collapse the group and re-expand it
													
													//This is in a group and we are taking it out.!
													For ($_l_Index; 1; Size of array:C274(SM_al_SetitemsID))
														If (SM_al_SetContextItemContextID{$_l_Index}=$_l_ContextID)
															$_l_SubItemID:=SM_al_SetitemsID{$_l_Index}
															$_l_ItemPostion:=Find in array:C230(DB_al_SetID; $_l_SubItemID)
															If ($_l_ItemPostion>0)
																DELETE FROM ARRAY:C228(DB_at_SetName; $_l_ItemPostion; 1)
																DELETE FROM ARRAY:C228(DB_apic_SetPicture; $_l_ItemPostion; 1)
																DELETE FROM ARRAY:C228(DB_al_SetID; $_l_ItemPostion; 1)
																DELETE FROM ARRAY:C228(DB_at_SetMethod; $_l_ItemPostion; 1)
																DELETE FROM ARRAY:C228(DB_at_MethodParameters; $_l_ItemPostion; 1)
															End if 
														End if 
													End for 
													$_l_Row:=$_l_GroupRow
													For ($_l_Index; 1; Size of array:C274(SM_al_SetitemsID))
														If (SM_al_SetContextItemContextID{$_l_Index}=$_l_ContextID) & (SM_al_SetitemsClassID{$_l_Index}#855)
															$_l_SubItemID:=SM_al_SetitemsID{$_l_Index}
															$_l_ItemPostion:=Find in array:C230(SM_al_SetitemsID; $_l_SubItemID)
															If ($_l_ItemPostion>0)
																INSERT IN ARRAY:C227(DB_at_SetName; $_l_Row+1; 1)
																INSERT IN ARRAY:C227(DB_apic_SetPicture; $_l_Row+1; 1)
																INSERT IN ARRAY:C227(DB_al_SetID; $_l_Row+1; 1)
																INSERT IN ARRAY:C227(DB_at_SetMethod; $_l_Row+1; 1)
																INSERT IN ARRAY:C227(DB_at_MethodParameters; $_l_Row+1; 1)
																$_l_Row:=$_l_Row+1
																$_l_Icon:=SM_al_SetitemsClassID{$_l_ItemPostion}
																If ($_l_Icon=0)
																	$_l_Icon:=853
																End if 
																Case of 
																	: ($_l_Icon=853)
																		$_pic_Icon:=DB_pic_SelectedSet
																		
																	: ($_l_Icon=854)
																		$_pic_Icon:=DB_pic_BuiltSet
																		
																	: ($_l_Icon=852)
																		$_pic_Icon:=DB_pic_SelectedPlusSet
																		
																	: ($_l_Icon=855)
																		$_pic_Icon:=DB_pic_GroupedSetList
																		
																	Else 
																		$_pic_Icon:=DB_pic_SelectedSet
																		
																End case 
																//GET PICTURE FROM LIBRARY(22552; $_pic_Space)
																$_pic_Space:=Get_Picture(22552)
																COMBINE PICTURES:C987($_pic_Icon; $_pic_Space; Horizontal concatenation:K61:8; $_pic_Icon)
																DB_apic_SetPicture{$_l_Row}:=$_pic_Icon
																DB_al_SetID{$_l_Row}:=SM_al_SetitemsID{$_l_ItemPostion}
																DB_at_SetMethod{$_l_Row}:="DB_SelectSet"
																DB_at_MethodParameters{$_l_Row}:=String:C10(SM_al_SetitemsID{$_l_ItemPostion})
																DB_at_SetName{$_l_Row}:=SM_at_SetItemsName{$_l_ItemPostion}
																
																
															End if 
														End if 
													End for 
													//now insert the dragged item
													$_l_Row:=Size of array:C274(DB_at_SetName)
													$_l_ItemPostion:=Find in array:C230(SM_al_SetitemsID; $_l_ItemID)
													If ($_l_ItemPostion>0)
														INSERT IN ARRAY:C227(DB_at_SetName; $_l_Row+1; 1)
														INSERT IN ARRAY:C227(DB_apic_SetPicture; $_l_Row+1; 1)
														INSERT IN ARRAY:C227(DB_al_SetID; $_l_Row+1; 1)
														INSERT IN ARRAY:C227(DB_at_SetMethod; $_l_Row+1; 1)
														INSERT IN ARRAY:C227(DB_at_MethodParameters; $_l_Row+1; 1)
														$_l_Icon:=SM_al_SetitemsClassID{$_l_ItemPostion}
														If ($_l_Icon=0)
															$_l_Icon:=853
														End if 
														Case of 
															: ($_l_Icon=853)
																$_pic_Icon:=DB_pic_SelectedSet
																
															: ($_l_Icon=854)
																$_pic_Icon:=DB_pic_BuiltSet
																
															: ($_l_Icon=852)
																$_pic_Icon:=DB_pic_SelectedPlusSet
																
															: ($_l_Icon=855)
																$_pic_Icon:=DB_pic_GroupedSetList
																
															Else 
																$_pic_Icon:=DB_pic_SelectedSet
																
														End case 
														//Get Picture FROM LIBRARY(22552;$_pic_Space)
														//COMBINE PICTURES($_pic_Icon;$_pic_Space;Horizontal concatenation ;$_pic_Icon)
														DB_apic_SetPicture{$_l_Row}:=$_pic_Icon
														DB_al_SetID{$_l_Row}:=SM_al_SetitemsID{$_l_ItemPostion}
														DB_at_SetMethod{$_l_Row}:="DB_SelectSet"
														DB_at_MethodParameters{$_l_Row}:=String:C10(SM_al_SetitemsID{$_l_ItemPostion})
														DB_at_SetName{$_l_Row}:=SM_at_SetItemsName{$_l_ItemPostion}
														
														
													End if 
												End if 
												
											End if 
										End if 
									End if 
								Else 
									Gen_Alert("You may only put user created selections into a folder")
								End if 
							End if 
						End if 
				End case 
			Else 
				
			End if 
			
			
		End if 
	: ($_l_event=On Data Change:K2:15)
		TRACE:C157
		
		LISTBOX GET CELL POSITION:C971(*; "oSelectionsListbox"; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			
			If (DB_al_SetID{$_l_Row}=999999)  //new Record not saved
				Case of 
					: (DB_at_SetName{$_l_Row}="New Set")
						$_t_NewSetName:=Gen_Request("Enter Name for new set"; "New Set")
						If (OK=1)
							DB_at_SetName{$_l_Row}:=$_t_NewSetName
						End if 
					: (DB_at_SetName{$_l_Row}="New Group")
						$_t_NewSetName:=Gen_Request("Enter Name for the new Group"; "New Group")
						If (OK=1)
							DB_at_SetName{$_l_Row}:=$_t_NewSetName
						End if 
				End case 
				
				ARRAY TEXT:C222($_at_SetClass; 4)
				ARRAY LONGINT:C221($_al_SetClassID; 4)
				$_at_SetClass{1}:="Fixed List"
				$_at_SetClass{2}:="Dynamic List"
				$_at_SetClass{3}:="Fixed List with Dynamic Query"
				$_at_SetClass{4}:="Group"
				$_al_SetClassID{1}:=853
				$_al_SetClassID{2}:=854
				$_al_SetClassID{3}:=852
				$_al_SetClassID{4}:=855
				$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
				$_l_ItemRef:=-(AA_GetNextIDinMethod(->SM_l_ContextItemID))
				DB_al_SetID{$_l_Row}:=$_l_ItemRef
				DB_at_SetMethod{$_l_Row}:="DB_SelectSet"
				DB_at_MethodParameters{$_l_Row}:=String:C10($_l_ItemRef)
				If (DB_l_newSetClass=0)
					DB_l_newSetClass:=853
				End if 
				$_l_ItemPostion3:=Find in array:C230($_al_SetClassID; DB_l_newSetClass)
				SM_UpdateArrays("PER"; DB_at_SetName{$_l_Row}; $_l_ItemRef; $_l_ItemParent; ""; 0; $_at_SetClass{$_l_ItemPostion3}; $_al_SetClassID{$_l_ItemPostion3})
				Case of 
					: (DB_l_newSetClass=853)
						SM_saveSet("DB_NewSet"; $_l_ItemRef)
					: (DB_l_newSetClass=852) | (DB_l_newSetClass=854)
						If (DB_l_MyTempMacro=0)
							DB_l_MyTempMacro:=AA_GetNextID(->DB_l_MyTempMacro)
						End if 
						$_t_ScriptCode:=String:C10(DB_l_MyTempMacro; "######")
						$_t_ScriptName:="Data Query "+"Temp"
						READ WRITE:C146([SCRIPTS:80])
						QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ScriptCode)
						If (Records in selection:C76([SCRIPTS:80])=1)
							[SCRIPTS:80]Script_Code:1:=String:C10(DB_al_SetID{$_l_Row})
							[SCRIPTS:80]Script_Name:2:="Data Query "+DB_at_SetName{$_l_Row}
							DB_SaveRecord(->[SCRIPTS:80])
							
						End if 
				End case 
				//the above saves the data to the arrays. now save the arrays.
				//START TRANSACTION
				SM_UPDATEDATA
				LB_SetEnterable(->DB_lb_Setsandselections; False:C215; 0)
				GOTO OBJECT:C206(Sel_ConfigSelection)
				
			End if 
			
			
			
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oSelectionsListbox"; $_t_oldMethodName)

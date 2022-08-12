If (False:C215)
	//object Method Name: Object Name:      DB_OutputForm.oSelectionsOptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/08/2011 10:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_Setsandselections;0)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	ARRAY LONGINT:C221($_al_Lines; 0)
	ARRAY LONGINT:C221($_al_SelectedLines; 0)
	ARRAY LONGINT:C221($_al_SetClassID; 0)
	//ARRAY LONGINT(DB_al_SelectionFuntions;0)
	//ARRAY LONGINT(DB_al_SetID;0)
	//ARRAY PICTURE(DB_apic_SetPicture;0)
	ARRAY TEXT:C222($_at_SetClass; 0)
	//ARRAY TEXT(DB_at_ConfigureOptions;0)
	//ARRAY TEXT(DB_at_MethodParameters;0)
	//ARRAY TEXT(DB_at_SelectionOptions;0)
	//ARRAY TEXT(DB_at_SetMethod;0)
	//ARRAY TEXT(DB_at_SetName;0)
	//ARRAY TEXT(SM_at_SetItemsName;0)
	C_BOOLEAN:C305($_bo_CurrentSelection; $_bo_CurrentSelectionAsked; $_bo_PopUpDisplayed; $_bo_UseHighlighted; DB_bo_ShowArrayBased; SEL_SelectionsShare)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Index; $_l_IndextemRef; $_l_ItemParent; $_l_ListboxWidth; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_ObjectBottom; $_l_ObjectLeft)
	C_LONGINT:C283($_l_ObjectRight; $_l_objectTop; $_l_Row; $_l_SelectedLine; $_l_SelectedLine2; $_l_SelectedOption; $_l_SelectedOption3; $_l_SelectedRecords; $_l_SetID; $_l_SizeofArray; $_l_Type)
	C_LONGINT:C283($_l_UserChoice; DB_l_CurrentDisplayedForm; DB_l_MyTempMacro; Sel_ConfigSelection; SM_l_ContextItemID)
	C_PICTURE:C286($_pic_NulPicture; DB_pic_SelectedSet)
	C_POINTER:C301($_ptr_Table)
	C_REAL:C285(DB_l_newSetClass)
	C_TEXT:C284($_t_MenuString; $_t_NewSetName; $_t_oldMethodName; $_t_Parameter; $_t_ScriptCode; $_t_ScriptName; DB_t_CurrentContext; DB_t_FirstSetName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oSelectionsOptions"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Alternative Click:K2:36)
		LISTBOX GET CELL POSITION:C971(DB_lb_Setsandselections; $_l_Column; $_l_Row)
		If ($_l_Row=0)
			ARRAY TEXT:C222(DB_at_SelectionOptions; 0)
			ARRAY LONGINT:C221(DB_al_SelectionFuntions; 0)
			APPEND TO ARRAY:C911(DB_at_SelectionOptions; "Save current displayed records to new saved selection")
			APPEND TO ARRAY:C911(DB_al_SelectionFuntions; 1)
			
		End if 
		
		$_bo_PopUpDisplayed:=False:C215
		If (Size of array:C274(DB_at_SelectionOptions)>0)
			If (Size of array:C274(DB_at_SelectionOptions)>1)
				GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
				For ($_l_Index; 1; Size of array:C274(DB_at_SelectionOptions))
					If ($_l_Index=1)
						$_t_MenuString:=DB_at_SelectionOptions{$_l_Index}
					Else 
						$_t_MenuString:=$_t_MenuString+";"+DB_at_SelectionOptions{$_l_Index}
					End if 
				End for 
				$_bo_PopUpDisplayed:=True:C214
				$_l_UserChoice:=Pop up menu:C542($_t_MenuString; 1; $_l_MouseX; $_l_MouseY)
			Else 
				$_l_UserChoice:=1
			End if 
			
			If ($_l_UserChoice>0)
				
				$_l_SelectedOption:=$_l_UserChoice
				If ($_l_SelectedOption>0) & ($_l_SelectedOption<=Size of array:C274(DB_al_SelectionFuntions))
					
					$_l_Type:=DB_al_SelectionFuntions{$_l_SelectedOption}
					Case of 
						: ($_l_Type=1)  //create a new selection from the current records
							$_bo_UseHighlighted:=False:C215
							$_bo_CurrentSelection:=False:C215
							$_bo_CurrentSelectionAsked:=False:C215
							If (Not:C34($_bo_PopUpDisplayed))
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
								If ($_bo_CurrentSelection)
									$_bo_CurrentSelectionAsked:=True:C214
									Gen_Confirm("Use highlighted selection or all records currently displayed?"; "All"; "Highlighted")
									If (OK=0)
										$_bo_UseHighlighted:=True:C214
									End if 
								Else 
									$_bo_CurrentSelectionAsked:=True:C214
									Gen_Confirm("Create New Saved selection from currently displayed records"; "No"; "Yes")
								End if 
							End if 
							$_l_SizeofArray:=Size of array:C274(DB_at_SetName)
							If (DB_al_SetID{$_l_SizeofArray}=999999)  //new Record not saved
								Case of 
									: (DB_at_SetName{$_l_SizeofArray}="New Set")
										$_t_NewSetName:=Gen_Request("Enter Name for previously created new saved selection"; "New Set")
										If (OK=1)
											DB_at_SetName{$_l_SizeofArray}:=$_t_NewSetName
										End if 
									: (DB_at_SetName{$_l_SizeofArray}="New Group")
										$_t_NewSetName:=Gen_Request("Enter Name for the new Group"; "New Group")
										If (OK=1)
											DB_at_SetName{$_l_SizeofArray}:=$_t_NewSetName
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
								$_l_IndextemRef:=-(AA_GetNextIDinMethod(->SM_l_ContextItemID))
								DB_al_SetID{$_l_SizeofArray}:=$_l_IndextemRef
								DB_at_SetMethod{$_l_SizeofArray}:="DB_SelectSet"
								DB_at_MethodParameters{$_l_SizeofArray}:=String:C10($_l_IndextemRef)
								If (DB_l_newSetClass=0)
									DB_l_newSetClass:=853
								End if 
								$_l_SelectedOption3:=Find in array:C230($_al_SetClassID; DB_l_newSetClass)
								SM_UpdateArrays("PER"; DB_at_SetName{$_l_SizeofArray}; $_l_IndextemRef; $_l_ItemParent; ""; 0; $_at_SetClass{$_l_SelectedOption3}; $_al_SetClassID{$_l_SelectedOption3})
								Case of 
									: (DB_l_newSetClass=853)
										SM_saveSet("DB_NewSet"; $_l_IndextemRef)
									: (DB_l_newSetClass=852) | (DB_l_newSetClass=854)
										If (DB_l_MyTempMacro=0)
											DB_l_MyTempMacro:=AA_GetNextID(->DB_l_MyTempMacro)
										End if 
										$_t_ScriptCode:=String:C10(DB_l_MyTempMacro; "######")
										$_t_ScriptName:="Data Query "+"Temp"
										READ WRITE:C146([SCRIPTS:80])
										QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ScriptCode)
										If (Records in selection:C76([SCRIPTS:80])=1)
											[SCRIPTS:80]Script_Code:1:=String:C10(DB_al_SetID{$_l_SizeofArray})
											[SCRIPTS:80]Script_Name:2:="Data Query "+DB_at_SetName{$_l_SizeofArray}
											DB_SaveRecord(->[SCRIPTS:80])
											
										End if 
								End case 
								//the above saves the data to the arrays. now save the arrays.
								//START TRANSACTION
								SM_UPDATEDATA
								LB_SetEnterable(->DB_lb_Setsandselections; False:C215; 0)
								GOTO OBJECT:C206(Sel_ConfigSelection)
								
							End if 
							If (DB_al_SetID{$_l_SizeofArray}=0)  // not user sets yet
								APPEND TO ARRAY:C911(DB_at_SetName; "")
								APPEND TO ARRAY:C911(DB_apic_SetPicture; $_pic_NulPicture)
								APPEND TO ARRAY:C911(DB_al_SetID; 9999998)
								APPEND TO ARRAY:C911(DB_at_SetMethod; "")
								APPEND TO ARRAY:C911(DB_at_MethodParameters; "")
								$_l_SizeofArray:=Size of array:C274(DB_at_SetName)
							End if 
							APPEND TO ARRAY:C911(DB_at_SetName; "New Set")
							APPEND TO ARRAY:C911(DB_apic_SetPicture; DB_pic_SelectedSet)
							APPEND TO ARRAY:C911(DB_al_SetID; 999999)
							APPEND TO ARRAY:C911(DB_at_SetMethod; "")  //note we leave this blank at this moment so it wont try to select anything
							APPEND TO ARRAY:C911(DB_at_MethodParameters; "")
							
							//$_bo_CurrentSelection:=False
							If (Not:C34($_bo_CurrentSelectionAsked))
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
							End if 
							//$_bo_UseHighlighted:=False
							If ($_bo_CurrentSelection) & (Not:C34($_bo_CurrentSelectionAsked))
								
								Gen_Confirm("Use highlighted selection or all records currently displayed?"; "All"; "Highlighted")
								If (OK=0)
									$_bo_UseHighlighted:=True:C214
								End if 
							Else 
								
								
							End if 
							If ($_bo_UseHighlighted)
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
								
							Else 
								DB_l_newSetClass:=853
								CREATE SET:C116(Table:C252(DB_l_CurrentDisplayedForm)->; "DB_NewSet")
								
								OBJECT SET VISIBLE:C603(DB_at_ConfigureOptions; False:C215)
								
							End if 
							OBJECT SET VISIBLE:C603(SEL_SelectionsShare; False:C215)
							OBJECT SET VISIBLE:C603(*; "oSelectionsOptions"; False:C215)
							
							OBJECT GET COORDINATES:C663(*; "oSelectionsListbox"; $_l_ObjectLeft; $_l_objectTop; $_l_ObjectRight; $_l_ObjectBottom)
							$_l_ListboxWidth:=$_l_ObjectRight-$_l_ObjectLeft
							LB_SetColumnWidths(->DB_lb_Setsandselections; "SMGR_t"; 1; 30; $_l_ListboxWidth-(30+20); 0; 0; 0)
							LB_SetEnterable(->DB_lb_Setsandselections; True:C214; 2)
							GOTO OBJECT:C206(DB_lb_Setsandselections)
							LB_SetScroll(->DB_lb_Setsandselections; $_l_SizeofArray; 0)
							LB_GoToCell(->DB_lb_Setsandselections; 2; $_l_SizeofArray+1)
							APPEND TO ARRAY:C911(DB_at_ConfigureOptions; "Save Set")
							//_O_ENABLE BUTTON(SEL_configselection)
							OBJECT SET ENABLED:C1123(SEL_configselection; True:C214)
							OBJECT SET VISIBLE:C603(SEL_configselection; True:C214)
						: ($_l_Type=2)  //Select current displayed records and  saved selection
							LISTBOX GET CELL POSITION:C971(DB_lb_Setsandselections; $_l_Column; $_l_Row)
							If ($_l_Row>0)  //it should be
								$_l_SetID:=DB_al_SetID{$_l_Row}
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
								$_bo_UseHighlighted:=False:C215
								If ($_bo_CurrentSelection)
									Gen_Confirm("Use highlighted selection or all records currently displayed?"; "All"; "Highlighted")
									If (OK=0)
										$_bo_UseHighlighted:=True:C214
									End if 
								Else 
									$_bo_UseHighlighted:=False:C215
								End if 
								If ($_bo_UseHighlighted)
									If (DB_bo_ShowArrayBased)
										
										
									Else 
										USE SET:C118("ListboxSet0")
										CREATE SET:C116(Table:C252(DB_l_CurrentDisplayedForm)->; "$Stemp1")
										$_l_SelectedRecords:=Records in set:C195("ListboxSet0")
									End if 
								Else 
									
									CREATE SET:C116(Table:C252(DB_l_CurrentDisplayedForm)->; "$Stemp1")
									
								End if 
								If (DB_at_SetMethod{$_l_Row}#"")
									$_t_Parameter:=DB_at_MethodParameters{$_l_Row}
									If ($_t_Parameter#"")
										Case of 
											: (DB_at_SetMethod{$_l_Row}="DB_SelectSet")
												$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
												DB_SelectSet($_t_Parameter; $_l_ItemParent)
											: (DB_at_SetMethod{$_l_Row}="SEL_AllRecords")
												SEL_AllRecords($_t_Parameter)
												
											Else 
												//EXECUTE FORMULA(DB_at_SetMethod{$_l_Row}+"("+$_t_Parameter+")")
												EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_Row}; *; $_t_Parameter)
										End case 
									Else 
										//EXECUTE FORMULA(DB_at_SetMethod{$_l_Row})
										EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_Row})
									End if 
									
									
									
								End if 
								$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
								CREATE SET:C116($_ptr_Table->; "$Stemp2")
								INTERSECTION:C121("$Stemp1"; "$Stemp2"; "$Stemp1")
								//UNION("$Stemp1";"$Stemp2";"$Stemp1")
								USE SET:C118("$Stemp1")
								
								
								
								
								
								
								
								//SEL_UpdateRecordCache (DB_l_CurrentDisplayedForm)
								//DB_SetFormButtons (DB_l_CurrentDisplayedForm;DB_t_CurrentContext)
								//DB_SetFormMenuoptions
								//DB_HideShowSearch (DB_l_CurrentDisplayedForm)
								//SRCH_Applyfilterstoselection ($_ptr_Table)
								//DB_SetFormSortOrder (DB_l_CurrentDisplayedForm;DB_t_CurrentContext)
								DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							End if 
							
						: ($_l_Type=3)  //union
							LISTBOX GET CELL POSITION:C971(DB_lb_Setsandselections; $_l_Column; $_l_Row)
							If ($_l_Row>0)  //it should be
								$_l_SetID:=DB_al_SetID{$_l_Row}
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
								$_bo_UseHighlighted:=False:C215
								If ($_bo_CurrentSelection)
									Gen_Confirm("Use highlighted selection or all records currently displayed?"; "All"; "Highlighted")
									If (OK=0)
										$_bo_UseHighlighted:=True:C214
									End if 
								Else 
									$_bo_UseHighlighted:=False:C215
								End if 
								If ($_bo_UseHighlighted)
									If (DB_bo_ShowArrayBased)
										
										
									Else 
										USE SET:C118("ListboxSet0")
										CREATE SET:C116(Table:C252(DB_l_CurrentDisplayedForm)->; "$Stemp1")
										$_l_SelectedRecords:=Records in set:C195("ListboxSet0")
									End if 
								Else 
									
									CREATE SET:C116(Table:C252(DB_l_CurrentDisplayedForm)->; "$Stemp1")
									
								End if 
								If (DB_at_SetMethod{$_l_Row}#"")
									$_t_Parameter:=DB_at_MethodParameters{$_l_Row}
									If ($_t_Parameter#"")
										Case of 
											: (DB_at_SetMethod{$_l_Row}="DB_SelectSet")
												$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
												DB_SelectSet($_t_Parameter; $_l_ItemParent)
												
											: (DB_at_SetMethod{$_l_Row}="SEL_AllRecords")
												SEL_AllRecords($_t_Parameter)
												
											Else 
												//EXECUTE FORMULA(DB_at_SetMethod{$_l_Row}+"("+$_t_Parameter+")")
												EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_Row}; *; $_t_Parameter)
										End case 
									Else 
										//EXECUTE FORMULA(DB_at_SetMethod{$_l_Row})
										EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_Row})
									End if 
									
									
									
								End if 
								$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
								CREATE SET:C116($_ptr_Table->; "$Stemp2")
								//INTERSECTION("$Stemp1";"$Stemp2";"$Stemp1")
								UNION:C120("$Stemp1"; "$Stemp2"; "$Stemp1")
								USE SET:C118("$Stemp1")
								
								
								
								
								
								
								
								SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
								DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetFormMenuoptions
								DB_HideShowSearch(DB_l_CurrentDisplayedForm)
								SRCH_Applyfilterstoselection($_ptr_Table)
								DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							End if 
						: ($_l_Type=4)
							LISTBOX GET CELL POSITION:C971(DB_lb_Setsandselections; $_l_Column; $_l_Row)
							If ($_l_Row>0)  //it should be
								$_l_SetID:=DB_al_SetID{$_l_Row}
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
								$_bo_UseHighlighted:=False:C215
								If ($_bo_CurrentSelection)
									Gen_Confirm("Use highlighted selection or all records currently displayed?"; "All"; "Highlighted")
									If (OK=0)
										$_bo_UseHighlighted:=True:C214
									End if 
								Else 
									$_bo_UseHighlighted:=False:C215
								End if 
								If ($_bo_UseHighlighted)
									If (DB_bo_ShowArrayBased)
										
										
									Else 
										USE SET:C118("ListboxSet0")
										CREATE SET:C116(Table:C252(DB_l_CurrentDisplayedForm)->; "$Stemp1")
										$_l_SelectedRecords:=Records in set:C195("ListboxSet0")
									End if 
								Else 
									
									CREATE SET:C116(Table:C252(DB_l_CurrentDisplayedForm)->; "$Stemp1")
									
								End if 
								If (DB_at_SetMethod{$_l_Row}#"")
									$_t_Parameter:=DB_at_MethodParameters{$_l_Row}
									If ($_t_Parameter#"")
										Case of 
											: (DB_at_SetMethod{$_l_Row}="DB_SelectSet")
												$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
												DB_SelectSet($_t_Parameter; $_l_ItemParent)
											: (DB_at_SetMethod{$_l_Row}="SEL_AllRecords")
												SEL_AllRecords($_t_Parameter)
												
											Else 
												//EXECUTE FORMULA(DB_at_SetMethod{$_l_Row}+"("+$_t_Parameter+")")
												EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_Row}; *; $_t_Parameter)
										End case 
									Else 
										//EXECUTE FORMULA(DB_at_SetMethod{$_l_Row})
										EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_Row})
									End if 
									
									
									
								End if 
								$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
								CREATE SET:C116($_ptr_Table->; "$Stemp2")
								//INTERSECTION("$Stemp1";"$Stemp2";"$Stemp1")
								//UNION("$Stemp1";"$Stemp2";"$Stemp1")
								DIFFERENCE:C122("$Stemp2"; "$Stemp1"; "$Stemp1")
								USE SET:C118("$Stemp1")
								
								
								
								
								
								
								
								SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
								DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetFormMenuoptions
								DB_HideShowSearch(DB_l_CurrentDisplayedForm)
								SRCH_Applyfilterstoselection($_ptr_Table)
								DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							End if 
						: ($_l_Type=5)
							LISTBOX GET CELL POSITION:C971(DB_lb_Setsandselections; $_l_Column; $_l_Row)
							If ($_l_Row>0)  //it should be
								$_l_SetID:=DB_al_SetID{$_l_Row}
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
								$_bo_UseHighlighted:=False:C215
								If ($_bo_CurrentSelection)
									Gen_Confirm("Use highlighted selection or all records currently displayed?"; "All"; "Highlighted")
									If (OK=0)
										$_bo_UseHighlighted:=True:C214
									End if 
								Else 
									$_bo_UseHighlighted:=False:C215
								End if 
								If ($_bo_UseHighlighted)
									If (DB_bo_ShowArrayBased)
										
										
									Else 
										USE SET:C118("ListboxSet0")
										CREATE SET:C116(Table:C252(DB_l_CurrentDisplayedForm)->; "$Stemp1")
										$_l_SelectedRecords:=Records in set:C195("ListboxSet0")
									End if 
								Else 
									
									CREATE SET:C116(Table:C252(DB_l_CurrentDisplayedForm)->; "$Stemp1")
									
								End if 
								If (DB_at_SetMethod{$_l_Row}#"")
									$_t_Parameter:=DB_at_MethodParameters{$_l_Row}
									If ($_t_Parameter#"")
										Case of 
											: (DB_at_SetMethod{$_l_Row}="DB_SelectSet")
												$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
												DB_SelectSet($_t_Parameter; $_l_ItemParent)
											: (DB_at_SetMethod{$_l_Row}="SEL_AllRecords")
												SEL_AllRecords($_t_Parameter)
												
											Else 
												//EXECUTE FORMULA(DB_at_SetMethod{$_l_Row}+"("+$_t_Parameter+")")
												EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_Row}; *; $_t_Parameter)
										End case 
									Else 
										//EXECUTE FORMULA(DB_at_SetMethod{$_l_Row})
										EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_Row})
									End if 
									
									
									
								End if 
								$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
								CREATE SET:C116($_ptr_Table->; "$Stemp2")
								//INTERSECTION("$Stemp1";"$Stemp2";"$Stemp1")
								//UNION("$Stemp1";"$Stemp2";"$Stemp1")
								DIFFERENCE:C122("$Stemp1"; "$Stemp2"; "$Stemp1")
								USE SET:C118("$Stemp1")
								
								
								
								
								
								
								
								SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
								DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetFormMenuoptions
								DB_HideShowSearch(DB_l_CurrentDisplayedForm)
								SRCH_Applyfilterstoselection($_ptr_Table)
								DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							End if 
						: ($_l_Type=6)  //intesection of two sets
							ARRAY LONGINT:C221($_al_SelectedLines; 0)
							LB_GetSelect(->DB_lb_Setsandselections; ->$_al_SelectedLines)
							If (Size of array:C274($_al_SelectedLines)=2)  //it should be
								If (DB_t_FirstSetName=SM_at_SetItemsName{$_al_SelectedLines{1}})
									$_l_SelectedLine:=$_al_SelectedLines{1}
									$_l_SelectedLine2:=$_al_SelectedLines{2}
								Else 
									$_l_SelectedLine:=$_al_SelectedLines{2}
									$_l_SelectedLine2:=$_al_SelectedLines{1}
								End if 
								If (DB_at_SetMethod{$_l_SelectedLine2}#"")
									$_t_Parameter:=DB_at_MethodParameters{$_l_SelectedLine2}
									If ($_t_Parameter#"")
										Case of 
											: (DB_at_SetMethod{$_l_SelectedLine2}="DB_SelectSet")
												$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
												DB_SelectSet($_t_Parameter; $_l_ItemParent)
											: (DB_at_SetMethod{$_l_SelectedLine2}="SEL_AllRecords")
												SEL_AllRecords($_t_Parameter)
												
											Else 
												//EXECUTE FORMULA(DB_at_SetMethod{$_l_SelectedLine2}+"("+$_t_Parameter+")")
												EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine2}; *; $_t_Parameter)
										End case 
									Else 
										//EXECUTE FORMULA(DB_at_SetMethod{$_l_SelectedLine2})
										EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine2})
									End if 
									
									
									
								End if 
								$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
								CREATE SET:C116($_ptr_Table->; "$Stemp1")
								
								If (DB_at_SetMethod{$_l_SelectedLine}#"")
									$_t_Parameter:=DB_at_MethodParameters{$_l_SelectedLine}
									If ($_t_Parameter#"")
										Case of 
											: (DB_at_SetMethod{$_l_SelectedLine}="DB_SelectSet")
												$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
												DB_SelectSet($_t_Parameter; $_l_ItemParent)
											: (DB_at_SetMethod{$_l_SelectedLine}="SEL_AllRecords")
												SEL_AllRecords($_t_Parameter)
												
											Else 
												//Execute method(DB_at_SetMethod{$_l_SelectedLine};*;$_t_Parameter)
												EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine}; *; $_t_Parameter)
										End case 
									Else 
										//Execute method(DB_at_SetMethod{$_l_SelectedLine})
										EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine}; *; $_t_Parameter)
									End if 
									
									
									
								End if 
								$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
								CREATE SET:C116($_ptr_Table->; "$Stemp2")
								INTERSECTION:C121("$Stemp1"; "$Stemp2"; "$Stemp1")
								//UNION("$Stemp1";"$Stemp2";"$Stemp1")
								USE SET:C118("$Stemp1")
								
								
								
								
								
								
								
								SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
								DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetFormMenuoptions
								DB_HideShowSearch(DB_l_CurrentDisplayedForm)
								SRCH_Applyfilterstoselection($_ptr_Table)
								DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							End if 
						: ($_l_Type=7)  //union of two sets
							ARRAY LONGINT:C221($_al_SelectedLines; 0)
							LB_GetSelect(->DB_lb_Setsandselections; ->$_al_SelectedLines)
							If (Size of array:C274($_al_SelectedLines)=2)  //it should be
								If (DB_t_FirstSetName=SM_at_SetItemsName{$_al_SelectedLines{1}})
									$_l_SelectedLine:=$_al_SelectedLines{1}
									$_l_SelectedLine2:=$_al_SelectedLines{2}
								Else 
									$_l_SelectedLine:=$_al_SelectedLines{2}
									$_l_SelectedLine2:=$_al_SelectedLines{1}
								End if 
								If (DB_at_SetMethod{$_l_SelectedLine2}#"")
									$_t_Parameter:=DB_at_MethodParameters{$_l_SelectedLine2}
									If ($_t_Parameter#"")
										Case of 
											: (DB_at_SetMethod{$_l_SelectedLine2}="DB_SelectSet")
												$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
												DB_SelectSet($_t_Parameter; $_l_ItemParent)
											: (DB_at_SetMethod{$_l_SelectedLine2}="SEL_AllRecords")
												SEL_AllRecords($_t_Parameter)
												
											Else 
												//EXECUTE FORMULA(DB_at_SetMethod{$_l_SelectedLine2}+"("+$_t_Parameter+")")
												EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine2}; *; $_t_Parameter)
										End case 
									Else 
										//EXECUTE FORMULA(DB_at_SetMethod{$_l_SelectedLine2})
										EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine2})
									End if 
									
									
									
								End if 
								$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
								CREATE SET:C116($_ptr_Table->; "$Stemp1")
								
								If (DB_at_SetMethod{$_l_SelectedLine}#"")
									$_t_Parameter:=DB_at_MethodParameters{$_l_SelectedLine}
									If ($_t_Parameter#"")
										Case of 
											: (DB_at_SetMethod{$_l_SelectedLine}="DB_SelectSet")
												$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
												DB_SelectSet($_t_Parameter; $_l_ItemParent)
											: (DB_at_SetMethod{$_l_SelectedLine}="SEL_AllRecords")
												SEL_AllRecords($_t_Parameter)
												
											Else 
												//Execute method(DB_at_SetMethod{$_l_SelectedLine};*;$_t_Parameter)
												EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine}; *; $_t_Parameter)
										End case 
									Else 
										//Execute method(DB_at_SetMethod{$_l_SelectedLine})
										EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine})
									End if 
									
									
									
								End if 
								$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
								CREATE SET:C116($_ptr_Table->; "$Stemp2")
								//INTERSECTION("$Stemp1";"$Stemp2";"$Stemp1")
								UNION:C120("$Stemp1"; "$Stemp2"; "$Stemp1")
								USE SET:C118("$Stemp1")
								
								
								
								
								
								
								
								SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
								DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetFormMenuoptions
								DB_HideShowSearch(DB_l_CurrentDisplayedForm)
								SRCH_Applyfilterstoselection($_ptr_Table)
								DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							End if 
						: ($_l_Type=8)
							ARRAY LONGINT:C221($_al_SelectedLines; 0)
							LB_GetSelect(->DB_lb_Setsandselections; ->$_al_SelectedLines)
							If (Size of array:C274($_al_SelectedLines)=2)  //it should be
								If (DB_t_FirstSetName=SM_at_SetItemsName{$_al_SelectedLines{1}})
									$_l_SelectedLine:=$_al_SelectedLines{1}
									$_l_SelectedLine2:=$_al_SelectedLines{2}
								Else 
									$_l_SelectedLine:=$_al_SelectedLines{2}
									$_l_SelectedLine2:=$_al_SelectedLines{1}
								End if 
								If (DB_at_SetMethod{$_l_SelectedLine2}#"")
									$_t_Parameter:=DB_at_MethodParameters{$_l_SelectedLine2}
									If ($_t_Parameter#"")
										Case of 
											: (DB_at_SetMethod{$_l_SelectedLine2}="DB_SelectSet")
												$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
												DB_SelectSet($_t_Parameter; $_l_ItemParent)
											: (DB_at_SetMethod{$_l_SelectedLine2}="SEL_AllRecords")
												SEL_AllRecords($_t_Parameter)
												
											Else 
												//EXECUTE FORMULA(DB_at_SetMethod{$_l_SelectedLine2}+"("+$_t_Parameter+")")
												EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine2}; *; $_t_Parameter)
										End case 
									Else 
										//EXECUTE FORMULA(DB_at_SetMethod{$_l_SelectedLine2})
										EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine2})
									End if 
									
									
									
								End if 
								$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
								CREATE SET:C116($_ptr_Table->; "$Stemp1")
								
								If (DB_at_SetMethod{$_l_SelectedLine}#"")
									$_t_Parameter:=DB_at_MethodParameters{$_l_SelectedLine}
									If ($_t_Parameter#"")
										Case of 
											: (DB_at_SetMethod{$_l_SelectedLine}="DB_SelectSet")
												$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
												DB_SelectSet($_t_Parameter; $_l_ItemParent)
											: (DB_at_SetMethod{$_l_SelectedLine}="SEL_AllRecords")
												SEL_AllRecords($_t_Parameter)
												
											Else 
												//Execute method(DB_at_SetMethod{$_l_SelectedLine};*;$_t_Parameter)
												EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine}; *; $_t_Parameter)
										End case 
									Else 
										//Execute method(DB_at_SetMethod{$_l_SelectedLine})
										EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine})
									End if 
									
									
									
								End if 
								$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
								CREATE SET:C116($_ptr_Table->; "$Stemp2")
								//INTERSECTION("$Stemp1";"$Stemp2";"$Stemp1")
								DIFFERENCE:C122("$Stemp2"; "$Stemp1"; "$Stemp1")
								USE SET:C118("$Stemp1")
								
								
								
								
								
								
								
								SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
								DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetFormMenuoptions
								DB_HideShowSearch(DB_l_CurrentDisplayedForm)
								SRCH_Applyfilterstoselection($_ptr_Table)
								DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							End if 
						: ($_l_Type=9)
							ARRAY LONGINT:C221($_al_SelectedLines; 0)
							LB_GetSelect(->DB_lb_Setsandselections; ->$_al_SelectedLines)
							If (Size of array:C274($_al_SelectedLines)=2)  //it should be
								If (DB_t_FirstSetName=SM_at_SetItemsName{$_al_SelectedLines{1}})
									$_l_SelectedLine:=$_al_SelectedLines{1}
									$_l_SelectedLine2:=$_al_SelectedLines{2}
								Else 
									$_l_SelectedLine:=$_al_SelectedLines{2}
									$_l_SelectedLine2:=$_al_SelectedLines{1}
								End if 
								If (DB_at_SetMethod{$_l_SelectedLine2}#"")
									$_t_Parameter:=DB_at_MethodParameters{$_l_SelectedLine2}
									If ($_t_Parameter#"")
										Case of 
											: (DB_at_SetMethod{$_l_SelectedLine2}="DB_SelectSet")
												$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
												DB_SelectSet($_t_Parameter; $_l_ItemParent)
											: (DB_at_SetMethod{$_l_SelectedLine2}="SEL_AllRecords")
												SEL_AllRecords($_t_Parameter)
												
											Else 
												//EXECUTE FORMULA(DB_at_SetMethod{$_l_SelectedLine2}+"("+$_t_Parameter+")")
												EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine2}; *; $_t_Parameter)
										End case 
									Else 
										//EXECUTE FORMULA(DB_at_SetMethod{$_l_SelectedLine2})
										EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine2})
									End if 
									
									
									
								End if 
								$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
								CREATE SET:C116($_ptr_Table->; "$Stemp1")
								
								If (DB_at_SetMethod{$_l_SelectedLine}#"")
									$_t_Parameter:=DB_at_MethodParameters{$_l_SelectedLine}
									If ($_t_Parameter#"")
										Case of 
											: (DB_at_SetMethod{$_l_SelectedLine}="DB_SelectSet")
												$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
												DB_SelectSet($_t_Parameter; $_l_ItemParent)
											: (DB_at_SetMethod{$_l_SelectedLine}="SEL_AllRecords")
												SEL_AllRecords($_t_Parameter)
												
											Else 
												//Execute method(DB_at_SetMethod{$_l_SelectedLine};*;$_t_Parameter)
												EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine}; *; $_t_Parameter)
										End case 
									Else 
										//Execute method(DB_at_SetMethod{$_l_SelectedLine})
										EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine})
									End if 
									
									
									
								End if 
								$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
								CREATE SET:C116($_ptr_Table->; "$Stemp2")
								//INTERSECTION("$Stemp1";"$Stemp2";"$Stemp1")
								DIFFERENCE:C122("$Stemp1"; "$Stemp2"; "$Stemp1")
								USE SET:C118("$Stemp1")
								
								
								
								
								
								
								
								SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
								DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetFormMenuoptions
								DB_HideShowSearch(DB_l_CurrentDisplayedForm)
								SRCH_Applyfilterstoselection($_ptr_Table)
								DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							End if 
						: ($_l_Type=10)  //Display records in "+DB_t_FirstSetName
							ARRAY LONGINT:C221($_al_SelectedLines; 0)
							LB_GetSelect(->DB_lb_Setsandselections; ->$_al_SelectedLines)
							If (Size of array:C274($_al_SelectedLines)>=1)  //it should be
								For ($_l_Index; 1; Size of array:C274($_al_SelectedLines))
									If (DB_t_FirstSetName=SM_at_SetItemsName{$_al_SelectedLines{$_l_Index}})
										$_l_SelectedLine:=$_al_SelectedLines{$_l_Index}
										$_l_Index:=Size of array:C274($_al_SelectedLines)
									End if 
								End for 
								
								
								
								If (DB_at_SetMethod{$_l_SelectedLine}#"")
									$_t_Parameter:=DB_at_MethodParameters{$_l_SelectedLine}
									If ($_t_Parameter#"")
										Case of 
											: (DB_at_SetMethod{$_l_SelectedLine}="DB_SelectSet")
												$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
												DB_SelectSet($_t_Parameter; $_l_ItemParent)
											: (DB_at_SetMethod{$_l_SelectedLine}="SEL_AllRecords")
												SEL_AllRecords($_t_Parameter)
												
											Else 
												//Execute method(DB_at_SetMethod{$_l_SelectedLine};*;$_t_Parameter)
												EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine}; *; $_t_Parameter)
										End case 
									Else 
										EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine})
										EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine})  //;*;$_t_Parameter)
									End if 
								End if 
								$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
								CREATE SET:C116($_ptr_Table->; "$Stemp1")
								USE SET:C118("$Stemp1")
								
								
								
								
								
								
								
								SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
								DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetFormMenuoptions
								DB_HideShowSearch(DB_l_CurrentDisplayedForm)
								SRCH_Applyfilterstoselection($_ptr_Table)
								DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							End if 
							
						: ($_l_Type=11)  //"Display records from "+"multiple"+" saved selections")
							ARRAY LONGINT:C221($_al_SelectedLines; 0)
							LB_GetSelect(->DB_lb_Setsandselections; ->$_al_SelectedLines)
							If (Size of array:C274($_al_SelectedLines)>=2)  //it should be
								$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
								CREATE SET:C116($_ptr_Table->; "$Stemp1")
								For ($_l_Index; 1; Size of array:C274($_al_SelectedLines))
									$_l_SelectedLine:=$_al_SelectedLines{$_l_Index}
									If (DB_at_SetMethod{$_l_SelectedLine}#"")
										$_t_Parameter:=DB_at_MethodParameters{$_l_SelectedLine}
										If ($_t_Parameter#"")
											Case of 
												: (DB_at_SetMethod{$_l_SelectedLine}="DB_SelectSet")
													$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
													DB_SelectSet($_t_Parameter; $_l_ItemParent)
												: (DB_at_SetMethod{$_l_SelectedLine}="SEL_AllRecords")
													SEL_AllRecords($_t_Parameter)
													
												Else 
													//Execute method(DB_at_SetMethod{$_l_SelectedLine};*;$_t_Parameter)
													EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine}; *; $_t_Parameter)
											End case 
										Else 
											//Execute method(DB_at_SetMethod{$_l_SelectedLine})
											EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine})
										End if 
										
										
										
									End if 
									$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
									CREATE SET:C116($_ptr_Table->; "$Stemp2")
									//INTERSECTION("$Stemp1";"$Stemp2";"$Stemp1")
									UNION:C120("$Stemp2"; "$Stemp1"; "$Stemp1")
									USE SET:C118("$Stemp1")
									
								End for 
								
								
								
								
								
								SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
								DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetFormMenuoptions
								DB_HideShowSearch(DB_l_CurrentDisplayedForm)
								SRCH_Applyfilterstoselection($_ptr_Table)
								DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							End if 
							
						: ($_l_Type=12)  //"Display records In Saved selection "+DB_t_FirstSetName+" and not in other saved selecitons")
							ARRAY LONGINT:C221($_al_SelectedLines; 0)
							LB_GetSelect(->DB_lb_Setsandselections; ->$_al_SelectedLines)
							If (Size of array:C274($_al_SelectedLines)>=2)  //it should be
								For ($_l_Index; 1; Size of array:C274($_al_SelectedLines))
									If (DB_t_FirstSetName=SM_at_SetItemsName{$_al_SelectedLines{$_l_Index}})
										$_l_SelectedLine2:=$_al_SelectedLines{$_l_Index}
										$_l_Index:=Size of array:C274($_al_SelectedLines)
									End if 
								End for 
								$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
								
								CREATE SET:C116($_ptr_Table->; "$Stemp1")
								For ($_l_Index; 1; Size of array:C274($_al_SelectedLines))
									$_l_SelectedLine:=$_al_SelectedLines{$_l_Index}
									If ($_l_SelectedLine2#$_l_SelectedLine)
										If (DB_at_SetMethod{$_l_SelectedLine}#"")
											$_t_Parameter:=DB_at_MethodParameters{$_l_SelectedLine}
											If ($_t_Parameter#"")
												Case of 
													: (DB_at_SetMethod{$_l_SelectedLine}="DB_SelectSet")
														$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
														DB_SelectSet($_t_Parameter; $_l_ItemParent)
													: (DB_at_SetMethod{$_l_SelectedLine}="SEL_AllRecords")
														SEL_AllRecords($_t_Parameter)
														
													Else 
														EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine}; *; $_t_Parameter)
												End case 
											Else 
												EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine})
											End if 
											
											
											
										End if 
										$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
										CREATE SET:C116($_ptr_Table->; "$Stemp2")
										//INTERSECTION("$Stemp1";"$Stemp2";"$Stemp1")
										UNION:C120("$Stemp2"; "$Stemp1"; "$Stemp1")
										USE SET:C118("$Stemp1")
									End if 
								End for 
								If (DB_at_SetMethod{$_l_SelectedLine2}#"")
									$_t_Parameter:=DB_at_MethodParameters{$_l_SelectedLine2}
									If ($_t_Parameter#"")
										Case of 
											: (DB_at_SetMethod{$_l_SelectedLine2}="DB_SelectSet")
												$_l_ItemParent:=10000+DB_l_CurrentDisplayedForm
												DB_SelectSet($_t_Parameter; $_l_ItemParent)
											: (DB_at_SetMethod{$_l_SelectedLine2}="SEL_AllRecords")
												SEL_AllRecords($_t_Parameter)
												
											Else 
												EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine2}; *; $_t_Parameter)
												//EXECUTE FORMULA(DB_at_SetMethod{$_l_SelectedLine2}+"("+$_t_Parameter+")")
										End case 
									Else 
										EXECUTE METHOD:C1007(DB_at_SetMethod{$_l_SelectedLine2})
										
									End if 
								End if 
								$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
								CREATE SET:C116($_ptr_Table->; "$Stemp2")
								DIFFERENCE:C122("$Stemp2"; "$Stemp1"; "$Stemp1")
								
								USE SET:C118("$Stemp1")
								
								
								
								
								
								
								SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
								DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetFormMenuoptions
								DB_HideShowSearch(DB_l_CurrentDisplayedForm)
								SRCH_Applyfilterstoselection($_ptr_Table)
								DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							End if 
							
					End case 
					
					
				End if 
				
				
				
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oSelectionsOptions"; $_t_oldMethodName)

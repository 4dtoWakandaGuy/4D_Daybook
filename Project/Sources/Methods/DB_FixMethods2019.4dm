//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_FixMethods2019
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_all_VarTypes; 0)
	ARRAY LONGINT:C221($_al_AllArrayTypes; 0)
	ARRAY LONGINT:C221($_al_DatabaseParameters; 0)
	ARRAY LONGINT:C221($_al_DeclareType; 0)
	ARRAY LONGINT:C221($_al_NumberOfPlug; 0)
	ARRAY LONGINT:C221($_al_ParameterValue; 0)
	ARRAY LONGINT:C221($_al_ParameterValueType; 0)
	ARRAY TEXT:C222($_at_AllArrayNames; 0)
	ARRAY TEXT:C222($_at_AllVarNames; 0)
	ARRAY TEXT:C222($_at_Components; 0)
	ARRAY TEXT:C222($_at_ComponentsList; 0)
	ARRAY TEXT:C222($_at_DatabaseParameterNames; 0)
	ARRAY TEXT:C222($_at_DatabaseParameterSettings; 0)
	ARRAY TEXT:C222($_at_FormNames; 0)
	ARRAY TEXT:C222($_at_HeaderDatas; 0)
	ARRAY TEXT:C222($_at_HeaderDatas2; 0)
	ARRAY TEXT:C222($_at_HeaderItems; 0)
	ARRAY TEXT:C222($_at_HeaderItems2; 0)
	ARRAY TEXT:C222($_at_HeaderLines; 0)
	ARRAY TEXT:C222($_at_HeaderLines2; 0)
	ARRAY TEXT:C222($_at_IgnoreMethods; 0)
	ARRAY TEXT:C222($_at_MethodDeclares; 0)
	ARRAY TEXT:C222($_at_MethodNames; 0)
	ARRAY TEXT:C222($_at_MethodPaths; 0)
	ARRAY TEXT:C222($_at_ParameterValue; 0)
	ARRAY TEXT:C222($_at_PLugInName; 0)
	C_BOOLEAN:C305($_bo_AmendmentsFound; $_Bo_AutoMany; $_Bo_AutoOne; $_bo_CreatedDateFound; $_bo_CreatorFound; $_bo_DeclarationsFound; $_bo_DescriptionFound; $_bo_Exit; $_bo_Ignore; $_bo_InsertCHanges; $_Bo_Invisible)
	C_BOOLEAN:C305($_Bo_Mandatory; $_bo_MergeHeaders; $_bo_NameFound; $_Bo_ndex; $_bo_noModifications; $_Bo_NonEnterable; $_Bo_NonModifiable; $_bo_NotComment; $_bo_Nul; $_bo_ParametersFound; $_bo_RevisionsFound)
	C_BOOLEAN:C305($_Bo_TrigDel; $_Bo_trigSave; $_Bo_trigSaveNew; $_Bo_Unique)
	C_DATE:C307($_Dte_ModificationDate)
	C_LONGINT:C283($_l_Build; $_l_CHar; $_l_CheckifComment; $_l_CHeckIgnore; $_l_ChoiceField; $_l_CurrentForm; $_l_CurrentFormNumber; $_l_CurrentTable; $_l_EndofLine; $_l_EndofLine2; $_l_FieldLength)
	C_LONGINT:C283($_l_FieldType; $_l_GetItems; $_l_Headers; $_l_Index; $_l_Index2; $_l_Index3; $_l_Index4; $_l_IsFieldValid; $_l_isTableNul; $_l_isTableValid; $_l_lastFieldNumber)
	C_LONGINT:C283($_l_LastLine; $_l_LastTableNumber; $_l_Length; $_l_Next; $_l_OneField; $_l_OneTable; $_l_ParseType; $_l_Platformproperties; $_l_Position; $_l_Position2; $_l_PositionCompiler1)
	C_LONGINT:C283($_l_PositionHeaderStart; $_l_Ref; $_l_SequenceConstant; $_l_SequenceNumber; $_l_SizeofArray)
	C_OBJECT:C1216($_Obj_Components; $_Obj_DatabaseParameters; $_Obj_FieldProperties; $_Obj_Fields; $_Obj_Localization; $_Obj_PlugIns; $_Obj_Structure; $_Obj_TableProperties; $CORE_ob_FormObject)
	C_POINTER:C301($_Ptr_ptrTablePointer)
	C_TEXT:C284($_t_After; $_t_Amendments; $_t_before; $_t_beforeAmend; $_t_BeforeCreator; $_t_BeforeEnd; $_t_BeforeHeader; $_t_BeforeMethod; $_t_Creator; $_t_DateCreated; $_t_DateModified)
	C_TEXT:C284($_t_DateTime; $_t_Delcarations; $_t_Description; $_t_Header; $_t_Ignore; $_t_LastLine; $_T_MethodAfter; $_T_MethodBefore; $_T_MethodBeforeEND; $_t_MethodName; $_t_MethodNameStripped)
	C_TEXT:C284($_t_MethodText; $_t_MethodTextOLD; $_t_Modifier; $_t_Name; $_t_newBit; $_t_NewHeader; $_t_NewMethodOLD; $_t_NewMethodText; $_t_Notes; $_t_OldMethodText; $_t_Parameters)
	C_TEXT:C284($_t_PrependBefore; $_t_Revisions; $_t_StoreBefore; $_t_TableName; $_t_ThisLine; $_Txt_CurrentDatabaseLocalizatio; $_Txt_DefaultDatabaseLocalizatio; $_txt_FieldName; $_Txt_InternalDatabaseLocalizati; $_Txt_ListName; $_txt_ReturnValue)
	C_TEXT:C284($_txt_TableName; $_Txt_tableNul; $_Txt_UserDatabaseLocalization; CORE_T_ParseFormName)
	C_TIME:C306($_ti_ModificationTime)
End if 
//Code Starts Here
$_l_ParseType:=1
ARRAY TEXT:C222($_at_IgnoreMethods; 0)
//HERE PUT ADD TO THE ABOVE ARRAY METHODS OR METHOD PREFIXES YOU WANT IGNORED FROM INSERTION OF HEADER AND TRACKING.
APPEND TO ARRAY:C911($_at_IgnoreMethods; "CORE_*")
APPEND TO ARRAY:C911($_at_IgnoreMethods; "CODE_*")
APPEND TO ARRAY:C911($_at_IgnoreMethods; "JUNK*")
APPEND TO ARRAY:C911($_at_IgnoreMethods; "COMPILER_*")
APPEND TO ARRAY:C911($_at_IgnoreMethods; "error*")
APPEND TO ARRAY:C911($_at_IgnoreMethods; "ERR_*")
APPEND TO ARRAY:C911($_at_IgnoreMethods; "AA_JUNK*")
APPEND TO ARRAY:C911($_at_IgnoreMethods; "DIFFu_*")
APPEND TO ARRAY:C911($_at_IgnoreMethods; "DB_FIXMETHODS2019*")


//TRACE


//CODE_ManagerStructureExport (2;True)  //Makes sure the latest version of all Forms is exported
ARRAY TEXT:C222($_at_AllArrayNames; 0)
ARRAY LONGINT:C221($_al_AllArrayTypes; 0)
ARRAY TEXT:C222($_at_AllVarNames; 0)
ARRAY LONGINT:C221($_al_all_VarTypes; 0)
ARRAY TEXT:C222($_at_MethodDeclares; 0)
ARRAY TEXT:C222($_at_MethodNames; 0)
ARRAY LONGINT:C221($_al_DeclareType; 0)

If (True:C214)
	ARRAY TEXT:C222($_at_MethodPaths; 0)
	METHOD GET PATHS:C1163(Path database method:K72:2; $_at_MethodPaths)
	For ($_l_Index; 1; Size of array:C274($_at_MethodPaths))
		//So here we are going to get the method text
		$_t_MethodName:=$_at_MethodPaths{$_l_Index}
		$_bo_Ignore:=False:C215
		
		For ($_l_CHeckIgnore; 1; Size of array:C274($_at_IgnoreMethods))
			If (Position:C15("*"; $_at_IgnoreMethods{$_l_CHeckIgnore})>0)
				$_t_Ignore:=Replace string:C233($_at_IgnoreMethods{$_l_CHeckIgnore}; "*"; "")
				If ($_t_MethodName=($_t_Ignore+"@"))
					$_bo_Ignore:=True:C214
				End if 
			Else 
				If ($_t_MethodName=$_at_IgnoreMethods{$_l_CHeckIgnore})
					$_bo_Ignore:=True:C214
				End if 
			End if 
		End for 
		If (Not:C34($_bo_Ignore))
			$_t_MethodName:=$_at_MethodPaths{$_l_Index}
			METHOD GET MODIFICATION DATE:C1170($_t_MethodName; $_Dte_ModificationDate; $_ti_ModificationTime; *)
			METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
			$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
			If ($_l_Position>0)
				$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
				For ($_l_Position; 1; Length:C16($_t_MethodText))
					If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
						If (Length:C16($_t_methodText)>$_l_Position)
							$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
						Else 
							$_t_MethodText:=""
						End if 
						$_l_Position:=Length:C16($_t_MethodText)*2
					End if 
				End for 
			End if 
			$_t_MethodTextOLD:=$_t_MethodText
			$_bo_Exit:=False:C215
			Repeat 
				If ($_t_MethodText#"")
					If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
						$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
					Else 
						$_bo_Exit:=True:C214
					End if 
				End if 
			Until ($_bo_Exit) | ($_t_MethodText="")
			
			If ($_t_MethodText#"")
				$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
				Case of 
					: ($_l_Position=0)  //there is no new header
						//take out the old header save then put the new header text in
						$_l_Position:=Position:C15("//Creator: "; $_t_MethodText)
						
						
						If ($_l_Position>0)
							$_t_OldMethodText:=$_t_MethodText
							$_t_BeforeCreator:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
							$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
							$_l_Position:=Position:C15("Amendments"; $_t_MethodText)
							If ($_l_Position>0)
								$_t_beforeAmend:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
								$_l_Position:=Position:C15("END IF"; $_t_MethodText)
								$_t_PrependBefore:=""
								Repeat 
									
									$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
									For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
										Case of 
											: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
												//this is a commented out line
												//so get the next end if
												$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
												$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
												$_l_CheckifComment:=0
											: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
												//this is not a comment
												$_l_CheckifComment:=0
												$_bo_NotComment:=True:C214
											: ($_l_CheckifComment=1)
												$_l_CheckifComment:=0
												$_bo_NotComment:=True:C214
										End case 
									End for 
									$_l_Position:=Position:C15("END IF"; $_t_MethodText)
								Until ($_bo_NotComment)
								If ($_t_PrependBefore#"")
									$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
								End if 
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
								$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
								$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
								If ($_l_PositionHeaderStart>0)
									$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
									$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
									ARRAY TEXT:C222($_at_HeaderLines; 0)
									Repeat 
										$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
										If ($_l_Position>0)
											APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
											$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
											
										Else 
											APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
											$_t_Header:=""
										End if 
									Until ($_l_Position=0)
									ARRAY TEXT:C222($_at_HeaderItems; 0)
									ARRAY TEXT:C222($_at_HeaderDatas; 0)
									DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
									$_bo_MergeHeaders:=True:C214
									////TRACE
									If ($_t_MethodTextOLD#$_t_MethodText)
										If ($_t_MethodText#"")
											METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
										End if 
										If ($_t_MethodText#"")
											EXECUTE METHOD:C1007("DIFFu_DBCodemanager"; *; $_t_MethodName; Path project method:K72:1; True:C214)
											
										End if 
										//Now re-get the method code
										METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
										$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
										If ($_l_Position>0)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
											For ($_l_Position; 1; Length:C16($_t_MethodText))
												If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
													If (Length:C16($_t_methodText)>$_l_Position)
														$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
													Else 
														$_t_MethodText:=""
													End if 
													$_l_Position:=999999
												End if 
											End for 
										End if 
										$_t_MethodTextOLD:=$_t_MethodText
										$_bo_Exit:=False:C215
										Repeat 
											If ($_t_MethodText#"")
												If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
													$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
												Else 
													$_bo_Exit:=True:C214
												End if 
											End if 
										Until ($_bo_Exit) | ($_t_MethodText="")
										
									End if 
									//now the new header should be here
									$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
									If ($_l_Position>0)
										$_bo_MergeHeaders:=True:C214
										$_t_NewHeader:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16(" //Code Starts Here"))
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" //Code Starts Here")+1)
										If ($_bo_MergeHeaders)
											$_l_Position:=Position:C15("//Variable Declarations"; $_t_NewHeader)
											If ($_l_Position>0)
												$_t_newBit:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
												$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
												ARRAY TEXT:C222($_at_HeaderLines2; 0)
												Repeat 
													$_l_Position:=Position:C15(Char:C90(13); $_t_newBit)
													If ($_l_Position>0)
														APPEND TO ARRAY:C911($_at_HeaderLines2; Substring:C12($_t_newBit; 1; $_l_Position-1))
														$_t_newBit:=Substring:C12($_t_newBit; $_l_Position+1)
														
													Else 
														APPEND TO ARRAY:C911($_at_HeaderLines2; $_t_newBit)
														$_t_newBit:=""
													End if 
												Until ($_l_Position=0)
												////TRACE
												$_bo_MergeHeaders:=True:C214
												ARRAY TEXT:C222($_at_HeaderItems2; 0)
												ARRAY TEXT:C222($_at_HeaderDatas2; 0)
												DB_FixMethods2019GetHeader("NEW"; ->$_at_HeaderLines2; ->$_at_HeaderItems2; ->$_at_HeaderDatas2)
												For ($_l_Build; 1; Size of array:C274($_at_HeaderItems2))
													Case of 
														: ($_at_HeaderItems2{$_l_Build}="Creator")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Creator")
															If ($_l_Position>0)
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
														: ($_at_HeaderItems2{$_l_Build}="Created Date")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Created Date")
															If ($_l_Position>0)
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
														: ($_at_HeaderItems2{$_l_Build}="Name")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Method Name")
															If ($_l_Position>0)
																If ($_at_HeaderDatas2{$_l_Build}="")
																	$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																End if 
															End if 
														: ($_at_HeaderItems2{$_l_Build}="Description")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Description")
															If ($_l_Position>0)
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
														: ($_at_HeaderItems2{$_l_Build}="Modified Date")
														: ($_at_HeaderItems2{$_l_Build}="Modified By")
														: ($_at_HeaderItems2{$_l_Build}="Modified Notes")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Amendments")
															If ($_l_Position>0)
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
													End case 
												End for 
												$_t_NewBit:="IF(FALSE)"+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Name")
												$_t_Name:=""
												$_t_Description:=""
												$_t_Revisions:=""
												If ($_l_Ref>0)
													$_t_Name:=$_at_HeaderDatas2{$_l_Ref}
												Else 
													$_t_Name:=$_t_MethodName
												End if 
												$_t_NewBit:=$_t_NewBit+"//Database Method Name: "+$_t_Name+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Description")
												If ($_l_Ref>0)
													$_t_Description:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												For ($_l_Index; 1; 10)
													$_t_Description:=Replace string:C233($_t_Description; Char:C90(13)+Char:C90(13); Char:C90(13))
												End for 
												If ($_t_Description#"")
													$_l_Length:=Length:C16($_t_Description)
													If ($_t_Description[[Length:C16($_t_Description)]]=Char:C90(13))
														$_t_Description:=Substring:C12($_t_Description; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//------------------ Method Notes ------------------"+$_t_Description+Char:C90(13)
												$_t_NewBit:=$_t_NewBit+"//------------------ Revision Control ----------------"+Char:C90(13)
												$_t_DateCreated:=""
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Created Date")
												If ($_l_Ref>0)
													$_t_DateCreated:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												If ($_t_DateCreated#"")
													$_l_Length:=Length:C16($_t_DateCreated)
													If ($_t_DateCreated[[Length:C16($_t_DateCreated)]]=Char:C90(13))
														$_t_DateCreated:=Substring:C12($_t_DateCreated; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Date Created: "+$_t_DateCreated+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Creator")
												$_t_Creator:=""
												If ($_l_Ref>0)
													$_t_Creator:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												If ($_t_Creator#"")
													$_l_Length:=Length:C16($_t_Creator)
													If ($_t_Creator[[Length:C16($_t_Creator)]]=Char:C90(13))
														$_t_Creator:=Substring:C12($_t_Creator; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Created BY: "+$_t_Creator+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Date")
												$_t_DateModified:=""
												If ($_l_Ref>0)
													$_t_DateModified:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												If ($_t_DateModified#"")
													$_l_Length:=Length:C16($_t_DateModified)
													If ($_t_DateModified[[Length:C16($_t_DateModified)]]=Char:C90(13))
														$_t_DateModified:=Substring:C12($_t_DateModified; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Date Modified: "+$_t_DateModified+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified By")
												$_t_Modifier:=""
												If ($_l_Ref>0)
													$_t_Modifier:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												If ($_t_Modifier#"")
													$_l_Length:=Length:C16($_t_Modifier)
													If ($_t_Modifier[[Length:C16($_t_Modifier)]]=Char:C90(13))
														$_t_Modifier:=Substring:C12($_t_Modifier; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Modified By "+$_t_Modifier+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Notes")
												$_t_Notes:=""
												If ($_l_Ref>0)
													$_t_Notes:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												For ($_l_Index; 1; 10)
													$_t_Notes:=Replace string:C233($_t_Notes; Char:C90(13)+Char:C90(13); Char:C90(13))
												End for 
												If ($_t_Notes#"")
													$_l_Length:=Length:C16($_t_Notes)
													If ($_t_Notes[[Length:C16($_t_Notes)]]=Char:C90(13))
														$_t_Notes:=Substring:C12($_t_Notes; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Modification notes "+Char:C90(13)
												$_t_NewBit:=$_t_NewBit+$_t_Notes+Char:C90(13)
												$_t_NewBit:=$_t_NewBit+"END IF"+Char:C90(13)
												$_t_NewMethodText:=$_t_NewBit+Char:C90(13)+$_t_NewHeader+$_t_MethodText
												If ($_t_MethodTextOLD#$_t_NewMethodText)
													METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
												End if 
												
											Else 
												//TRACE
											End if 
										End if 
										$_bo_MergeHeaders:=False:C215
										
									Else 
										//TRACE
									End if 
								Else 
									//this would be strange
									//TRACE
									
								End if 
							Else 
								//this would be strange
								//TRACE
							End if 
						Else 
							If ($_t_MethodTextOLD#$_t_MethodText)
								METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
							End if 
							If ($_t_MethodText#"")
								EXECUTE METHOD:C1007("DIFFu_DBCodemanager"; *; $_t_MethodName; Path project method:K72:1; True:C214)
								
								$_l_Index:=$_l_Index-1
							End if 
							////TRACE
						End if 
					: ($_l_Position>0)
						//find the old header-if it is there and replace it.
						$_l_PositionCompiler1:=Position:C15("//Variable Declarations"; $_t_MethodText)
						$_t_Delcarations:=Substring:C12($_t_MethodText; $_l_PositionCompiler1; $_l_Position)
						DB_FixMethodDeclarations2020($_t_MethodName; $_t_Delcarations; ->$_at_AllArrayNames; ->$_al_AllArrayTypes; ->$_at_AllVarNames; ->$_al_all_VarTypes; ->$_at_MethodDeclares; ->$_at_MethodNames; ->$_al_DeclareType)
						
						$_t_NewHeader:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16(" //Code Starts Here"))
						$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" //Code Starts Here")+1)
						//now we have 3 possible outcomes
						//1)there is no old header-do nothing-its a new method
						//2) there is an old header on the remaing text-this will the normal
						//3) i have extracted the header already and stuck into the new header
						///
						$_l_Position:=Position:C15("//Creator: "; $_t_MethodText)
						$_bo_MergeHeaders:=False:C215
						
						If ($_l_Position>0)  //this is scenario 1.. we want to take out the old header
							
							$_t_BeforeCreator:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
							$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
							$_l_Position:=Position:C15("Amendments"; $_t_MethodText)
							If ($_l_Position>0)
								$_t_beforeAmend:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
								$_l_Position:=Position:C15("END IF"; $_t_MethodText)
								$_t_PrependBefore:=""
								Repeat 
									
									$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
									For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
										Case of 
											: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
												//this is a commented out line
												//so get the next end if
												$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
												$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
												$_l_CheckifComment:=0
											: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
												//this is not a comment
												$_l_CheckifComment:=0
												$_bo_NotComment:=True:C214
											: ($_l_CheckifComment=1)
												$_l_CheckifComment:=0
												$_bo_NotComment:=True:C214
										End case 
									End for 
									$_l_Position:=Position:C15("END IF"; $_t_MethodText)
								Until ($_bo_NotComment)
								If ($_t_PrependBefore#"")
									$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
								End if 
								
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
								$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
								$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
								If ($_l_PositionHeaderStart>0)
									$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
									$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
									ARRAY TEXT:C222($_at_HeaderLines; 0)
									Repeat 
										$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
										If ($_l_Position>0)
											APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
											$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
											
										Else 
											APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
											$_t_Header:=""
										End if 
									Until ($_l_Position=0)
									ARRAY TEXT:C222($_at_HeaderItems; 0)
									ARRAY TEXT:C222($_at_HeaderDatas; 0)
									DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
									
									$_bo_MergeHeaders:=True:C214
									$_t_NewMethodText:=$_t_NewHeader+$_t_MethodText
									If ($_t_MethodTextOLD#$_t_NewMethodText)
										METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
									End if 
									
									
									
									
									
									
								Else 
									//this would be strange
									//TRACE
									
								End if 
							Else 
								//this would be strange
								//TRACE
							End if 
						Else 
							//there is no old header in the text
							//we now want to look for the old header in the new header..
							///
							$_l_Position:=Position:C15("//Creator: "; $_t_NewHeader)
							
							
							If ($_l_Position>0)
								$_t_BeforeCreator:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
								$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
								$_l_Position:=Position:C15("Amendments"; $_t_NewHeader)
								If ($_l_Position>0)
									$_t_beforeAmend:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
									$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
									$_l_Position:=Position:C15("END IF"; $_t_NewHeader)
									$_t_PrependBefore:=""
									Repeat 
										
										$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
										For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
											Case of 
												: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
													//this is a commented out line
													//so get the next end if
													$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
													$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
													$_l_CheckifComment:=0
												: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
													//this is not a comment
													$_l_CheckifComment:=0
													$_bo_NotComment:=True:C214
												: ($_l_CheckifComment=1)
													$_l_CheckifComment:=0
													$_bo_NotComment:=True:C214
											End case 
										End for 
										$_l_Position:=Position:C15("END IF"; $_t_MethodText)
									Until ($_bo_NotComment)
									If ($_t_PrependBefore#"")
										$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
									End if 
									$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position+Length:C16("END IF")+1)
									$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
									
									$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
									If ($_l_PositionHeaderStart>0)
										$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
										$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
										ARRAY TEXT:C222($_at_HeaderLines; 0)
										Repeat 
											$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
											If ($_l_Position>0)
												APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
												$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
												
											Else 
												APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
												$_t_Header:=""
											End if 
										Until ($_l_Position=0)
										ARRAY TEXT:C222($_at_HeaderItems; 0)
										ARRAY TEXT:C222($_at_HeaderDatas; 0)
										DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
										$_bo_MergeHeaders:=True:C214
										
										//METHOD SET CODE($_t_MethodName;$_t_MethodText)
										//Now re-get the method code
										//METHOD GET CODE($_t_MethodName;$_t_MethodText)
										
										
									Else 
										//this would be strange
										//TRACE
										
									End if 
								Else 
									//this would be strange
									//TRACE
								End if 
							Else 
								////TRACE
							End if 
							
							///
						End if 
						//now extract the data from the important bit of the new header
						If ($_bo_MergeHeaders)
							$_l_Position:=Position:C15("//Variable Declarations"; $_t_NewHeader)
							If ($_l_Position>0)
								$_t_newBit:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
								$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
								ARRAY TEXT:C222($_at_HeaderLines2; 0)
								Repeat 
									$_l_Position:=Position:C15(Char:C90(13); $_t_newBit)
									If ($_l_Position>0)
										APPEND TO ARRAY:C911($_at_HeaderLines2; Substring:C12($_t_newBit; 1; $_l_Position-1))
										$_t_newBit:=Substring:C12($_t_newBit; $_l_Position+1)
										
									Else 
										APPEND TO ARRAY:C911($_at_HeaderLines2; $_t_newBit)
										$_t_newBit:=""
									End if 
								Until ($_l_Position=0)
								
								$_bo_MergeHeaders:=True:C214
								ARRAY TEXT:C222($_at_HeaderItems2; 0)
								ARRAY TEXT:C222($_at_HeaderDatas2; 0)
								DB_FixMethods2019GetHeader("NEW"; ->$_at_HeaderLines2; ->$_at_HeaderItems2; ->$_at_HeaderDatas2)
								For ($_l_Build; 1; Size of array:C274($_at_HeaderItems2))
									Case of 
										: ($_at_HeaderItems2{$_l_Build}="Creator")
											$_l_Position:=Find in array:C230($_at_HeaderItems; "Creator")
											If ($_l_Position>0)
												$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
											End if 
										: ($_at_HeaderItems2{$_l_Build}="Created Date")
											$_l_Position:=Find in array:C230($_at_HeaderItems; "Created Date")
											If ($_l_Position>0)
												$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
											End if 
										: ($_at_HeaderItems2{$_l_Build}="Name")
											$_l_Position:=Find in array:C230($_at_HeaderItems; "Method Name")
											If ($_l_Position>0)
												If ($_at_HeaderDatas2{$_l_Build}="")
													$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
												End if 
											End if 
										: ($_at_HeaderItems2{$_l_Build}="Description")
											$_l_Position:=Find in array:C230($_at_HeaderItems; "Description")
											If ($_l_Position>0)
												$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
											End if 
										: ($_at_HeaderItems2{$_l_Build}="Modified Date")
										: ($_at_HeaderItems2{$_l_Build}="Modified By")
										: ($_at_HeaderItems2{$_l_Build}="Modified Notes")
											$_l_Position:=Find in array:C230($_at_HeaderItems; "Amendments")
											If ($_l_Position>0)
												$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
											End if 
									End case 
								End for 
								$_t_NewBit:="IF(FALSE)"+Char:C90(13)
								$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Name")
								$_t_Name:=""
								$_t_Description:=""
								$_t_Revisions:=""
								
								If ($_l_Ref>0)
									$_t_Name:=$_at_HeaderDatas2{$_l_Ref}
								Else 
									$_t_Name:=$_t_MethodName
								End if 
								
								$_t_NewBit:=$_t_NewBit+"//Database Method Name: "+$_t_Name+Char:C90(13)
								$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Description")
								If ($_l_Ref>0)
									$_t_Description:=$_at_HeaderDatas2{$_l_Ref}
								End if 
								For ($_l_Index; 1; 10)
									$_t_Description:=Replace string:C233($_t_Description; Char:C90(13)+Char:C90(13); Char:C90(13))
								End for 
								If ($_t_Description#"")
									$_l_Length:=Length:C16($_t_Description)
									If ($_t_Description[[Length:C16($_t_Description)]]=Char:C90(13))
										$_t_Description:=Substring:C12($_t_Description; 1; $_l_Length-1)
									End if 
								End if 
								$_t_NewBit:=$_t_NewBit+"//------------------ Method Notes ------------------"+$_t_Description+Char:C90(13)
								$_t_NewBit:=$_t_NewBit+"//------------------ Revision Control ----------------"+Char:C90(13)
								$_t_DateCreated:=""
								$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Created Date")
								If ($_l_Ref>0)
									$_t_DateCreated:=$_at_HeaderDatas2{$_l_Ref}
								End if 
								If ($_t_DateCreated#"")
									$_l_Length:=Length:C16($_t_DateCreated)
									If ($_t_DateCreated[[Length:C16($_t_DateCreated)]]=Char:C90(13))
										$_t_DateCreated:=Substring:C12($_t_DateCreated; 1; $_l_Length-1)
									End if 
								End if 
								$_t_NewBit:=$_t_NewBit+"//Date Created: "+$_t_DateCreated+Char:C90(13)
								$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Creator")
								$_t_Creator:=""
								If ($_l_Ref>0)
									$_t_Creator:=$_at_HeaderDatas2{$_l_Ref}
								End if 
								If ($_t_Creator#"")
									$_l_Length:=Length:C16($_t_Creator)
									If ($_t_Creator[[Length:C16($_t_Creator)]]=Char:C90(13))
										$_t_Creator:=Substring:C12($_t_Creator; 1; $_l_Length-1)
									End if 
								End if 
								$_t_NewBit:=$_t_NewBit+"//Created BY: "+$_t_Creator+Char:C90(13)
								$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Date")
								$_t_DateModified:=""
								If ($_l_Ref>0)
									$_t_DateModified:=$_at_HeaderDatas2{$_l_Ref}
								End if 
								If ($_t_DateModified#"")
									$_l_Length:=Length:C16($_t_DateModified)
									If ($_t_DateModified[[Length:C16($_t_DateModified)]]=Char:C90(13))
										$_t_DateModified:=Substring:C12($_t_DateModified; 1; $_l_Length-1)
									End if 
								End if 
								$_t_NewBit:=$_t_NewBit+"//Date Modified: "+$_t_DateModified+Char:C90(13)
								$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified By")
								$_t_Modifier:=""
								If ($_l_Ref>0)
									$_t_Modifier:=$_at_HeaderDatas2{$_l_Ref}
								End if 
								If ($_t_Modifier#"")
									$_l_Length:=Length:C16($_t_Modifier)
									If ($_t_Modifier[[Length:C16($_t_Modifier)]]=Char:C90(13))
										$_t_Modifier:=Substring:C12($_t_Modifier; 1; $_l_Length-1)
									End if 
								End if 
								$_t_NewBit:=$_t_NewBit+"//Modified By "+$_t_Modifier+Char:C90(13)
								$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Notes")
								$_t_Notes:=""
								If ($_l_Ref>0)
									$_t_Notes:=$_at_HeaderDatas2{$_l_Ref}
								End if 
								For ($_l_Index; 1; 10)
									$_t_Notes:=Replace string:C233($_t_Notes; Char:C90(13)+Char:C90(13); Char:C90(13))
								End for 
								If ($_t_Notes#"")
									$_l_Length:=Length:C16($_t_Notes)
									If ($_t_Notes[[Length:C16($_t_Notes)]]=Char:C90(13))
										$_t_Notes:=Substring:C12($_t_Notes; 1; $_l_Length-1)
									End if 
								End if 
								$_t_NewBit:=$_t_NewBit+"//Modification notes "+Char:C90(13)
								$_t_NewBit:=$_t_NewBit+$_t_Notes+Char:C90(13)
								$_t_NewBit:=$_t_NewBit+"END IF"+Char:C90(13)
								$_t_NewMethodText:=$_t_NewBit+Char:C90(13)+$_t_NewHeader+$_t_MethodText
								If ($_t_MethodTextOLD#$_t_NewMethodText)
									METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
								End if 
							Else 
								//TRACE
							End if 
						End if 
						$_bo_MergeHeaders:=False:C215
				End case 
				METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
				$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
				If ($_l_Position>0)
					$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
					For ($_l_Position; 1; Length:C16($_t_MethodText))
						If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
							If (Length:C16($_t_methodText)>$_l_Position)
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
							Else 
								$_t_MethodText:=""
							End if 
							$_l_Position:=999999
						End if 
					End for 
				End if 
				$_t_MethodTextOLD:=$_t_MethodText
				$_bo_Exit:=False:C215
				Repeat 
					If ($_t_MethodText#"")
						If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
							$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
						Else 
							$_bo_Exit:=True:C214
						End if 
					End if 
				Until ($_bo_Exit) | ($_t_MethodText="")
				
				
				
				$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
				If ($_l_Position>0)  //it would be odd iff it is not here
					$_t_Header:=Substring:C12($_t_MethodText; 1; $_l_Position)
					//$_t_MethodText:=Substring($_t_MethodText;$_l_Position+1)
					If (Length:C16($_t_methodText)>$_l_Position)
						$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
					Else 
						$_t_MethodText:=""
					End if 
					
					$_t_NewMethodText:=""
					Repeat 
						$_l_EndofLine:=Position:C15(Char:C90(13); $_t_MethodText)
						If ($_l_EndofLine>0)
							$_t_ThisLine:=Substring:C12($_t_MethodText; 1; $_l_EndofLine-1)
							$_t_MethodText:=Substring:C12($_t_MethodText; $_l_EndofLine+1)
						Else 
							$_t_ThisLine:=$_t_MethodText
							$_t_MethodText:=""
						End if 
						$_bo_Exit:=False:C215
						Repeat 
							If ($_t_ThisLine#"")
								If ($_t_ThisLine[[1]]=Char:C90(9)) | ($_t_ThisLine[[1]]=" ")
									$_t_ThisLine:=Substring:C12($_t_ThisLine; 2)
								Else 
									$_bo_Exit:=True:C214
								End if 
							End if 
						Until ($_t_ThisLine="") | ($_bo_Exit)
						Case of 
							: ($_t_ThisLine="C_String@")
							: ($_t_ThisLine="_o_C_String@")
							: ($_t_ThisLine="C_Text@")
							: ($_t_ThisLine="C_Longint@")
							: ($_t_ThisLine="_o_C_integer@")
							: ($_t_ThisLine="C_OBJECT@")
							: ($_t_ThisLine="C_BOOLEAN@")
							: ($_t_ThisLine="C_TIME@")
							: ($_t_ThisLine="C_BLOB@")
							: ($_t_ThisLine="C_Date@")
							: ($_t_ThisLine="C_picture@")
							: ($_t_ThisLine="C_pointer@")
							: ($_t_ThisLine="C_Real@")
							: ($_t_ThisLine="C_picture@")
								
							Else 
								$_t_NewMethodText:=$_t_NewMethodText+Char:C90(13)+$_t_ThisLine
								
						End case 
						
					Until ($_t_MethodText="")
					For ($_l_Index; 1; 20)
						$_t_Header:=Replace string:C233($_t_Header; Char:C90(13)+Char:C90(13); Char:C90(13))
					End for 
					$_t_NewMethodText:=$_t_Header+$_t_NewMethodText
					For ($_l_Index; 1; 20)
						$_t_NewMethodText:=Replace string:C233($_t_NewMethodText; Char:C90(13)+Char:C90(13)+"  //Code Starts Here"; Char:C90(13)+"  //Code Starts Here")
					End for 
					If ($_t_MethodTextOLD#$_t_NewMethodText)
						METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
					End if 
					
				End if 
				METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
				$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
				If ($_l_Position>0)
					$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
					For ($_l_Position; 1; Length:C16($_t_MethodText))
						If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
							If (Length:C16($_t_methodText)>$_l_Position)
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
							Else 
								$_t_MethodText:=""
							End if 
							$_l_Position:=Length:C16($_t_MethodText)*2
						End if 
					End for 
				End if 
				$_bo_InsertCHanges:=False:C215
				If (False:C215)
					$_l_Position:=Position:C15("$_t_oldMethodName:=ERR_MethodTracker"; $_t_MethodText)
					If ($_l_Position>0)
						$_t_before:=Substring:C12($_t_MethodText; $_l_Position-1)
						$_t_After:=Substring:C12($_t_MethodText; $_l_Position)
						For ($_l_EndofLine; 1; Length:C16($_t_After))
							If ($_t_After[[$_l_EndofLine]]=Char:C90(10)) | ($_t_After[[$_l_EndofLine]]=Char:C90(13))
								$_t_ThisLine:=Substring:C12($_t_After; 1; $_l_EndofLine-1)
								$_l_EndofLine2:=Length:C16($_t_After)
								$_t_After:=Substring:C12($_t_After; $_l_EndofLine+1)
								$_l_EndofLine:=$_l_EndofLine2
								$_l_position2:=Position:C15($_t_ThisLine; $_t_After)
								If ($_l_position2>0)
									$_t_After:=Replace string:C233($_t_After; $_t_ThisLine; "")
									$_t_MethodText:=$_t_before+$_t_ThisLine+Char:C90(13)+$_t_After
									$_bo_InsertCHanges:=True:C214
								End if 
							End if 
						End for 
					End if 
				End if 
				Repeat 
					$_l_Position:=Position:C15("_O_ENABLE BUTTON"; $_t_MethodText)
					If ($_l_Position>0)
						
						$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
						$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_ENABLE BUTTON"))
						//We need to now find the end of the line(")"
						$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
						If ($_l_Position2>0)
							$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
							$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
							$_t_ThisLIne:="Object Set Enabled"+$_t_ThisLIne+";TRUE)"
							$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
							$_bo_InsertCHanges:=False:C215
						End if 
					End if 
				Until ($_l_Position=0)
				Repeat 
					$_l_Position:=Position:C15("_O_DISABLE BUTTON"; $_t_MethodText)
					If ($_l_Position>0)
						
						$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
						$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_DISABLE BUTTON"))
						//We need to now find the end of the line(")"
						$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
						If ($_l_Position2>0)
							$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
							$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
							$_t_ThisLIne:="Object Set Enabled"+$_t_ThisLIne+";FALSE)"
							$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
							$_bo_InsertCHanges:=False:C215
						End if 
					End if 
				Until ($_l_Position=0)
				//_o_REDRAW LIST
				$_t_StoreBefore:=""
				Repeat 
					$_l_Position:=Position:C15("_o_REDRAW LIST"; $_t_MethodText)
					If ($_l_Position>0)
						//TRACE
						$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
						$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_o_REDRAW LIST"))
						//We need to now find the end of the line(")"
						$_t_BeforeEnd:=Substring:C12($_T_MethodBefore; Length:C16($_T_MethodBefore)-2)
						If ($_t_BeforeEnd#"//")
							$_t_StoreBefore:=$_t_StoreBefore+$_T_MethodBefore+"//_o_REDRAW LIST"
							$_t_MethodText:=$_T_MethodAfter
							$_bo_InsertCHanges:=True:C214
						Else 
							$_t_StoreBefore:=$_t_StoreBefore+$_T_MethodBefore+"_o_REDRAW LIST"
							$_t_MethodText:=$_T_MethodAfter
							//dont change the flag
						End if 
					End if 
				Until ($_l_Position=0)
				If ($_t_StoreBefore#"")
					$_t_MethodText:=$_t_StoreBefore+$_t_MethodText
				End if   //_O_C_STRING(20;$SD_S20_DiaryResultCode)
				Repeat 
					$_l_Position:=Position:C15("_O_C_STRING"; $_t_MethodText)
					If ($_l_Position>0)
						
						$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
						$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_C_STRING"))
						//We need to now find the end of the line(")"
						$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
						If ($_l_Position2>0)
							$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
							$_l_Position:=Position:C15(";"; $_t_ThisLIne)
							$_t_ThisLIne:=Substring:C12($_t_ThisLIne; $_l_Position+1)
							$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
							$_t_ThisLIne:="C_TEXT("+$_t_ThisLIne+")"
							$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
							$_bo_InsertCHanges:=True:C214
						End if 
					End if 
				Until ($_l_Position=0)
				
				//
				Repeat 
					$_l_Position:=Position:C15("_O_C_INTEGER"; $_t_MethodText)
					If ($_l_Position>0)
						
						
						$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
						$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_C_INTEGER"))
						//We need to now find the end of the line(")"
						$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
						If ($_l_Position2>0)
							$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
							$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
							$_t_ThisLIne:="C_LONGINT"+$_t_ThisLIne+")"
							$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
							$_bo_InsertCHanges:=False:C215
						End if 
					End if 
				Until ($_l_Position=0)
				
				//Array string(20;$SD_S20_DiaryResultCode)
				Repeat 
					$_l_Position:=Position:C15("_O_ARRAY STRING"; $_t_MethodText)
					If ($_l_Position>0)
						
						$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
						$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_ARRAY STRING"))
						//We need to now find the end of the line(")"
						$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
						If ($_l_Position2>0)
							$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
							$_l_Position:=Position:C15(";"; $_t_ThisLIne)
							$_t_ThisLIne:=Substring:C12($_t_ThisLIne; $_l_Position+1)
							$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
							$_t_ThisLIne:="ARRAY TEXT("+$_t_ThisLIne+")"
							$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
							$_bo_InsertCHanges:=True:C214
						End if 
					End if 
				Until ($_l_Position=0)
				
				
				$_l_Position:=Position:C15("//C_Unknown($_t"; $_t_MethodText)
				If ($_l_Position=0)
					$_l_Position:=Position:C15("//C_Unknown($_i"; $_t_MethodText)
					If ($_l_Position=0)
						$_l_Position:=Position:C15("//C_Unknown($_a"; $_t_MethodText)
						If ($_l_Position=0)
							$_l_Position:=Position:C15("//C_Unknown($_l"; $_t_MethodText)
						Else 
							$_l_Position:=Position:C15("//C_Unknown"; $_t_MethodText)
							
						End if 
					End if 
				End if 
				If ($_l_Position>0) | ($_bo_InsertCHanges)  //force a save
					$_t_MethodText:=$_t_MethodText+" "
					METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
				End if 
			End if 
		End if 
	End for 
	
	TRACE:C157
	ARRAY TEXT:C222($_at_MethodPaths; 0)
	METHOD GET PATHS:C1163(Path project method:K72:1; $_at_MethodPaths; *)
	SORT ARRAY:C229($_at_MethodPaths; >)
	$_l_SizeofArray:=Size of array:C274($_at_MethodPaths)
	For ($_l_Index; 1; $_l_SizeofArray)
		//So here we are going to get the method text
		
		$_t_MethodName:=$_at_MethodPaths{$_l_Index}
		MESSAGE:C88($_t_MethodName+" "+String:C10($_l_Index)+" of "+String:C10($_l_SizeofArray))
		
		$_bo_Ignore:=False:C215
		If ("AA_LoadListOfLists"=$_t_MethodName)
			//TRACE
		End if 
		////TRACE
		For ($_l_CHeckIgnore; 1; Size of array:C274($_at_IgnoreMethods))
			If (Position:C15("*"; $_at_IgnoreMethods{$_l_CHeckIgnore})>0)
				$_t_Ignore:=Replace string:C233($_at_IgnoreMethods{$_l_CHeckIgnore}; "*"; "")
				If ($_t_MethodName=($_t_Ignore+"@"))
					$_bo_Ignore:=True:C214
				End if 
			Else 
				If ($_t_MethodName=$_at_IgnoreMethods{$_l_CHeckIgnore})
					$_bo_Ignore:=True:C214
				End if 
			End if 
		End for 
		If (Not:C34($_bo_Ignore))
			$_t_MethodName:=$_at_MethodPaths{$_l_Index}
			METHOD GET MODIFICATION DATE:C1170($_t_MethodName; $_Dte_ModificationDate; $_ti_ModificationTime; *)
			METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
			$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
			If ($_l_Position>0)
				$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
				For ($_l_Position; 1; Length:C16($_t_MethodText))
					If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
						If (Length:C16($_t_methodText)>$_l_Position)
							$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
						Else 
							$_t_MethodText:=""
						End if 
						$_l_Position:=999999
					End if 
				End for 
			End if 
			$_t_MethodTextOLD:=$_t_MethodText
			$_bo_Exit:=False:C215
			Repeat 
				If ($_t_MethodText#"")
					If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
						$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
					Else 
						$_bo_Exit:=True:C214
					End if 
				End if 
			Until ($_bo_Exit) | ($_t_MethodText="")
			If ($_t_MethodText#"")
				$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
				Case of 
					: ($_l_Position=0)  //there is no new header
						//take out the old header save then put the new header text in
						$_l_Position:=Position:C15("//Creator: "; $_t_MethodText)
						
						
						If ($_l_Position>0)
							$_t_OldMethodText:=$_t_MethodText
							$_t_BeforeCreator:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
							$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
							$_l_Position:=Position:C15("Amendments"; $_t_MethodText)
							If ($_l_Position>0)
								$_t_beforeAmend:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
								$_l_Position:=Position:C15("END IF"; $_t_MethodText)
								$_t_PrependBefore:=""
								Repeat 
									
									$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
									For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
										Case of 
											: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
												//this is a commented out line
												//so get the next end if
												$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
												$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
												$_l_CheckifComment:=0
											: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
												//this is not a comment
												$_l_CheckifComment:=0
												$_bo_NotComment:=True:C214
											: ($_l_CheckifComment=1)
												$_l_CheckifComment:=0
												$_bo_NotComment:=True:C214
										End case 
									End for 
									$_l_Position:=Position:C15("END IF"; $_t_MethodText)
								Until ($_bo_NotComment)
								If ($_t_PrependBefore#"")
									$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
								End if 
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
								$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
								$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
								If ($_l_PositionHeaderStart>0)
									$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
									$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
									ARRAY TEXT:C222($_at_HeaderLines; 0)
									Repeat 
										$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
										If ($_l_Position>0)
											APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
											$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
											
										Else 
											APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
											$_t_Header:=""
										End if 
									Until ($_l_Position=0)
									ARRAY TEXT:C222($_at_HeaderItems; 0)
									ARRAY TEXT:C222($_at_HeaderDatas; 0)
									DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
									$_bo_MergeHeaders:=True:C214
									If ($_t_MethodTextOLD#$_t_MethodText)
										METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
										If ($_t_MethodText#"")
											//DIFFu_DBCodemanager ($_t_MethodName;Path project method;True)
											EXECUTE METHOD:C1007("DIFFu_DBCodemanager"; *; $_t_MethodName; Path project method:K72:1; True:C214)
											
										End if 
										//Now re-get the method code
										METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
										$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
										If ($_l_Position>0)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
											For ($_l_Position; 1; Length:C16($_t_MethodText))
												If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
													If (Length:C16($_t_methodText)>$_l_Position)
														$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
													Else 
														$_t_MethodText:=""
													End if 
													$_l_Position:=999999
												End if 
											End for 
										End if 
										$_t_MethodTextOLD:=$_t_MethodText
										$_bo_Exit:=False:C215
										Repeat 
											If ($_t_MethodText#"")
												If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
													$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
												Else 
													$_bo_Exit:=True:C214
												End if 
											End if 
										Until ($_bo_Exit) | ($_t_MethodText="")
										
										
									End if 
									//now the new header should be here
									$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
									If ($_l_Position>0)
										$_bo_MergeHeaders:=True:C214
										$_t_NewHeader:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16(" //Code Starts Here"))
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" //Code Starts Here")+1)
										If ($_bo_MergeHeaders)
											$_l_Position:=Position:C15("//Variable Declarations"; $_t_NewHeader)
											If ($_l_Position>0)
												$_t_newBit:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
												$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
												ARRAY TEXT:C222($_at_HeaderLines2; 0)
												Repeat 
													$_l_Position:=Position:C15(Char:C90(13); $_t_newBit)
													If ($_l_Position>0)
														APPEND TO ARRAY:C911($_at_HeaderLines2; Substring:C12($_t_newBit; 1; $_l_Position-1))
														$_t_newBit:=Substring:C12($_t_newBit; $_l_Position+1)
														
													Else 
														APPEND TO ARRAY:C911($_at_HeaderLines2; $_t_newBit)
														$_t_newBit:=""
													End if 
												Until ($_l_Position=0)
												
												$_bo_MergeHeaders:=True:C214
												ARRAY TEXT:C222($_at_HeaderItems2; 0)
												ARRAY TEXT:C222($_at_HeaderDatas2; 0)
												DB_FixMethods2019GetHeader("NEW"; ->$_at_HeaderLines2; ->$_at_HeaderItems2; ->$_at_HeaderDatas2)
												For ($_l_Build; 1; Size of array:C274($_at_HeaderItems2))
													Case of 
														: ($_at_HeaderItems2{$_l_Build}="Creator")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Creator")
															If ($_l_Position>0)
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
														: ($_at_HeaderItems2{$_l_Build}="Created Date")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Created Date")
															If ($_l_Position>0)
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
														: ($_at_HeaderItems2{$_l_Build}="Name")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Method Name")
															If ($_l_Position>0)
																If ($_at_HeaderDatas2{$_l_Build}="")
																	$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																End if 
															End if 
														: ($_at_HeaderItems2{$_l_Build}="Description")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Description")
															If ($_l_Position>0)
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
														: ($_at_HeaderItems2{$_l_Build}="Modified Date")
														: ($_at_HeaderItems2{$_l_Build}="Modified By")
														: ($_at_HeaderItems2{$_l_Build}="Modified Notes")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Amendments")
															If ($_l_Position>0)
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
													End case 
												End for 
												$_t_NewBit:="IF(FALSE)"+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Name")
												$_t_Name:=""
												$_t_Description:=""
												$_t_Revisions:=""
												If ($_l_Ref>0)
													$_t_Name:=$_at_HeaderDatas2{$_l_Ref}
												Else 
													$_t_name:=$_t_MethodName
													
												End if 
												$_t_NewBit:=$_t_NewBit+"//Project Method Name:      DB_FixMethods2019"
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Description")
												If ($_l_Ref>0)
													$_t_Description:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												For ($_l_Index; 1; 10)
													$_t_Description:=Replace string:C233($_t_Description; Char:C90(13)+Char:C90(13); Char:C90(13))
												End for 
												If ($_t_Description#"")
													$_l_Length:=Length:C16($_t_Description)
													If ($_t_Description[[Length:C16($_t_Description)]]=Char:C90(13))
														$_t_Description:=Substring:C12($_t_Description; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//------------------ Method Notes ------------------"+$_t_Description+Char:C90(13)
												$_t_NewBit:=$_t_NewBit+"//------------------ Revision Control ----------------"+Char:C90(13)
												$_t_DateCreated:=""
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Created Date")
												If ($_l_Ref>0)
													$_t_DateCreated:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												If ($_t_DateCreated#"")
													$_l_Length:=Length:C16($_t_DateCreated)
													If ($_t_DateCreated[[Length:C16($_t_DateCreated)]]=Char:C90(13))
														$_t_DateCreated:=Substring:C12($_t_DateCreated; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Date Created: "+$_t_DateCreated+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Creator")
												$_t_Creator:=""
												If ($_l_Ref>0)
													$_t_Creator:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												If ($_t_Creator#"")
													$_l_Length:=Length:C16($_t_Creator)
													If ($_t_Creator[[Length:C16($_t_Creator)]]=Char:C90(13))
														$_t_Creator:=Substring:C12($_t_Creator; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Created BY: "+$_t_Creator+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Date")
												$_t_DateModified:=""
												If ($_l_Ref>0)
													$_t_DateModified:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												If ($_t_DateModified#"")
													$_l_Length:=Length:C16($_t_DateModified)
													If ($_t_DateModified[[Length:C16($_t_DateModified)]]=Char:C90(13))
														$_t_DateModified:=Substring:C12($_t_DateModified; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Date Modified: "+$_t_DateModified+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified By")
												$_t_Modifier:=""
												If ($_l_Ref>0)
													$_t_Modifier:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												If ($_t_Modifier#"")
													$_l_Length:=Length:C16($_t_Modifier)
													If ($_t_Modifier[[Length:C16($_t_Modifier)]]=Char:C90(13))
														$_t_Modifier:=Substring:C12($_t_Modifier; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Modified By "+$_t_Modifier+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Notes")
												$_t_Notes:=""
												If ($_l_Ref>0)
													$_t_Notes:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												For ($_l_Index; 1; 10)
													$_t_Notes:=Replace string:C233($_t_Notes; Char:C90(13)+Char:C90(13); Char:C90(13))
												End for 
												If ($_t_Notes#"")
													$_l_Length:=Length:C16($_t_Notes)
													If ($_t_Notes[[Length:C16($_t_Notes)]]=Char:C90(13))
														$_t_Notes:=Substring:C12($_t_Notes; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Modification notes "+Char:C90(13)
												$_t_NewBit:=$_t_NewBit+$_t_Notes+Char:C90(13)
												$_t_NewBit:=$_t_NewBit+"END IF"+Char:C90(13)
												$_t_NewMethodText:=$_t_NewBit+Char:C90(13)+$_t_NewHeader+$_t_MethodText
												If ($_t_MethodTextOLD#$_t_NewMethodText)
													METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
												End if 
											Else 
												//TRACE
											End if 
										End if 
										$_bo_MergeHeaders:=False:C215
										
									Else 
										//TRACE
									End if 
								Else 
									//this would be strange
									//TRACE
									
								End if 
							Else 
								//this would be strange
								//TRACE
							End if 
						Else 
							If ($_t_MethodTextOLD#$_t_MethodText)
								METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
							End if 
							If ($_t_MethodText#"")
								//DIFFu_DBCodemanager ($_t_MethodName;Path project method;True)
								EXECUTE METHOD:C1007("DIFFu_DBCodemanager"; *; $_t_MethodName; Path project method:K72:1; True:C214)
								
								$_l_Index:=$_l_Index-1
							End if 
							////TRACE
						End if 
					: ($_l_Position>0)
						//find the old header-if it is there and replace it.
						$_l_PositionCompiler1:=Position:C15("//Variable Declarations"; $_t_MethodText)
						$_t_Delcarations:=Substring:C12($_t_MethodText; $_l_PositionCompiler1; $_l_Position)
						DB_FixMethodDeclarations2020($_t_MethodName; $_t_Delcarations; ->$_at_AllArrayNames; ->$_al_AllArrayTypes; ->$_at_AllVarNames; ->$_al_all_VarTypes; ->$_at_MethodDeclares; ->$_at_MethodNames; ->$_al_DeclareType)
						
						$_t_NewHeader:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16(" //Code Starts Here"))
						$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" //Code Starts Here")+1)
						//now we have 3 possible outcomes
						//1)there is no old header-do nothing-its a new method
						//2) there is an old header on the remaing text-this will the normal
						//3) i have extracted the header already and stuck into the new header
						///
						$_l_Position:=Position:C15("//Creator: "; $_t_MethodText)
						If ($_l_Position=0)
							$_l_Position:=Position:C15("// Creator:"; $_t_MethodText)
						End if 
						$_bo_MergeHeaders:=False:C215
						
						If ($_l_Position>0)  //this is scenario 1.. we want to take out the old header
							
							$_t_BeforeCreator:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
							$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
							$_l_Position:=Position:C15("Amendments"; $_t_MethodText)
							If ($_l_Position>0)
								$_t_beforeAmend:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
								$_l_Position:=Position:C15("END IF"; $_t_MethodText)
								$_t_PrependBefore:=""
								Repeat 
									
									$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
									For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
										Case of 
											: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
												//this is a commented out line
												//so get the next end if
												$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
												$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
												$_l_CheckifComment:=0
											: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
												//this is not a comment
												$_l_CheckifComment:=0
												$_bo_NotComment:=True:C214
											: ($_l_CheckifComment=1)
												$_l_CheckifComment:=0
												$_bo_NotComment:=True:C214
										End case 
									End for 
									$_l_Position:=Position:C15("END IF"; $_t_MethodText)
								Until ($_bo_NotComment)
								If ($_t_PrependBefore#"")
									$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
								End if 
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
								$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
								$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
								If ($_l_PositionHeaderStart>0)
									$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
									$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
									ARRAY TEXT:C222($_at_HeaderLines; 0)
									Repeat 
										$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
										If ($_l_Position>0)
											APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
											$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
											
										Else 
											APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
											$_t_Header:=""
										End if 
									Until ($_l_Position=0)
									ARRAY TEXT:C222($_at_HeaderItems; 0)
									ARRAY TEXT:C222($_at_HeaderDatas; 0)
									DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
									
									$_bo_MergeHeaders:=True:C214
									$_t_NewMethodText:=$_t_NewHeader+$_t_MethodText
									If ($_t_MethodTextOLD#$_t_NewMethodText)
										METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
									End if 
									
									
									
									
									
									
								Else 
									//this would be strange
									//TRACE
									
								End if 
							Else 
								//this would be strange
								//TRACE
							End if 
						Else 
							//there is no old header in the text
							//we now want to look for the old header in the new header..
							///
							$_l_Position:=Position:C15("//Creator: "; $_t_NewHeader)
							If ($_l_Position=0)
								$_l_Position:=Position:C15("// Creator:"; $_t_NewHeader)
							End if 
							
							If ($_l_Position>0)
								$_t_BeforeCreator:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
								$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
								$_l_Position:=Position:C15("Amendments"; $_t_NewHeader)
								If ($_l_Position>0)
									$_t_beforeAmend:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
									$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
									$_l_Position:=Position:C15("END IF"; $_t_NewHeader)
									$_t_PrependBefore:=""
									Repeat 
										
										$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
										For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
											Case of 
												: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
													//this is a commented out line
													//so get the next end if
													$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
													$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
													$_l_CheckifComment:=0
												: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
													//this is not a comment
													$_l_CheckifComment:=0
													$_bo_NotComment:=True:C214
												: ($_l_CheckifComment=1)
													$_l_CheckifComment:=0
													$_bo_NotComment:=True:C214
											End case 
										End for 
										$_l_Position:=Position:C15("END IF"; $_t_MethodText)
									Until ($_bo_NotComment)
									If ($_t_PrependBefore#"")
										$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
									End if 
									$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position+Length:C16("END IF")+1)
									$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
									
									$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
									If ($_l_PositionHeaderStart>0)
										$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
										$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
										ARRAY TEXT:C222($_at_HeaderLines; 0)
										Repeat 
											$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
											If ($_l_Position>0)
												APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
												$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
												
											Else 
												APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
												$_t_Header:=""
											End if 
										Until ($_l_Position=0)
										ARRAY TEXT:C222($_at_HeaderItems; 0)
										ARRAY TEXT:C222($_at_HeaderDatas; 0)
										DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
										$_bo_MergeHeaders:=True:C214
										
										//METHOD SET CODE($_t_MethodName;$_t_MethodText)
										//Now re-get the method code
										//METHOD GET CODE($_t_MethodName;$_t_MethodText)
										
										
									Else 
										//this would be strange
										//TRACE
										
									End if 
								Else 
									//this would be strange
									////TRACE
								End if 
							Else 
								/////TRACE
							End if 
							
							///
						End if 
						//now extract the data from the important bit of the new header
						If ($_bo_MergeHeaders)
							$_l_Position:=Position:C15("//Variable Declarations"; $_t_NewHeader)
							If ($_l_Position>0)
								$_t_newBit:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
								$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
								ARRAY TEXT:C222($_at_HeaderLines2; 0)
								Repeat 
									$_l_Position:=Position:C15(Char:C90(13); $_t_newBit)
									If ($_l_Position>0)
										APPEND TO ARRAY:C911($_at_HeaderLines2; Substring:C12($_t_newBit; 1; $_l_Position-1))
										$_t_newBit:=Substring:C12($_t_newBit; $_l_Position+1)
										
									Else 
										APPEND TO ARRAY:C911($_at_HeaderLines2; $_t_newBit)
										$_t_newBit:=""
									End if 
								Until ($_l_Position=0)
								
								$_bo_MergeHeaders:=True:C214
								ARRAY TEXT:C222($_at_HeaderItems2; 0)
								ARRAY TEXT:C222($_at_HeaderDatas2; 0)
								DB_FixMethods2019GetHeader("NEW"; ->$_at_HeaderLines2; ->$_at_HeaderItems2; ->$_at_HeaderDatas2)
								For ($_l_Build; 1; Size of array:C274($_at_HeaderItems2))
									Case of 
										: ($_at_HeaderItems2{$_l_Build}="Creator")
											$_l_Position:=Find in array:C230($_at_HeaderItems; "Creator")
											If ($_l_Position>0)
												$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
											End if 
										: ($_at_HeaderItems2{$_l_Build}="Created Date")
											$_l_Position:=Find in array:C230($_at_HeaderItems; "Created Date")
											If ($_l_Position>0)
												$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
											End if 
										: ($_at_HeaderItems2{$_l_Build}="Name")
											$_l_Position:=Find in array:C230($_at_HeaderItems; "Method Name")
											If ($_l_Position>0)
												If ($_at_HeaderDatas2{$_l_Build}="")
													$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
												End if 
											End if 
										: ($_at_HeaderItems2{$_l_Build}="Description")
											$_l_Position:=Find in array:C230($_at_HeaderItems; "Description")
											If ($_l_Position>0)
												$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
											End if 
										: ($_at_HeaderItems2{$_l_Build}="Modified Date")
										: ($_at_HeaderItems2{$_l_Build}="Modified By")
										: ($_at_HeaderItems2{$_l_Build}="Modified Notes")
											$_l_Position:=Find in array:C230($_at_HeaderItems; "Amendments")
											If ($_l_Position>0)
												$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
											End if 
									End case 
								End for 
								$_t_NewBit:="IF(FALSE)"+Char:C90(13)
								$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Name")
								$_t_Name:=""
								$_t_Description:=""
								$_t_Revisions:=""
								If ($_l_Ref>0)
									$_t_Name:=$_at_HeaderDatas2{$_l_Ref}
								Else 
									$_t_Name:=$_t_MethodName
								End if 
								$_t_NewBit:=$_t_NewBit+"//Project Method Name: "+$_t_Name+Char:C90(13)
								$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Description")
								If ($_l_Ref>0)
									$_t_Description:=$_at_HeaderDatas2{$_l_Ref}
								End if 
								For ($_l_Index; 1; 10)
									$_t_Description:=Replace string:C233($_t_Description; Char:C90(13)+Char:C90(13); Char:C90(13))
								End for 
								If ($_t_Description#"")
									$_l_Length:=Length:C16($_t_Description)
									If ($_t_Description[[Length:C16($_t_Description)]]=Char:C90(13))
										$_t_Description:=Substring:C12($_t_Description; 1; $_l_Length-1)
									End if 
								End if 
								$_t_NewBit:=$_t_NewBit+"//------------------ Method Notes ------------------"+$_t_Description+Char:C90(13)
								$_t_NewBit:=$_t_NewBit+"//------------------ Revision Control ----------------"+Char:C90(13)
								$_t_DateCreated:=""
								$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Created Date")
								If ($_l_Ref>0)
									$_t_DateCreated:=$_at_HeaderDatas2{$_l_Ref}
								End if 
								If ($_t_DateCreated#"")
									$_l_Length:=Length:C16($_t_DateCreated)
									If ($_t_DateCreated[[Length:C16($_t_DateCreated)]]=Char:C90(13))
										$_t_DateCreated:=Substring:C12($_t_DateCreated; 1; $_l_Length-1)
									End if 
								End if 
								$_t_NewBit:=$_t_NewBit+"//Date Created: "+$_t_DateCreated+Char:C90(13)
								$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Creator")
								$_t_Creator:=""
								If ($_l_Ref>0)
									$_t_Creator:=$_at_HeaderDatas2{$_l_Ref}
								End if 
								If ($_t_Creator#"")
									$_l_Length:=Length:C16($_t_Creator)
									If ($_t_Creator[[Length:C16($_t_Creator)]]=Char:C90(13))
										$_t_Creator:=Substring:C12($_t_Creator; 1; $_l_Length-1)
									End if 
								End if 
								$_t_NewBit:=$_t_NewBit+"//Created BY: "+$_t_Creator+Char:C90(13)
								$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Date")
								$_t_DateModified:=""
								If ($_l_Ref>0)
									$_t_DateModified:=$_at_HeaderDatas2{$_l_Ref}
								End if 
								If ($_t_DateModified#"")
									$_l_Length:=Length:C16($_t_DateModified)
									If ($_t_DateModified[[Length:C16($_t_DateModified)]]=Char:C90(13))
										$_t_DateModified:=Substring:C12($_t_DateModified; 1; $_l_Length-1)
									End if 
								End if 
								$_t_NewBit:=$_t_NewBit+"//Date Modified: "+$_t_DateModified+Char:C90(13)
								$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified By")
								$_t_Modifier:=""
								If ($_l_Ref>0)
									$_t_Modifier:=$_at_HeaderDatas2{$_l_Ref}
								End if 
								If ($_t_Modifier#"")
									$_l_Length:=Length:C16($_t_Modifier)
									If ($_t_Modifier[[Length:C16($_t_Modifier)]]=Char:C90(13))
										$_t_Modifier:=Substring:C12($_t_Modifier; 1; $_l_Length-1)
									End if 
								End if 
								$_t_NewBit:=$_t_NewBit+"//Modified By "+$_t_Modifier+Char:C90(13)
								$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Notes")
								$_t_Notes:=""
								If ($_l_Ref>0)
									$_t_Notes:=$_at_HeaderDatas2{$_l_Ref}
								End if 
								For ($_l_Index; 1; 10)
									$_t_Notes:=Replace string:C233($_t_Notes; Char:C90(13)+Char:C90(13); Char:C90(13))
								End for 
								If ($_t_Notes#"")
									$_l_Length:=Length:C16($_t_Notes)
									If ($_t_Notes[[Length:C16($_t_Notes)]]=Char:C90(13))
										$_t_Notes:=Substring:C12($_t_Notes; 1; $_l_Length-1)
									End if 
								End if 
								$_t_NewBit:=$_t_NewBit+"//Modification notes "+Char:C90(13)
								$_t_NewBit:=$_t_NewBit+$_t_Notes+Char:C90(13)
								$_t_NewBit:=$_t_NewBit+"END IF"+Char:C90(13)
								$_t_NewMethodText:=$_t_NewBit+Char:C90(13)+$_t_NewHeader+$_t_MethodText
								If ($_t_MethodTextOLD#$_t_NewMethodText)
									METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
								End if 
							Else 
								//TRACE
							End if 
						End if 
						$_bo_MergeHeaders:=False:C215
				End case 
				METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
				$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
				If ($_l_Position>0)
					$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
					For ($_l_Position; 1; Length:C16($_t_MethodText))
						If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
							If (Length:C16($_t_methodText)>$_l_Position)
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
							Else 
								$_t_MethodText:=""
							End if 
							$_l_Position:=999999
						End if 
					End for 
				End if 
				$_t_MethodTextOLD:=$_t_MethodText
				$_bo_Exit:=False:C215
				Repeat 
					If ($_t_MethodText#"")
						If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
							$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
						Else 
							$_bo_Exit:=True:C214
						End if 
					End if 
				Until ($_bo_Exit) | ($_t_MethodText="")
				
				
				
				$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
				If ($_l_Position>0)  //it would be odd iff it is not here
					$_t_Header:=Substring:C12($_t_MethodText; 1; $_l_Position)
					//$_t_MethodText:=Substring($_t_MethodText;$_l_Position+1)
					If (Length:C16($_t_methodText)>$_l_Position)
						$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
					Else 
						$_t_MethodText:=""
					End if 
					
					$_t_NewMethodText:=""
					Repeat 
						$_l_EndofLine:=Position:C15(Char:C90(13); $_t_MethodText)
						If ($_l_EndofLine>0)
							$_t_ThisLine:=Substring:C12($_t_MethodText; 1; $_l_EndofLine-1)
							$_t_MethodText:=Substring:C12($_t_MethodText; $_l_EndofLine+1)
						Else 
							$_t_ThisLine:=$_t_MethodText
							$_t_MethodText:=""
						End if 
						$_bo_Exit:=False:C215
						Repeat 
							If ($_t_ThisLine#"")
								If ($_t_ThisLine[[1]]=Char:C90(9)) | ($_t_ThisLine[[1]]=" ")
									$_t_ThisLine:=Substring:C12($_t_ThisLine; 2)
								Else 
									$_bo_Exit:=True:C214
								End if 
							End if 
						Until ($_t_ThisLine="") | ($_bo_Exit)
						Case of 
							: ($_t_ThisLine="C_String@")
							: ($_t_ThisLine="_o_C_String@")
							: ($_t_ThisLine="C_Text@")
							: ($_t_ThisLine="C_Longint@")
							: ($_t_ThisLine="_o_C_integer@")
							: ($_t_ThisLine="C_OBJECT@")
							: ($_t_ThisLine="C_BOOLEAN@")
							: ($_t_ThisLine="C_TIME@")
							: ($_t_ThisLine="C_BLOB@")
							: ($_t_ThisLine="C_Date@")
							: ($_t_ThisLine="C_picture@")
							: ($_t_ThisLine="C_pointer@")
							: ($_t_ThisLine="C_Real@")
							: ($_t_ThisLine="C_picture@")
								
							Else 
								$_t_NewMethodText:=$_t_NewMethodText+Char:C90(13)+$_t_ThisLine
								
						End case 
						
					Until ($_t_MethodText="")
					For ($_l_Index3; 1; 20)
						$_t_Header:=Replace string:C233($_t_Header; Char:C90(13)+Char:C90(13); Char:C90(13))
					End for 
					$_t_NewMethodText:=$_t_Header+$_t_NewMethodText
					For ($_l_Index3; 1; 20)
						$_t_NewMethodText:=Replace string:C233($_t_NewMethodText; Char:C90(13)+Char:C90(13)+"  //Code Starts Here"; Char:C90(13)+"  //Code Starts Here")
					End for 
					If ($_t_MethodTextOLD#$_t_NewMethodText)
						METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
						METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
						$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
						If ($_l_Position>0)
							$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
							For ($_l_Position; 1; Length:C16($_t_MethodText))
								If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
									If (Length:C16($_t_methodText)>$_l_Position)
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
									Else 
										$_t_MethodText:=""
									End if 
									$_l_Position:=999999
								End if 
							End for 
						End if 
						$_t_MethodTextOLD:=$_t_MethodText
						$_bo_Exit:=False:C215
						Repeat 
							If ($_t_MethodText#"")
								If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
									$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
								Else 
									$_bo_Exit:=True:C214
								End if 
							End if 
						Until ($_bo_Exit) | ($_t_MethodText="")
						
						
					End if 
					
					$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
					If ($_l_Position>0)  //it would be odd iff it is not here
						$_T_Header:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16(" //Code Starts Here"))
						$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" //Code Starts Here")+1)
						$_t_MethodText:=STR_RemoveLeadTrailSpace($_t_MethodText)
						$_l_Position:=Position:C15("$_t_oldMethodName:=ERR_MethodTracker ("; $_t_MethodText)
						If ($_l_Position>1)
							If ($_t_MethodText[[$_l_Position-1]]="/")
								$_l_Position:=0
							End if 
						End if 
						If ($_l_Position=0) | ($_l_Position>20)
							
							$_t_MethodText:="$_t_oldMethodName:=ERR_MethodTracker ("+Char:C90(34)+$_t_MethodName+Char:C90(34)+")"+Char:C90(13)+$_t_MethodText
						End if 
						$_bo_exit:=False:C215
						Repeat 
							If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(9)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=" ")
								$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
							Else 
								$_bo_exit:=True:C214
							End if 
						Until ($_bo_exit)
						$_bo_exit:=False:C215
						
						For ($_l_LastLine; Length:C16($_t_MethodText); 1; -1)
							
							If ($_t_MethodText[[$_l_LastLine]]=Char:C90(13))
								$_t_LastLine:=Substring:C12($_t_MethodText; $_l_LastLine+1)
								$_t_MethodText:=Substring:C12($_t_MethodText; 1; $_l_LastLine-1)
								$_l_LastLine:=0
								$_t_LastLine:=STR_RemoveLeadTrailSpace($_t_LastLine)
								If (Position:C15("ERR_MethodTrackerReturn"; $_t_LastLine)=0)
									
									$_t_LastLine:=$_t_LastLine+Char:C90(13)+"ERR_MethodTrackerReturn("+Char:C90(34)+$_t_MethodName+Char:C90(34)+";$_t_oldMethodName)"
									$_bo_exit:=False:C215
								End if 
								Repeat 
									If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(9)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=" ")
										
										$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
									Else 
										$_bo_exit:=True:C214
									End if 
								Until ($_bo_exit)
								$_t_MethodText:=$_T_Header+$_t_MethodText+Char:C90(13)+$_t_LastLine
								If ($_t_MethodTextOLD#$_t_MethodText)
									METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
								End if 
								
								
							End if 
						End for 
						
						
						
					End if 
					
				End if 
				
				METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
				$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
				If ($_l_Position>0)
					$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
					For ($_l_Position; 1; Length:C16($_t_MethodText))
						If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
							If (Length:C16($_t_methodText)>$_l_Position)
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
							Else 
								$_t_MethodText:=""
							End if 
							$_l_Position:=Length:C16($_t_MethodText)*2
						End if 
					End for 
				End if 
				$_bo_InsertCHanges:=False:C215
				If (False:C215)
					$_l_Position:=Position:C15("$_t_oldMethodName:=ERR_MethodTracker"; $_t_MethodText)
					If ($_l_Position>0)
						$_t_before:=Substring:C12($_t_MethodText; $_l_Position-1)
						$_t_After:=Substring:C12($_t_MethodText; $_l_Position)
						For ($_l_EndofLine; 1; Length:C16($_t_After))
							If ($_t_After[[$_l_EndofLine]]=Char:C90(10)) | ($_t_After[[$_l_EndofLine]]=Char:C90(13))
								$_t_ThisLine:=Substring:C12($_t_After; 1; $_l_EndofLine-1)
								$_l_EndofLine2:=Length:C16($_t_After)
								$_t_After:=Substring:C12($_t_After; $_l_EndofLine+1)
								$_l_EndofLine:=$_l_EndofLine2
								$_l_position2:=Position:C15($_t_ThisLine; $_t_After)
								If ($_l_position2>0)
									$_t_After:=Replace string:C233($_t_After; $_t_ThisLine; "")
									$_t_MethodText:=$_t_before+$_t_ThisLine+Char:C90(13)+$_t_After
									$_bo_InsertCHanges:=True:C214
								End if 
							End if 
						End for 
					End if 
				End if 
				Repeat 
					$_l_Position:=Position:C15("_O_ENABLE BUTTON"; $_t_MethodText)
					If ($_l_Position>0)
						
						$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
						$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_ENABLE BUTTON"))
						//We need to now find the end of the line(")"
						$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
						If ($_l_Position2>0)
							$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
							$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
							$_t_ThisLIne:="Object Set Enabled"+$_t_ThisLIne+";TRUE)"
							$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
							$_bo_InsertCHanges:=False:C215
						End if 
					End if 
				Until ($_l_Position=0)
				Repeat 
					$_l_Position:=Position:C15("_O_DISABLE BUTTON"; $_t_MethodText)
					If ($_l_Position>0)
						
						$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
						$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_DISABLE BUTTON"))
						//We need to now find the end of the line(")"
						$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
						If ($_l_Position2>0)
							$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
							$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
							$_t_ThisLIne:="Object Set Enabled"+$_t_ThisLIne+";FALSE)"
							$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
							$_bo_InsertCHanges:=False:C215
						End if 
					End if 
				Until ($_l_Position=0)
				//_o_REDRAW LIST
				$_t_StoreBefore:=""
				Repeat 
					$_l_Position:=Position:C15("_o_REDRAW LIST"; $_t_MethodText)
					If ($_l_Position>0)
						//TRACE
						$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
						$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_o_REDRAW LIST"))
						//We need to now find the end of the line(")"
						$_t_BeforeEnd:=Substring:C12($_T_MethodBefore; Length:C16($_T_MethodBefore)-2)
						If ($_t_BeforeEnd#"//")
							$_t_StoreBefore:=$_t_StoreBefore+$_T_MethodBefore+"//_o_REDRAW LIST"
							$_t_MethodText:=$_T_MethodAfter
							$_bo_InsertCHanges:=True:C214
						Else 
							$_t_StoreBefore:=$_t_StoreBefore+$_T_MethodBefore+"_o_REDRAW LIST"
							$_t_MethodText:=$_T_MethodAfter
							//dont change the flag
						End if 
					End if 
				Until ($_l_Position=0)
				If ($_t_StoreBefore#"")
					$_t_MethodText:=$_t_StoreBefore+$_t_MethodText
				End if 
				//_O_C_STRING(20;$SD_S20_DiaryResultCode)
				Repeat 
					$_l_Position:=Position:C15("_O_C_STRING"; $_t_MethodText)
					If ($_l_Position>0)
						
						$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
						$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_C_STRING"))
						//We need to now find the end of the line(")"
						$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
						If ($_l_Position2>0)
							$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
							$_l_Position:=Position:C15(";"; $_t_ThisLIne)
							$_t_ThisLIne:=Substring:C12($_t_ThisLIne; $_l_Position+1)
							$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
							$_t_ThisLIne:="C_TEXT("+$_t_ThisLIne+")"
							$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
							$_bo_InsertCHanges:=True:C214
						End if 
					End if 
				Until ($_l_Position=0)
				Repeat 
					$_l_Position:=Position:C15("_O_C_INTEGER"; $_t_MethodText)
					If ($_l_Position>0)
						
						$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
						$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_C_INTEGER"))
						//We need to now find the end of the line(")"
						$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
						If ($_l_Position2>0)
							$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
							$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
							$_t_ThisLIne:="C_LONGINT"+$_t_ThisLIne+")"
							$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
							$_bo_InsertCHanges:=False:C215
						End if 
					End if 
				Until ($_l_Position=0)
				//Array string(20;$SD_S20_DiaryResultCode)
				Repeat 
					$_l_Position:=Position:C15("_O_ARRAY STRING"; $_t_MethodText)
					If ($_l_Position>0)
						
						
						$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
						$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_ARRAY STRING"))
						//We need to now find the end of the line(")"
						$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
						If ($_l_Position2>0)
							
							$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
							$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
							$_l_Position:=Position:C15(";"; $_t_ThisLIne)
							$_t_ThisLIne:=Substring:C12($_t_ThisLIne; $_l_Position+1)
							
							$_t_ThisLIne:="ARRAY TEXT("+$_t_ThisLIne+")"
							$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
							$_bo_InsertCHanges:=True:C214
						End if 
					End if 
				Until ($_l_Position=0)
				
				$_l_Position:=Position:C15("//C_Unknown($_t"; $_t_MethodText)
				If ($_l_Position=0)
					$_l_Position:=Position:C15("//C_Unknown($_i"; $_t_MethodText)
					If ($_l_Position=0)
						$_l_Position:=Position:C15("//C_Unknown($_a"; $_t_MethodText)
						If ($_l_Position=0)
							$_l_Position:=Position:C15("//C_Unknown($_l"; $_t_MethodText)
						Else 
							$_l_Position:=Position:C15("//C_Unknown"; $_t_MethodText)
						End if 
					End if 
				End if 
				If ($_l_Position>0) | ($_bo_InsertCHanges)  //force a save
					$_t_MethodText:=$_t_MethodText+" "
					METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
				End if 
			End if 
			
		End if 
	End for 
End if 


If (True:C214)
	$_bo_Ignore:=False:C215
	ARRAY TEXT:C222($_at_MethodPaths; 0)
	FORM GET NAMES:C1167($_at_FormNames)
	SORT ARRAY:C229($_at_FormNames)
	If (True:C214)
		For ($_l_CurrentForm; 1; Size of array:C274($_at_FormNames))
			METHOD GET PATHS FORM:C1168($_at_MethodPaths; $_at_FormNames{$_l_CurrentForm})
			//MESSAGE("Exporting("+$_at_FormNames{$_l_CurrentForm}+")")
			$_l_SizeofArray:=Size of array:C274($_at_MethodPaths)
			SORT ARRAY:C229($_at_MethodPaths)
			
			For ($_l_Index; 1; $_l_SizeofArray)
				//MESSAGE("Exporting("+$_at_FormNames{$_l_CurrentForm}+":"+$_at_MethodPaths{$_l_Index}+")")
				
				If (Position:C15("FormMethod"; $_at_MethodPaths{$_l_Index})>0)
					/////DIFFu_DBCodemanager ($_at_MethodPaths{$_l_Index};Path project form;True)
					If (Not:C34($_bo_Ignore))
						
						$_t_MethodName:=$_at_MethodPaths{$_l_Index}
						MESSAGE:C88($_at_FormNames{$_l_CurrentForm}+$_t_MethodName+" "+String:C10($_l_Index)+" of "+String:C10($_l_SizeofArray))
						
						$_t_MethodNameStripped:=Replace string:C233($_t_MethodName; "{formmethod}"; "")
						$_t_MethodNameStripped:=Replace string:C233($_t_MethodNameStripped; "[projectForm]/"; "")
						$_t_MethodNameStripped:=Replace string:C233($_t_MethodNameStripped; "/"; "")
						
						METHOD GET MODIFICATION DATE:C1170($_t_MethodName; $_Dte_ModificationDate; $_ti_ModificationTime; *)
						METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
						$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
						If ($_l_Position>0)
							$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
							For ($_l_Position; 1; Length:C16($_t_MethodText))
								If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
									If (Length:C16($_t_methodText)>$_l_Position)
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
									Else 
										$_t_MethodText:=""
									End if 
									$_l_Position:=999999
								End if 
							End for 
						End if 
						$_t_MethodTextOLD:=$_t_MethodText
						$_bo_Exit:=False:C215
						Repeat 
							If ($_t_MethodText#"")
								If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
									$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
								Else 
									$_bo_Exit:=True:C214
								End if 
							End if 
						Until ($_bo_Exit) | ($_t_MethodText="")
						
						If ($_t_MethodText#"")
							$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
							Case of 
								: ($_l_Position=0)  //there is no new header
									//take out the old header save then put the new header text in
									$_l_Position:=Position:C15("//Creator: "; $_t_MethodText)
									
									
									If ($_l_Position>0)
										$_t_OldMethodText:=$_t_MethodText
										$_t_BeforeCreator:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
										$_l_Position:=Position:C15("Amendments"; $_t_MethodText)
										If ($_l_Position>0)
											$_t_beforeAmend:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
											$_l_Position:=Position:C15("END IF"; $_t_MethodText)
											$_t_PrependBefore:=""
											Repeat 
												
												$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
												For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
													Case of 
														: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
															//this is a commented out line
															//so get the next end if
															$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
															$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
															$_l_CheckifComment:=0
														: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
															//this is not a comment
															$_l_CheckifComment:=0
															$_bo_NotComment:=True:C214
														: ($_l_CheckifComment=1)
															$_l_CheckifComment:=0
															$_bo_NotComment:=True:C214
													End case 
												End for 
												$_l_Position:=Position:C15("END IF"; $_t_MethodText)
											Until ($_bo_NotComment)
											If ($_t_PrependBefore#"")
												$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
											End if 
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
											$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
											$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
											If ($_l_PositionHeaderStart>0)
												$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
												$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
												ARRAY TEXT:C222($_at_HeaderLines; 0)
												Repeat 
													$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
													If ($_l_Position>0)
														APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
														$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
														
													Else 
														APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
														$_t_Header:=""
													End if 
												Until ($_l_Position=0)
												ARRAY TEXT:C222($_at_HeaderItems; 0)
												ARRAY TEXT:C222($_at_HeaderDatas; 0)
												DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
												$_bo_MergeHeaders:=True:C214
												If ($_t_MethodTextOLD#$_t_MethodText)
													METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
													If ($_t_MethodText#"")
														//DIFFu_DBCodemanager ($_t_MethodName;Path project form;True)
														EXECUTE METHOD:C1007("DIFFu_DBCodemanager"; *; $_t_MethodName; Path project form:K72:3; True:C214)
														
													End if 
													
													
													//Now re-get the method code
													METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
													$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
													If ($_l_Position>0)
														$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
														For ($_l_Position; 1; Length:C16($_t_MethodText))
															If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
																If (Length:C16($_t_methodText)>$_l_Position)
																	$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
																Else 
																	$_t_MethodText:=""
																End if 
																$_l_Position:=999999
															End if 
														End for 
													End if 
													$_t_MethodTextOLD:=$_t_MethodText
													$_bo_Exit:=False:C215
													Repeat 
														If ($_t_MethodText#"")
															If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
																$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
															Else 
																$_bo_Exit:=True:C214
															End if 
														End if 
													Until ($_bo_Exit) | ($_t_MethodText="")
													
												End if 
												//now the new header should be here
												$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
												If ($_l_Position>0)
													$_bo_MergeHeaders:=True:C214
													$_t_NewHeader:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16(" //Code Starts Here"))
													$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" //Code Starts Here")+1)
													If ($_bo_MergeHeaders)
														$_l_Position:=Position:C15("//Variable Declarations"; $_t_NewHeader)
														If ($_l_Position>0)
															$_t_newBit:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
															$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
															ARRAY TEXT:C222($_at_HeaderLines2; 0)
															Repeat 
																$_l_Position:=Position:C15(Char:C90(13); $_t_newBit)
																If ($_l_Position>0)
																	APPEND TO ARRAY:C911($_at_HeaderLines2; Substring:C12($_t_newBit; 1; $_l_Position-1))
																	$_t_newBit:=Substring:C12($_t_newBit; $_l_Position+1)
																	
																Else 
																	APPEND TO ARRAY:C911($_at_HeaderLines2; $_t_newBit)
																	$_t_newBit:=""
																End if 
															Until ($_l_Position=0)
															
															$_bo_MergeHeaders:=True:C214
															ARRAY TEXT:C222($_at_HeaderItems2; 0)
															ARRAY TEXT:C222($_at_HeaderDatas2; 0)
															DB_FixMethods2019GetHeader("NEW"; ->$_at_HeaderLines2; ->$_at_HeaderItems2; ->$_at_HeaderDatas2)
															For ($_l_Build; 1; Size of array:C274($_at_HeaderItems2))
																Case of 
																	: ($_at_HeaderItems2{$_l_Build}="Creator")
																		$_l_Position:=Find in array:C230($_at_HeaderItems; "Creator")
																		If ($_l_Position>0)
																			$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																		End if 
																	: ($_at_HeaderItems2{$_l_Build}="Created Date")
																		$_l_Position:=Find in array:C230($_at_HeaderItems; "Created Date")
																		If ($_l_Position>0)
																			$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																		End if 
																	: ($_at_HeaderItems2{$_l_Build}="Name")
																		$_l_Position:=Find in array:C230($_at_HeaderItems; "Method Name")
																		If ($_l_Position>0)
																			If ($_at_HeaderDatas2{$_l_Build}="")
																				$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																			End if 
																		End if 
																	: ($_at_HeaderItems2{$_l_Build}="Description")
																		$_l_Position:=Find in array:C230($_at_HeaderItems; "Description")
																		If ($_l_Position>0)
																			$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																		End if 
																	: ($_at_HeaderItems2{$_l_Build}="Modified Date")
																	: ($_at_HeaderItems2{$_l_Build}="Modified By")
																	: ($_at_HeaderItems2{$_l_Build}="Modified Notes")
																		$_l_Position:=Find in array:C230($_at_HeaderItems; "Amendments")
																		If ($_l_Position>0)
																			$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																		End if 
																End case 
															End for 
															$_t_NewBit:="IF(FALSE)"+Char:C90(13)
															$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Name")
															$_t_Name:=""
															$_t_Description:=""
															$_t_Revisions:=""
															If ($_l_Ref>0)
																$_t_Name:=$_at_HeaderDatas2{$_l_Ref}
															Else 
																$_t_name:=$_t_MethodNameStripped
																
															End if 
															$_t_NewBit:=$_t_NewBit+"//Project Form Method Name: "+$_t_Name+Char:C90(13)
															$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Description")
															If ($_l_Ref>0)
																$_t_Description:=$_at_HeaderDatas2{$_l_Ref}
															End if 
															For ($_l_Index3; 1; 10)
																$_t_Description:=Replace string:C233($_t_Description; Char:C90(13)+Char:C90(13); Char:C90(13))
															End for 
															If ($_t_Description#"")
																$_l_Length:=Length:C16($_t_Description)
																If ($_t_Description[[Length:C16($_t_Description)]]=Char:C90(13))
																	$_t_Description:=Substring:C12($_t_Description; 1; $_l_Length-1)
																End if 
															End if 
															$_t_NewBit:=$_t_NewBit+"//------------------ Method Notes ------------------"+$_t_Description+Char:C90(13)
															$_t_NewBit:=$_t_NewBit+"//------------------ Revision Control ----------------"+Char:C90(13)
															$_t_DateCreated:=""
															$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Created Date")
															If ($_l_Ref>0)
																$_t_DateCreated:=$_at_HeaderDatas2{$_l_Ref}
															End if 
															If ($_t_DateCreated#"")
																$_l_Length:=Length:C16($_t_DateCreated)
																If ($_t_DateCreated[[Length:C16($_t_DateCreated)]]=Char:C90(13))
																	$_t_DateCreated:=Substring:C12($_t_DateCreated; 1; $_l_Length-1)
																End if 
															End if 
															$_t_NewBit:=$_t_NewBit+"//Date Created: "+$_t_DateCreated+Char:C90(13)
															$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Creator")
															$_t_Creator:=""
															If ($_l_Ref>0)
																$_t_Creator:=$_at_HeaderDatas2{$_l_Ref}
															End if 
															If ($_t_Creator#"")
																$_l_Length:=Length:C16($_t_Creator)
																If ($_t_Creator[[Length:C16($_t_Creator)]]=Char:C90(13))
																	$_t_Creator:=Substring:C12($_t_Creator; 1; $_l_Length-1)
																End if 
															End if 
															$_t_NewBit:=$_t_NewBit+"//Created BY: "+$_t_Creator+Char:C90(13)
															$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Date")
															$_t_DateModified:=""
															If ($_l_Ref>0)
																$_t_DateModified:=$_at_HeaderDatas2{$_l_Ref}
															End if 
															If ($_t_DateModified#"")
																$_l_Length:=Length:C16($_t_DateModified)
																If ($_t_DateModified[[Length:C16($_t_DateModified)]]=Char:C90(13))
																	$_t_DateModified:=Substring:C12($_t_DateModified; 1; $_l_Length-1)
																End if 
															End if 
															$_t_NewBit:=$_t_NewBit+"//Date Modified: "+$_t_DateModified+Char:C90(13)
															$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified By")
															$_t_Modifier:=""
															If ($_l_Ref>0)
																$_t_Modifier:=$_at_HeaderDatas2{$_l_Ref}
															End if 
															If ($_t_Modifier#"")
																$_l_Length:=Length:C16($_t_Modifier)
																If ($_t_Modifier[[Length:C16($_t_Modifier)]]=Char:C90(13))
																	$_t_Modifier:=Substring:C12($_t_Modifier; 1; $_l_Length-1)
																End if 
															End if 
															$_t_NewBit:=$_t_NewBit+"//Modified By "+$_t_Modifier+Char:C90(13)
															$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Notes")
															$_t_Notes:=""
															If ($_l_Ref>0)
																$_t_Notes:=$_at_HeaderDatas2{$_l_Ref}
															End if 
															For ($_l_Index4; 1; 10)
																$_t_Notes:=Replace string:C233($_t_Notes; Char:C90(13)+Char:C90(13); Char:C90(13))
															End for 
															If ($_t_Notes#"")
																$_l_Length:=Length:C16($_t_Notes)
																If ($_t_Notes[[Length:C16($_t_Notes)]]=Char:C90(13))
																	$_t_Notes:=Substring:C12($_t_Notes; 1; $_l_Length-1)
																End if 
															End if 
															$_t_NewBit:=$_t_NewBit+"//Modification notes "+Char:C90(13)
															$_t_NewBit:=$_t_NewBit+$_t_Notes+Char:C90(13)
															$_t_NewBit:=$_t_NewBit+"END IF"+Char:C90(13)
															$_t_NewMethodText:=$_t_NewBit+Char:C90(13)+$_t_NewHeader+$_t_MethodText
															If ($_t_NewMethodText#$_t_MethodTextOLD)
																METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
															End if 
														Else 
															//TRACE
														End if 
													End if 
													$_bo_MergeHeaders:=False:C215
													
												Else 
													//TRACE
												End if 
											Else 
												//this would be strange
												//TRACE
												
											End if 
										Else 
											//this would be strange
											//TRACE
										End if 
									Else 
										If ($_t_MethodTextOLD#$_t_MethodText)
											METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
										End if 
										If ($_t_MethodText#"")
											//DIFFu_DBCodemanager ($_t_MethodName;Path project form;True)
											EXECUTE METHOD:C1007("DIFFu_DBCodemanager"; *; $_t_MethodName; Path project form:K72:3; True:C214)
											
											$_l_Index:=$_l_Index-1
										End if 
									End if 
								: ($_l_Position>0)
									//find the old header-if it is there and replace it.
									$_l_PositionCompiler1:=Position:C15("//Variable Declarations"; $_t_MethodText)
									$_t_Delcarations:=Substring:C12($_t_MethodText; $_l_PositionCompiler1; $_l_Position)
									DB_FixMethodDeclarations2020($_t_MethodName; $_t_Delcarations; ->$_at_AllArrayNames; ->$_al_AllArrayTypes; ->$_at_AllVarNames; ->$_al_all_VarTypes; ->$_at_MethodDeclares; ->$_at_MethodNames; ->$_al_DeclareType)
									
									$_t_NewHeader:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16(" //Code Starts Here"))
									$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" //Code Starts Here")+1)
									//now we have 3 possible outcomes
									//1)there is no old header-do nothing-its a new method
									//2) there is an old header on the remaing text-this will the normal
									//3) i have extracted the header already and stuck into the new header
									///
									$_l_Position:=Position:C15("//Creator: "; $_t_MethodText)
									If ($_l_Position=0)
										$_l_Position:=Position:C15("// Creator:"; $_t_MethodText)
									End if 
									$_bo_MergeHeaders:=False:C215
									
									If ($_l_Position>0)  //this is scenario 1.. we want to take out the old header
										
										$_t_BeforeCreator:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
										$_l_Position:=Position:C15("Amendments"; $_t_MethodText)
										If ($_l_Position>0)
											$_t_beforeAmend:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
											$_l_Position:=Position:C15("END IF"; $_t_MethodText)
											$_t_PrependBefore:=""
											Repeat 
												
												$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
												For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
													Case of 
														: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
															//this is a commented out line
															//so get the next end if
															$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
															$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
															$_l_CheckifComment:=0
														: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
															//this is not a comment
															$_l_CheckifComment:=0
															$_bo_NotComment:=True:C214
														: ($_l_CheckifComment=1)
															$_l_CheckifComment:=0
															$_bo_NotComment:=True:C214
													End case 
												End for 
												$_l_Position:=Position:C15("END IF"; $_t_MethodText)
											Until ($_bo_NotComment)
											If ($_t_PrependBefore#"")
												$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
											End if 
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
											$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
											$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
											If ($_l_PositionHeaderStart>0)
												$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
												$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
												ARRAY TEXT:C222($_at_HeaderLines; 0)
												Repeat 
													$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
													If ($_l_Position>0)
														APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
														$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
														
													Else 
														APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
														$_t_Header:=""
													End if 
												Until ($_l_Position=0)
												ARRAY TEXT:C222($_at_HeaderItems; 0)
												ARRAY TEXT:C222($_at_HeaderDatas; 0)
												DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
												
												$_bo_MergeHeaders:=True:C214
												$_t_NewMethodText:=$_t_NewHeader+$_t_MethodText
												If ($_t_MethodTextOLD#$_t_NewMethodText)
													METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
												End if 
												
												
												
												
												
												
											Else 
												//this would be strange
												//TRACE
												
											End if 
										Else 
											//this would be strange
											//TRACE
										End if 
									Else 
										//there is no old header in the text
										//we now want to look for the old header in the new header..
										///
										$_l_Position:=Position:C15("//Creator: "; $_t_NewHeader)
										If ($_l_Position=0)
											$_l_Position:=Position:C15("// Creator:"; $_t_NewHeader)
										End if 
										
										If ($_l_Position>0)
											$_t_BeforeCreator:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
											$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
											$_l_Position:=Position:C15("Amendments"; $_t_NewHeader)
											If ($_l_Position>0)
												$_t_beforeAmend:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
												$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
												$_l_Position:=Position:C15("END IF"; $_t_NewHeader)
												$_t_PrependBefore:=""
												Repeat 
													
													$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
													For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
														Case of 
															: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
																//this is a commented out line
																//so get the next end if
																$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
																$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
																$_l_CheckifComment:=0
															: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
																//this is not a comment
																$_l_CheckifComment:=0
																$_bo_NotComment:=True:C214
															: ($_l_CheckifComment=1)
																$_l_CheckifComment:=0
																$_bo_NotComment:=True:C214
														End case 
													End for 
													$_l_Position:=Position:C15("END IF"; $_t_MethodText)
												Until ($_bo_NotComment)
												If ($_t_PrependBefore#"")
													$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
												End if 
												$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position+Length:C16("END IF")+1)
												$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
												
												$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
												If ($_l_PositionHeaderStart>0)
													$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
													$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
													ARRAY TEXT:C222($_at_HeaderLines; 0)
													Repeat 
														$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
														If ($_l_Position>0)
															APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
															$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
															
														Else 
															APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
															$_t_Header:=""
														End if 
													Until ($_l_Position=0)
													ARRAY TEXT:C222($_at_HeaderItems; 0)
													ARRAY TEXT:C222($_at_HeaderDatas; 0)
													DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
													$_bo_MergeHeaders:=True:C214
													
													//METHOD SET CODE($_t_MethodName;$_t_MethodText)
													//Now re-get the method code
													//METHOD GET CODE($_t_MethodName;$_t_MethodText)
													
													
												Else 
													//this would be strange
													//TRACE
													
												End if 
											Else 
												//this would be strange
												////TRACE
											End if 
										Else 
											/////TRACE
										End if 
										
										///
									End if 
									//now extract the data from the important bit of the new header
									If ($_bo_MergeHeaders)
										$_l_Position:=Position:C15("//Variable Declarations"; $_t_NewHeader)
										If ($_l_Position>0)
											$_t_newBit:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
											$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
											ARRAY TEXT:C222($_at_HeaderLines2; 0)
											Repeat 
												$_l_Position:=Position:C15(Char:C90(13); $_t_newBit)
												If ($_l_Position>0)
													APPEND TO ARRAY:C911($_at_HeaderLines2; Substring:C12($_t_newBit; 1; $_l_Position-1))
													$_t_newBit:=Substring:C12($_t_newBit; $_l_Position+1)
													
												Else 
													APPEND TO ARRAY:C911($_at_HeaderLines2; $_t_newBit)
													$_t_newBit:=""
												End if 
											Until ($_l_Position=0)
											
											$_bo_MergeHeaders:=True:C214
											ARRAY TEXT:C222($_at_HeaderItems2; 0)
											ARRAY TEXT:C222($_at_HeaderDatas2; 0)
											DB_FixMethods2019GetHeader("NEW"; ->$_at_HeaderLines2; ->$_at_HeaderItems2; ->$_at_HeaderDatas2)
											For ($_l_Build; 1; Size of array:C274($_at_HeaderItems2))
												Case of 
													: ($_at_HeaderItems2{$_l_Build}="Creator")
														$_l_Position:=Find in array:C230($_at_HeaderItems; "Creator")
														If ($_l_Position>0)
															$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
														End if 
													: ($_at_HeaderItems2{$_l_Build}="Created Date")
														$_l_Position:=Find in array:C230($_at_HeaderItems; "Created Date")
														If ($_l_Position>0)
															$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
														End if 
													: ($_at_HeaderItems2{$_l_Build}="Name")
														$_l_Position:=Find in array:C230($_at_HeaderItems; "Method Name")
														If ($_l_Position>0)
															If ($_at_HeaderDatas2{$_l_Build}="")
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
														End if 
													: ($_at_HeaderItems2{$_l_Build}="Description")
														$_l_Position:=Find in array:C230($_at_HeaderItems; "Description")
														If ($_l_Position>0)
															$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
														End if 
													: ($_at_HeaderItems2{$_l_Build}="Modified Date")
													: ($_at_HeaderItems2{$_l_Build}="Modified By")
													: ($_at_HeaderItems2{$_l_Build}="Modified Notes")
														$_l_Position:=Find in array:C230($_at_HeaderItems; "Amendments")
														If ($_l_Position>0)
															$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
														End if 
												End case 
											End for 
											$_t_NewBit:="IF(FALSE)"+Char:C90(13)
											$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Name")
											$_t_Name:=""
											$_t_Description:=""
											$_t_Revisions:=""
											If ($_l_Ref>0)
												$_t_Name:=$_at_HeaderDatas2{$_l_Ref}
											Else 
												$_t_Name:=$_t_MethodNameStripped
											End if 
											$_t_NewBit:=$_t_NewBit+"//Project Form Method Name: "+$_t_Name+Char:C90(13)
											$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Description")
											If ($_l_Ref>0)
												$_t_Description:=$_at_HeaderDatas2{$_l_Ref}
											End if 
											For ($_l_Index4; 1; 10)
												$_t_Description:=Replace string:C233($_t_Description; Char:C90(13)+Char:C90(13); Char:C90(13))
											End for 
											If ($_t_Description#"")
												$_l_Length:=Length:C16($_t_Description)
												If ($_t_Description[[Length:C16($_t_Description)]]=Char:C90(13))
													$_t_Description:=Substring:C12($_t_Description; 1; $_l_Length-1)
												End if 
											End if 
											$_t_NewBit:=$_t_NewBit+"//------------------ Method Notes ------------------"+$_t_Description+Char:C90(13)
											$_t_NewBit:=$_t_NewBit+"//------------------ Revision Control ----------------"+Char:C90(13)
											$_t_DateCreated:=""
											$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Created Date")
											If ($_l_Ref>0)
												$_t_DateCreated:=$_at_HeaderDatas2{$_l_Ref}
											End if 
											If ($_t_DateCreated#"")
												$_l_Length:=Length:C16($_t_DateCreated)
												If ($_t_DateCreated[[Length:C16($_t_DateCreated)]]=Char:C90(13))
													$_t_DateCreated:=Substring:C12($_t_DateCreated; 1; $_l_Length-1)
												End if 
											End if 
											$_t_NewBit:=$_t_NewBit+"//Date Created: "+$_t_DateCreated+Char:C90(13)
											$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Creator")
											$_t_Creator:=""
											If ($_l_Ref>0)
												$_t_Creator:=$_at_HeaderDatas2{$_l_Ref}
											End if 
											If ($_t_Creator#"")
												$_l_Length:=Length:C16($_t_Creator)
												If ($_t_Creator[[Length:C16($_t_Creator)]]=Char:C90(13))
													$_t_Creator:=Substring:C12($_t_Creator; 1; $_l_Length-1)
												End if 
											End if 
											$_t_NewBit:=$_t_NewBit+"//Created BY: "+$_t_Creator+Char:C90(13)
											$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Date")
											$_t_DateModified:=""
											If ($_l_Ref>0)
												$_t_DateModified:=$_at_HeaderDatas2{$_l_Ref}
											End if 
											If ($_t_DateModified#"")
												$_l_Length:=Length:C16($_t_DateModified)
												If ($_t_DateModified[[Length:C16($_t_DateModified)]]=Char:C90(13))
													$_t_DateModified:=Substring:C12($_t_DateModified; 1; $_l_Length-1)
												End if 
											End if 
											$_t_NewBit:=$_t_NewBit+"//Date Modified: "+$_t_DateModified+Char:C90(13)
											$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified By")
											$_t_Modifier:=""
											If ($_l_Ref>0)
												$_t_Modifier:=$_at_HeaderDatas2{$_l_Ref}
											End if 
											If ($_t_Modifier#"")
												$_l_Length:=Length:C16($_t_Modifier)
												If ($_t_Modifier[[Length:C16($_t_Modifier)]]=Char:C90(13))
													$_t_Modifier:=Substring:C12($_t_Modifier; 1; $_l_Length-1)
												End if 
											End if 
											$_t_NewBit:=$_t_NewBit+"//Modified By "+$_t_Modifier+Char:C90(13)
											$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Notes")
											$_t_Notes:=""
											If ($_l_Ref>0)
												$_t_Notes:=$_at_HeaderDatas2{$_l_Ref}
											End if 
											For ($_l_Index4; 1; 10)
												$_t_Notes:=Replace string:C233($_t_Notes; Char:C90(13)+Char:C90(13); Char:C90(13))
											End for 
											If ($_t_Notes#"")
												$_l_Length:=Length:C16($_t_Notes)
												If ($_t_Notes[[Length:C16($_t_Notes)]]=Char:C90(13))
													$_t_Notes:=Substring:C12($_t_Notes; 1; $_l_Length-1)
												End if 
											End if 
											$_t_NewBit:=$_t_NewBit+"//Modification notes "+Char:C90(13)
											$_t_NewBit:=$_t_NewBit+$_t_Notes+Char:C90(13)
											$_t_NewBit:=$_t_NewBit+"END IF"+Char:C90(13)
											$_t_NewMethodText:=$_t_NewBit+Char:C90(13)+$_t_NewHeader+$_t_MethodText
											If ($_t_MethodTextOLD#$_t_NewMethodText)
												METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
											End if 
										Else 
											//TRACE
										End if 
									End if 
									$_bo_MergeHeaders:=False:C215
							End case 
							METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
							$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
							If ($_l_Position>0)
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
								For ($_l_Position; 1; Length:C16($_t_MethodText))
									If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
										If (Length:C16($_t_methodText)>$_l_Position)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
										Else 
											$_t_MethodText:=""
										End if 
										$_l_Position:=999999
									End if 
								End for 
							End if 
							$_t_MethodTextOLD:=$_t_MethodText
							$_bo_Exit:=False:C215
							Repeat 
								If ($_t_MethodText#"")
									If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
										$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
									Else 
										$_bo_Exit:=True:C214
									End if 
								End if 
							Until ($_bo_Exit) | ($_t_MethodText="")
							
							$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
							If ($_l_Position>0)  //it would be odd iff it is not here
								$_t_Header:=Substring:C12($_t_MethodText; 1; $_l_Position)
								If (Length:C16($_t_methodText)>$_l_Position)
									$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
								Else 
									$_t_MethodText:=""
								End if 
								
								$_t_NewMethodText:=""
								Repeat 
									$_l_EndofLine:=Position:C15(Char:C90(13); $_t_MethodText)
									If ($_l_EndofLine>0)
										$_t_ThisLine:=Substring:C12($_t_MethodText; 1; $_l_EndofLine-1)
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_EndofLine+1)
									Else 
										$_t_ThisLine:=$_t_MethodText
										$_t_MethodText:=""
									End if 
									$_bo_Exit:=False:C215
									Repeat 
										If ($_t_ThisLine#"")
											If ($_t_ThisLine[[1]]=Char:C90(9)) | ($_t_ThisLine[[1]]=" ")
												$_t_ThisLine:=Substring:C12($_t_ThisLine; 2)
											Else 
												$_bo_Exit:=True:C214
											End if 
										End if 
									Until ($_t_ThisLine="") | ($_bo_Exit)
									Case of 
										: ($_t_ThisLine="C_String@")
										: ($_t_ThisLine="_o_C_String@")
										: ($_t_ThisLine="C_Text@")
										: ($_t_ThisLine="C_Longint@")
										: ($_t_ThisLine="_o_C_integer@")
										: ($_t_ThisLine="C_OBJECT@")
										: ($_t_ThisLine="C_BOOLEAN@")
										: ($_t_ThisLine="C_TIME@")
										: ($_t_ThisLine="C_BLOB@")
										: ($_t_ThisLine="C_Date@")
										: ($_t_ThisLine="C_picture@")
										: ($_t_ThisLine="C_pointer@")
										: ($_t_ThisLine="C_Real@")
										: ($_t_ThisLine="C_picture@")
											
										Else 
											$_t_NewMethodText:=$_t_NewMethodText+Char:C90(13)+$_t_ThisLine
											
									End case 
									
								Until ($_t_MethodText="")
								For ($_l_Index4; 1; 20)
									$_t_Header:=Replace string:C233($_t_Header; Char:C90(13)+Char:C90(13); Char:C90(13))
								End for 
								$_t_NewMethodText:=$_t_Header+$_t_NewMethodText
								For ($_l_Index4; 1; 20)
									$_t_NewMethodText:=Replace string:C233($_t_NewMethodText; Char:C90(13)+Char:C90(13)+"  //Code Starts Here"; Char:C90(13)+"  //Code Starts Here")
								End for 
								If ($_t_MethodTextOLD#$_t_NewMethodText)
									METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
									
									
									METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
									
									$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
									If ($_l_Position>0)
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
										For ($_l_Position; 1; Length:C16($_t_MethodText))
											If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
												If (Length:C16($_t_methodText)>$_l_Position)
													$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
												Else 
													$_t_MethodText:=""
												End if 
												$_l_Position:=999999
											End if 
										End for 
									End if 
									$_t_MethodTextOLD:=$_t_MethodText
									$_bo_Exit:=False:C215
									Repeat 
										If ($_t_MethodText#"")
											If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
												$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
											Else 
												$_bo_Exit:=True:C214
											End if 
										End if 
									Until ($_bo_Exit) | ($_t_MethodText="")
									
								End if 
								$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
								If ($_l_Position>0)  //it would be odd iff it is not here
									$_T_Header:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16(" //Code Starts Here"))
									$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" //Code Starts Here")+1)
									$_t_MethodText:=STR_RemoveLeadTrailSpace($_t_MethodText)
									$_l_Position:=Position:C15("$_t_oldMethodName:=ERR_MethodTracker ("; $_t_MethodText)
									If ($_l_Position>1)
										If ($_t_MethodText[[$_l_Position-1]]="/")
											$_l_Position:=0
										End if 
									End if 
									If ($_l_Position=0) | ($_l_Position>20)
										$_t_MethodText:="$_t_oldMethodName:=ERR_MethodTracker ("+Char:C90(34)+"FM "+$_t_MethodNameStripped+Char:C90(34)+";FORM EVENT)"+Char:C90(13)+$_t_MethodText
									End if 
									$_bo_exit:=False:C215
									Repeat 
										If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(9)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=" ")
											$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
										Else 
											$_bo_exit:=True:C214
										End if 
									Until ($_bo_exit)
									$_bo_exit:=False:C215
									
									For ($_l_LastLine; Length:C16($_t_MethodText); 1; -1)
										
										If ($_t_MethodText[[$_l_LastLine]]=Char:C90(13))
											$_t_LastLine:=Substring:C12($_t_MethodText; $_l_LastLine+1)
											$_t_MethodText:=Substring:C12($_t_MethodText; 1; $_l_LastLine-1)
											$_l_LastLine:=0
											$_t_LastLine:=STR_RemoveLeadTrailSpace($_t_LastLine)
											If (Position:C15("ERR_MethodTrackerReturn"; $_t_LastLine)=0)
												
												$_t_LastLine:=$_t_LastLine+Char:C90(13)+"ERR_MethodTrackerReturn("+Char:C90(34)+"FM "+$_t_MethodNameStripped+Char:C90(34)+";$_t_oldMethodName)"
												$_bo_exit:=False:C215
											End if 
											Repeat 
												If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(9)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=" ")
													
													$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
												Else 
													$_bo_exit:=True:C214
												End if 
											Until ($_bo_exit)
											$_t_MethodText:=$_T_Header+$_t_MethodText+Char:C90(13)+$_t_LastLine
											If ($_t_MethodTextOLD#$_t_MethodText)
												METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
												If ($_t_MethodText#"")
													//DIFFu_DBCodemanager ($_t_MethodName;Path project form;True)
													EXECUTE METHOD:C1007("DIFFu_DBCodemanager"; *; $_t_MethodName; Path project form:K72:3; True:C214)
													
												End if 
											End if 
											
											
											
										End if 
									End for 
									
									
									
								End if 
								
							End if 
							
						End if 
						METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
						$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
						If ($_l_Position>0)
							$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
							For ($_l_Position; 1; Length:C16($_t_MethodText))
								If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
									If (Length:C16($_t_methodText)>$_l_Position)
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
									Else 
										$_t_MethodText:=""
									End if 
									$_l_Position:=Length:C16($_t_MethodText)*2
								End if 
							End for 
						End if 
						$_bo_InsertCHanges:=False:C215
						If (False:C215)
							$_l_Position:=Position:C15("$_t_oldMethodName:=ERR_MethodTracker"; $_t_MethodText)
							If ($_l_Position>0)
								$_t_before:=Substring:C12($_t_MethodText; $_l_Position-1)
								$_t_After:=Substring:C12($_t_MethodText; $_l_Position)
								For ($_l_EndofLine; 1; Length:C16($_t_After))
									If ($_t_After[[$_l_EndofLine]]=Char:C90(10)) | ($_t_After[[$_l_EndofLine]]=Char:C90(13))
										$_t_ThisLine:=Substring:C12($_t_After; 1; $_l_EndofLine-1)
										$_l_EndofLine2:=Length:C16($_t_After)
										$_t_After:=Substring:C12($_t_After; $_l_EndofLine+1)
										$_l_EndofLine:=$_l_EndofLine2
										$_l_position2:=Position:C15($_t_ThisLine; $_t_After)
										If ($_l_position2>0)
											$_t_After:=Replace string:C233($_t_After; $_t_ThisLine; "")
											$_t_MethodText:=$_t_before+$_t_ThisLine+Char:C90(13)+$_t_After
											$_bo_InsertCHanges:=True:C214
										End if 
									End if 
								End for 
							End if 
						End if 
						Repeat 
							$_l_Position:=Position:C15("_O_ENABLE BUTTON"; $_t_MethodText)
							If ($_l_Position>0)
								
								$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
								$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_ENABLE BUTTON"))
								//We need to now find the end of the line(")"
								$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
								If ($_l_Position2>0)
									$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
									$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
									$_t_ThisLIne:="Object Set Enabled"+$_t_ThisLIne+";TRUE)"
									$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
									$_bo_InsertCHanges:=False:C215
								End if 
							End if 
						Until ($_l_Position=0)
						Repeat 
							$_l_Position:=Position:C15("_O_DISABLE BUTTON"; $_t_MethodText)
							If ($_l_Position>0)
								
								$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
								$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_DISABLE BUTTON"))
								//We need to now find the end of the line(")"
								$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
								If ($_l_Position2>0)
									$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
									$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
									$_t_ThisLIne:="Object Set Enabled"+$_t_ThisLIne+";FALSE)"
									$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
									$_bo_InsertCHanges:=False:C215
								End if 
							End if 
						Until ($_l_Position=0)
						//_o_REDRAW LIST
						$_t_StoreBefore:=""
						Repeat 
							$_l_Position:=Position:C15("_o_REDRAW LIST"; $_t_MethodText)
							If ($_l_Position>0)
								//TRACE
								$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
								$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_o_REDRAW LIST"))
								//We need to now find the end of the line(")"
								$_t_BeforeEnd:=Substring:C12($_T_MethodBefore; Length:C16($_T_MethodBefore)-2)
								If ($_t_BeforeEnd#"//")
									$_t_StoreBefore:=$_t_StoreBefore+$_T_MethodBefore+"//_o_REDRAW LIST"
									$_t_MethodText:=$_T_MethodAfter
									$_bo_InsertCHanges:=True:C214
								Else 
									$_t_StoreBefore:=$_t_StoreBefore+$_T_MethodBefore+"_o_REDRAW LIST"
									$_t_MethodText:=$_T_MethodAfter
									//dont change the flag
								End if 
							End if 
						Until ($_l_Position=0)
						If ($_t_StoreBefore#"")
							$_t_MethodText:=$_t_StoreBefore+$_t_MethodText
						End if   //_O_C_STRING(20;$SD_S20_DiaryResultCode)
						Repeat 
							$_l_Position:=Position:C15("_O_C_STRING"; $_t_MethodText)
							If ($_l_Position>0)
								
								$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
								$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_C_STRING"))
								//We need to now find the end of the line(")"
								$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
								If ($_l_Position2>0)
									$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
									$_l_Position:=Position:C15(";"; $_t_ThisLIne)
									$_t_ThisLIne:=Substring:C12($_t_ThisLIne; $_l_Position+1)
									$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
									$_t_ThisLIne:="C_TEXT("+$_t_ThisLIne+")"
									$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
									$_bo_InsertCHanges:=True:C214
								End if 
							End if 
						Until ($_l_Position=0)
						Repeat 
							$_l_Position:=Position:C15("_O_C_INTEGER"; $_t_MethodText)
							If ($_l_Position>0)
								
								$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
								$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_C_INTEGER"))
								//We need to now find the end of the line(")"
								$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
								If ($_l_Position2>0)
									$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
									$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
									$_t_ThisLIne:="C_LONGINT"+$_t_ThisLIne+")"
									$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
									$_bo_InsertCHanges:=False:C215
								End if 
							End if 
						Until ($_l_Position=0)
						//Array string(20;$SD_S20_DiaryResultCode)
						Repeat 
							$_l_Position:=Position:C15("_O_ARRAY STRING"; $_t_MethodText)
							If ($_l_Position>0)
								
								$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
								$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_ARRAY STRING"))
								//We need to now find the end of the line(")"
								$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
								If ($_l_Position2>0)
									$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
									$_l_Position:=Position:C15(";"; $_t_ThisLIne)
									$_t_ThisLIne:=Substring:C12($_t_ThisLIne; $_l_Position+1)
									$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
									$_t_ThisLIne:="ARRAY TEXT("+$_t_ThisLIne+")"
									$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
									$_bo_InsertCHanges:=True:C214
								End if 
							End if 
						Until ($_l_Position=0)
						
						$_l_Position:=Position:C15("//C_Unknown($_t"; $_t_MethodText)
						If ($_l_Position=0)
							$_l_Position:=Position:C15("//C_Unknown($_i"; $_t_MethodText)
							If ($_l_Position=0)
								$_l_Position:=Position:C15("//C_Unknown($_a"; $_t_MethodText)
								
								If ($_l_Position=0)
									$_l_Position:=Position:C15("//C_Unknown($_l"; $_t_MethodText)
								Else 
									$_l_Position:=Position:C15("//C_Unknown"; $_t_MethodText)
								End if 
							End if 
						End if 
						If ($_l_Position>0) | ($_bo_InsertCHanges)  //force a save
							$_t_MethodText:=$_t_MethodText+" "
							METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
						End if 
					End if 
				Else 
					If (Not:C34($_bo_Ignore))
						$_t_MethodName:=$_at_MethodPaths{$_l_Index}
						////TRACE
						MESSAGE:C88($_at_FormNames{$_l_CurrentForm}+$_t_MethodName+" "+String:C10($_l_Index)+" of "+String:C10($_l_SizeofArray))
						
						$_t_MethodNameStripped:=Replace string:C233($_t_MethodName; "{formmethod}"; "")
						$_t_MethodNameStripped:=Replace string:C233($_t_MethodNameStripped; "[projectForm]/"; "")
						$_t_MethodNameStripped:=Replace string:C233($_t_MethodNameStripped; "/"; ".")
						
						METHOD GET MODIFICATION DATE:C1170($_t_MethodName; $_Dte_ModificationDate; $_ti_ModificationTime; *)
						METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
						
						$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
						If ($_l_Position>0)
							$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
							For ($_l_Position; 1; Length:C16($_t_MethodText))
								If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
									If (Length:C16($_t_methodText)>$_l_Position)
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
									Else 
										$_t_MethodText:=""
									End if 
									$_l_Position:=999999
								End if 
							End for 
						End if 
						$_t_MethodTextOLD:=$_t_MethodText
						$_bo_Exit:=False:C215
						Repeat 
							If ($_t_MethodText#"")
								If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
									$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
								Else 
									$_bo_Exit:=True:C214
								End if 
							End if 
						Until ($_bo_Exit) | ($_t_MethodText="")
						If ($_t_MethodText#"")
							$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
							Case of 
								: ($_l_Position=0)  //there is no new header
									//take out the old header save then put the new header text in
									$_l_Position:=Position:C15("//Creator: "; $_t_MethodText)
									
									
									If ($_l_Position>0)
										$_t_OldMethodText:=$_t_MethodText
										$_t_BeforeCreator:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
										$_l_Position:=Position:C15("Amendments"; $_t_MethodText)
										If ($_l_Position>0)
											$_t_beforeAmend:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
											$_l_Position:=Position:C15("END IF"; $_t_MethodText)
											$_t_PrependBefore:=""
											Repeat 
												
												$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
												For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
													Case of 
														: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
															//this is a commented out line
															//so get the next end if
															$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
															$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
															$_l_CheckifComment:=0
														: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
															//this is not a comment
															$_l_CheckifComment:=0
															$_bo_NotComment:=True:C214
														: ($_l_CheckifComment=1)
															$_l_CheckifComment:=0
															$_bo_NotComment:=True:C214
													End case 
												End for 
												$_l_Position:=Position:C15("END IF"; $_t_MethodText)
											Until ($_bo_NotComment)
											If ($_t_PrependBefore#"")
												$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
											End if 
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
											$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
											$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
											If ($_l_PositionHeaderStart>0)
												$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
												$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
												ARRAY TEXT:C222($_at_HeaderLines; 0)
												Repeat 
													$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
													If ($_l_Position>0)
														APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
														$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
														
													Else 
														APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
														$_t_Header:=""
													End if 
												Until ($_l_Position=0)
												ARRAY TEXT:C222($_at_HeaderItems; 0)
												ARRAY TEXT:C222($_at_HeaderDatas; 0)
												DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
												$_bo_MergeHeaders:=True:C214
												If ($_t_MethodTextOLD#$_t_MethodText)
													METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
													If ($_t_MethodText#"")
														//DIFFu_DBCodemanager ($_t_MethodName;Path project form+99;True)
														EXECUTE METHOD:C1007("DIFFu_DBCodemanager"; *; $_t_MethodName; Path project form:K72:3+99; True:C214)
														
													End if 
													METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
													$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
													If ($_l_Position>0)
														$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
														For ($_l_Position; 1; Length:C16($_t_MethodText))
															If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
																If (Length:C16($_t_methodText)>$_l_Position)
																	$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
																Else 
																	$_t_MethodText:=""
																End if 
																$_l_Position:=999999
															End if 
														End for 
													End if 
													$_t_MethodTextOLD:=$_t_MethodText
													$_bo_Exit:=False:C215
													Repeat 
														If ($_t_MethodText#"")
															If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
																$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
															Else 
																$_bo_Exit:=True:C214
															End if 
														End if 
													Until ($_bo_Exit) | ($_t_MethodText="")
												End if 
												//now the new header should be here
												$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
												If ($_l_Position>0)
													$_bo_MergeHeaders:=True:C214
													$_t_NewHeader:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16(" //Code Starts Here"))
													$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" //Code Starts Here")+1)
													If ($_bo_MergeHeaders)
														$_l_Position:=Position:C15("//Variable Declarations"; $_t_NewHeader)
														If ($_l_Position>0)
															$_t_newBit:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
															$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
															ARRAY TEXT:C222($_at_HeaderLines2; 0)
															Repeat 
																$_l_Position:=Position:C15(Char:C90(13); $_t_newBit)
																If ($_l_Position>0)
																	APPEND TO ARRAY:C911($_at_HeaderLines2; Substring:C12($_t_newBit; 1; $_l_Position-1))
																	$_t_newBit:=Substring:C12($_t_newBit; $_l_Position+1)
																	
																Else 
																	APPEND TO ARRAY:C911($_at_HeaderLines2; $_t_newBit)
																	$_t_newBit:=""
																End if 
															Until ($_l_Position=0)
															
															$_bo_MergeHeaders:=True:C214
															ARRAY TEXT:C222($_at_HeaderItems2; 0)
															ARRAY TEXT:C222($_at_HeaderDatas2; 0)
															DB_FixMethods2019GetHeader("NEW"; ->$_at_HeaderLines2; ->$_at_HeaderItems2; ->$_at_HeaderDatas2)
															For ($_l_Build; 1; Size of array:C274($_at_HeaderItems2))
																Case of 
																	: ($_at_HeaderItems2{$_l_Build}="Creator")
																		$_l_Position:=Find in array:C230($_at_HeaderItems; "Creator")
																		If ($_l_Position>0)
																			$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																		End if 
																	: ($_at_HeaderItems2{$_l_Build}="Created Date")
																		$_l_Position:=Find in array:C230($_at_HeaderItems; "Created Date")
																		If ($_l_Position>0)
																			$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																		End if 
																	: ($_at_HeaderItems2{$_l_Build}="Name")
																		$_l_Position:=Find in array:C230($_at_HeaderItems; "Method Name")
																		If ($_l_Position>0)
																			If ($_at_HeaderDatas2{$_l_Build}="")
																				$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																			End if 
																		End if 
																	: ($_at_HeaderItems2{$_l_Build}="Description")
																		$_l_Position:=Find in array:C230($_at_HeaderItems; "Description")
																		If ($_l_Position>0)
																			$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																		End if 
																	: ($_at_HeaderItems2{$_l_Build}="Modified Date")
																	: ($_at_HeaderItems2{$_l_Build}="Modified By")
																	: ($_at_HeaderItems2{$_l_Build}="Modified Notes")
																		$_l_Position:=Find in array:C230($_at_HeaderItems; "Amendments")
																		If ($_l_Position>0)
																			$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																		End if 
																End case 
															End for 
															$_t_NewBit:="IF(FALSE)"+Char:C90(13)
															$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Name")
															$_t_Name:=""
															$_t_Description:=""
															$_t_Revisions:=""
															If ($_l_Ref>0)
																$_t_Name:=$_at_HeaderDatas2{$_l_Ref}
															Else 
																$_t_name:=$_t_MethodNameStripped
																
															End if 
															$_t_NewBit:=$_t_NewBit+"//object Name: "+$_t_Name+Char:C90(13)
															$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Description")
															If ($_l_Ref>0)
																$_t_Description:=$_at_HeaderDatas2{$_l_Ref}
															End if 
															For ($_l_Index4; 1; 10)
																$_t_Description:=Replace string:C233($_t_Description; Char:C90(13)+Char:C90(13); Char:C90(13))
															End for 
															If ($_t_Description#"")
																$_l_Length:=Length:C16($_t_Description)
																If ($_t_Description[[Length:C16($_t_Description)]]=Char:C90(13))
																	$_t_Description:=Substring:C12($_t_Description; 1; $_l_Length-1)
																End if 
															End if 
															$_t_NewBit:=$_t_NewBit+"//------------------ Method Notes ------------------"+$_t_Description+Char:C90(13)
															$_t_NewBit:=$_t_NewBit+"//------------------ Revision Control ----------------"+Char:C90(13)
															$_t_DateCreated:=""
															$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Created Date")
															If ($_l_Ref>0)
																$_t_DateCreated:=$_at_HeaderDatas2{$_l_Ref}
															End if 
															If ($_t_DateCreated#"")
																$_l_Length:=Length:C16($_t_DateCreated)
																If ($_t_DateCreated[[Length:C16($_t_DateCreated)]]=Char:C90(13))
																	$_t_DateCreated:=Substring:C12($_t_DateCreated; 1; $_l_Length-1)
																End if 
															End if 
															$_t_NewBit:=$_t_NewBit+"//Date Created: "+$_t_DateCreated+Char:C90(13)
															$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Creator")
															$_t_Creator:=""
															If ($_l_Ref>0)
																$_t_Creator:=$_at_HeaderDatas2{$_l_Ref}
															End if 
															If ($_t_Creator#"")
																$_l_Length:=Length:C16($_t_Creator)
																If ($_t_Creator[[Length:C16($_t_Creator)]]=Char:C90(13))
																	$_t_Creator:=Substring:C12($_t_Creator; 1; $_l_Length-1)
																End if 
															End if 
															$_t_NewBit:=$_t_NewBit+"//Created BY: "+$_t_Creator+Char:C90(13)
															$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Date")
															$_t_DateModified:=""
															If ($_l_Ref>0)
																$_t_DateModified:=$_at_HeaderDatas2{$_l_Ref}
															End if 
															If ($_t_DateModified#"")
																$_l_Length:=Length:C16($_t_DateModified)
																If ($_t_DateModified[[Length:C16($_t_DateModified)]]=Char:C90(13))
																	$_t_DateModified:=Substring:C12($_t_DateModified; 1; $_l_Length-1)
																End if 
															End if 
															$_t_NewBit:=$_t_NewBit+"//Date Modified: "+$_t_DateModified+Char:C90(13)
															$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified By")
															$_t_Modifier:=""
															If ($_l_Ref>0)
																$_t_Modifier:=$_at_HeaderDatas2{$_l_Ref}
															End if 
															If ($_t_Modifier#"")
																$_l_Length:=Length:C16($_t_Modifier)
																If ($_t_Modifier[[Length:C16($_t_Modifier)]]=Char:C90(13))
																	$_t_Modifier:=Substring:C12($_t_Modifier; 1; $_l_Length-1)
																End if 
															End if 
															$_t_NewBit:=$_t_NewBit+"//Modified By "+$_t_Modifier+Char:C90(13)
															$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Notes")
															$_t_Notes:=""
															If ($_l_Ref>0)
																$_t_Notes:=$_at_HeaderDatas2{$_l_Ref}
															End if 
															For ($_l_Index4; 1; 10)
																$_t_Notes:=Replace string:C233($_t_Notes; Char:C90(13)+Char:C90(13); Char:C90(13))
															End for 
															If ($_t_Notes#"")
																$_l_Length:=Length:C16($_t_Notes)
																If ($_t_Notes[[Length:C16($_t_Notes)]]=Char:C90(13))
																	$_t_Notes:=Substring:C12($_t_Notes; 1; $_l_Length-1)
																End if 
															End if 
															$_t_NewBit:=$_t_NewBit+"//Modification notes "+Char:C90(13)
															$_t_NewBit:=$_t_NewBit+$_t_Notes+Char:C90(13)
															$_t_NewBit:=$_t_NewBit+"END IF"+Char:C90(13)
															$_t_NewMethodText:=$_t_NewBit+Char:C90(13)+$_t_NewHeader+$_t_MethodText
															If ($_t_MethodTextOLD#$_t_NewMethodText)
																
																METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
																
															End if 
														Else 
															//TRACE
														End if 
													End if 
													$_bo_MergeHeaders:=False:C215
													
												Else 
													//TRACE
												End if 
											Else 
												//this would be strange
												//TRACE
												
											End if 
										Else 
											//this would be strange
											//TRACE
										End if 
									Else 
										If ($_t_MethodTextOLD#$_t_MethodText)
											METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
										End if 
										If ($_t_MethodText#"")
											//DIFFu_DBCodemanager ($_t_MethodName;Path project form+99;True)
											EXECUTE METHOD:C1007("DIFFu_DBCodemanager"; *; $_t_MethodName; Path project form:K72:3+99; True:C214)
											
											$_l_Index:=$_l_Index-1
										End if 
										////TRACE
									End if 
								: ($_l_Position>0)
									//find the old header-if it is there and replace it.
									$_l_PositionCompiler1:=Position:C15("//Variable Declarations"; $_t_MethodText)
									$_t_Delcarations:=Substring:C12($_t_MethodText; $_l_PositionCompiler1; $_l_Position)
									DB_FixMethodDeclarations2020($_t_MethodName; $_t_Delcarations; ->$_at_AllArrayNames; ->$_al_AllArrayTypes; ->$_at_AllVarNames; ->$_al_all_VarTypes; ->$_at_MethodDeclares; ->$_at_MethodNames; ->$_al_DeclareType)
									
									$_t_NewHeader:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16(" //Code Starts Here"))
									$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" //Code Starts Here")+1)
									//now we have 3 possible outcomes
									//1)there is no old header-do nothing-its a new method
									//2) there is an old header on the remaing text-this will the normal
									//3) i have extracted the header already and stuck into the new header
									///
									$_l_Position:=Position:C15("//Creator: "; $_t_MethodText)
									If ($_l_Position=0)
										$_l_Position:=Position:C15("// Creator:"; $_t_MethodText)
									End if 
									$_bo_MergeHeaders:=False:C215
									
									If ($_l_Position>0)  //this is scenario 1.. we want to take out the old header
										
										$_t_BeforeCreator:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
										$_l_Position:=Position:C15("Amendments"; $_t_MethodText)
										If ($_l_Position>0)
											$_t_beforeAmend:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
											$_l_Position:=Position:C15("END IF"; $_t_MethodText)
											$_t_PrependBefore:=""
											Repeat 
												
												$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
												For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
													Case of 
														: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
															//this is a commented out line
															//so get the next end if
															$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
															$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
															$_l_CheckifComment:=0
														: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
															//this is not a comment
															$_l_CheckifComment:=0
															$_bo_NotComment:=True:C214
														: ($_l_CheckifComment=1)
															$_l_CheckifComment:=0
															$_bo_NotComment:=True:C214
													End case 
												End for 
												$_l_Position:=Position:C15("END IF"; $_t_MethodText)
											Until ($_bo_NotComment)
											If ($_t_PrependBefore#"")
												$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
											End if 
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
											$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
											$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
											If ($_l_PositionHeaderStart>0)
												$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
												$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
												ARRAY TEXT:C222($_at_HeaderLines; 0)
												Repeat 
													$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
													If ($_l_Position>0)
														APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
														$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
														
													Else 
														APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
														$_t_Header:=""
													End if 
												Until ($_l_Position=0)
												ARRAY TEXT:C222($_at_HeaderItems; 0)
												ARRAY TEXT:C222($_at_HeaderDatas; 0)
												DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
												
												$_bo_MergeHeaders:=True:C214
												
												$_t_NewMethodText:=$_t_NewHeader+$_t_MethodText
												If ($_t_MethodTextOLD#$_t_NewMethodText)
													METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
													
													
												End if 
												
												
												
											Else 
												//this would be strange
												//TRACE
												
											End if 
										Else 
											//this would be strange
											//TRACE
										End if 
									Else 
										//there is no old header in the text
										//we now want to look for the old header in the new header..
										///
										$_l_Position:=Position:C15("//Creator: "; $_t_NewHeader)
										If ($_l_Position=0)
											$_l_Position:=Position:C15("// Creator:"; $_t_NewHeader)
										End if 
										
										If ($_l_Position>0)
											$_t_BeforeCreator:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
											$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
											$_l_Position:=Position:C15("Amendments"; $_t_NewHeader)
											If ($_l_Position>0)
												$_t_beforeAmend:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
												$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
												$_l_Position:=Position:C15("END IF"; $_t_NewHeader)
												$_t_PrependBefore:=""
												Repeat 
													
													$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
													For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
														Case of 
															: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
																//this is a commented out line
																//so get the next end if
																$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
																$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
																$_l_CheckifComment:=0
															: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
																//this is not a comment
																$_l_CheckifComment:=0
																$_bo_NotComment:=True:C214
															: ($_l_CheckifComment=1)
																$_l_CheckifComment:=0
																$_bo_NotComment:=True:C214
														End case 
													End for 
													$_l_Position:=Position:C15("END IF"; $_t_MethodText)
												Until ($_bo_NotComment)
												If ($_t_PrependBefore#"")
													$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
												End if 
												$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position+Length:C16("END IF")+1)
												$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
												
												$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
												If ($_l_PositionHeaderStart>0)
													$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
													$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
													ARRAY TEXT:C222($_at_HeaderLines; 0)
													Repeat 
														$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
														If ($_l_Position>0)
															APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
															$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
															
														Else 
															APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
															$_t_Header:=""
														End if 
													Until ($_l_Position=0)
													ARRAY TEXT:C222($_at_HeaderItems; 0)
													ARRAY TEXT:C222($_at_HeaderDatas; 0)
													DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
													$_bo_MergeHeaders:=True:C214
													
													//METHOD SET CODE($_t_MethodName;$_t_MethodText)
													//Now re-get the method code
													//METHOD GET CODE($_t_MethodName;$_t_MethodText)
													
													
												Else 
													//this would be strange
													//TRACE
													
												End if 
											Else 
												//this would be strange
												////TRACE
											End if 
										Else 
											/////TRACE
										End if 
										
										///
									End if 
									//now extract the data from the important bit of the new header
									If ($_bo_MergeHeaders)
										$_l_Position:=Position:C15("//Variable Declarations"; $_t_NewHeader)
										If ($_l_Position>0)
											$_t_newBit:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
											$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
											ARRAY TEXT:C222($_at_HeaderLines2; 0)
											Repeat 
												$_l_Position:=Position:C15(Char:C90(13); $_t_newBit)
												If ($_l_Position>0)
													APPEND TO ARRAY:C911($_at_HeaderLines2; Substring:C12($_t_newBit; 1; $_l_Position-1))
													$_t_newBit:=Substring:C12($_t_newBit; $_l_Position+1)
													
												Else 
													APPEND TO ARRAY:C911($_at_HeaderLines2; $_t_newBit)
													$_t_newBit:=""
												End if 
											Until ($_l_Position=0)
											
											$_bo_MergeHeaders:=True:C214
											ARRAY TEXT:C222($_at_HeaderItems2; 0)
											ARRAY TEXT:C222($_at_HeaderDatas2; 0)
											DB_FixMethods2019GetHeader("NEW"; ->$_at_HeaderLines2; ->$_at_HeaderItems2; ->$_at_HeaderDatas2)
											For ($_l_Build; 1; Size of array:C274($_at_HeaderItems2))
												Case of 
													: ($_at_HeaderItems2{$_l_Build}="Creator")
														$_l_Position:=Find in array:C230($_at_HeaderItems; "Creator")
														If ($_l_Position>0)
															$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
														End if 
													: ($_at_HeaderItems2{$_l_Build}="Created Date")
														$_l_Position:=Find in array:C230($_at_HeaderItems; "Created Date")
														If ($_l_Position>0)
															$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
														End if 
													: ($_at_HeaderItems2{$_l_Build}="Name")
														$_l_Position:=Find in array:C230($_at_HeaderItems; "Method Name")
														If ($_l_Position>0)
															If ($_at_HeaderDatas2{$_l_Build}="")
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
														End if 
													: ($_at_HeaderItems2{$_l_Build}="Description")
														$_l_Position:=Find in array:C230($_at_HeaderItems; "Description")
														If ($_l_Position>0)
															$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
														End if 
													: ($_at_HeaderItems2{$_l_Build}="Modified Date")
													: ($_at_HeaderItems2{$_l_Build}="Modified By")
													: ($_at_HeaderItems2{$_l_Build}="Modified Notes")
														$_l_Position:=Find in array:C230($_at_HeaderItems; "Amendments")
														If ($_l_Position>0)
															$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
														End if 
												End case 
											End for 
											$_t_NewBit:="IF(FALSE)"+Char:C90(13)
											$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Name")
											$_t_Name:=""
											$_t_Description:=""
											$_t_Revisions:=""
											If ($_l_Ref>0)
												$_t_Name:=$_at_HeaderDatas2{$_l_Ref}
											Else 
												$_t_Name:=$_t_MethodNameStripped
											End if 
											$_t_NewBit:=$_t_NewBit+"//object Method Name: "+$_t_Name+Char:C90(13)
											$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Description")
											If ($_l_Ref>0)
												$_t_Description:=$_at_HeaderDatas2{$_l_Ref}
											End if 
											For ($_l_Index4; 1; 10)
												$_t_Description:=Replace string:C233($_t_Description; Char:C90(13)+Char:C90(13); Char:C90(13))
											End for 
											If ($_t_Description#"")
												$_l_Length:=Length:C16($_t_Description)
												If ($_t_Description[[Length:C16($_t_Description)]]=Char:C90(13))
													$_t_Description:=Substring:C12($_t_Description; 1; $_l_Length-1)
												End if 
											End if 
											$_t_NewBit:=$_t_NewBit+"//------------------ Method Notes ------------------"+$_t_Description+Char:C90(13)
											$_t_NewBit:=$_t_NewBit+"//------------------ Revision Control ----------------"+Char:C90(13)
											$_t_DateCreated:=""
											$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Created Date")
											If ($_l_Ref>0)
												$_t_DateCreated:=$_at_HeaderDatas2{$_l_Ref}
											End if 
											If ($_t_DateCreated#"")
												$_l_Length:=Length:C16($_t_DateCreated)
												If ($_t_DateCreated[[Length:C16($_t_DateCreated)]]=Char:C90(13))
													$_t_DateCreated:=Substring:C12($_t_DateCreated; 1; $_l_Length-1)
												End if 
											End if 
											$_t_NewBit:=$_t_NewBit+"//Date Created: "+$_t_DateCreated+Char:C90(13)
											$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Creator")
											$_t_Creator:=""
											If ($_l_Ref>0)
												$_t_Creator:=$_at_HeaderDatas2{$_l_Ref}
											End if 
											If ($_t_Creator#"")
												$_l_Length:=Length:C16($_t_Creator)
												If ($_t_Creator[[Length:C16($_t_Creator)]]=Char:C90(13))
													$_t_Creator:=Substring:C12($_t_Creator; 1; $_l_Length-1)
												End if 
											End if 
											$_t_NewBit:=$_t_NewBit+"//Created BY: "+$_t_Creator+Char:C90(13)
											$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Date")
											$_t_DateModified:=""
											If ($_l_Ref>0)
												$_t_DateModified:=$_at_HeaderDatas2{$_l_Ref}
											End if 
											If ($_t_DateModified#"")
												$_l_Length:=Length:C16($_t_DateModified)
												If ($_t_DateModified[[Length:C16($_t_DateModified)]]=Char:C90(13))
													$_t_DateModified:=Substring:C12($_t_DateModified; 1; $_l_Length-1)
												End if 
											End if 
											$_t_NewBit:=$_t_NewBit+"//Date Modified: "+$_t_DateModified+Char:C90(13)
											$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified By")
											$_t_Modifier:=""
											If ($_l_Ref>0)
												$_t_Modifier:=$_at_HeaderDatas2{$_l_Ref}
											End if 
											If ($_t_Modifier#"")
												$_l_Length:=Length:C16($_t_Modifier)
												If ($_t_Modifier[[Length:C16($_t_Modifier)]]=Char:C90(13))
													$_t_Modifier:=Substring:C12($_t_Modifier; 1; $_l_Length-1)
												End if 
											End if 
											$_t_NewBit:=$_t_NewBit+"//Modified By "+$_t_Modifier+Char:C90(13)
											$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Notes")
											$_t_Notes:=""
											If ($_l_Ref>0)
												$_t_Notes:=$_at_HeaderDatas2{$_l_Ref}
											End if 
											For ($_l_Index4; 1; 10)
												$_t_Notes:=Replace string:C233($_t_Notes; Char:C90(13)+Char:C90(13); Char:C90(13))
											End for 
											If ($_t_Notes#"")
												$_l_Length:=Length:C16($_t_Notes)
												If ($_t_Notes[[Length:C16($_t_Notes)]]=Char:C90(13))
													$_t_Notes:=Substring:C12($_t_Notes; 1; $_l_Length-1)
												End if 
											End if 
											$_t_NewBit:=$_t_NewBit+"//Modification notes "+Char:C90(13)
											$_t_NewBit:=$_t_NewBit+$_t_Notes+Char:C90(13)
											$_t_NewBit:=$_t_NewBit+"END IF"+Char:C90(13)
											$_t_NewMethodText:=$_t_NewBit+Char:C90(13)+$_t_NewHeader+$_t_MethodText
											If ($_t_MethodTextOLD#$_t_NewMethodText)
												METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
											End if 
										Else 
											//TRACE
										End if 
									End if 
									$_bo_MergeHeaders:=False:C215
							End case 
							METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
							$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
							If ($_l_Position>0)
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
								For ($_l_Position; 1; Length:C16($_t_MethodText))
									If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
										If (Length:C16($_t_methodText)>$_l_Position)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
										Else 
											$_t_MethodText:=""
										End if 
										$_l_Position:=999999
									End if 
								End for 
							End if 
							$_t_MethodTextOLD:=$_t_MethodText
							$_bo_Exit:=False:C215
							Repeat 
								If ($_t_MethodText#"")
									If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
										$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
									Else 
										$_bo_Exit:=True:C214
									End if 
								End if 
							Until ($_bo_Exit) | ($_t_MethodText="")
							
							
							$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
							If ($_l_Position>0)  //it would be odd iff it is not here
								$_t_Header:=Substring:C12($_t_MethodText; 1; $_l_Position)
								If (Length:C16($_t_methodText)>$_l_Position)
									$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
								Else 
									$_t_MethodText:=""
								End if 
								
								
								$_t_NewMethodText:=""
								Repeat 
									$_l_EndofLine:=Position:C15(Char:C90(13); $_t_MethodText)
									If ($_l_EndofLine>0)
										$_t_ThisLine:=Substring:C12($_t_MethodText; 1; $_l_EndofLine-1)
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_EndofLine+1)
									Else 
										$_t_ThisLine:=$_t_MethodText
										$_t_MethodText:=""
									End if 
									$_bo_Exit:=False:C215
									Repeat 
										If ($_t_ThisLine#"")
											If ($_t_ThisLine[[1]]=Char:C90(9)) | ($_t_ThisLine[[1]]=" ")
												$_t_ThisLine:=Substring:C12($_t_ThisLine; 2)
											Else 
												$_bo_Exit:=True:C214
											End if 
										End if 
									Until ($_t_ThisLine="") | ($_bo_Exit)
									Case of 
										: ($_t_ThisLine="C_String@")
										: ($_t_ThisLine="_o_C_String@")
										: ($_t_ThisLine="C_Text@")
										: ($_t_ThisLine="C_Longint@")
										: ($_t_ThisLine="_o_C_integer@")
										: ($_t_ThisLine="C_OBJECT@")
										: ($_t_ThisLine="C_BOOLEAN@")
										: ($_t_ThisLine="C_TIME@")
										: ($_t_ThisLine="C_BLOB@")
										: ($_t_ThisLine="C_Date@")
										: ($_t_ThisLine="C_picture@")
										: ($_t_ThisLine="C_pointer@")
										: ($_t_ThisLine="C_Real@")
										: ($_t_ThisLine="C_picture@")
											
										Else 
											$_t_NewMethodText:=$_t_NewMethodText+Char:C90(13)+$_t_ThisLine
											
									End case 
									
								Until ($_t_MethodText="")
								For ($_l_Index4; 1; 20)
									$_t_Header:=Replace string:C233($_t_Header; Char:C90(13)+Char:C90(13); Char:C90(13))
								End for 
								$_t_NewMethodText:=$_t_Header+$_t_NewMethodText
								For ($_l_Index4; 1; 20)
									$_t_NewMethodText:=Replace string:C233($_t_NewMethodText; Char:C90(13)+Char:C90(13)+"  //Code Starts Here"; Char:C90(13)+"  //Code Starts Here")
								End for 
								If ($_t_MethodTextOLD#$_t_NewMethodText)
									METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
									
									METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
									$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
									If ($_l_Position>0)
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
										For ($_l_Position; 1; Length:C16($_t_MethodText))
											If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
												If (Length:C16($_t_methodText)>$_l_Position)
													$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
												Else 
													$_t_MethodText:=""
												End if 
												$_l_Position:=999999
											End if 
										End for 
									End if 
									$_t_MethodTextOLD:=$_t_MethodText
									$_bo_Exit:=False:C215
									Repeat 
										If ($_t_MethodText#"")
											If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
												$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
											Else 
												$_bo_Exit:=True:C214
											End if 
										End if 
									Until ($_bo_Exit) | ($_t_MethodText="")
									
								End if 
								$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
								If ($_l_Position>0)  //it would be odd iff it is not here
									$_T_Header:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16(" //Code Starts Here"))
									$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" //Code Starts Here")+1)
									$_t_MethodText:=STR_RemoveLeadTrailSpace($_t_MethodText)
									$_l_Position:=Position:C15("$_t_oldMethodName:=ERR_MethodTracker ("; $_t_MethodText)
									If ($_l_Position>1)
										If ($_t_MethodText[[$_l_Position-1]]="/")
											$_l_Position:=0
										End if 
									End if 
									If ($_l_Position=0) | ($_l_Position>20)
										
										$_t_MethodText:="$_t_oldMethodName:=ERR_MethodTracker ("+Char:C90(34)+"OBJ "+$_t_MethodNameStripped+Char:C90(34)+";FORM EVENT)"+Char:C90(13)+$_t_MethodText
									End if 
									$_bo_exit:=False:C215
									Repeat 
										If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(9)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=" ")
											$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
										Else 
											$_bo_exit:=True:C214
										End if 
									Until ($_bo_exit)
									$_bo_exit:=False:C215
									
									For ($_l_LastLine; Length:C16($_t_MethodText); 1; -1)
										
										If ($_t_MethodText[[$_l_LastLine]]=Char:C90(13))
											$_t_LastLine:=Substring:C12($_t_MethodText; $_l_LastLine+1)
											$_t_MethodText:=Substring:C12($_t_MethodText; 1; $_l_LastLine-1)
											$_l_LastLine:=0
											$_t_LastLine:=STR_RemoveLeadTrailSpace($_t_LastLine)
											If (Position:C15("ERR_MethodTrackerReturn"; $_t_LastLine)=0)
												
												$_t_LastLine:=$_t_LastLine+Char:C90(13)+"ERR_MethodTrackerReturn("+Char:C90(34)+"OBJ "+$_t_MethodNameStripped+Char:C90(34)+";$_t_oldMethodName)"
												$_bo_exit:=False:C215
											End if 
											Repeat 
												If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(9)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=" ")
													
													$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
												Else 
													$_bo_exit:=True:C214
												End if 
											Until ($_bo_exit)
											$_t_MethodText:=$_T_Header+$_t_MethodText+Char:C90(13)+$_t_LastLine
											If ($_t_MethodTextOLD#$_t_MethodText)
												METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
												If ($_t_MethodText#"")
													//DIFFu_DBCodemanager ($_t_MethodName;Path project form+99;True)
													EXECUTE METHOD:C1007("DIFFu_DBCodemanager"; *; $_t_MethodName; Path project form:K72:3+99; True:C214)
													
												End if 
											End if 
											
										End if 
									End for 
									
									
									
								End if 
								
							End if 
							METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
							$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
							If ($_l_Position>0)
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
								For ($_l_Position; 1; Length:C16($_t_MethodText))
									If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
										If (Length:C16($_t_methodText)>$_l_Position)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
										Else 
											$_t_MethodText:=""
										End if 
										$_l_Position:=Length:C16($_t_MethodText)*2
									End if 
								End for 
							End if 
							$_bo_InsertCHanges:=False:C215
							If (False:C215)
								$_l_Position:=Position:C15("$_t_oldMethodName:=ERR_MethodTracker"; $_t_MethodText)
								If ($_l_Position>0)
									$_t_before:=Substring:C12($_t_MethodText; $_l_Position-1)
									$_t_After:=Substring:C12($_t_MethodText; $_l_Position)
									For ($_l_EndofLine; 1; Length:C16($_t_After))
										If ($_t_After[[$_l_EndofLine]]=Char:C90(10)) | ($_t_After[[$_l_EndofLine]]=Char:C90(13))
											$_t_ThisLine:=Substring:C12($_t_After; 1; $_l_EndofLine-1)
											$_l_EndofLine2:=Length:C16($_t_After)
											$_t_After:=Substring:C12($_t_After; $_l_EndofLine+1)
											$_l_EndofLine:=$_l_EndofLine2
											$_l_position2:=Position:C15($_t_ThisLine; $_t_After)
											If ($_l_position2>0)
												$_t_After:=Replace string:C233($_t_After; $_t_ThisLine; "")
												$_t_MethodText:=$_t_before+$_t_ThisLine+Char:C90(13)+$_t_After
												$_bo_InsertCHanges:=True:C214
											End if 
										End if 
									End for 
								End if 
							End if 
							Repeat 
								$_l_Position:=Position:C15("_O_ENABLE BUTTON"; $_t_MethodText)
								If ($_l_Position>0)
									
									$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
									$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_ENABLE BUTTON"))
									//We need to now find the end of the line(")"
									$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
									If ($_l_Position2>0)
										$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
										$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
										$_t_ThisLIne:="Object Set Enabled"+$_t_ThisLIne+";TRUE)"
										$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
										$_bo_InsertCHanges:=False:C215
									End if 
								End if 
							Until ($_l_Position=0)
							Repeat 
								$_l_Position:=Position:C15("_O_DISABLE BUTTON"; $_t_MethodText)
								If ($_l_Position>0)
									
									$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
									$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_DISABLE BUTTON"))
									//We need to now find the end of the line(")"
									$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
									If ($_l_Position2>0)
										$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
										$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
										$_t_ThisLIne:="Object Set Enabled"+$_t_ThisLIne+";FALSE)"
										$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
										$_bo_InsertCHanges:=False:C215
									End if 
								End if 
							Until ($_l_Position=0)
							//_o_REDRAW LIST
							$_t_StoreBefore:=""
							Repeat 
								$_l_Position:=Position:C15("_o_REDRAW LIST"; $_t_MethodText)
								If ($_l_Position>0)
									//TRACE
									$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
									$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_o_REDRAW LIST"))
									//We need to now find the end of the line(")"
									$_t_BeforeEnd:=Substring:C12($_T_MethodBefore; Length:C16($_T_MethodBefore)-2)
									If ($_t_BeforeEnd#"//")
										$_t_StoreBefore:=$_t_StoreBefore+$_T_MethodBefore+"//_o_REDRAW LIST"
										$_t_MethodText:=$_T_MethodAfter
										$_bo_InsertCHanges:=True:C214
									Else 
										$_t_StoreBefore:=$_t_StoreBefore+$_T_MethodBefore+"_o_REDRAW LIST"
										$_t_MethodText:=$_T_MethodAfter
										//dont change the flag
									End if 
								End if 
							Until ($_l_Position=0)
							If ($_t_StoreBefore#"")
								$_t_MethodText:=$_t_StoreBefore+$_t_MethodText
							End if 
							//_O_C_STRING(20;$SD_S20_DiaryResultCode)
							Repeat 
								$_l_Position:=Position:C15("_O_C_STRING"; $_t_MethodText)
								If ($_l_Position>0)
									
									$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
									$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_C_STRING"))
									//We need to now find the end of the line(")"
									$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
									If ($_l_Position2>0)
										$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
										$_l_Position:=Position:C15(";"; $_t_ThisLIne)
										$_t_ThisLIne:=Substring:C12($_t_ThisLIne; $_l_Position+1)
										$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
										$_t_ThisLIne:="C_TEXT("+$_t_ThisLIne+")"
										$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
										$_bo_InsertCHanges:=True:C214
									End if 
								End if 
							Until ($_l_Position=0)
							Repeat 
								$_l_Position:=Position:C15("_O_C_INTEGER"; $_t_MethodText)
								If ($_l_Position>0)
									
									$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
									$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_C_INTEGER"))
									//We need to now find the end of the line(")"
									$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
									If ($_l_Position2>0)
										$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
										$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
										$_t_ThisLIne:="C_LONGINT"+$_t_ThisLIne+")"
										$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
										$_bo_InsertCHanges:=False:C215
									End if 
								End if 
							Until ($_l_Position=0)
							//Array string(20;$SD_S20_DiaryResultCode)
							Repeat 
								$_l_Position:=Position:C15("_O_ARRAY STRING"; $_t_MethodText)
								If ($_l_Position>0)
									
									
									$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
									$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_ARRAY STRING"))
									//We need to now find the end of the line(")"
									$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
									If ($_l_Position2>0)
										$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
										$_l_Position:=Position:C15(";"; $_t_ThisLIne)
										$_t_ThisLIne:=Substring:C12($_t_ThisLIne; $_l_Position+1)
										$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
										$_t_ThisLIne:="ARRAY TEXT("+$_t_ThisLIne+")"
										$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
										$_bo_InsertCHanges:=True:C214
									End if 
								End if 
							Until ($_l_Position=0)
							
							$_l_Position:=Position:C15("//C_Unknown($_t"; $_t_MethodText)
							If ($_l_Position=0)
								$_l_Position:=Position:C15("//C_Unknown($_i"; $_t_MethodText)
								If ($_l_Position=0)
									$_l_Position:=Position:C15("//C_Unknown($_a"; $_t_MethodText)
									If ($_l_Position=0)
										$_l_Position:=Position:C15("//C_Unknown($_l"; $_t_MethodText)
									Else 
										$_l_Position:=Position:C15("//C_Unknown"; $_t_MethodText)
									End if 
								End if 
							End if 
							If ($_l_Position>0) | ($_bo_InsertCHanges)  //force a save
								$_t_MethodText:=$_t_MethodText+" "
								METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
							End if 
							
						End if 
					End if 
					
				End if 
			End for 
		End for 
	End if 
	///this can only work if you pass the pointers@
	$_l_LastTableNumber:=Get last table number:C254
	C_LONGINT:C283($_l_LastTableNumber)
	///EXECUTE METHOD("CODE_GetTableInfo";$_l_LastTableNumber;0)
	
	//$_l_LastTableNumber:=Size of array($_ptr_TablePointers->)
	
	For ($_l_CurrentTable; 2; $_l_LastTableNumber)
		$_l_isTableValid:=0
		///EXECUTE METHOD("CODE_GetTableInfo";$_l_isTableValid;$_l_CurrentTable)
		
		
		If (Is table number valid:C999($_l_CurrentTable))
			ARRAY TEXT:C222($_at_FormNames; 0)
			$_Ptr_ptrTablePointer:=Table:C252($_l_CurrentTable)
			$_t_TableName:=Table name:C256($_Ptr_ptrTablePointer)
			//$_Ptr_ptrTablePointer:=$_ptr_TablePointers->{$_l_CurrentTable}
			FORM GET NAMES:C1167($_Ptr_ptrTablePointer->; $_at_FormNames)
			SORT ARRAY:C229($_at_FormNames)
			For ($_l_CurrentFormNumber; 1; Size of array:C274($_at_FormNames))
				ARRAY TEXT:C222($_at_MethodPaths; 0)
				METHOD GET PATHS FORM:C1168($_Ptr_ptrTablePointer->; $_at_MethodPaths; $_at_FormNames{$_l_CurrentFormNumber})
				SORT ARRAY:C229($_at_MethodPaths)
				$_l_SizeofArray:=Size of array:C274($_at_MethodPaths)
				For ($_l_Index; 1; Size of array:C274($_at_MethodPaths))
					If (Position:C15("FormMethod"; $_at_MethodPaths{$_l_Index})>0)
						////DIFFu_DBCodemanager ($_at_MethodPaths{$_l_Index};Path table form;True)
						If (Not:C34($_bo_Ignore))
							
							$_t_MethodName:=$_at_MethodPaths{$_l_Index}
							MESSAGE:C88($_t_MethodName+" "+$_t_TableName+" "+$_at_FormNames{$_l_CurrentFormNumber}+" Form "+String:C10($_l_CurrentFormNumber)+" of "+String:C10(Size of array:C274($_at_FormNames))+" "+String:C10($_l_Index)+" of "+String:C10($_l_SizeofArray))
							
							$_t_MethodNameStripped:=Replace string:C233($_t_MethodName; "{formmethod}"; "")
							$_t_MethodNameStripped:=Replace string:C233($_t_MethodNameStripped; "[TABLEFORM]/"; "")
							$_t_MethodNameStripped:=Replace string:C233($_t_MethodNameStripped; $_t_TableName+"/"; "")
							$_t_MethodNameStripped:="["+$_t_TableName+"]"+Replace string:C233($_t_MethodNameStripped; "/"; "")
							
							
							METHOD GET MODIFICATION DATE:C1170($_t_MethodName; $_Dte_ModificationDate; $_ti_ModificationTime)
							METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
							$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
							If ($_l_Position>0)
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
								For ($_l_Position; 1; Length:C16($_t_MethodText))
									If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
										If (Length:C16($_t_methodText)>$_l_Position)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
										Else 
											$_t_MethodText:=""
										End if 
										$_l_Position:=999999
									End if 
								End for 
							End if 
							$_t_MethodTextOLD:=$_t_MethodText
							$_bo_Exit:=False:C215
							Repeat 
								If ($_t_MethodText#"")
									If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
										$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
									Else 
										$_bo_Exit:=True:C214
									End if 
								End if 
							Until ($_bo_Exit) | ($_t_MethodText="")
							
							If ($_t_MethodText#"")
								$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
								Case of 
									: ($_l_Position=0)  //there is no new header
										//take out the old header save then put the new header text in
										$_l_Position:=Position:C15("//Creator: "; $_t_MethodText)
										
										
										If ($_l_Position>0)
											$_t_OldMethodText:=$_t_MethodText
											$_t_BeforeCreator:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
											$_l_Position:=Position:C15("Amendments"; $_t_MethodText)
											If ($_l_Position>0)
												$_t_beforeAmend:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
												$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
												$_l_Position:=Position:C15("END IF"; $_t_MethodText)
												$_t_PrependBefore:=""
												Repeat 
													
													$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
													For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
														Case of 
															: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
																//this is a commented out line
																//so get the next end if
																$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
																$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
																$_l_CheckifComment:=0
															: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
																//this is not a comment
																$_l_CheckifComment:=0
																$_bo_NotComment:=True:C214
															: ($_l_CheckifComment=1)
																$_l_CheckifComment:=0
																$_bo_NotComment:=True:C214
														End case 
													End for 
													$_l_Position:=Position:C15("END IF"; $_t_MethodText)
												Until ($_bo_NotComment)
												If ($_t_PrependBefore#"")
													$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
												End if 
												$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
												$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
												$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
												If ($_l_PositionHeaderStart>0)
													$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
													$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
													ARRAY TEXT:C222($_at_HeaderLines; 0)
													Repeat 
														$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
														If ($_l_Position>0)
															APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
															$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
															
														Else 
															APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
															$_t_Header:=""
														End if 
													Until ($_l_Position=0)
													ARRAY TEXT:C222($_at_HeaderItems; 0)
													ARRAY TEXT:C222($_at_HeaderDatas; 0)
													DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
													$_bo_MergeHeaders:=True:C214
													If ($_t_MethodTextOLD#$_t_MethodText)
														METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
														If ($_t_MethodText#"")
															//DIFFu_DBCodemanager ($_t_MethodName;Path table form;True)
															EXECUTE METHOD:C1007("DIFFu_DBCodemanager"; *; $_t_MethodName; Path table form:K72:5; True:C214)
															
														End if 
														METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
														$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
														If ($_l_Position>0)
															$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
															For ($_l_Position; 1; Length:C16($_t_MethodText))
																If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
																	If (Length:C16($_t_methodText)>$_l_Position)
																		$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
																	Else 
																		$_t_MethodText:=""
																	End if 
																	$_l_Position:=999999
																End if 
															End for 
														End if 
														$_t_MethodTextOLD:=$_t_MethodText
														$_bo_Exit:=False:C215
														Repeat 
															If ($_t_MethodText#"")
																If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
																	$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
																Else 
																	$_bo_Exit:=True:C214
																End if 
															End if 
														Until ($_bo_Exit) | ($_t_MethodText="")
														
													End if 
													//now the new header should be here
													$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
													If ($_l_Position>0)
														$_bo_MergeHeaders:=True:C214
														$_t_NewHeader:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16(" //Code Starts Here"))
														$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" //Code Starts Here")+1)
														If ($_bo_MergeHeaders)
															$_l_Position:=Position:C15("//Variable Declarations"; $_t_NewHeader)
															If ($_l_Position>0)
																$_t_newBit:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
																$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
																ARRAY TEXT:C222($_at_HeaderLines2; 0)
																Repeat 
																	$_l_Position:=Position:C15(Char:C90(13); $_t_newBit)
																	If ($_l_Position>0)
																		APPEND TO ARRAY:C911($_at_HeaderLines2; Substring:C12($_t_newBit; 1; $_l_Position-1))
																		$_t_newBit:=Substring:C12($_t_newBit; $_l_Position+1)
																		
																	Else 
																		APPEND TO ARRAY:C911($_at_HeaderLines2; $_t_newBit)
																		$_t_newBit:=""
																	End if 
																Until ($_l_Position=0)
																
																$_bo_MergeHeaders:=True:C214
																ARRAY TEXT:C222($_at_HeaderItems2; 0)
																ARRAY TEXT:C222($_at_HeaderDatas2; 0)
																DB_FixMethods2019GetHeader("NEW"; ->$_at_HeaderLines2; ->$_at_HeaderItems2; ->$_at_HeaderDatas2)
																For ($_l_Build; 1; Size of array:C274($_at_HeaderItems2))
																	Case of 
																		: ($_at_HeaderItems2{$_l_Build}="Creator")
																			$_l_Position:=Find in array:C230($_at_HeaderItems; "Creator")
																			If ($_l_Position>0)
																				$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																			End if 
																		: ($_at_HeaderItems2{$_l_Build}="Created Date")
																			$_l_Position:=Find in array:C230($_at_HeaderItems; "Created Date")
																			If ($_l_Position>0)
																				$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																			End if 
																		: ($_at_HeaderItems2{$_l_Build}="Name")
																			$_l_Position:=Find in array:C230($_at_HeaderItems; "Method Name")
																			If ($_l_Position>0)
																				If ($_at_HeaderDatas2{$_l_Build}="")
																					$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																				End if 
																			End if 
																		: ($_at_HeaderItems2{$_l_Build}="Description")
																			$_l_Position:=Find in array:C230($_at_HeaderItems; "Description")
																			If ($_l_Position>0)
																				$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																			End if 
																		: ($_at_HeaderItems2{$_l_Build}="Modified Date")
																		: ($_at_HeaderItems2{$_l_Build}="Modified By")
																		: ($_at_HeaderItems2{$_l_Build}="Modified Notes")
																			$_l_Position:=Find in array:C230($_at_HeaderItems; "Amendments")
																			If ($_l_Position>0)
																				$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																			End if 
																	End case 
																End for 
																$_t_NewBit:="IF(FALSE)"+Char:C90(13)
																$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Name")
																$_t_Name:=""
																$_t_Description:=""
																$_t_Revisions:=""
																If ($_l_Ref>0)
																	$_t_Name:=$_at_HeaderDatas2{$_l_Ref}
																Else 
																	$_t_name:=$_t_MethodNameStripped
																	
																End if 
																$_t_NewBit:=$_t_NewBit+"//Table Form Method Name: "+$_t_Name+Char:C90(13)
																$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Description")
																If ($_l_Ref>0)
																	$_t_Description:=$_at_HeaderDatas2{$_l_Ref}
																End if 
																For ($_l_Index4; 1; 10)
																	$_t_Description:=Replace string:C233($_t_Description; Char:C90(13)+Char:C90(13); Char:C90(13))
																End for 
																If ($_t_Description#"")
																	$_l_Length:=Length:C16($_t_Description)
																	If ($_t_Description[[Length:C16($_t_Description)]]=Char:C90(13))
																		$_t_Description:=Substring:C12($_t_Description; 1; $_l_Length-1)
																	End if 
																End if 
																$_t_NewBit:=$_t_NewBit+"//------------------ Method Notes ------------------"+$_t_Description+Char:C90(13)
																$_t_NewBit:=$_t_NewBit+"//------------------ Revision Control ----------------"+Char:C90(13)
																$_t_DateCreated:=""
																$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Created Date")
																If ($_l_Ref>0)
																	$_t_DateCreated:=$_at_HeaderDatas2{$_l_Ref}
																End if 
																If ($_t_DateCreated#"")
																	$_l_Length:=Length:C16($_t_DateCreated)
																	If ($_t_DateCreated[[Length:C16($_t_DateCreated)]]=Char:C90(13))
																		$_t_DateCreated:=Substring:C12($_t_DateCreated; 1; $_l_Length-1)
																	End if 
																End if 
																$_t_NewBit:=$_t_NewBit+"//Date Created: "+$_t_DateCreated+Char:C90(13)
																$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Creator")
																$_t_Creator:=""
																If ($_l_Ref>0)
																	$_t_Creator:=$_at_HeaderDatas2{$_l_Ref}
																End if 
																If ($_t_Creator#"")
																	$_l_Length:=Length:C16($_t_Creator)
																	If ($_t_Creator[[Length:C16($_t_Creator)]]=Char:C90(13))
																		$_t_Creator:=Substring:C12($_t_Creator; 1; $_l_Length-1)
																	End if 
																End if 
																$_t_NewBit:=$_t_NewBit+"//Created BY: "+$_t_Creator+Char:C90(13)
																$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Date")
																$_t_DateModified:=""
																If ($_l_Ref>0)
																	$_t_DateModified:=$_at_HeaderDatas2{$_l_Ref}
																End if 
																If ($_t_DateModified#"")
																	$_l_Length:=Length:C16($_t_DateModified)
																	If ($_t_DateModified[[Length:C16($_t_DateModified)]]=Char:C90(13))
																		$_t_DateModified:=Substring:C12($_t_DateModified; 1; $_l_Length-1)
																	End if 
																End if 
																$_t_NewBit:=$_t_NewBit+"//Date Modified: "+$_t_DateModified+Char:C90(13)
																$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified By")
																$_t_Modifier:=""
																If ($_l_Ref>0)
																	$_t_Modifier:=$_at_HeaderDatas2{$_l_Ref}
																End if 
																If ($_t_Modifier#"")
																	$_l_Length:=Length:C16($_t_Modifier)
																	If ($_t_Modifier[[Length:C16($_t_Modifier)]]=Char:C90(13))
																		$_t_Modifier:=Substring:C12($_t_Modifier; 1; $_l_Length-1)
																	End if 
																End if 
																$_t_NewBit:=$_t_NewBit+"//Modified By "+$_t_Modifier+Char:C90(13)
																$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Notes")
																$_t_Notes:=""
																If ($_l_Ref>0)
																	$_t_Notes:=$_at_HeaderDatas2{$_l_Ref}
																End if 
																For ($_l_Index4; 1; 10)
																	$_t_Notes:=Replace string:C233($_t_Notes; Char:C90(13)+Char:C90(13); Char:C90(13))
																End for 
																If ($_t_Notes#"")
																	$_l_Length:=Length:C16($_t_Notes)
																	If ($_t_Notes[[Length:C16($_t_Notes)]]=Char:C90(13))
																		$_t_Notes:=Substring:C12($_t_Notes; 1; $_l_Length-1)
																	End if 
																End if 
																$_t_NewBit:=$_t_NewBit+"//Modification notes "+Char:C90(13)
																$_t_NewBit:=$_t_NewBit+$_t_Notes+Char:C90(13)
																$_t_NewBit:=$_t_NewBit+"END IF"+Char:C90(13)
																$_t_NewMethodText:=$_t_NewBit+Char:C90(13)+$_t_NewHeader+$_t_MethodText
																If ($_t_MethodTextOLD#$_t_NewMethodText)
																	METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
																End if 
															Else 
																//TRACE
															End if 
														End if 
														$_bo_MergeHeaders:=False:C215
														
													Else 
														//TRACE
													End if 
												Else 
													//this would be strange
													////TRACE
													
												End if 
											Else 
												//this would be strange
												////TRACE
											End if 
										Else 
											If ($_t_MethodTextOLD#$_t_MethodText)
												METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
											End if 
											If ($_t_MethodText#"")
												//DIFFu_DBCodemanager ($_t_MethodName;Path table form;True)
												EXECUTE METHOD:C1007("DIFFu_DBCodemanager"; *; $_t_MethodName; Path table form:K72:5; True:C214)
												
												$_l_Index:=$_l_Index-1
											End if 
											////TRACE
										End if 
									: ($_l_Position>0)
										//find the old header-if it is there and replace it.
										$_l_PositionCompiler1:=Position:C15("//Variable Declarations"; $_t_MethodText)
										$_t_Delcarations:=Substring:C12($_t_MethodText; $_l_PositionCompiler1; $_l_Position)
										DB_FixMethodDeclarations2020($_t_MethodName; $_t_Delcarations; ->$_at_AllArrayNames; ->$_al_AllArrayTypes; ->$_at_AllVarNames; ->$_al_all_VarTypes; ->$_at_MethodDeclares; ->$_at_MethodNames; ->$_al_DeclareType)
										
										$_t_NewHeader:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16(" //Code Starts Here"))
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" //Code Starts Here")+1)
										//now we have 3 possible outcomes
										//1)there is no old header-do nothing-its a new method
										//2) there is an old header on the remaing text-this will the normal
										//3) i have extracted the header already and stuck into the new header
										///
										$_l_Position:=Position:C15("//Creator: "; $_t_MethodText)
										If ($_l_Position=0)
											$_l_Position:=Position:C15("// Creator:"; $_t_MethodText)
										End if 
										$_bo_MergeHeaders:=False:C215
										
										If ($_l_Position>0)  //this is scenario 1.. we want to take out the old header
											
											$_t_BeforeCreator:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
											$_l_Position:=Position:C15("Amendments"; $_t_MethodText)
											If ($_l_Position>0)
												$_t_beforeAmend:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
												$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
												$_l_Position:=Position:C15("END IF"; $_t_MethodText)
												$_t_PrependBefore:=""
												Repeat 
													
													$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
													For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
														Case of 
															: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
																//this is a commented out line
																//so get the next end if
																$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
																$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
																$_l_CheckifComment:=0
															: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
																//this is not a comment
																$_l_CheckifComment:=0
																$_bo_NotComment:=True:C214
															: ($_l_CheckifComment=1)
																$_l_CheckifComment:=0
																$_bo_NotComment:=True:C214
														End case 
													End for 
													$_l_Position:=Position:C15("END IF"; $_t_MethodText)
												Until ($_bo_NotComment)
												If ($_t_PrependBefore#"")
													$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
												End if 
												$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
												$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
												$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
												If ($_l_PositionHeaderStart>0)
													$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
													$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
													ARRAY TEXT:C222($_at_HeaderLines; 0)
													Repeat 
														$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
														If ($_l_Position>0)
															APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
															$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
															
														Else 
															APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
															$_t_Header:=""
														End if 
													Until ($_l_Position=0)
													ARRAY TEXT:C222($_at_HeaderItems; 0)
													ARRAY TEXT:C222($_at_HeaderDatas; 0)
													DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
													
													$_bo_MergeHeaders:=True:C214
													
													$_t_NewMethodText:=$_t_NewHeader+$_t_MethodText
													If ($_t_NewMethodText#$_t_MethodTextOLD)
														METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
													End if 
													
													
													
													
													
													
													
												Else 
													//this would be strange
													//TRACE
													
												End if 
											Else 
												//this would be strange
												//TRACE
											End if 
										Else 
											//there is no old header in the text
											//we now want to look for the old header in the new header..
											///
											$_l_Position:=Position:C15("//Creator: "; $_t_NewHeader)
											If ($_l_Position=0)
												$_l_Position:=Position:C15("// Creator:"; $_t_NewHeader)
											End if 
											
											If ($_l_Position>0)
												$_t_BeforeCreator:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
												$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
												$_l_Position:=Position:C15("Amendments"; $_t_NewHeader)
												If ($_l_Position>0)
													$_t_beforeAmend:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
													$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
													$_l_Position:=Position:C15("END IF"; $_t_NewHeader)
													$_t_PrependBefore:=""
													Repeat 
														
														$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
														For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
															Case of 
																: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
																	//this is a commented out line
																	//so get the next end if
																	$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
																	$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
																	$_l_CheckifComment:=0
																: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
																	//this is not a comment
																	$_l_CheckifComment:=0
																	$_bo_NotComment:=True:C214
																: ($_l_CheckifComment=1)
																	$_l_CheckifComment:=0
																	$_bo_NotComment:=True:C214
															End case 
														End for 
														$_l_Position:=Position:C15("END IF"; $_t_MethodText)
													Until ($_bo_NotComment)
													If ($_t_PrependBefore#"")
														$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
													End if 
													$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position+Length:C16("END IF")+1)
													$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
													
													$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
													If ($_l_PositionHeaderStart>0)
														$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
														$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
														ARRAY TEXT:C222($_at_HeaderLines; 0)
														Repeat 
															$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
															If ($_l_Position>0)
																APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
																$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
																
															Else 
																APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
																$_t_Header:=""
															End if 
														Until ($_l_Position=0)
														ARRAY TEXT:C222($_at_HeaderItems; 0)
														ARRAY TEXT:C222($_at_HeaderDatas; 0)
														DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
														$_bo_MergeHeaders:=True:C214
														
														//METHOD SET CODE($_t_MethodName;$_t_MethodText)
														//Now re-get the method code
														//METHOD GET CODE($_t_MethodName;$_t_MethodText)
														
														
													Else 
														//this would be strange
														//TRACE
														
													End if 
												Else 
													//this would be strange
													////TRACE
												End if 
											Else 
												/////TRACE
											End if 
											
											///
										End if 
										//now extract the data from the important bit of the new header
										If ($_bo_MergeHeaders)
											$_l_Position:=Position:C15("//Variable Declarations"; $_t_NewHeader)
											If ($_l_Position>0)
												$_t_newBit:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
												$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
												ARRAY TEXT:C222($_at_HeaderLines2; 0)
												Repeat 
													$_l_Position:=Position:C15(Char:C90(13); $_t_newBit)
													If ($_l_Position>0)
														APPEND TO ARRAY:C911($_at_HeaderLines2; Substring:C12($_t_newBit; 1; $_l_Position-1))
														$_t_newBit:=Substring:C12($_t_newBit; $_l_Position+1)
														
													Else 
														APPEND TO ARRAY:C911($_at_HeaderLines2; $_t_newBit)
														$_t_newBit:=""
													End if 
												Until ($_l_Position=0)
												
												$_bo_MergeHeaders:=True:C214
												ARRAY TEXT:C222($_at_HeaderItems2; 0)
												ARRAY TEXT:C222($_at_HeaderDatas2; 0)
												DB_FixMethods2019GetHeader("NEW"; ->$_at_HeaderLines2; ->$_at_HeaderItems2; ->$_at_HeaderDatas2)
												For ($_l_Build; 1; Size of array:C274($_at_HeaderItems2))
													Case of 
														: ($_at_HeaderItems2{$_l_Build}="Creator")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Creator")
															If ($_l_Position>0)
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
														: ($_at_HeaderItems2{$_l_Build}="Created Date")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Created Date")
															If ($_l_Position>0)
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
														: ($_at_HeaderItems2{$_l_Build}="Name")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Method Name")
															If ($_l_Position>0)
																If ($_at_HeaderDatas2{$_l_Build}="")
																	$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																End if 
															End if 
														: ($_at_HeaderItems2{$_l_Build}="Description")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Description")
															If ($_l_Position>0)
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
														: ($_at_HeaderItems2{$_l_Build}="Modified Date")
														: ($_at_HeaderItems2{$_l_Build}="Modified By")
														: ($_at_HeaderItems2{$_l_Build}="Modified Notes")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Amendments")
															If ($_l_Position>0)
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
													End case 
												End for 
												$_t_NewBit:="IF(FALSE)"+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Name")
												$_t_Name:=""
												$_t_Description:=""
												$_t_Revisions:=""
												If ($_l_Ref>0)
													$_t_Name:=$_at_HeaderDatas2{$_l_Ref}
												Else 
													$_t_Name:=$_t_MethodNameStripped
												End if 
												$_t_NewBit:=$_t_NewBit+"//Table Form Method Name: "+$_t_Name+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Description")
												If ($_l_Ref>0)
													$_t_Description:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												For ($_l_Index4; 1; 10)
													$_t_Description:=Replace string:C233($_t_Description; Char:C90(13)+Char:C90(13); Char:C90(13))
												End for 
												If ($_t_Description#"")
													$_l_Length:=Length:C16($_t_Description)
													If ($_t_Description[[Length:C16($_t_Description)]]=Char:C90(13))
														$_t_Description:=Substring:C12($_t_Description; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//------------------ Method Notes ------------------"+$_t_Description+Char:C90(13)
												$_t_NewBit:=$_t_NewBit+"//------------------ Revision Control ----------------"+Char:C90(13)
												$_t_DateCreated:=""
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Created Date")
												If ($_l_Ref>0)
													$_t_DateCreated:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												If ($_t_DateCreated#"")
													$_l_Length:=Length:C16($_t_DateCreated)
													If ($_t_DateCreated[[Length:C16($_t_DateCreated)]]=Char:C90(13))
														$_t_DateCreated:=Substring:C12($_t_DateCreated; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Date Created: "+$_t_DateCreated+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Creator")
												$_t_Creator:=""
												If ($_l_Ref>0)
													$_t_Creator:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												If ($_t_Creator#"")
													$_l_Length:=Length:C16($_t_Creator)
													If ($_t_Creator[[Length:C16($_t_Creator)]]=Char:C90(13))
														$_t_Creator:=Substring:C12($_t_Creator; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Created BY: "+$_t_Creator+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Date")
												$_t_DateModified:=""
												If ($_l_Ref>0)
													$_t_DateModified:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												If ($_t_DateModified#"")
													$_l_Length:=Length:C16($_t_DateModified)
													If ($_t_DateModified[[Length:C16($_t_DateModified)]]=Char:C90(13))
														$_t_DateModified:=Substring:C12($_t_DateModified; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Date Modified: "+$_t_DateModified+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified By")
												$_t_Modifier:=""
												If ($_l_Ref>0)
													$_t_Modifier:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												If ($_t_Modifier#"")
													$_l_Length:=Length:C16($_t_Modifier)
													If ($_t_Modifier[[Length:C16($_t_Modifier)]]=Char:C90(13))
														$_t_Modifier:=Substring:C12($_t_Modifier; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Modified By "+$_t_Modifier+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Notes")
												$_t_Notes:=""
												If ($_l_Ref>0)
													$_t_Notes:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												For ($_l_Index4; 1; 10)
													$_t_Notes:=Replace string:C233($_t_Notes; Char:C90(13)+Char:C90(13); Char:C90(13))
												End for 
												If ($_t_Notes#"")
													$_l_Length:=Length:C16($_t_Notes)
													If ($_t_Notes[[Length:C16($_t_Notes)]]=Char:C90(13))
														$_t_Notes:=Substring:C12($_t_Notes; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Modification notes "+Char:C90(13)
												$_t_NewBit:=$_t_NewBit+$_t_Notes+Char:C90(13)
												$_t_NewBit:=$_t_NewBit+"END IF"+Char:C90(13)
												$_t_NewMethodText:=$_t_NewBit+Char:C90(13)+$_t_NewHeader+$_t_MethodText
												If ($_t_NewMethodText#$_t_MethodTextOLD)
													METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
												End if 
											Else 
												//TRACE
											End if 
										End if 
										$_bo_MergeHeaders:=False:C215
								End case 
								METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
								$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
								If ($_l_Position>0)
									$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
									For ($_l_Position; 1; Length:C16($_t_MethodText))
										If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
											If (Length:C16($_t_methodText)>$_l_Position)
												$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
											Else 
												$_t_MethodText:=""
											End if 
											$_l_Position:=999999
										End if 
									End for 
								End if 
								$_t_MethodTextOLD:=$_t_MethodText
								$_bo_Exit:=False:C215
								Repeat 
									If ($_t_MethodText#"")
										If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
											$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
										Else 
											$_bo_Exit:=True:C214
										End if 
									End if 
								Until ($_bo_Exit) | ($_t_MethodText="")
								
								
								$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
								If ($_l_Position>0)  //it would be odd iff it is not here
									$_t_Header:=Substring:C12($_t_MethodText; 1; $_l_Position)
									If (Length:C16($_t_methodText)>$_l_Position)
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
									Else 
										$_t_MethodText:=""
									End if 
									
									$_t_NewMethodText:=""
									Repeat 
										$_l_EndofLine:=Position:C15(Char:C90(13); $_t_MethodText)
										If ($_l_EndofLine>0)
											$_t_ThisLine:=Substring:C12($_t_MethodText; 1; $_l_EndofLine-1)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_EndofLine+1)
										Else 
											$_t_ThisLine:=$_t_MethodText
											$_t_MethodText:=""
										End if 
										$_bo_Exit:=False:C215
										Repeat 
											If ($_t_ThisLine#"")
												If ($_t_ThisLine[[1]]=Char:C90(9)) | ($_t_ThisLine[[1]]=" ")
													$_t_ThisLine:=Substring:C12($_t_ThisLine; 2)
												Else 
													$_bo_Exit:=True:C214
												End if 
											End if 
										Until ($_t_ThisLine="") | ($_bo_Exit)
										Case of 
											: ($_t_ThisLine="C_String@")
											: ($_t_ThisLine="_o_C_String@")
											: ($_t_ThisLine="C_Text@")
											: ($_t_ThisLine="C_Longint@")
											: ($_t_ThisLine="_o_C_integer@")
											: ($_t_ThisLine="C_OBJECT@")
											: ($_t_ThisLine="C_BOOLEAN@")
											: ($_t_ThisLine="C_TIME@")
											: ($_t_ThisLine="C_BLOB@")
											: ($_t_ThisLine="C_Date@")
											: ($_t_ThisLine="C_picture@")
											: ($_t_ThisLine="C_pointer@")
											: ($_t_ThisLine="C_Real@")
											: ($_t_ThisLine="C_picture@")
												
											Else 
												$_t_NewMethodText:=$_t_NewMethodText+Char:C90(13)+$_t_ThisLine
												
										End case 
										
									Until ($_t_MethodText="")
									For ($_l_Index4; 1; 20)
										$_t_Header:=Replace string:C233($_t_Header; Char:C90(13)+Char:C90(13); Char:C90(13))
									End for 
									$_t_NewMethodText:=$_t_Header+$_t_NewMethodText
									For ($_l_Index4; 1; 20)
										$_t_NewMethodText:=Replace string:C233($_t_NewMethodText; Char:C90(13)+Char:C90(13)+"  //Code Starts Here"; Char:C90(13)+"  //Code Starts Here")
									End for 
									If ($_t_MethodTextOLD#$_t_NewMethodText)
										METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
										METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
										$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
										If ($_l_Position>0)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
											For ($_l_Position; 1; Length:C16($_t_MethodText))
												If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
													If (Length:C16($_t_methodText)>$_l_Position)
														$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
													Else 
														$_t_MethodText:=""
													End if 
													$_l_Position:=999999
												End if 
											End for 
										End if 
										$_t_MethodTextOLD:=$_t_MethodText
										$_bo_Exit:=False:C215
										Repeat 
											If ($_t_MethodText#"")
												If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
													$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
												Else 
													$_bo_Exit:=True:C214
												End if 
											End if 
										Until ($_bo_Exit) | ($_t_MethodText="")
										
										
									End if 
									$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
									If ($_l_Position>0)  //it would be odd iff it is not here
										$_T_Header:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16(" //Code Starts Here"))
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" //Code Starts Here")+1)
										$_t_MethodText:=STR_RemoveLeadTrailSpace($_t_MethodText)
										$_l_Position:=Position:C15("$_t_oldMethodName:=ERR_MethodTracker ("; $_t_MethodText)
										If ($_l_Position>1)
											If ($_t_MethodText[[$_l_Position-1]]="/")
												$_l_Position:=0
											End if 
										End if 
										If ($_l_Position=0) | ($_l_Position>20)
											
											$_t_MethodText:="$_t_oldMethodName:=ERR_MethodTracker ("+Char:C90(34)+"FM "+$_t_MethodNameStripped+Char:C90(34)+";FORM EVENT)"+Char:C90(13)+$_t_MethodText
										End if 
										$_bo_exit:=False:C215
										Repeat 
											If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(9)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=" ")
												$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
											Else 
												$_bo_exit:=True:C214
											End if 
										Until ($_bo_exit)
										$_bo_exit:=False:C215
										
										For ($_l_LastLine; Length:C16($_t_MethodText); 1; -1)
											
											If ($_t_MethodText[[$_l_LastLine]]=Char:C90(13))
												$_t_LastLine:=Substring:C12($_t_MethodText; $_l_LastLine+1)
												$_t_MethodText:=Substring:C12($_t_MethodText; 1; $_l_LastLine-1)
												$_l_LastLine:=0
												$_t_LastLine:=STR_RemoveLeadTrailSpace($_t_LastLine)
												If (Position:C15("ERR_MethodTrackerReturn"; $_t_LastLine)=0)
													
													$_t_LastLine:=$_t_LastLine+Char:C90(13)+"ERR_MethodTrackerReturn("+Char:C90(34)+"FM "+$_t_MethodNameStripped+Char:C90(34)+";$_t_oldMethodName)"
													$_bo_exit:=False:C215
												End if 
												Repeat 
													If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(9)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=" ")
														
														$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
													Else 
														$_bo_exit:=True:C214
													End if 
												Until ($_bo_exit)
												$_t_MethodText:=$_T_Header+$_t_MethodText+Char:C90(13)+$_t_LastLine
												If ($_t_MethodTextOLD#$_t_MethodText)
													METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
													If ($_t_MethodText#"")
														//DIFFu_DBCodemanager ($_t_MethodName;Path table form;True)
														EXECUTE METHOD:C1007("DIFFu_DBCodemanager"; *; $_t_MethodName; Path table form:K72:5; True:C214)
														
													End if 
													
												End if 
												
											End if 
										End for 
										
										
										
									End if 
									
								End if 
								METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
								$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
								If ($_l_Position>0)
									$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
									For ($_l_Position; 1; Length:C16($_t_MethodText))
										If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
											If (Length:C16($_t_methodText)>$_l_Position)
												$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
											Else 
												$_t_MethodText:=""
											End if 
											$_l_Position:=Length:C16($_t_MethodText)*2
										End if 
									End for 
								End if 
								$_bo_InsertCHanges:=False:C215
								If (False:C215)
									$_l_Position:=Position:C15("$_t_oldMethodName:=ERR_MethodTracker"; $_t_MethodText)
									If ($_l_Position>0)
										$_t_before:=Substring:C12($_t_MethodText; $_l_Position-1)
										$_t_After:=Substring:C12($_t_MethodText; $_l_Position)
										For ($_l_EndofLine; 1; Length:C16($_t_After))
											If ($_t_After[[$_l_EndofLine]]=Char:C90(10)) | ($_t_After[[$_l_EndofLine]]=Char:C90(13))
												$_t_ThisLine:=Substring:C12($_t_After; 1; $_l_EndofLine-1)
												$_l_EndofLine2:=Length:C16($_t_After)
												$_t_After:=Substring:C12($_t_After; $_l_EndofLine+1)
												$_l_EndofLine:=$_l_EndofLine2
												$_l_position2:=Position:C15($_t_ThisLine; $_t_After)
												If ($_l_position2>0)
													$_t_After:=Replace string:C233($_t_After; $_t_ThisLine; "")
													$_t_MethodText:=$_t_before+$_t_ThisLine+Char:C90(13)+$_t_After
													$_bo_InsertCHanges:=True:C214
												End if 
											End if 
										End for 
									End if 
								End if 
								Repeat 
									$_l_Position:=Position:C15("_O_ENABLE BUTTON"; $_t_MethodText)
									If ($_l_Position>0)
										
										$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
										$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_ENABLE BUTTON"))
										//We need to now find the end of the line(")"
										$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
										If ($_l_Position2>0)
											$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
											$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
											$_t_ThisLIne:="Object Set Enabled"+$_t_ThisLIne+";TRUE)"
											$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
											$_bo_InsertCHanges:=False:C215
										End if 
									End if 
								Until ($_l_Position=0)
								Repeat 
									$_l_Position:=Position:C15("_O_DISABLE BUTTON"; $_t_MethodText)
									If ($_l_Position>0)
										
										$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position+1)
										$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_DISABLE BUTTON"))
										//We need to now find the end of the line(")"
										$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
										If ($_l_Position2>0)
											$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
											$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
											$_t_ThisLIne:="Object Set Enabled"+$_t_ThisLIne+";FALSE)"
											$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
											$_bo_InsertCHanges:=False:C215
										End if 
									End if 
								Until ($_l_Position=0)
								//_o_REDRAW LIST
								$_t_StoreBefore:=""
								Repeat 
									$_l_Position:=Position:C15("_o_REDRAW LIST"; $_t_MethodText)
									If ($_l_Position>0)
										//TRACE
										$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
										$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_o_REDRAW LIST"))
										//We need to now find the end of the line(")"
										$_t_BeforeEnd:=Substring:C12($_T_MethodBefore; Length:C16($_T_MethodBefore)-2)
										If ($_t_BeforeEnd#"//")
											$_t_StoreBefore:=$_t_StoreBefore+$_T_MethodBefore+"//_o_REDRAW LIST"
											$_t_MethodText:=$_T_MethodAfter
											$_bo_InsertCHanges:=True:C214
										Else 
											$_t_StoreBefore:=$_t_StoreBefore+$_T_MethodBefore+"_o_REDRAW LIST"
											$_t_MethodText:=$_T_MethodAfter
											//dont change the flag
										End if 
									End if 
								Until ($_l_Position=0)
								If ($_t_StoreBefore#"")
									$_t_MethodText:=$_t_StoreBefore+$_t_MethodText
								End if 
								//_O_C_STRING(20;$SD_S20_DiaryResultCode)
								Repeat 
									$_l_Position:=Position:C15("_O_C_STRING"; $_t_MethodText)
									If ($_l_Position>0)
										
										$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
										$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_C_STRING"))
										//We need to now find the end of the line(")"
										$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
										If ($_l_Position2>0)
											$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
											$_l_Position:=Position:C15(";"; $_t_ThisLIne)
											$_t_ThisLIne:=Substring:C12($_t_ThisLIne; $_l_Position+1)
											$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
											$_t_ThisLIne:="C_TEXT("+$_t_ThisLIne+")"
											$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
											$_bo_InsertCHanges:=True:C214
										End if 
									End if 
								Until ($_l_Position=0)
								//Array string(20;$SD_S20_DiaryResultCode)
								Repeat 
									$_l_Position:=Position:C15("_O_ARRAY STRING"; $_t_MethodText)
									If ($_l_Position>0)
										
										$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
										$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_ARRAY STRING"))
										//We need to now find the end of the line(")"
										$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
										If ($_l_Position2>0)
											$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
											$_l_Position:=Position:C15(";"; $_t_ThisLIne)
											$_t_ThisLIne:=Substring:C12($_t_ThisLIne; $_l_Position+1)
											$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
											$_t_ThisLIne:="ARRAY TEXT("+$_t_ThisLIne+")"
											$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
											$_bo_InsertCHanges:=True:C214
										End if 
									End if 
								Until ($_l_Position=0)
								
								$_l_Position:=Position:C15("//C_Unknown($_t"; $_t_MethodText)
								If ($_l_Position=0)
									$_l_Position:=Position:C15("//C_Unknown($_i"; $_t_MethodText)
									If ($_l_Position=0)
										$_l_Position:=Position:C15("//C_Unknown($_a"; $_t_MethodText)
										If ($_l_Position=0)
											$_l_Position:=Position:C15("//C_Unknown($_l"; $_t_MethodText)
										Else 
											$_l_Position:=Position:C15("//C_Unknown"; $_t_MethodText)
										End if 
									End if 
								End if 
								If ($_l_Position>0) | ($_bo_InsertCHanges)  //force a save
									$_t_MethodText:=$_t_MethodText+" "
									METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
								End if 
								
							End if 
							
						End if 
						
					Else 
						//DIFFu_DBCodemanager ($_at_MethodPaths{$_l_Index};Path table form+99;True)
						If (Not:C34($_bo_Ignore))
							$_t_MethodName:=$_at_MethodPaths{$_l_Index}
							//MESSAGE($_t_MethodName+" "+$_t_TableName+" "+$_at_FormNames{$_l_CurrentFormNumber}+String($_l_Index)+" of "+String($_l_SizeofArray))
							MESSAGE:C88($_t_MethodName+" "+$_t_TableName+" "+$_at_FormNames{$_l_CurrentFormNumber}+" Form "+String:C10($_l_CurrentFormNumber)+" of "+String:C10(Size of array:C274($_at_FormNames))+" "+String:C10($_l_Index)+" of "+String:C10($_l_SizeofArray))
							
							
							$_t_MethodName:=$_at_MethodPaths{$_l_Index}
							$_t_MethodNameStripped:=Replace string:C233($_t_MethodName; "{formmethod}"; "")
							$_t_MethodNameStripped:=Replace string:C233($_t_MethodNameStripped; "[TABLEFORM]/"; "")
							$_t_MethodNameStripped:=Replace string:C233($_t_MethodNameStripped; $_t_TableName+"/"; "")
							$_t_MethodNameStripped:="["+$_t_TableName+"]"+Replace string:C233($_t_MethodNameStripped; "/"; ".")
							
							METHOD GET MODIFICATION DATE:C1170($_t_MethodName; $_Dte_ModificationDate; $_ti_ModificationTime; *)
							METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
							$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
							If ($_l_Position>0)
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
								For ($_l_Position; 1; Length:C16($_t_MethodText))
									If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
										If (Length:C16($_t_methodText)>$_l_Position)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
										Else 
											$_t_MethodText:=""
										End if 
										$_l_Position:=999999
									End if 
								End for 
							End if 
							$_t_MethodTextOLD:=$_t_MethodText
							$_bo_Exit:=False:C215
							Repeat 
								If ($_t_MethodText#"")
									If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
										$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
									Else 
										$_bo_Exit:=True:C214
									End if 
								End if 
							Until ($_bo_Exit) | ($_t_MethodText="")
							
							
							If ($_t_MethodText#"")
								
								
								
								$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
								Case of 
									: ($_l_Position=0)  //there is no new header
										//take out the old header save then put the new header text in
										$_l_Position:=Position:C15("//Creator: "; $_t_MethodText)
										
										
										If ($_l_Position>0)
											$_t_OldMethodText:=$_t_MethodText
											$_t_BeforeCreator:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
											$_l_Position:=Position:C15("Amendments"; $_t_MethodText)
											If ($_l_Position>0)
												$_t_beforeAmend:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
												$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
												$_l_Position:=Position:C15("END IF"; $_t_MethodText)
												$_t_PrependBefore:=""
												Repeat 
													
													$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
													For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
														Case of 
															: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
																//this is a commented out line
																//so get the next end if
																$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
																$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
																$_l_CheckifComment:=0
															: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
																//this is not a comment
																$_l_CheckifComment:=0
																$_bo_NotComment:=True:C214
															: ($_l_CheckifComment=1)
																$_l_CheckifComment:=0
																$_bo_NotComment:=True:C214
														End case 
													End for 
													$_l_Position:=Position:C15("END IF"; $_t_MethodText)
												Until ($_bo_NotComment)
												If ($_t_PrependBefore#"")
													$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
												End if 
												$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
												$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
												$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
												If ($_l_PositionHeaderStart>0)
													$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
													$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
													ARRAY TEXT:C222($_at_HeaderLines; 0)
													Repeat 
														$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
														If ($_l_Position>0)
															APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
															$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
															
														Else 
															APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
															$_t_Header:=""
														End if 
													Until ($_l_Position=0)
													ARRAY TEXT:C222($_at_HeaderItems; 0)
													ARRAY TEXT:C222($_at_HeaderDatas; 0)
													DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
													$_bo_MergeHeaders:=True:C214
													If ($_t_MethodTextOLD#$_t_MethodText)
														METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
														If ($_t_MethodText#"")
															//DIFFu_DBCodemanager ($_t_MethodName;Path table form+99;True)
															EXECUTE METHOD:C1007("DIFFu_DBCodemanager"; *; $_t_MethodName; Path table form:K72:5+99; True:C214)
															
														End if 
														
														//Now re-get the method code
														METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
														$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
														If ($_l_Position>0)
															$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
															For ($_l_Position; 1; Length:C16($_t_MethodText))
																If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
																	If (Length:C16($_t_methodText)>$_l_Position)
																		$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
																	Else 
																		$_t_MethodText:=""
																	End if 
																	$_l_Position:=999999
																End if 
															End for 
														End if 
														$_t_MethodTextOLD:=$_t_MethodText
														$_bo_Exit:=False:C215
														Repeat 
															If ($_t_MethodText#"")
																If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
																	$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
																Else 
																	$_bo_Exit:=True:C214
																End if 
															End if 
														Until ($_bo_Exit) | ($_t_MethodText="")
														
														
													End if 
													//now the new header should be here
													$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
													If ($_l_Position>0)
														$_bo_MergeHeaders:=True:C214
														$_t_NewHeader:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16(" //Code Starts Here"))
														$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" //Code Starts Here")+1)
														If ($_bo_MergeHeaders)
															$_l_Position:=Position:C15("//Variable Declarations"; $_t_NewHeader)
															If ($_l_Position>0)
																$_t_newBit:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
																$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
																ARRAY TEXT:C222($_at_HeaderLines2; 0)
																Repeat 
																	$_l_Position:=Position:C15(Char:C90(13); $_t_newBit)
																	If ($_l_Position>0)
																		APPEND TO ARRAY:C911($_at_HeaderLines2; Substring:C12($_t_newBit; 1; $_l_Position-1))
																		$_t_newBit:=Substring:C12($_t_newBit; $_l_Position+1)
																		
																	Else 
																		APPEND TO ARRAY:C911($_at_HeaderLines2; $_t_newBit)
																		$_t_newBit:=""
																	End if 
																Until ($_l_Position=0)
																
																$_bo_MergeHeaders:=True:C214
																ARRAY TEXT:C222($_at_HeaderItems2; 0)
																ARRAY TEXT:C222($_at_HeaderDatas2; 0)
																DB_FixMethods2019GetHeader("NEW"; ->$_at_HeaderLines2; ->$_at_HeaderItems2; ->$_at_HeaderDatas2)
																For ($_l_Build; 1; Size of array:C274($_at_HeaderItems2))
																	Case of 
																		: ($_at_HeaderItems2{$_l_Build}="Creator")
																			$_l_Position:=Find in array:C230($_at_HeaderItems; "Creator")
																			If ($_l_Position>0)
																				$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																			End if 
																		: ($_at_HeaderItems2{$_l_Build}="Created Date")
																			$_l_Position:=Find in array:C230($_at_HeaderItems; "Created Date")
																			If ($_l_Position>0)
																				$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																			End if 
																		: ($_at_HeaderItems2{$_l_Build}="Name")
																			$_l_Position:=Find in array:C230($_at_HeaderItems; "Method Name")
																			If ($_l_Position>0)
																				If ($_at_HeaderDatas2{$_l_Build}="")
																					$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																				End if 
																			End if 
																		: ($_at_HeaderItems2{$_l_Build}="Description")
																			$_l_Position:=Find in array:C230($_at_HeaderItems; "Description")
																			If ($_l_Position>0)
																				$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																			End if 
																		: ($_at_HeaderItems2{$_l_Build}="Modified Date")
																		: ($_at_HeaderItems2{$_l_Build}="Modified By")
																		: ($_at_HeaderItems2{$_l_Build}="Modified Notes")
																			$_l_Position:=Find in array:C230($_at_HeaderItems; "Amendments")
																			If ($_l_Position>0)
																				$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																			End if 
																	End case 
																End for 
																$_t_NewBit:="IF(FALSE)"+Char:C90(13)
																$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Name")
																$_t_Name:=""
																$_t_Description:=""
																$_t_Revisions:=""
																If ($_l_Ref>0)
																	$_t_Name:=$_at_HeaderDatas2{$_l_Ref}
																Else 
																	$_t_name:=$_t_MethodNameStripped
																	
																End if 
																$_t_NewBit:=$_t_NewBit+"//object Name: "+$_t_Name+Char:C90(13)
																$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Description")
																If ($_l_Ref>0)
																	$_t_Description:=$_at_HeaderDatas2{$_l_Ref}
																End if 
																For ($_l_Index4; 1; 10)
																	$_t_Description:=Replace string:C233($_t_Description; Char:C90(13)+Char:C90(13); Char:C90(13))
																End for 
																If ($_t_Description#"")
																	$_l_Length:=Length:C16($_t_Description)
																	If ($_t_Description[[Length:C16($_t_Description)]]=Char:C90(13))
																		$_t_Description:=Substring:C12($_t_Description; 1; $_l_Length-1)
																	End if 
																End if 
																$_t_NewBit:=$_t_NewBit+"//------------------ Method Notes ------------------"+$_t_Description+Char:C90(13)
																$_t_NewBit:=$_t_NewBit+"//------------------ Revision Control ----------------"+Char:C90(13)
																$_t_DateCreated:=""
																$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Created Date")
																If ($_l_Ref>0)
																	$_t_DateCreated:=$_at_HeaderDatas2{$_l_Ref}
																End if 
																If ($_t_DateCreated#"")
																	$_l_Length:=Length:C16($_t_DateCreated)
																	If ($_t_DateCreated[[Length:C16($_t_DateCreated)]]=Char:C90(13))
																		$_t_DateCreated:=Substring:C12($_t_DateCreated; 1; $_l_Length-1)
																	End if 
																End if 
																$_t_NewBit:=$_t_NewBit+"//Date Created: "+$_t_DateCreated+Char:C90(13)
																$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Creator")
																$_t_Creator:=""
																If ($_l_Ref>0)
																	$_t_Creator:=$_at_HeaderDatas2{$_l_Ref}
																End if 
																If ($_t_Creator#"")
																	$_l_Length:=Length:C16($_t_Creator)
																	If ($_t_Creator[[Length:C16($_t_Creator)]]=Char:C90(13))
																		$_t_Creator:=Substring:C12($_t_Creator; 1; $_l_Length-1)
																	End if 
																End if 
																$_t_NewBit:=$_t_NewBit+"//Created BY: "+$_t_Creator+Char:C90(13)
																$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Date")
																$_t_DateModified:=""
																If ($_l_Ref>0)
																	$_t_DateModified:=$_at_HeaderDatas2{$_l_Ref}
																End if 
																If ($_t_DateModified#"")
																	$_l_Length:=Length:C16($_t_DateModified)
																	If ($_t_DateModified[[Length:C16($_t_DateModified)]]=Char:C90(13))
																		$_t_DateModified:=Substring:C12($_t_DateModified; 1; $_l_Length-1)
																	End if 
																End if 
																$_t_NewBit:=$_t_NewBit+"//Date Modified: "+$_t_DateModified+Char:C90(13)
																$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified By")
																$_t_Modifier:=""
																If ($_l_Ref>0)
																	$_t_Modifier:=$_at_HeaderDatas2{$_l_Ref}
																End if 
																If ($_t_Modifier#"")
																	$_l_Length:=Length:C16($_t_Modifier)
																	If ($_t_Modifier[[Length:C16($_t_Modifier)]]=Char:C90(13))
																		$_t_Modifier:=Substring:C12($_t_Modifier; 1; $_l_Length-1)
																	End if 
																End if 
																$_t_NewBit:=$_t_NewBit+"//Modified By "+$_t_Modifier+Char:C90(13)
																$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Notes")
																$_t_Notes:=""
																If ($_l_Ref>0)
																	$_t_Notes:=$_at_HeaderDatas2{$_l_Ref}
																End if 
																For ($_l_Index4; 1; 10)
																	$_t_Notes:=Replace string:C233($_t_Notes; Char:C90(13)+Char:C90(13); Char:C90(13))
																End for 
																If ($_t_Notes#"")
																	$_l_Length:=Length:C16($_t_Notes)
																	If ($_t_Notes[[Length:C16($_t_Notes)]]=Char:C90(13))
																		$_t_Notes:=Substring:C12($_t_Notes; 1; $_l_Length-1)
																	End if 
																End if 
																$_t_NewBit:=$_t_NewBit+"//Modification notes "+Char:C90(13)
																$_t_NewBit:=$_t_NewBit+$_t_Notes+Char:C90(13)
																$_t_NewBit:=$_t_NewBit+"END IF"+Char:C90(13)
																$_t_NewMethodText:=$_t_NewBit+Char:C90(13)+$_t_NewHeader+$_t_MethodText
																If ($_t_MethodTextOLD#$_t_NewMethodText)
																	METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
																End if 
															Else 
																//TRACE
															End if 
														End if 
														$_bo_MergeHeaders:=False:C215
														
													Else 
														//TRACE
													End if 
													
												Else 
													//this would be strange
													//TRACE
													
												End if 
											Else 
												//this would be strange
												//TRACE
											End if 
										Else 
											If ($_t_MethodTextOLD#$_t_MethodText)
												METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
											End if 
											If ($_t_MethodText#"")
												//DIFFu_DBCodemanager ($_t_MethodName;Path table form+99;True)
												EXECUTE METHOD:C1007("DIFFu_DBCodemanager"; *; $_t_MethodName; Path table form:K72:5+99; True:C214)
												
												$_l_Index:=$_l_Index-1
											End if 
											////TRACE
										End if 
									: ($_l_Position>0)
										//find the old header-if it is there and replace it.
										$_l_PositionCompiler1:=Position:C15("//Variable Declarations"; $_t_MethodText)
										$_t_Delcarations:=Substring:C12($_t_MethodText; $_l_PositionCompiler1; $_l_Position)
										DB_FixMethodDeclarations2020($_t_MethodName; $_t_Delcarations; ->$_at_AllArrayNames; ->$_al_AllArrayTypes; ->$_at_AllVarNames; ->$_al_all_VarTypes; ->$_at_MethodDeclares; ->$_at_MethodNames; ->$_al_DeclareType)
										
										$_t_NewHeader:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16(" //Code Starts Here"))
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" //Code Starts Here")+1)
										//now we have 3 possible outcomes
										//1)there is no old header-do nothing-its a new method
										//2) there is an old header on the remaing text-this will the normal
										//3) i have extracted the header already and stuck into the new header
										///
										$_l_Position:=Position:C15("//Creator: "; $_t_MethodText)
										If ($_l_Position=0)
											$_l_Position:=Position:C15("// Creator:"; $_t_MethodText)
										End if 
										$_bo_MergeHeaders:=False:C215
										
										If ($_l_Position>0)  //this is scenario 1.. we want to take out the old header
											
											$_t_BeforeCreator:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
											$_l_Position:=Position:C15("Amendments"; $_t_MethodText)
											If ($_l_Position>0)
												$_t_beforeAmend:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
												$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
												$_l_Position:=Position:C15("END IF"; $_t_MethodText)
												$_t_PrependBefore:=""
												Repeat 
													
													$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
													For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
														Case of 
															: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
																//this is a commented out line
																//so get the next end if
																$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
																$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
																$_l_CheckifComment:=0
															: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
																//this is not a comment
																$_l_CheckifComment:=0
																$_bo_NotComment:=True:C214
															: ($_l_CheckifComment=1)
																$_l_CheckifComment:=0
																$_bo_NotComment:=True:C214
														End case 
													End for 
													$_l_Position:=Position:C15("END IF"; $_t_MethodText)
												Until ($_bo_NotComment)
												If ($_t_PrependBefore#"")
													$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
												End if 
												$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
												$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
												$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
												If ($_l_PositionHeaderStart>0)
													$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
													$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
													ARRAY TEXT:C222($_at_HeaderLines; 0)
													Repeat 
														$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
														If ($_l_Position>0)
															APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
															$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
															
														Else 
															APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
															$_t_Header:=""
														End if 
													Until ($_l_Position=0)
													ARRAY TEXT:C222($_at_HeaderItems; 0)
													ARRAY TEXT:C222($_at_HeaderDatas; 0)
													DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
													
													$_bo_MergeHeaders:=True:C214
													
													
													$_t_NewMethodText:=$_t_NewHeader+$_t_MethodText
													If ($_t_MethodTextOLD#$_t_NewMethodText)
														METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
													End if 
													
													
													
													
													
												Else 
													//this would be strange
													//TRACE
													
												End if 
											Else 
												//this would be strange
												//TRACE
											End if 
										Else 
											//there is no old header in the text
											//we now want to look for the old header in the new header..
											///
											$_l_Position:=Position:C15("//Creator: "; $_t_NewHeader)
											If ($_l_Position=0)
												$_l_Position:=Position:C15("// Creator:"; $_t_NewHeader)
											End if 
											
											If ($_l_Position>0)
												$_t_BeforeCreator:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
												$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
												$_l_Position:=Position:C15("Amendments"; $_t_NewHeader)
												If ($_l_Position>0)
													$_t_beforeAmend:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
													$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
													$_l_Position:=Position:C15("END IF"; $_t_NewHeader)
													$_t_PrependBefore:=""
													Repeat 
														
														$_t_BeforeMethod:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16("END IF"))
														For ($_l_CheckifComment; Length:C16($_t_BeforeMethod); 1; -1)
															Case of 
																: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)="//@")
																	//this is a commented out line
																	//so get the next end if
																	$_t_PrependBefore:=$_t_PrependBefore+$_t_BeforeMethod
																	$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("END IF")+1)
																	$_l_CheckifComment:=0
																: (Substring:C12($_t_BeforeMethod; $_l_CheckifComment)=(Char:C90(13)+"@"))
																	//this is not a comment
																	$_l_CheckifComment:=0
																	$_bo_NotComment:=True:C214
																: ($_l_CheckifComment=1)
																	$_l_CheckifComment:=0
																	$_bo_NotComment:=True:C214
															End case 
														End for 
														$_l_Position:=Position:C15("END IF"; $_t_MethodText)
													Until ($_bo_NotComment)
													If ($_t_PrependBefore#"")
														$_t_BeforeMethod:=$_t_PrependBefore+$_t_BeforeMethod
													End if 
													$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position+Length:C16("END IF")+1)
													$_t_Header:=$_t_BeforeCreator+$_t_beforeAmend+$_t_BeforeMethod
													
													$_l_PositionHeaderStart:=Position:C15("If (False)"; $_t_Header)
													If ($_l_PositionHeaderStart>0)
														$_t_BeforeHeader:=Substring:C12($_t_Header; 1; $_l_PositionHeaderStart-1)
														$_t_Header:=Substring:C12($_t_Header; $_l_PositionHeaderStart)
														ARRAY TEXT:C222($_at_HeaderLines; 0)
														Repeat 
															$_l_Position:=Position:C15(Char:C90(13); $_t_Header)
															If ($_l_Position>0)
																APPEND TO ARRAY:C911($_at_HeaderLines; Substring:C12($_t_Header; 1; $_l_Position-1))
																$_t_Header:=Substring:C12($_t_Header; $_l_Position+1)
																
															Else 
																APPEND TO ARRAY:C911($_at_HeaderLines; $_t_Header)
																$_t_Header:=""
															End if 
														Until ($_l_Position=0)
														ARRAY TEXT:C222($_at_HeaderItems; 0)
														ARRAY TEXT:C222($_at_HeaderDatas; 0)
														DB_FixMethods2019GetHeader("OLD"; ->$_at_HeaderLines; ->$_at_HeaderItems; ->$_at_HeaderDatas)
														$_bo_MergeHeaders:=True:C214
														
														//METHOD SET CODE($_t_MethodName;$_t_MethodText)
														//Now re-get the method code
														//METHOD GET CODE($_t_MethodName;$_t_MethodText)
														
														
													Else 
														//this would be strange
														//TRACE
														
													End if 
												Else 
													//this would be strange
													////TRACE
												End if 
											Else 
												/////TRACE
											End if 
											
											///
										End if 
										//now extract the data from the important bit of the new header
										If ($_bo_MergeHeaders)
											$_l_Position:=Position:C15("//Variable Declarations"; $_t_NewHeader)
											If ($_l_Position>0)
												$_t_newBit:=Substring:C12($_t_NewHeader; 1; $_l_Position-1)
												$_t_NewHeader:=Substring:C12($_t_NewHeader; $_l_Position)
												ARRAY TEXT:C222($_at_HeaderLines2; 0)
												Repeat 
													$_l_Position:=Position:C15(Char:C90(13); $_t_newBit)
													If ($_l_Position>0)
														APPEND TO ARRAY:C911($_at_HeaderLines2; Substring:C12($_t_newBit; 1; $_l_Position-1))
														$_t_newBit:=Substring:C12($_t_newBit; $_l_Position+1)
														
													Else 
														APPEND TO ARRAY:C911($_at_HeaderLines2; $_t_newBit)
														$_t_newBit:=""
													End if 
												Until ($_l_Position=0)
												
												$_bo_MergeHeaders:=True:C214
												ARRAY TEXT:C222($_at_HeaderItems2; 0)
												ARRAY TEXT:C222($_at_HeaderDatas2; 0)
												DB_FixMethods2019GetHeader("NEW"; ->$_at_HeaderLines2; ->$_at_HeaderItems2; ->$_at_HeaderDatas2)
												For ($_l_Build; 1; Size of array:C274($_at_HeaderItems2))
													Case of 
														: ($_at_HeaderItems2{$_l_Build}="Creator")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Creator")
															If ($_l_Position>0)
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
														: ($_at_HeaderItems2{$_l_Build}="Created Date")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Created Date")
															If ($_l_Position>0)
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
														: ($_at_HeaderItems2{$_l_Build}="Name")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Method Name")
															If ($_l_Position>0)
																If ($_at_HeaderDatas2{$_l_Build}="")
																	$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
																End if 
															End if 
														: ($_at_HeaderItems2{$_l_Build}="Description")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Description")
															If ($_l_Position>0)
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
														: ($_at_HeaderItems2{$_l_Build}="Modified Date")
														: ($_at_HeaderItems2{$_l_Build}="Modified By")
														: ($_at_HeaderItems2{$_l_Build}="Modified Notes")
															$_l_Position:=Find in array:C230($_at_HeaderItems; "Amendments")
															If ($_l_Position>0)
																$_at_HeaderDatas2{$_l_Build}:=$_at_HeaderDatas{$_l_Position}
															End if 
													End case 
												End for 
												$_t_NewBit:="IF(FALSE)"+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Name")
												$_t_Name:=""
												$_t_Description:=""
												$_t_Revisions:=""
												If ($_l_Ref>0)
													$_t_Name:=$_at_HeaderDatas2{$_l_Ref}
												Else 
													$_t_Name:=$_t_MethodNameStripped
												End if 
												$_t_NewBit:=$_t_NewBit+"//object Method Name: "+$_t_Name+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Description")
												If ($_l_Ref>0)
													$_t_Description:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												For ($_l_Index4; 1; 10)
													$_t_Description:=Replace string:C233($_t_Description; Char:C90(13)+Char:C90(13); Char:C90(13))
												End for 
												If ($_t_Description#"")
													$_l_Length:=Length:C16($_t_Description)
													If ($_t_Description[[Length:C16($_t_Description)]]=Char:C90(13))
														$_t_Description:=Substring:C12($_t_Description; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//------------------ Method Notes ------------------"+$_t_Description+Char:C90(13)
												$_t_NewBit:=$_t_NewBit+"//------------------ Revision Control ----------------"+Char:C90(13)
												$_t_DateCreated:=""
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Created Date")
												If ($_l_Ref>0)
													$_t_DateCreated:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												If ($_t_DateCreated#"")
													$_l_Length:=Length:C16($_t_DateCreated)
													If ($_t_DateCreated[[Length:C16($_t_DateCreated)]]=Char:C90(13))
														$_t_DateCreated:=Substring:C12($_t_DateCreated; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Date Created: "+$_t_DateCreated+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Creator")
												$_t_Creator:=""
												If ($_l_Ref>0)
													$_t_Creator:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												If ($_t_Creator#"")
													$_l_Length:=Length:C16($_t_Creator)
													If ($_t_Creator[[Length:C16($_t_Creator)]]=Char:C90(13))
														$_t_Creator:=Substring:C12($_t_Creator; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Created BY: "+$_t_Creator+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Date")
												$_t_DateModified:=""
												If ($_l_Ref>0)
													$_t_DateModified:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												If ($_t_DateModified#"")
													$_l_Length:=Length:C16($_t_DateModified)
													If ($_t_DateModified[[Length:C16($_t_DateModified)]]=Char:C90(13))
														$_t_DateModified:=Substring:C12($_t_DateModified; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Date Modified: "+$_t_DateModified+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified By")
												$_t_Modifier:=""
												If ($_l_Ref>0)
													$_t_Modifier:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												If ($_t_Modifier#"")
													$_l_Length:=Length:C16($_t_Modifier)
													If ($_t_Modifier[[Length:C16($_t_Modifier)]]=Char:C90(13))
														$_t_Modifier:=Substring:C12($_t_Modifier; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Modified By "+$_t_Modifier+Char:C90(13)
												$_l_Ref:=Find in array:C230($_at_HeaderItems2; "Modified Notes")
												$_t_Notes:=""
												If ($_l_Ref>0)
													$_t_Notes:=$_at_HeaderDatas2{$_l_Ref}
												End if 
												For ($_l_Index4; 1; 10)
													$_t_Notes:=Replace string:C233($_t_Notes; Char:C90(13)+Char:C90(13); Char:C90(13))
												End for 
												If ($_t_Notes#"")
													$_l_Length:=Length:C16($_t_Notes)
													If ($_t_Notes[[Length:C16($_t_Notes)]]=Char:C90(13))
														$_t_Notes:=Substring:C12($_t_Notes; 1; $_l_Length-1)
													End if 
												End if 
												$_t_NewBit:=$_t_NewBit+"//Modification notes "+Char:C90(13)
												$_t_NewBit:=$_t_NewBit+$_t_Notes+Char:C90(13)
												$_t_NewBit:=$_t_NewBit+"END IF"+Char:C90(13)
												$_t_NewMethodText:=$_t_NewBit+Char:C90(13)+$_t_NewHeader+$_t_MethodText
												If ($_t_MethodTextOLD#$_t_NewMethodText)
													METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
												End if 
											Else 
												//TRACE
											End if 
										End if 
										$_bo_MergeHeaders:=False:C215
								End case 
								METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
								$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
								If ($_l_Position>0)
									$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
									For ($_l_Position; 1; Length:C16($_t_MethodText))
										If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
											If (Length:C16($_t_methodText)>$_l_Position)
												$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
											Else 
												$_t_MethodText:=""
											End if 
											$_l_Position:=999999
										End if 
									End for 
								End if 
								$_t_MethodTextOLD:=$_t_MethodText
								$_bo_Exit:=False:C215
								Repeat 
									If ($_t_MethodText#"")
										If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
											$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
										Else 
											$_bo_Exit:=True:C214
										End if 
									End if 
								Until ($_bo_Exit) | ($_t_MethodText="")
								
								
								
								$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
								If ($_l_Position>0)  //it would be odd iff it is not here
									$_t_Header:=Substring:C12($_t_MethodText; 1; $_l_Position)
									If (Length:C16($_t_methodText)>$_l_Position)
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
									Else 
										$_t_MethodText:=""
									End if 
									
									
									$_t_NewMethodText:=""
									Repeat 
										$_l_EndofLine:=Position:C15(Char:C90(13); $_t_MethodText)
										If ($_l_EndofLine>0)
											$_t_ThisLine:=Substring:C12($_t_MethodText; 1; $_l_EndofLine-1)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_EndofLine+1)
										Else 
											$_t_ThisLine:=$_t_MethodText
											$_t_MethodText:=""
										End if 
										$_bo_Exit:=False:C215
										Repeat 
											If ($_t_ThisLine#"")
												If ($_t_ThisLine[[1]]=Char:C90(9)) | ($_t_ThisLine[[1]]=" ")
													$_t_ThisLine:=Substring:C12($_t_ThisLine; 2)
												Else 
													$_bo_Exit:=True:C214
												End if 
											End if 
										Until ($_t_ThisLine="") | ($_bo_Exit)
										Case of 
											: ($_t_ThisLine="C_String@")
											: ($_t_ThisLine="_o_C_String@")
											: ($_t_ThisLine="C_Text@")
											: ($_t_ThisLine="C_Longint@")
											: ($_t_ThisLine="_o_C_integer@")
											: ($_t_ThisLine="C_OBJECT@")
											: ($_t_ThisLine="C_BOOLEAN@")
											: ($_t_ThisLine="C_TIME@")
											: ($_t_ThisLine="C_BLOB@")
											: ($_t_ThisLine="C_Date@")
											: ($_t_ThisLine="C_picture@")
											: ($_t_ThisLine="C_pointer@")
											: ($_t_ThisLine="C_Real@")
											: ($_t_ThisLine="C_picture@")
												
											Else 
												$_t_NewMethodText:=$_t_NewMethodText+Char:C90(13)+$_t_ThisLine
												
										End case 
										
									Until ($_t_MethodText="")
									For ($_l_Index4; 1; 20)
										$_t_Header:=Replace string:C233($_t_Header; Char:C90(13)+Char:C90(13); Char:C90(13))
									End for 
									$_t_NewMethodText:=$_t_Header+$_t_NewMethodText
									For ($_l_Index4; 1; 20)
										$_t_NewMethodText:=Replace string:C233($_t_NewMethodText; Char:C90(13)+Char:C90(13)+"  //Code Starts Here"; Char:C90(13)+"  //Code Starts Here")
									End for 
									If ($_t_MethodTextOLD#$_t_NewMethodText)
										METHOD SET CODE:C1194($_t_MethodName; $_t_NewMethodText)
										METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
										$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
										If ($_l_Position>0)
											$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
											For ($_l_Position; 1; Length:C16($_t_MethodText))
												If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
													If (Length:C16($_t_methodText)>$_l_Position)
														$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
													Else 
														$_t_MethodText:=""
													End if 
													$_l_Position:=999999
												End if 
											End for 
										End if 
										$_t_MethodTextOLD:=$_t_MethodText
										$_bo_Exit:=False:C215
										Repeat 
											If ($_t_MethodText#"")
												If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13))
													$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
												Else 
													$_bo_Exit:=True:C214
												End if 
											End if 
										Until ($_bo_Exit) | ($_t_MethodText="")
										
										
									End if 
									$_l_Position:=Position:C15(" //Code Starts Here"; $_t_MethodText)
									If ($_l_Position>0)  //it would be odd iff it is not here
										$_T_Header:=Substring:C12($_t_MethodText; 1; $_l_Position+Length:C16(" //Code Starts Here"))
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" //Code Starts Here")+1)
										$_t_MethodText:=STR_RemoveLeadTrailSpace($_t_MethodText)
										$_l_Position:=Position:C15("$_t_oldMethodName:=ERR_MethodTracker ("; $_t_MethodText)
										If ($_l_Position>1)
											If ($_t_MethodText[[$_l_Position-1]]="/")
												$_l_Position:=0
											End if 
										End if 
										If ($_l_Position=0) | ($_l_Position>20)
											
											$_t_MethodText:="$_t_oldMethodName:=ERR_MethodTracker ("+Char:C90(34)+"OBJ "+$_t_MethodNameStripped+Char:C90(34)+";FORM EVENT)"+Char:C90(13)+$_t_MethodText
										End if 
										$_bo_exit:=False:C215
										Repeat 
											If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(9)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=" ")
												$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
											Else 
												$_bo_exit:=True:C214
											End if 
										Until ($_bo_exit)
										$_bo_exit:=False:C215
										
										For ($_l_LastLine; Length:C16($_t_MethodText); 1; -1)
											
											If ($_t_MethodText[[$_l_LastLine]]=Char:C90(13))
												$_t_LastLine:=Substring:C12($_t_MethodText; $_l_LastLine+1)
												$_t_MethodText:=Substring:C12($_t_MethodText; 1; $_l_LastLine-1)
												$_l_LastLine:=0
												$_t_LastLine:=STR_RemoveLeadTrailSpace($_t_LastLine)
												If (Position:C15("ERR_MethodTrackerReturn"; $_t_LastLine)=0)
													
													$_t_LastLine:=$_t_LastLine+Char:C90(13)+"ERR_MethodTrackerReturn("+Char:C90(34)+"OBJ "+$_t_MethodNameStripped+Char:C90(34)+";$_t_oldMethodName)"
													$_bo_exit:=False:C215
												End if 
												Repeat 
													If ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(13)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=Char:C90(9)) | ($_t_MethodText[[Length:C16($_t_MethodText)]]=" ")
														
														$_t_MethodText:=Substring:C12($_t_MethodText; 1; Length:C16($_t_MethodText)-1)
													Else 
														$_bo_exit:=True:C214
													End if 
												Until ($_bo_exit)
												$_t_MethodText:=$_T_Header+$_t_MethodText+Char:C90(13)+$_t_LastLine
												If ($_t_MethodTextOLD#$_t_MethodText)
													METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
													If ($_t_MethodText#"")
														//DIFFu_DBCodemanager ($_t_MethodName;Path table form+99;True)
														EXECUTE METHOD:C1007("DIFFu_DBCodemanager"; *; $_t_MethodName; Path table form:K72:5+99; True:C214)
														
													End if 
												End if 
												
											End if 
										End for 
										
										
									End if 
									
								End if 
								METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
								$_l_Position:=Position:C15(" comment added and reserved by 4D"; $_t_MethodText)
								If ($_l_Position>0)
									$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+Length:C16(" comment added and reserved by 4D"))
									For ($_l_Position; 1; Length:C16($_t_MethodText))
										If ($_t_MethodText[[$_l_Position]]=Char:C90(13)) | ($_t_MethodText[[$_l_Position]]=Char:C90(10))
											If (Length:C16($_t_methodText)>$_l_Position)
												$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
											Else 
												$_t_MethodText:=""
											End if 
											$_l_Position:=Length:C16($_t_MethodText)*2
										End if 
									End for 
								End if 
								$_bo_InsertCHanges:=False:C215
								If (False:C215)
									$_l_Position:=Position:C15("$_t_oldMethodName:=ERR_MethodTracker"; $_t_MethodText)
									If ($_l_Position>0)
										$_t_before:=Substring:C12($_t_MethodText; $_l_Position-1)
										$_t_After:=Substring:C12($_t_MethodText; $_l_Position)
										For ($_l_EndofLine; 1; Length:C16($_t_After))
											If ($_t_After[[$_l_EndofLine]]=Char:C90(10)) | ($_t_After[[$_l_EndofLine]]=Char:C90(13))
												$_t_ThisLine:=Substring:C12($_t_After; 1; $_l_EndofLine-1)
												$_l_EndofLine2:=Length:C16($_t_After)
												$_t_After:=Substring:C12($_t_After; $_l_EndofLine+1)
												$_l_EndofLine:=$_l_EndofLine2
												$_l_position2:=Position:C15($_t_ThisLine; $_t_After)
												If ($_l_position2>0)
													$_t_After:=Replace string:C233($_t_After; $_t_ThisLine; "")
													$_t_MethodText:=$_t_before+$_t_ThisLine+Char:C90(13)+$_t_After
													$_bo_InsertCHanges:=True:C214
												End if 
											End if 
										End for 
									End if 
								End if 
								Repeat 
									$_l_Position:=Position:C15("_O_ENABLE BUTTON"; $_t_MethodText)
									If ($_l_Position>0)
										
										$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
										$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_ENABLE BUTTON"))
										//We need to now find the end of the line(")"
										$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
										If ($_l_Position2>0)
											$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
											$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
											$_t_ThisLIne:="Object Set Enabled"+$_t_ThisLIne+";TRUE)"
											$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
											$_bo_InsertCHanges:=False:C215
										End if 
									End if 
								Until ($_l_Position=0)
								Repeat 
									$_l_Position:=Position:C15("_O_Disable BUTTON"; $_t_MethodText)
									If ($_l_Position>0)
										
										$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
										$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_DISABLE BUTTON"))
										//We need to now find the end of the line(")"
										$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
										If ($_l_Position2>0)
											$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
											$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
											$_t_ThisLIne:="Object Set Enabled"+$_t_ThisLIne+";FALSE)"
											$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
											$_bo_InsertCHanges:=False:C215
										End if 
									End if 
								Until ($_l_Position=0)
								//_o_REDRAW LIST
								$_t_StoreBefore:=""
								Repeat 
									$_l_Position:=Position:C15("_o_REDRAW LIST"; $_t_MethodText)
									If ($_l_Position>0)
										//TRACE
										$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
										$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_o_REDRAW LIST"))
										//We need to now find the end of the line(")"
										$_t_BeforeEnd:=Substring:C12($_T_MethodBefore; Length:C16($_T_MethodBefore)-2)
										If ($_t_BeforeEnd#"//")
											$_t_StoreBefore:=$_t_StoreBefore+$_T_MethodBefore+"//_o_REDRAW LIST"
											$_t_MethodText:=$_T_MethodAfter
											$_bo_InsertCHanges:=True:C214
										Else 
											$_t_StoreBefore:=$_t_StoreBefore+$_T_MethodBefore+"_o_REDRAW LIST"
											$_t_MethodText:=$_T_MethodAfter
											//dont change the flag
										End if 
									End if 
								Until ($_l_Position=0)
								If ($_t_StoreBefore#"")
									$_t_MethodText:=$_t_StoreBefore+$_t_MethodText
								End if 
								//_O_C_STRING(20;$SD_S20_DiaryResultCode)
								Repeat 
									$_l_Position:=Position:C15("_O_C_STRING"; $_t_MethodText)
									If ($_l_Position>0)
										
										$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
										$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_C_STRING"))
										//We need to now find the end of the line(")"
										$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
										If ($_l_Position2>0)
											$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
											$_l_Position:=Position:C15(";"; $_t_ThisLIne)
											$_t_ThisLIne:=Substring:C12($_t_ThisLIne; $_l_Position+1)
											$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
											$_t_ThisLIne:="C_TEXT("+$_t_ThisLIne+")"
											$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
											$_bo_InsertCHanges:=True:C214
										End if 
									End if 
								Until ($_l_Position=0)
								//Array string(20;$SD_S20_DiaryResultCode)
								Repeat 
									$_l_Position:=Position:C15("_O_ARRAY STRING"; $_t_MethodText)
									If ($_l_Position>0)
										
										$_T_MethodBefore:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
										$_T_MethodAfter:=Substring:C12($_t_MethodText; $_l_Position+Length:C16("_O_ARRAY STRING"))
										//We need to now find the end of the line(")"
										$_l_Position2:=Position:C15(")"; $_T_MethodAfter)
										If ($_l_Position2>0)
											$_t_ThisLIne:=Substring:C12($_T_MethodAfter; 1; $_l_Position2-1)
											$_l_Position:=Position:C15(";"; $_t_ThisLIne)
											$_t_ThisLIne:=Substring:C12($_t_ThisLIne; $_l_Position+1)
											$_T_MethodAfter:=Substring:C12($_T_MethodAfter; $_l_Position2+1)
											$_t_ThisLIne:="ARRAY TEXT("+$_t_ThisLIne+")"
											$_t_MethodText:=$_T_MethodBefore+$_t_ThisLIne+$_T_MethodAfter
											$_bo_InsertCHanges:=True:C214
										End if 
									End if 
								Until ($_l_Position=0)
								
								$_l_Position:=Position:C15("//C_Unknown($_t"; $_t_MethodText)
								If ($_l_Position=0)
									$_l_Position:=Position:C15("//C_Unknown($_i"; $_t_MethodText)
									If ($_l_Position=0)
										$_l_Position:=Position:C15("//C_Unknown($_a"; $_t_MethodText)
										If ($_l_Position=0)
											$_l_Position:=Position:C15("//C_Unknown($_l"; $_t_MethodText)
										Else 
											$_l_Position:=Position:C15("//C_Unknown"; $_t_MethodText)
										End if 
									End if 
								End if 
								If ($_l_Position>0) | ($_bo_InsertCHanges)  //force a 
									
									$_t_MethodText:=$_t_MethodText+" "
									METHOD SET CODE:C1194($_t_MethodName; $_t_MethodText)
								End if 
								
							End if 
						End if 
						
					End if 
				End for 
			End for 
		End if 
	End for 
	TRACE:C157
	
	
	
	
	
End if 


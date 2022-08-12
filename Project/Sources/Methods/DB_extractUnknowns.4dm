//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_extractUnknowns
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/02/2020
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DatabaseParameters; 0)
	ARRAY LONGINT:C221($_al_NumberOfPlug; 0)
	ARRAY LONGINT:C221($_al_ParameterValue; 0)
	ARRAY LONGINT:C221($_al_ParameterValueType; 0)
	ARRAY LONGINT:C221($_al_UnknownCount; 0)
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
	ARRAY TEXT:C222($_at_MethodPaths; 0)
	ARRAY TEXT:C222($_at_ParameterValue; 0)
	ARRAY TEXT:C222($_at_PLugInName; 0)
	ARRAY TEXT:C222($_at_ResName; 0)
	ARRAY TEXT:C222($_at_UnknownLines; 0)
	ARRAY TEXT:C222($_at_IgnoreMethods; 0)
	C_BOOLEAN:C305($_bo_AmendmentsFound; $_Bo_AutoMany; $_Bo_AutoOne; $_bo_CreatedDateFound; $_bo_CreatorFound; $_bo_DeclarationsFound; $_bo_DescriptionFound; $_bo_Exit; $_bo_Ignore; $_Bo_Invisible; $_Bo_Mandatory)
	C_BOOLEAN:C305($_bo_MergeHeaders; $_bo_NameFound; $_Bo_ndex; $_bo_noModifications; $_Bo_NonEnterable; $_Bo_NonModifiable; $_bo_NotComment; $_bo_Nul; $_bo_ParametersFound; $_bo_RevisionsFound; $_Bo_TrigDel)
	C_BOOLEAN:C305($_Bo_trigSave; $_Bo_trigSaveNew; $_Bo_Unique; SYS_bo_NoTrack)
	C_DATE:C307($_Dte_ModificationDate)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_Build; $_l_CHar; $_l_CheckifComment; $_l_CHeckIgnore; $_l_ChoiceField; $_l_CurrentForm; $_l_CurrentFormNumber; $_l_CurrentTable; $_l_DestinationRow; $_l_EndofLine)
	C_LONGINT:C283($_l_FieldLength; $_l_FieldType; $_l_GetItems; $_l_Headers; $_l_Index; $_l_Index2; $_l_IsFieldValid; $_l_isTableNul; $_l_isTableValid; $_l_lastFieldNumber; $_l_LastLine)
	C_LONGINT:C283($_l_LastTableNumber; $_l_Length; $_l_Next; $_l_OneField; $_l_OneTable; $_l_ParseType; $_l_Platformproperties; $_l_Pos2; $_l_Position; $_l_PositionHeaderStart; $_l_Ref)
	C_LONGINT:C283($_l_SequenceConstant; $_l_SequenceNumber; $_l_SizeofArray; $_l_SourceRow; $_l_UPos; $_l_DiaryActionNum; rDiary; SMS_l_MessagesAvailable)
	C_OBJECT:C1216($_Obj_Components; $_Obj_DatabaseParameters; $_Obj_FieldProperties; $_Obj_Fields; $_Obj_Localization; $_Obj_PlugIns; $_Obj_Structure; $_Obj_TableProperties; $CORE_ob_FormObject)
	C_POINTER:C301($_Ptr_ptrTablePointer)
	C_REAL:C285(SMS_Credits)
	C_TEXT:C284(<>MAIL_t_SMTPServer; <>MIR_t _NextTimeIntervalMode; <>MIR_T_ErrorEmailAcount; <>Per_t_PersonnelNames_EmailSMTP; <>PER_t_CurrentUserInitials; $_t_Amendments; $_t_beforeAmend; $_t_BeforeCreator; $_t_BeforeHeader; $_t_BeforeMethod; $_t_Creator)
	C_TEXT:C284($_t_DateCreated; $_t_DateModified; $_t_DateTime; $_t_Delcarations; $_t_Description; $_t_Header; $_t_Ignore; $_t_LastLine; $_t_MethodName; $_t_MethodNameStripped; $_t_MethodText)
	C_TEXT:C284($_t_MethodTextOLD; $_t_Modifier; $_t_Name; $_t_newBit; $_t_NewHeader; $_t_NewMethodOLD; $_t_NewMethodText; $_t_Notes; $_t_oldMethodName; $_t_OldMethodText; $_t_Parameters)
	C_TEXT:C284($_t_PrependBefore; $_t_Revisions; $_t_TableName; $_t_ThisLine; $_t_ULine; $_Txt_CurrentDatabaseLocalizatio; $_Txt_DefaultDatabaseLocalizatio; $_txt_FieldName; $_Txt_InternalDatabaseLocalizati; $_Txt_ListName; $_txt_ReturnValue)
	C_TEXT:C284($_txt_TableName; $_Txt_tableNul; $_Txt_UserDatabaseLocalization; CORE_T_ParseFormName; EMAIL_t_EmailTo; EmailAddress; SMS_AccountName; SMS_Password; vLetterCode; vSearch; vText)
	C_TIME:C306(<>MIR_ti_BackupTime; <>MIR_ti_BackupTimeInterval; <>MIR_ti_Time; <>MIR_ti_TimeInterval; <>MIR_ti_TransactionDelay; $_ti_Doc; $_ti_ModificationTime)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_extractUnknowns")

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
	//C_LONGINT($_l_Index)
	
	//C_UNKNOWN(DIFFu_DBCodemanager)
	ARRAY LONGINT:C221($_al_DatabaseParameters; 0)
	ARRAY LONGINT:C221($_al_NumberOfPlug; 0)
	ARRAY LONGINT:C221($_al_ParameterValue; 0)
	ARRAY LONGINT:C221($_al_ParameterValueType; 0)
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
	ARRAY TEXT:C222($_at_MethodPaths; 0)
	ARRAY TEXT:C222($_at_ParameterValue; 0)
	ARRAY TEXT:C222($_at_PLugInName; 0)
	ARRAY TEXT:C222($_at_IgnoreMethods; 0)
End if 
//Code Starts Here
$_l_ParseType:=1
ARRAY TEXT:C222($_at_UnknownLines; 0)
ARRAY LONGINT:C221($_al_UnknownCount; 0)

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


TRACE:C157


//CODE_ManagerStructureExport (2;True)  //Makes sure the latest version of all Forms is exported
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
			Repeat 
				$_l_UPos:=Position:C15("C_UNKNOWN"; $_t_MethodText)
				If ($_l_Upos>0)
					$_t_MethodText:=Substring:C12($_t_MethodText; $_l_UPos-1)
					$_l_Pos2:=Position:C15(Char:C90(13); $_t_MethodText)
					If ($_l_Pos2>0)
						$_t_ULine:=Substring:C12($_t_MethodText; 1; $_l_Pos2-1)
						$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Pos2+1)
						If ($_t_ULine#"")
							$_l_Position:=Find in array:C230($_at_UnknownLines; $_t_ULine)
							If ($_l_Position>0)
								$_al_UnknownCount{$_l_Position}:=$_al_UnknownCount{$_l_Position}+1
							Else 
								APPEND TO ARRAY:C911($_at_UnknownLines; $_t_ULine)
								APPEND TO ARRAY:C911($_al_UnknownCount; 1)
								
							End if 
						End if 
					End if 
				End if 
				
			Until ($_l_UPos=0)
			
			
		End if 
	End for 
	
	
	ARRAY TEXT:C222($_at_MethodPaths; 0)
	METHOD GET PATHS:C1163(Path project method:K72:1; $_at_MethodPaths; *)
	SORT ARRAY:C229($_at_MethodPaths; >)
	$_l_SizeofArray:=Size of array:C274($_at_MethodPaths)
	For ($_l_Index; 1; $_l_SizeofArray)
		//So here we are going to get the method text
		
		$_t_MethodName:=$_at_MethodPaths{$_l_Index}
		MESSAGE:C88($_t_MethodName+" "+String:C10($_l_Index)+" of "+String:C10($_l_SizeofArray))
		
		$_bo_Ignore:=False:C215
		If ("AA_BUILDLISTFROMDATA"=$_t_MethodName)
			TRACE:C157
		End if 
		//TRACE
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
			Repeat 
				$_l_UPos:=Position:C15("C_UNKNOWN"; $_t_MethodText)
				If ($_l_Upos>0)
					$_t_MethodText:=Substring:C12($_t_MethodText; $_l_UPos-1)
					
					$_l_Pos2:=Position:C15(Char:C90(13); $_t_MethodText)
					If ($_l_Pos2>0)
						$_t_ULine:=Substring:C12($_t_MethodText; 1; $_l_Pos2-1)
						$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Pos2+1)
						If ($_t_ULine#"")
							$_l_Position:=Find in array:C230($_at_UnknownLines; $_t_ULine)
							If ($_l_Position>0)
								$_al_UnknownCount{$_l_Position}:=$_al_UnknownCount{$_l_Position}+1
							Else 
								APPEND TO ARRAY:C911($_at_UnknownLines; $_t_ULine)
								APPEND TO ARRAY:C911($_al_UnknownCount; 1)
								
							End if 
						End if 
					End if 
				End if 
				
			Until ($_l_UPos=0)
			
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
						Repeat 
							$_l_UPos:=Position:C15("C_UNKNOWN"; $_t_MethodText)
							If ($_l_Upos>0)
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_UPos-1)
								
								$_l_Pos2:=Position:C15(Char:C90(13); $_t_MethodText)
								If ($_l_Pos2>0)
									$_t_ULine:=Substring:C12($_t_MethodText; 1; $_l_Pos2-1)
									$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Pos2+1)
									If ($_t_ULine#"")
										$_l_Position:=Find in array:C230($_at_UnknownLines; $_t_ULine)
										If ($_l_Position>0)
											$_al_UnknownCount{$_l_Position}:=$_al_UnknownCount{$_l_Position}+1
										Else 
											APPEND TO ARRAY:C911($_at_UnknownLines; $_t_ULine)
											APPEND TO ARRAY:C911($_al_UnknownCount; 1)
											
										End if 
									End if 
								End if 
							End if 
							
						Until ($_l_UPos=0)
						
						
					End if 
				Else 
					If (Not:C34($_bo_Ignore))
						$_t_MethodName:=$_at_MethodPaths{$_l_Index}
						//TRACE
						MESSAGE:C88($_at_FormNames{$_l_CurrentForm}+$_t_MethodName+" "+String:C10($_l_Index)+" of "+String:C10($_l_SizeofArray))
						
						$_t_MethodNameStripped:=Replace string:C233($_t_MethodName; "{formmethod}"; "")
						$_t_MethodNameStripped:=Replace string:C233($_t_MethodNameStripped; "[projectForm]/"; "")
						$_t_MethodNameStripped:=Replace string:C233($_t_MethodNameStripped; "/"; ".")
						
						METHOD GET MODIFICATION DATE:C1170($_t_MethodName; $_Dte_ModificationDate; $_ti_ModificationTime; *)
						METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
						
						Repeat 
							$_l_UPos:=Position:C15("C_UNKNOWN"; $_t_MethodText)
							If ($_l_Upos>0)
								$_t_MethodText:=Substring:C12($_t_MethodText; $_l_UPos-1)
								
								$_l_Pos2:=Position:C15(Char:C90(13); $_t_MethodText)
								If ($_l_Pos2>0)
									$_t_ULine:=Substring:C12($_t_MethodText; 1; $_l_Pos2-1)
									$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Pos2+1)
									If ($_t_ULine#"")
										$_l_Position:=Find in array:C230($_at_UnknownLines; $_t_ULine)
										If ($_l_Position>0)
											$_al_UnknownCount{$_l_Position}:=$_al_UnknownCount{$_l_Position}+1
										Else 
											APPEND TO ARRAY:C911($_at_UnknownLines; $_t_ULine)
											APPEND TO ARRAY:C911($_al_UnknownCount; 1)
											
										End if 
									End if 
								End if 
							End if 
							
						Until ($_l_UPos=0)
						
						
					End if 
					
				End if 
			End for 
		End for 
	End if 
	///this can only work if you pass the pointers@
	$_l_LastTableNumber:=Get last table number:C254
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
							Repeat 
								$_l_UPos:=Position:C15("C_UNKNOWN"; $_t_MethodText)
								If ($_l_Upos>0)
									$_t_MethodText:=Substring:C12($_t_MethodText; $_l_UPos-1)
									
									$_l_Pos2:=Position:C15(Char:C90(13); $_t_MethodText)
									If ($_l_Pos2>0)
										$_t_ULine:=Substring:C12($_t_MethodText; 1; $_l_Pos2-1)
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Pos2+1)
										If ($_t_ULine#"")
											$_l_Position:=Find in array:C230($_at_UnknownLines; $_t_ULine)
											If ($_l_Position>0)
												$_al_UnknownCount{$_l_Position}:=$_al_UnknownCount{$_l_Position}+1
											Else 
												APPEND TO ARRAY:C911($_at_UnknownLines; $_t_ULine)
												APPEND TO ARRAY:C911($_al_UnknownCount; 1)
												
											End if 
										End if 
									End if 
								End if 
								
							Until ($_l_UPos=0)
							
							
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
							Repeat 
								$_l_UPos:=Position:C15("C_UNKNOWN"; $_t_MethodText)
								If ($_l_Upos>0)
									$_t_MethodText:=Substring:C12($_t_MethodText; $_l_UPos-1)
									
									$_l_Pos2:=Position:C15(Char:C90(13); $_t_MethodText)
									If ($_l_Pos2>0)
										$_t_ULine:=Substring:C12($_t_MethodText; 1; $_l_Pos2-1)
										$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Pos2+1)
										If ($_t_ULine#"")
											$_l_Position:=Find in array:C230($_at_UnknownLines; $_t_ULine)
											If ($_l_Position>0)
												$_al_UnknownCount{$_l_Position}:=$_al_UnknownCount{$_l_Position}+1
											Else 
												APPEND TO ARRAY:C911($_at_UnknownLines; $_t_ULine)
												APPEND TO ARRAY:C911($_al_UnknownCount; 1)
												
											End if 
										End if 
									End if 
								End if 
								
							Until ($_l_UPos=0)
							
							
						End if 
						
					End if 
				End for 
			End for 
		End if 
	End for 
	$_ti_Doc:=Create document:C266(""; "TEXT")
	SORT ARRAY:C229($_al_UnknownCount; $_at_UnknownLines; <)
	For ($_l_Index; 1; Size of array:C274($_at_UnknownLines))
		SEND PACKET:C103($_ti_Doc; $_at_UnknownLines{$_l_Index}+Char:C90(9)+String:C10($_al_UnknownCount{$_l_Index}))
	End for 
	CLOSE DOCUMENT:C267($_ti_Doc)
End if 
ERR_MethodTrackerReturn("DB_extractUnknowns"; $_t_oldMethodName)
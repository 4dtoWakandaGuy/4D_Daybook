//%attributes = {}
If (False:C215)
	//Project Method Name:      HLP_MergeContextReference
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_AlternativeRefs; 0)
	ARRAY TEXT:C222($_at_AlternativeRefs2; 0)
	ARRAY TEXT:C222($_at_ContextDefaultRefs; 0)
	ARRAY TEXT:C222($_at_ContextDefaultRefs2; 0)
	ARRAY TEXT:C222($_at_ContextNames; 0)
	ARRAY TEXT:C222($_at_ContextNames2; 0)
	ARRAY TEXT:C222($_at_DocumentArray; 0)
	ARRAY TEXT:C222($_at_RecordArray; 0)
	C_BLOB:C604($_blb_Document)
	C_LONGINT:C283($_l_AlternativeRefIndex; $_l_CharacterPosition; $_l_ContextIndex; $_l_ContextRow; $_l_DelimterIndex; $_l_ItemID; $_l_offset)
	C_TEXT:C284($_t_AlternativeReference; $_t_Context; $_t_ContextName; $_t_DefaultReference; $_t_header; $_t_oldMethodName; $_t_oldMethodName2; $_t_TextFromBlob; $_t_Value; $1)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("HLP_MergeContextReference")


If (Count parameters:C259>=1)
	If (Is a document:K24:1=Test path name:C476($1))
		
		While (Semaphore:C143("LoadingHELPPrefs"))
			
			DelayTicks(2)
		End while 
		
		
		$_l_ItemID:=PREF_GetPreferenceID("Help Preferences")
		$_t_oldMethodName2:=ERR_MethodTracker("SYS_LOADSMTPAUTH/11")
		
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		If (Records in selection:C76([PREFERENCES:116])=0)
			READ WRITE:C146([PREFERENCES:116])
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_ItemID
			DOCUMENT TO BLOB:C525($1; [PREFERENCES:116]DataBlob:2)
			DB_SaveRecord(->[PREFERENCES:116])
		Else 
			If (Count parameters:C259=1)
				//Load the document to a blob
				//compare the 2 blobs
				//overwrite the document if there any difference
				DOCUMENT TO BLOB:C525($1; $_blb_Document)
				ARRAY TEXT:C222($_at_DocumentArray; 0)
				ARRAY TEXT:C222($_at_RecordArray; 0)
				$_l_offset:=0
				Repeat 
					$_t_TextFromBlob:=BLOB to text:C555($_blb_Document; 3; $_l_offset; 1000)
					If ($_t_TextFromBlob#"")
						APPEND TO ARRAY:C911($_at_DocumentArray; $_t_TextFromBlob)
					End if 
				Until ($_l_offset>=BLOB size:C605($_blb_Document))
				$_l_offset:=0
				Repeat 
					$_t_TextFromBlob:=BLOB to text:C555([PREFERENCES:116]DataBlob:2; 3; $_l_offset; 1000)
					If ($_t_TextFromBlob#"")
						APPEND TO ARRAY:C911($_at_RecordArray; $_t_TextFromBlob)
					End if 
				Until ($_l_offset>=BLOB size:C605([PREFERENCES:116]DataBlob:2))
				ARRAY TEXT:C222($_at_ContextNames; 0)
				ARRAY TEXT:C222($_at_ContextDefaultRefs; 0)
				ARRAY TEXT:C222($_at_AlternativeRefs; 0)
				$_l_CharacterPosition:=Position:C15("<HELPCONTEXTS>"; $_at_DocumentArray{1})
				If ($_l_CharacterPosition>0)
					$_t_header:=Substring:C12($_at_DocumentArray{1}; 1; $_l_CharacterPosition-1)
					$_at_DocumentArray{1}:=Substring:C12($_at_DocumentArray{1}; ($_l_CharacterPosition)+Length:C16("<HELPCONTEXTS>"); Length:C16($_at_DocumentArray{1}))
					
					For ($_l_ContextIndex; 1; Size of array:C274($_at_DocumentArray))
						
						Repeat 
							$_l_CharacterPosition:=Position:C15("</CONTEXT>"; $_at_DocumentArray{$_l_ContextIndex})
							If ($_l_CharacterPosition>0)
								$_t_Context:=Substring:C12($_at_DocumentArray{$_l_ContextIndex}; 1; $_l_CharacterPosition-1)
								$_at_DocumentArray{$_l_ContextIndex}:=Substring:C12($_at_DocumentArray{$_l_ContextIndex}; ($_l_CharacterPosition)+Length:C16("</CONTEXT>"); Length:C16($_at_DocumentArray{$_l_ContextIndex}))
								$_t_Context:=Replace string:C233($_t_Context; Char:C90(10); "")
								$_t_Context:=Replace string:C233($_t_Context; Char:C90(9); "")
								$_t_Context:=Replace string:C233($_t_Context; Char:C90(13); "")
								$_t_Context:=Replace string:C233($_t_Context; "<CONTEXT>"; "")
								$_t_Context:=Replace string:C233($_t_Context; "</CONTEXTNAME>"; Char:C90(9))
								$_t_Context:=Replace string:C233($_t_Context; "<CONTEXTNAME>"; "")
								$_t_Context:=Replace string:C233($_t_Context; "</DEFAULT>"; Char:C90(9))
								$_t_Context:=Replace string:C233($_t_Context; "<DEFAULT>"; "")
								$_t_Context:=Replace string:C233($_t_Context; "</ALTERNATIVE>"; Char:C90(13))
								$_t_Context:=Replace string:C233($_t_Context; "<ALTERNATIVE>"; "")
								$_l_CharacterPosition:=Position:C15(Char:C90(9); $_t_Context)
								$_t_ContextName:=Substring:C12($_t_Context; 1; $_l_CharacterPosition-1)
								For ($_l_DelimterIndex; 1; Length:C16($_t_ContextName))
									If ($_t_ContextName[[$_l_DelimterIndex]]#" ") | ($_l_DelimterIndex=Length:C16($_t_ContextName))
										$_t_ContextName:=Substring:C12($_t_ContextName; $_l_DelimterIndex; Length:C16($_t_ContextName))
										$_l_DelimterIndex:=Length:C16($_t_ContextName)+99999
									End if 
								End for 
								For ($_l_DelimterIndex; Length:C16($_t_ContextName); 1; -1)
									If ($_t_ContextName[[$_l_DelimterIndex]]#" ")
										$_t_ContextName:=Substring:C12($_t_ContextName; 1; $_l_DelimterIndex)
										$_l_DelimterIndex:=0
									End if 
								End for 
								$_t_Context:=Substring:C12($_t_Context; $_l_CharacterPosition+1; Length:C16($_t_Context))
								$_l_CharacterPosition:=Position:C15(Char:C90(9); $_t_Context)
								$_t_DefaultReference:=Substring:C12($_t_Context; 1; $_l_CharacterPosition-1)
								$_t_DefaultReference:=Replace string:C233($_t_DefaultReference; " "; "")
								
								$_t_Context:=Substring:C12($_t_Context; $_l_CharacterPosition+1; Length:C16($_t_Context))
								$_l_CharacterPosition:=Position:C15(Char:C90(9); $_t_Context)
								$_t_AlternativeReference:=Substring:C12($_t_Context; 1; $_l_CharacterPosition-1)
								$_t_AlternativeReference:=Replace string:C233($_t_AlternativeReference; " "; "")
								
								$_t_Context:=Substring:C12($_t_Context; $_l_CharacterPosition+1; Length:C16($_t_Context))
								APPEND TO ARRAY:C911($_at_ContextNames; $_t_ContextName)
								APPEND TO ARRAY:C911($_at_ContextDefaultRefs; $_t_DefaultReference)
								APPEND TO ARRAY:C911($_at_AlternativeRefs; $_t_AlternativeReference)
								$_t_Context:=$_t_ContextName
							Else 
								//There is not a whole context so move the remainder to the next block
								If ($_l_ContextIndex<Size of array:C274($_at_DocumentArray))
									$_at_DocumentArray{$_l_ContextIndex+1}:=$_at_DocumentArray{$_l_ContextIndex}+$_at_DocumentArray{$_l_ContextIndex+1}
									$_at_DocumentArray{$_l_ContextIndex}:=""
								End if 
								$_t_Context:=""
							End if 
						Until ($_t_Context="")
						
					End for 
					
					
					
					
					
				End if 
				//Note that wih this preference we are sucking XML into the blob
				//``
				ARRAY TEXT:C222($_at_ContextNames2; 0)
				ARRAY TEXT:C222($_at_ContextDefaultRefs2; 0)
				ARRAY TEXT:C222($_at_AlternativeRefs2; 0)
				$_l_CharacterPosition:=Position:C15("<HELPCONTEXTS>"; $_at_RecordArray{1})
				If ($_l_CharacterPosition>0)
					$_t_header:=Substring:C12($_at_RecordArray{1}; 1; $_l_CharacterPosition-1)
					$_at_RecordArray{1}:=Substring:C12($_at_RecordArray{1}; ($_l_CharacterPosition)+Length:C16("<HELPCONTEXTS>"); Length:C16($_at_RecordArray{1}))
					For ($_l_ContextIndex; 1; Size of array:C274($_at_RecordArray))
						Repeat 
							$_l_CharacterPosition:=Position:C15("</CONTEXT>"; $_at_RecordArray{$_l_ContextIndex})
							If ($_l_CharacterPosition>0)
								$_t_Context:=Substring:C12($_at_RecordArray{$_l_ContextIndex}; 1; $_l_CharacterPosition-1)
								$_at_RecordArray{$_l_ContextIndex}:=Substring:C12($_at_RecordArray{$_l_ContextIndex}; ($_l_CharacterPosition)+Length:C16("</CONTEXT>"); Length:C16($_at_RecordArray{$_l_ContextIndex}))
								$_t_Context:=Replace string:C233($_t_Context; Char:C90(10); "")
								$_t_Context:=Replace string:C233($_t_Context; Char:C90(9); "")
								$_t_Context:=Replace string:C233($_t_Context; Char:C90(13); "")
								$_t_Context:=Replace string:C233($_t_Context; "<CONTEXT>"; "")
								$_t_Context:=Replace string:C233($_t_Context; "</CONTEXTNAME>"; Char:C90(9))
								$_t_Context:=Replace string:C233($_t_Context; "<CONTEXTNAME>"; "")
								$_t_Context:=Replace string:C233($_t_Context; "</DEFAULT>"; Char:C90(9))
								$_t_Context:=Replace string:C233($_t_Context; "<DEFAULT>"; "")
								$_t_Context:=Replace string:C233($_t_Context; "</ALTERNATIVE>"; Char:C90(13))
								$_t_Context:=Replace string:C233($_t_Context; "<ALTERNATIVE>"; "")
								$_l_CharacterPosition:=Position:C15(Char:C90(9); $_t_Context)
								$_t_ContextName:=Substring:C12($_t_Context; 1; $_l_CharacterPosition-1)
								For ($_l_DelimterIndex; 1; Length:C16($_t_ContextName))
									If ($_t_ContextName[[$_l_DelimterIndex]]#" ") | ($_l_DelimterIndex=Length:C16($_t_ContextName))
										$_t_ContextName:=Substring:C12($_t_ContextName; $_l_DelimterIndex; Length:C16($_t_ContextName))
										$_l_DelimterIndex:=Length:C16($_t_ContextName)+999999
									End if 
								End for 
								For ($_l_DelimterIndex; Length:C16($_t_ContextName); 1; -1)
									If ($_t_ContextName[[$_l_DelimterIndex]]#" ")
										$_t_ContextName:=Substring:C12($_t_ContextName; 1; $_l_DelimterIndex)
										$_l_DelimterIndex:=0
									End if 
								End for 
								$_t_Context:=Substring:C12($_t_Context; $_l_CharacterPosition+1; Length:C16($_t_Context))
								$_l_CharacterPosition:=Position:C15(Char:C90(9); $_t_Context)
								$_t_DefaultReference:=Substring:C12($_t_Context; 1; $_l_CharacterPosition-1)
								$_t_DefaultReference:=Replace string:C233($_t_DefaultReference; " "; "")
								
								
								$_t_Context:=Substring:C12($_t_Context; $_l_CharacterPosition+1; Length:C16($_t_Context))
								$_l_CharacterPosition:=Position:C15(Char:C90(9); $_t_Context)
								$_t_AlternativeReference:=Substring:C12($_t_Context; 1; $_l_CharacterPosition-1)
								$_t_AlternativeReference:=Replace string:C233($_t_AlternativeReference; " "; "")
								
								$_t_Context:=Substring:C12($_t_Context; $_l_CharacterPosition+1; Length:C16($_t_Context))
								APPEND TO ARRAY:C911($_at_ContextNames2; $_t_ContextName)
								APPEND TO ARRAY:C911($_at_ContextDefaultRefs2; $_t_DefaultReference)
								APPEND TO ARRAY:C911($_at_AlternativeRefs2; $_t_AlternativeReference)
								$_t_Context:=$_t_ContextName
							Else 
								//There is not a whole context so move the remainder to the next block
								If ($_l_ContextIndex<Size of array:C274($_at_RecordArray))
									$_at_RecordArray{$_l_ContextIndex+1}:=$_at_RecordArray{$_l_ContextIndex}+$_at_RecordArray{$_l_ContextIndex+1}
									$_at_RecordArray{$_l_ContextIndex}:=""
								End if 
								$_t_Context:=""
							End if 
						Until ($_t_Context="")
						
					End for 
				End if 
				//We now have the both the document and the saved preferences in arrays
				For ($_l_ContextIndex; 1; Size of array:C274($_at_ContextNames))
					$_l_ContextRow:=Find in array:C230($_at_ContextNames2; $_at_ContextNames{$_l_ContextIndex})
					If ($_l_ContextRow>0)
						If ($_at_ContextDefaultRefs2{$_l_ContextRow}#"") & ($_at_ContextDefaultRefs{$_l_ContextIndex}="")
							$_at_ContextDefaultRefs{$_l_ContextIndex}:=$_at_ContextDefaultRefs2{$_l_ContextRow}
						End if 
						If ($_at_AlternativeRefs2{$_l_ContextRow}#"") & ($_at_AlternativeRefs{$_l_ContextIndex}="")
							$_at_AlternativeRefs{$_l_ContextIndex}:=$_at_AlternativeRefs2{$_l_ContextRow}
						End if 
					End if 
				End for 
				//now extract from each blob a context and compare the DEFAULT
				//The 'document array is now updated. So recreate the document
				
				$_ti_DocumentRef:=DB_CreateDocument($1; "TEXT")
				SAX SET XML DECLARATION:C858($_ti_DocumentRef; "ISO-8859-1"; True:C214)
				// Refister DS
				//zthis is the 2.03. licence
				
				SAX OPEN XML ELEMENT:C853($_ti_DocumentRef; "HELPCONTEXTS")
				
				For ($_l_AlternativeRefIndex; 1; Size of array:C274($_at_AlternativeRefs))
					SAX OPEN XML ELEMENT:C853($_ti_DocumentRef; "CONTEXT")
					SAX OPEN XML ELEMENT:C853($_ti_DocumentRef; "CONTEXTNAME")
					$_t_Value:=$_at_ContextNames{$_l_AlternativeRefIndex}
					SAX ADD XML ELEMENT VALUE:C855($_ti_DocumentRef; $_t_Value)
					SAX CLOSE XML ELEMENT:C854($_ti_DocumentRef)
					SAX OPEN XML ELEMENT:C853($_ti_DocumentRef; "DEFAULT")
					SAX ADD XML ELEMENT VALUE:C855($_ti_DocumentRef; $_at_ContextDefaultRefs{$_l_AlternativeRefIndex})
					
					SAX CLOSE XML ELEMENT:C854($_ti_DocumentRef)
					SAX OPEN XML ELEMENT:C853($_ti_DocumentRef; "ALTERNATIVE")
					SAX ADD XML ELEMENT VALUE:C855($_ti_DocumentRef; $_at_AlternativeRefs{$_l_AlternativeRefIndex})
					SAX CLOSE XML ELEMENT:C854($_ti_DocumentRef)
					SAX CLOSE XML ELEMENT:C854($_ti_DocumentRef)
				End for 
				
				SAX CLOSE XML ELEMENT:C854($_ti_DocumentRef)
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
			Else 
				//Just load the document to the preference
				READ WRITE:C146([PREFERENCES:116])
				LOAD RECORD:C52([PREFERENCES:116])
				
				DOCUMENT TO BLOB:C525($1; [PREFERENCES:116]DataBlob:2)
				DB_SaveRecord(->[PREFERENCES:116])
			End if 
		End if 
		CLEAR SEMAPHORE:C144("LoadingHELPPrefs")
		
	End if 
End if 
ERR_MethodTrackerReturn("HLP_MergeContextReference"; $_t_oldMethodName)
If (False:C215)
	//object Name: [USER]HLP_Edit.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/03/2010 18:41
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_AlternativeRefs; 0)
	ARRAY TEXT:C222($_at_ContextDefaultRefs; 0)
	ARRAY TEXT:C222($_at_ContextNames; 0)
	ARRAY TEXT:C222($_at_DocumentArray; 0)
	C_BLOB:C604($_blb_DocumentBlob)
	C_BOOLEAN:C305(<>HLP_bo_Inited)
	C_LONGINT:C283($_l_ContextRow; $_l_DeletionIndex; $_l_HelpProcess; $_l_Index; $_l_offset; $_l_CharacterPosition; $_l_ContextRow; $_l_DeletionIndex; $_l_HelpProcess; $_l_Index; $_l_offset)
	C_TEXT:C284($_t_Context; $_t_ContextName; $_t_ContextValue; $_t_DefaultReference; $_t_Header; $_t_oldMethodName; $_t_Text; HLP_t_DaybookHelpRef; HLP_t_DocumentsPath; HLP_T_EditHelpReference; $_t_AlternativeReff)
	C_TEXT:C284($_t_Context; $_t_ContextName; $_t_ContextValue; $_t_DefaultReference; $_t_Header; $_t_oldMethodName; $_t_Text; HLP_t_DaybookHelpRef; HLP_t_DocumentsPath; HLP_T_EditHelpReference; HLP_T_IntranetkHelpRef)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].HLP_Edit.Variable10"; Form event code:C388)
Gen_Confirm("Update Help file reference?")
If (OK=1)
	
	// Single user
	DOCUMENT TO BLOB:C525(HLP_t_DocumentsPath; $_blb_DocumentBlob)
	ARRAY TEXT:C222($_at_DocumentArray; 0)
	$_l_offset:=0
	Repeat 
		$_t_Text:=BLOB to text:C555($_blb_DocumentBlob; 3; $_l_offset; 1000)
		If ($_t_Text#"")
			APPEND TO ARRAY:C911($_at_DocumentArray; $_t_Text)
		End if 
	Until ($_l_offset>=BLOB size:C605($_blb_DocumentBlob))
	ARRAY TEXT:C222($_at_ContextNames; 0)
	ARRAY TEXT:C222($_at_ContextDefaultRefs; 0)
	ARRAY TEXT:C222($_at_AlternativeRefs; 0)
	$_l_CharacterPosition:=Position:C15("<HELPCONTEXTS>"; $_at_DocumentArray{1})
	If ($_l_CharacterPosition>0)
		$_t_Header:=Substring:C12($_at_DocumentArray{1}; 1; $_l_CharacterPosition-1)
		$_at_DocumentArray{1}:=Substring:C12($_at_DocumentArray{1}; ($_l_CharacterPosition)+Length:C16("<HELPCONTEXTS>"); Length:C16($_at_DocumentArray{1}))
		
		For ($_l_Index; 1; Size of array:C274($_at_DocumentArray))
			
			Repeat 
				$_l_CharacterPosition:=Position:C15("</CONTEXT>"; $_at_DocumentArray{$_l_Index})
				If ($_l_CharacterPosition>0)
					$_t_Context:=Substring:C12($_at_DocumentArray{$_l_Index}; 1; $_l_CharacterPosition-1)
					$_at_DocumentArray{$_l_Index}:=Substring:C12($_at_DocumentArray{$_l_Index}; ($_l_CharacterPosition)+Length:C16("</CONTEXT>"); Length:C16($_at_DocumentArray{$_l_Index}))
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
					For ($_l_DeletionIndex; 1; Length:C16($_t_ContextName))
						If ($_t_ContextName[[$_l_DeletionIndex]]#" ") | ($_l_DeletionIndex=Length:C16($_t_ContextName))
							$_t_ContextName:=Substring:C12($_t_ContextName; $_l_DeletionIndex; Length:C16($_t_ContextName))
							$_l_DeletionIndex:=Length:C16($_t_ContextName)+99999
						End if 
					End for 
					For ($_l_DeletionIndex; Length:C16($_t_ContextName); 1; -1)
						If ($_t_ContextName[[$_l_DeletionIndex]]#" ")
							$_t_ContextName:=Substring:C12($_t_ContextName; 1; $_l_DeletionIndex)
							$_l_DeletionIndex:=0
						End if 
					End for 
					$_t_Context:=Substring:C12($_t_Context; $_l_CharacterPosition+1; Length:C16($_t_Context))
					$_l_CharacterPosition:=Position:C15(Char:C90(9); $_t_Context)
					$_t_DefaultReference:=Substring:C12($_t_Context; 1; $_l_CharacterPosition-1)
					$_t_DefaultReference:=Replace string:C233($_t_DefaultReference; " "; "")
					
					$_t_Context:=Substring:C12($_t_Context; $_l_CharacterPosition+1; Length:C16($_t_Context))
					$_l_CharacterPosition:=Position:C15(Char:C90(9); $_t_Context)
					$_t_AlternativeReff:=Substring:C12($_t_Context; 1; $_l_CharacterPosition-1)
					$_t_AlternativeReff:=Replace string:C233($_t_AlternativeReff; " "; "")
					
					$_t_Context:=Substring:C12($_t_Context; $_l_CharacterPosition+1; Length:C16($_t_Context))
					APPEND TO ARRAY:C911($_at_ContextNames; $_t_ContextName)
					APPEND TO ARRAY:C911($_at_ContextDefaultRefs; $_t_DefaultReference)
					APPEND TO ARRAY:C911($_at_AlternativeRefs; $_t_AlternativeReff)
					$_t_Context:=$_t_ContextName
				Else 
					//There is not a whole context so move the remainder to the next block
					If ($_l_Index<Size of array:C274($_at_DocumentArray))
						$_at_DocumentArray{$_l_Index+1}:=$_at_DocumentArray{$_l_Index}+$_at_DocumentArray{$_l_Index+1}
						$_at_DocumentArray{$_l_Index}:=""
					End if 
					$_t_Context:=""
				End if 
			Until ($_t_Context="")
			
		End for 
		
		//Find the reference for the current object
		$_l_ContextRow:=Find in array:C230($_at_ContextNames; HLP_T_EditHelpReference)
		If ($_l_ContextRow>0)
			If (HLP_t_DaybookHelpRef#"")
				$_at_ContextDefaultRefs{$_l_ContextRow}:=HLP_t_DaybookHelpRef
			End if 
			If (HLP_T_IntranetkHelpRef#"")
				$_at_AlternativeRefs{$_l_ContextRow}:=HLP_T_IntranetkHelpRef
			End if 
			$_ti_DocumentRef:=DB_CreateDocument(HLP_t_DocumentsPath; "TEXT"; "Help File"; True:C214)
			
			SAX SET XML DECLARATION:C858($_ti_DocumentRef; "ISO-8859-1"; True:C214)
			SAX OPEN XML ELEMENT:C853($_ti_DocumentRef; "HELPCONTEXTS")
			
			For ($_l_Index; 1; Size of array:C274($_at_AlternativeRefs))
				SAX OPEN XML ELEMENT:C853($_ti_DocumentRef; "CONTEXT")
				SAX OPEN XML ELEMENT:C853($_ti_DocumentRef; "CONTEXTNAME")
				$_t_ContextValue:=$_at_ContextNames{$_l_Index}
				SAX ADD XML ELEMENT VALUE:C855($_ti_DocumentRef; $_t_ContextValue)
				SAX CLOSE XML ELEMENT:C854($_ti_DocumentRef)
				SAX OPEN XML ELEMENT:C853($_ti_DocumentRef; "DEFAULT")
				SAX ADD XML ELEMENT VALUE:C855($_ti_DocumentRef; $_at_ContextDefaultRefs{$_l_Index})
				
				SAX CLOSE XML ELEMENT:C854($_ti_DocumentRef)
				SAX OPEN XML ELEMENT:C853($_ti_DocumentRef; "ALTERNATIVE")
				SAX ADD XML ELEMENT VALUE:C855($_ti_DocumentRef; $_at_AlternativeRefs{$_l_Index})
				SAX CLOSE XML ELEMENT:C854($_ti_DocumentRef)
				SAX CLOSE XML ELEMENT:C854($_ti_DocumentRef)
			End for 
			SAX CLOSE XML ELEMENT:C854($_ti_DocumentRef)
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
			//And now put that document in the preference
			//and set the◊inited to False on the server and call help
			HLP_MergeContextReference(HLP_t_DocumentsPath; True:C214)
			If (Application type:C494=4D Remote mode:K5:5)
				SET PROCESS VARIABLE:C370(-1; <>HLP_bo_Inited; False:C215)
				$_l_HelpProcess:=Execute on server:C373("openHelp"; Table:C252(->[CONTACTS:1]); "Contact_in")  //actually the form here does not matter-all we want is to get the form loaded on the server
			End if 
			
		End if 
		
		
	End if 
	
	
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ:HLP_Edit,BOK"; $_t_oldMethodName)

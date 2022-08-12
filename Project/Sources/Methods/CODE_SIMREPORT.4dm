//%attributes = {}

If (False:C215)
	//Project Method Name:      CODE_SIMREPORT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/05/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
TRACE:C157

//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_MatchingScores; 0)
	ARRAY LONGINT:C221($_al_MethodLineNumbers; 0)
	ARRAY TEXT:C222($_at_FormNames; 0)
	ARRAY TEXT:C222($_at_HeaderDatas; 0)
	ARRAY TEXT:C222($_at_HeaderDatas2; 0)
	ARRAY TEXT:C222($_at_HeaderItems; 0)
	ARRAY TEXT:C222($_at_HeaderItems2; 0)
	ARRAY TEXT:C222($_at_HeaderLines; 0)
	ARRAY TEXT:C222($_at_HeaderLines2; 0)
	ARRAY TEXT:C222($_at_LineWords; 0)
	ARRAY TEXT:C222($_at_MatchingMethods; 0)
	ARRAY TEXT:C222($_at_MethodLines; 0)
	ARRAY TEXT:C222($_at_MethodPaths; 0)
	ARRAY TEXT:C222($_at_WordsMatch; 0)
	ARRAY TEXT:C222($_at_IgnoreMethods; 0)
	C_BOOLEAN:C305($_bo_Exit; $_bo_Find; $_bo_Ignore; $_bo_InsertCHanges; $_bo_MergeHeaders; $_bo_NotComment)
	C_DATE:C307($_Dte_ModificationDate)
	C_LONGINT:C283($_l_Break; $_l_Build; $_l_CheckifComment; $_l_CHeckIgnore; $_l_CurrentForm; $_l_CurrentFormNumber; $_l_CurrentTable; $_l_EndofLine; $_l_EndofLine2; $_l_Index; $_l_isTableValid)
	C_LONGINT:C283($_l_LastBreak; $_l_LastLine; $_l_LastTableNumber; $_l_Length; $_l_LineIndex; $_l_LineNumber; $_l_ParseType; $_l_Position; $_l_position2; $_l_PositionHeaderStart; $_l_Ref)
	C_LONGINT:C283($_l_SizeofArray)
	C_POINTER:C301($_Ptr_MatchingMethods; $_Ptr_ptrTablePointer; $3)
	C_TEXT:C284($_t_After; $_t_before; $_t_beforeAmend; $_t_BeforeCreator; $_t_BeforeEnd; $_t_BeforeHeader; $_t_BeforeMethod; $_t_Creator; $_t_DateCreated; $_t_DateModified; $_t_Description)
	C_TEXT:C284($_t_Header; $_t_Ignore; $_t_LastLine; $_T_MethodAfter; $_T_MethodBefore; $_t_MethodName; $_t_MethodNameStripped; $_t_MethodText; $_t_MethodTextOLD; $_t_Modifier; $_t_Name)
	C_TEXT:C284($_t_newBit; $_t_NewHeader; $_t_NewMethodText; $_t_Notes; $_t_OldMethodText; $_t_PrependBefore; $_t_Revisions; $_t_StoreBefore; $_t_TableName; $_t_ThisLine; $_t_ValueFind)
	C_TEXT:C284($_t_Word; $1; $2)
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

If (Count parameters:C259>=2)
	$_bo_Find:=True:C214
	$_t_ValueFind:=$2
	APPEND TO ARRAY:C911($_at_IgnoreMethods; $1)  //ignore the method
	$_Ptr_MatchingMethods:=$3
Else 
	$_bo_Find:=False:C215
	$_t_ValueFind:=""
	ARRAY TEXT:C222($_at_MatchingMethods; 0)
	$_Ptr_MatchingMethods:=->$_at_MatchingMethods
	
End if 
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
			ARRAY TEXT:C222($_at_MethodLines; 0)
			ARRAY LONGINT:C221($_al_MethodLineNumbers; 0)
			If ($_l_Position>0)  //it would be odd iff it is not here
				$_t_Header:=Substring:C12($_t_MethodText; 1; $_l_Position)
				If (Length:C16($_t_methodText)>$_l_Position)
					$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
				Else 
					$_t_MethodText:=""
				End if 
				
				$_t_NewMethodText:=""
				
				$_l_LineNumber:=1
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
					If ($_t_ThisLine#"")
						APPEND TO ARRAY:C911($_at_MethodLines; $_t_ThisLine)
						APPEND TO ARRAY:C911($_al_MethodLineNumbers; $_l_LineNumber)
						$_l_LineNumber:=$_l_LineNumber+1
					End if 
				Until ($_t_MethodText="")
			End if 
			For ($_l_LineIndex; 1; Size of array:C274($_at_MethodLines))
				If (Not:C34($_bo_Find)) & (False:C215)
					
					ARRAY TEXT:C222($_at_MatchingMethods; 0)
					ARRAY LONGINT:C221($_al_MatchingScores; 0)
					
					CODE_SIMREPORT($_t_MethodName; $_at_MethodLines{$_l_LineIndex}; ->$_at_MatchingMethods; ->$_al_MatchingScores)
					
				Else 
					ARRAY TEXT:C222($_at_WordsMatch; 0)
					ARRAY TEXT:C222($_at_LineWords; 0)
					$_l_LastBreak:=1
					For ($_l_Break; 1; Length:C16($_t_ValueFind))
						Case of 
							: ($_t_ValueFind[[$_l_Break]]="(")
								$_l_Length:=$_l_Break-$_l_LastBreak
								$_t_Word:=Substring:C12($_t_ValueFind; $_l_LastBreak; $_l_Length-1)
								If ($_t_Word#"")
									Repeat 
										If ($_t_Word[[Length:C16($_t_Word)]]=" ")
											$_t_Word:=Substring:C12($_t_Word; 1; Length:C16($_t_Word)-1)
										End if 
									Until ($_t_Word[[Length:C16($_t_Word)]]#" ")
									
									APPEND TO ARRAY:C911($_at_LineWords; $_t_Word)
								End if 
								APPEND TO ARRAY:C911($_at_LineWords; "(")
							: ($_t_ValueFind[[$_l_Break]]=")")
								$_l_Length:=$_l_Break-$_l_LastBreak
								$_t_Word:=Substring:C12($_t_ValueFind; $_l_LastBreak; $_l_Length-1)
								If ($_t_Word#"")
									Repeat 
										If ($_t_Word[[Length:C16($_t_Word)]]=" ")
											$_t_Word:=Substring:C12($_t_Word; 1; Length:C16($_t_Word)-1)
										End if 
									Until ($_t_Word[[Length:C16($_t_Word)]]#" ")
									APPEND TO ARRAY:C911($_at_LineWords; $_t_Word)
								End if 
								APPEND TO ARRAY:C911($_at_LineWords; ")")
							: ($_t_ValueFind[[$_l_Break]]="[")  //start of a table
								$_l_Length:=$_l_Break-$_l_LastBreak
								$_t_Word:=Substring:C12($_t_ValueFind; $_l_LastBreak; $_l_Length-1)
								If ($_t_Word#"")
									Repeat 
										If ($_t_Word[[Length:C16($_t_Word)]]=" ")
											$_t_Word:=Substring:C12($_t_Word; 1; Length:C16($_t_Word)-1)
										End if 
									Until ($_t_Word[[Length:C16($_t_Word)]]#" ")
									APPEND TO ARRAY:C911($_at_LineWords; $_t_Word)
								End if 
								APPEND TO ARRAY:C911($_at_LineWords; "[")
							: ($_t_ValueFind[[$_l_Break]]="]")  //end of a table
								$_l_Length:=$_l_Break-$_l_LastBreak
								$_t_Word:=Substring:C12($_t_ValueFind; $_l_LastBreak; $_l_Length-1)
								If ($_t_Word#"")
									Repeat 
										If ($_t_Word[[Length:C16($_t_Word)]]=" ")
											$_t_Word:=Substring:C12($_t_Word; 1; Length:C16($_t_Word)-1)
										End if 
									Until ($_t_Word[[Length:C16($_t_Word)]]#" ")
									
									APPEND TO ARRAY:C911($_at_LineWords; $_t_Word)
									//the table might be followed by a field in which case the field is actually part of the word
								End if 
								APPEND TO ARRAY:C911($_at_LineWords; "]")
							: ($_t_ValueFind[[$_l_Break]]="{")  //start of an array or blob reference point
								$_l_Length:=$_l_Break-$_l_LastBreak
								$_t_Word:=Substring:C12($_t_ValueFind; $_l_LastBreak; $_l_Length-1)
								If ($_t_Word#"")
									Repeat 
										If ($_t_Word[[Length:C16($_t_Word)]]=" ")
											$_t_Word:=Substring:C12($_t_Word; 1; Length:C16($_t_Word)-1)
										End if 
									Until ($_t_Word[[Length:C16($_t_Word)]]#" ")
									APPEND TO ARRAY:C911($_at_LineWords; $_t_Word)
								End if 
								APPEND TO ARRAY:C911($_at_LineWords; "{")
							: ($_t_ValueFind[[$_l_Break]]="}")  //end of a array or blob reference point
								$_l_Length:=$_l_Break-$_l_LastBreak
								$_t_Word:=Substring:C12($_t_ValueFind; $_l_LastBreak; $_l_Length-1)
								If ($_t_Word#"")
									Repeat 
										If ($_t_Word[[Length:C16($_t_Word)]]=" ")
											$_t_Word:=Substring:C12($_t_Word; 1; Length:C16($_t_Word)-1)
										End if 
									Until ($_t_Word[[Length:C16($_t_Word)]]#" ")
									
									APPEND TO ARRAY:C911($_at_LineWords; $_t_Word)
								End if 
								APPEND TO ARRAY:C911($_at_LineWords; "]")
								
							: ($_t_ValueFind[[$_l_Break]]=":")  ///the next char might be = which means its a gets
							: ($_t_ValueFind[[$_l_Break]]=";")  ///parameter seperator
							: ($_t_ValueFind[[$_l_Break]]="-")  ////the next char might be > which means its a pointer else its a negation
							: ($_t_ValueFind[[$_l_Break]]="+")  ///its a not equal
							: ($_t_ValueFind[[$_l_Break]]="*")  ///its a not equal
							: ($_t_ValueFind[[$_l_Break]]="<")  ///its a less than
							: ($_t_ValueFind[[$_l_Break]]=">")  ///its a greater than
							: ($_t_ValueFind[[$_l_Break]]="=")  ///its an equal
							: ($_t_ValueFind[[$_l_Break]]="#")  ///its a not equal
							: ($_t_ValueFind[[$_l_Break]]="|")  ///its a not equal
							: ($_t_ValueFind[[$_l_Break]]="&")  ///its a not equal
								
							: ($_t_ValueFind[[$_l_Break]]=Char:C90(34))
								//start of a literal..
						End case 
					End for 
				End if 
				
				
			End for 
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
			If ($_t_MethodText#"")
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
						//METHOD SET CODE($_t_MethodName;$_t_NewMethodText)
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
									//METHOD SET CODE($_t_MethodName;$_t_MethodText)
								End if 
								
								
							End if 
						End for 
						
						
						
					End if 
					
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
						
					End if 
				Else 
					If (Not:C34($_bo_Ignore))
						$_t_MethodName:=$_at_MethodPaths{$_l_Index}
						MESSAGE:C88($_at_FormNames{$_l_CurrentForm}+$_t_MethodName+" "+String:C10($_l_Index)+" of "+String:C10($_l_SizeofArray))
						$_t_MethodNameStripped:=Replace string:C233($_t_MethodName; "{formmethod}"; "")
						$_t_MethodNameStripped:=Replace string:C233($_t_MethodNameStripped; "[projectForm]/"; "")
						$_t_MethodNameStripped:=Replace string:C233($_t_MethodNameStripped; "/"; ".")
						METHOD GET MODIFICATION DATE:C1170($_t_MethodName; $_Dte_ModificationDate; $_ti_ModificationTime; *)
						METHOD GET CODE:C1190($_t_MethodName; $_t_MethodText)
					End if 
					
				End if 
			End for 
		End for 
	End if 
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
							
							If ($_t_MethodText#"")
								
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
							
							If ($_t_MethodText#"")
								
							End if 
						End if 
						
					End if 
				End for 
			End for 
		End if 
	End for 
	
	
	
	
	
End if 






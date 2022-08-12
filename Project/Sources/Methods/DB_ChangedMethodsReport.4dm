//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ChangedMethodsReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2013 22:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_MethodDates; 0)
	ARRAY LONGINT:C221($_al_DeletedA; 0)
	ARRAY LONGINT:C221($_al_DocumentDateTime; 0)
	ARRAY LONGINT:C221($_al_InsertedB; 0)
	ARRAY LONGINT:C221($_al_StartA; 0)
	ARRAY LONGINT:C221($_al_StartB; 0)
	//ARRAY LONGINT(DB_al_ChangesDates;0)
	//ARRAY LONGINT(DB_al_DIffColours;0)
	//ARRAY LONGINT(DB_al_LIneNumbers1;0)
	//ARRAY LONGINT(DB_al_LIneNumbers2;0)
	ARRAY TEXT:C222($_at_AllDocuments; 0)
	ARRAY TEXT:C222($_at_Documents; 0)
	ARRAY TEXT:C222($_at_MethodNames; 0)
	ARRAY TEXT:C222($_at_SubFolders; 0)
	//ARRAY TEXT(DB_at_ChangesDocument;0)
	//ARRAY TEXT(DB_at_ChangesList;0)
	//ARRAY TEXT(DB_at_DocofChanges;0)
	//ARRAY TEXT(DB_at_DocumentinArray1;0)
	//ARRAY TEXT(DB_at_DocumentinArray2;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_Invisible; $_bo_locked)
	C_DATE:C307($_d_CreatedOn; $_d_Date; $_d_ModifiedOn)
	C_LONGINT:C283($_l_2010Position; $_l_Days; $_l_DocumentRow; $_l_ExtensionPosition; $_l_Index; $_l_IndexP; $_l_Indexx; $_l_ItemRow; $_l_JunkPosition; $_l_NextMethodRow; $_l_Row)
	C_LONGINT:C283($_l_StartRow; $_l_TimeLongint; $_l_TimeNumber)
	C_TEXT:C284($_t_AddtoName; $_t_ChangeReportName; $_t_ChangeReportPath; $_t_CombinedText; $_t_Databasepath; $_t_DateSTR; $_t_DocTImeDate; $_t_DocumentName2; $_t_DocumentNames; $_t_DocumentPath; $_t_DocumentPath2)
	C_TEXT:C284($_t_EditedLines; $_t_LinesAddedToNew; $_t_LinesDeletedFromNew; $_t_Method; $_t_MethodName2; $_t_oldMethodName; $_t_Time; $_t_TimeHours; $_t_TimeMinutes; $_t_TryPath)
	C_TIME:C306($_ti_CreatedAt; $_ti_DocumentRef; $_ti_ModifiedAt; $_ti_Time)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_ChangedMethodsReport")

//NG this is a method to compare the versions of code
//this will traverse the whole folder and update the document
// Here are some mods
//her are some more
//changes


ARRAY TEXT:C222($_at_MethodNames; 0)


ARRAY DATE:C224($_ad_MethodDates; 0)
ARRAY TEXT:C222(DB_at_DocofChanges; 0)
ARRAY TEXT:C222(DB_at_ChangesList; 0)
ARRAY LONGINT:C221(DB_al_ChangesDates; 0)
$_t_Databasepath:=Get 4D folder:C485(4)
$_t_Databasepath:=$_t_Databasepath+"CODEEXPORTS"
If (Not:C34(Test path name:C476($_t_Databasepath)=0))
	CREATE FOLDER:C475($_t_Databasepath)
End if 
$_t_ChangeReportName:="Method_Changes_Report"
$_t_ChangeReportPath:=$_t_Databasepath+Directory_Symbol+$_t_ChangeReportName
If (Not:C34(Test path name:C476($_t_ChangeReportPath+".txt")=1))
	$_ti_DocumentRef:=Create document:C266($_t_ChangeReportPath+".txt")
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
End if 
ARRAY TEXT:C222(DB_at_ChangesDocument; 0)

DB_Documenttoarray($_t_ChangeReportPath+".txt"; ->DB_at_ChangesDocument; "≈")


For ($_l_Index; 1; Size of array:C274(DB_at_ChangesDocument))
	Case of 
		: (Position:C15(Char:C90(9)+Char:C90(9); DB_at_ChangesDocument{$_l_Index})>0)
			//DetailLine
			APPEND TO ARRAY:C911(DB_at_DocofChanges; "")
			APPEND TO ARRAY:C911(DB_al_ChangesDates; 0)
			APPEND TO ARRAY:C911(DB_at_ChangesList; Substring:C12(DB_at_ChangesDocument{$_l_Index}; 3))
			
		: (Position:C15(Char:C90(9); DB_at_ChangesDocument{$_l_Index})>0)
			//Date Line
			APPEND TO ARRAY:C911(DB_at_DocofChanges; "")
			APPEND TO ARRAY:C911(DB_al_ChangesDates; Num:C11(Substring:C12(DB_at_ChangesDocument{$_l_Index}; 2)))
			APPEND TO ARRAY:C911(DB_at_ChangesList; "")
			
		Else 
			//Method name
			APPEND TO ARRAY:C911(DB_at_DocofChanges; DB_at_ChangesDocument{$_l_Index})
			APPEND TO ARRAY:C911(DB_al_ChangesDates; 0)
			APPEND TO ARRAY:C911(DB_at_ChangesList; "")
			
	End case 
	
End for 
$_t_Databasepath:=Get 4D folder:C485(4)
$_t_Databasepath:=$_t_Databasepath+"CODEEXPORTS"+Directory_Symbol
If ($_t_Databasepath#"")
	FOLDER LIST:C473($_t_Databasepath; $_at_SubFolders)
	DOCUMENT LIST:C474($_t_Databasepath; $_at_Documents)
	
	For ($_l_Index; 1; Size of array:C274($_at_Documents))
		If ("Method_Changes_Report"#$_at_Documents{$_l_Index}) & ($_at_Documents{$_l_Index}[[1]]#".")
			
			$_l_JunkPosition:=Position:C15("JUNK"; $_at_Documents{$_l_Index})
			If ($_l_JunkPosition=0)
				$_l_2010Position:=Position:C15("_2010"; $_at_Documents{$_l_Index})
				
				If ($_l_2010Position=0)
					$_t_DocumentNames:=$_at_Documents{$_l_Index}
					$_l_ExtensionPosition:=Position:C15(".txt"; $_t_DocumentNames)
					If ($_l_ExtensionPosition=0)
						$_t_DocumentPath:=$_t_Databasepath+$_at_Documents{$_l_Index}
						If (Not:C34(Test path name:C476($_t_DocumentPath+".txt")=1))
							MOVE DOCUMENT:C540($_t_DocumentPath; $_t_DocumentPath+".txt")
							//DELETE DOCUMENT($_t_DocumentPath)
							$_at_Documents{$_l_Index}:=$_at_Documents{$_l_Index}+".txt"
						Else 
							//Document of that name already exists
							$_t_AddtoName:=" "+String:C10(Current date:C33; System date short:K1:1)+" "+String:C10(Current time:C178; System time short:K7:9)
							$_t_AddtoName:=Replace string:C233($_t_AddtoName; ":"; "")
							$_t_AddtoName:=Replace string:C233($_t_AddtoName; "/"; "_")
							
							MOVE DOCUMENT:C540($_t_DocumentPath; $_t_DocumentPath+$_t_AddtoName+".txt")
							
							
						End if 
					End if 
					$_t_Method:=Replace string:C233($_t_DocumentNames; ".txt"; "")
					ARRAY TEXT:C222($_at_AllDocuments; 0)
					ARRAY LONGINT:C221($_al_DocumentDateTime; 0)
					If ($_t_Method#"DB_ChangedMethodsReport")
						$_l_StartRow:=0
						Repeat 
							$_l_DocumentRow:=Find in array:C230($_at_Documents; $_t_Method+"@"; $_l_StartRow)
							If ($_l_DocumentRow>0)
								If ($_l_DocumentRow#$_l_Index)
									$_l_2010Position:=Position:C15("_2010"; $_at_Documents{$_l_DocumentRow})
									If ($_l_2010Position>0)
										$_t_DocumentName2:=$_at_Documents{$_l_DocumentRow}
										$_t_MethodName2:=Replace string:C233($_t_DocumentName2; ".txt"; "")
										$_t_DocTImeDate:=Replace string:C233($_t_MethodName2; $_t_Method; "")
										$_t_DateSTR:=Substring:C12($_t_DocTImeDate; 1; Length:C16($_t_DocTImeDate)-5)
										$_t_Time:=Substring:C12($_t_DocTImeDate; Length:C16($_t_DocTImeDate)-4)
										$_l_TimeNumber:=Num:C11($_t_Time)
										$_t_DateSTR:=Replace string:C233($_t_DateSTR; "_"; "/")
										$_d_Date:=Date:C102($_t_DateSTR)
										$_l_Days:=$_d_Date-!2010-01-01!
										$_t_Time:=String:C10($_l_TimeNumber)
										$_t_TimeHours:=Substring:C12($_t_Time; 1; 2)
										$_t_TimeMinutes:=Substring:C12($_t_Time; 3)
										$_ti_Time:=Time:C179($_t_TimeHours+":"+$_t_TimeMinutes)
										$_l_TimeLongint:=$_ti_Time*1
										APPEND TO ARRAY:C911($_al_DocumentDateTime; ($_l_TimeLongint+$_l_Days))
										
										
										
										APPEND TO ARRAY:C911($_at_AllDocuments; $_at_Documents{$_l_DocumentRow})
									End if 
								End if 
								$_l_StartRow:=$_l_DocumentRow+1
							End if 
						Until ($_l_DocumentRow<0)
						If (Size of array:C274($_at_AllDocuments)>0)
							//AA_jumkxl 02_11_2010 1728.txt
							SORT ARRAY:C229($_al_DocumentDateTime; $_at_AllDocuments; >)
							
							//For ($_l_IndexP;1;Size
							$_l_StartRow:=1
							If (Size of array:C274($_at_AllDocuments)>10)
								$_l_StartRow:=Size of array:C274($_at_AllDocuments)
							End if 
							
							For ($_l_IndexP; $_l_StartRow; Size of array:C274($_at_AllDocuments))
								If ($_l_IndexP=$_l_StartRow)
									$_t_DocumentPath:=$_t_Databasepath+$_at_Documents{$_l_Index}
									$_bo_Continue:=True:C214
								Else 
									$_t_DocumentPath:=$_t_Databasepath+$_at_AllDocuments{$_l_IndexP-1}
									$_l_Row:=Find in array:C230(DB_at_DocofChanges; $_t_Method)
									If ($_l_Row>0)
										For ($_l_Indexx; $_l_Row; Size of array:C274(DB_at_DocofChanges))
											If (DB_at_DocofChanges{$_l_Indexx}#"") & (DB_at_DocofChanges{$_l_Indexx}#$_t_Method)
												$_bo_Continue:=True:C214
												$_l_Indexx:=Size of array:C274(DB_at_DocofChanges)
											Else 
												If (DB_al_ChangesDates{$_l_Indexx}#0)
													If ($_al_DocumentDateTime{$_l_IndexP}=DB_al_ChangesDates{$_l_Indexx})  //The comparison is already done no need to do it again
														$_bo_Continue:=False:C215
													End if 
												End if 
											End if 
										End for 
									End if 
								End if 
								If ($_bo_Continue)
									$_t_TryPath:=$_t_Databasepath+$_at_AllDocuments{$_l_IndexP}
									$_l_ExtensionPosition:=Position:C15(".txt"; $_at_AllDocuments{$_l_IndexP})
									If ($_l_ExtensionPosition=0)
										$_l_DocumentRow:=Find in array:C230($_at_Documents; $_at_AllDocuments{$_l_IndexP})
										$_t_DocumentPath2:=$_t_Databasepath+$_at_AllDocuments{$_l_IndexP}
										If (Not:C34(Test path name:C476($_t_DocumentPath2+".txt")=1))
											MOVE DOCUMENT:C540($_t_DocumentPath2; $_t_DocumentPath2+".txt")
											//DELETE DOCUMENT($_t_DocumentPath)
											
										Else 
											//Document of that name already exists
											$_t_AddtoName:=" "+String:C10(Current date:C33; System date short:K1:1)+" "+String:C10(Current time:C178; System time short:K7:9)
											$_t_AddtoName:=Replace string:C233($_t_AddtoName; ":"; "")
											$_t_AddtoName:=Replace string:C233($_t_AddtoName; "/"; "_")
											
											MOVE DOCUMENT:C540($_t_DocumentPath2; $_t_DocumentPath2+$_t_AddtoName+".txt")
											
											
										End if 
										$_at_AllDocuments{$_l_IndexP}:=$_at_AllDocuments{$_l_IndexP}+".txt"
										$_at_Documents{$_l_DocumentRow}:=$_at_AllDocuments{$_l_IndexP}
										$_t_TryPath:=$_t_Databasepath+$_at_AllDocuments{$_l_IndexP}
									End if 
									GET DOCUMENT PROPERTIES:C477($_t_TryPath; $_bo_locked; $_bo_Invisible; $_d_CreatedOn; $_ti_CreatedAt; $_d_ModifiedOn; $_ti_ModifiedAt)
									APPEND TO ARRAY:C911($_at_MethodNames; $_at_Documents{$_l_Index})
									APPEND TO ARRAY:C911($_ad_MethodDates; $_d_CreatedOn)
									If (Test path name:C476($_t_TryPath)=Is a document:K24:1)
										
										ARRAY TEXT:C222(DB_at_DocumentinArray1; 0)
										ARRAY LONGINT:C221(DB_al_LIneNumbers1; 0)
										
										ARRAY TEXT:C222(DB_at_DocumentinArray2; 0)
										ARRAY LONGINT:C221(DB_al_LIneNumbers2; 2)
										DB_Documenttoarray($_t_DocumentPath; ->DB_at_DocumentinArray1; Char:C90(13))
										DB_Documenttoarray($_t_TryPath; ->DB_at_DocumentinArray2; Char:C90(13))
										
										
										$_l_Row:=Find in array:C230(DB_at_DocumentinArray1; "`End Project method Amendments")
										If ($_l_Row>1)
											DELETE FROM ARRAY:C228(DB_at_DocumentinArray1; 1; $_l_Row-1)
											
										End if 
										$_l_Row:=Find in array:C230(DB_at_DocumentinArray2; "`End Project method Amendments")
										If ($_l_Row>1)
											DELETE FROM ARRAY:C228(DB_at_DocumentinArray2; 1; $_l_Row-1)
											
										End if 
										ARRAY LONGINT:C221($_al_StartA; 0)
										ARRAY LONGINT:C221($_al_StartB; 0)
										ARRAY LONGINT:C221($_al_DeletedA; 0)
										ARRAY LONGINT:C221($_al_InsertedB; 0)
										If (DB_IsComponentInstalled("DIFFComponent"))
											EXECUTE FORMULA:C63("DIFF_FILES (->DB_at_DocumentinArray1;->DB_at_DocumentinArray2;->$_al_StartA;->$_al_StartB;->$_al_DeletedA;->$_al_InsertedB)")
											
										End if 
										ARRAY LONGINT:C221(DB_al_DIffColours; 0)
										If (DB_IsComponentInstalled("DIFFComponent"))
											EXECUTE FORMULA:C63("DIFF_SYNCHRONIZE (->DB_at_DocumentinArray1;->DB_at_DocumentinArray2;->$_al_StartA;->$_al_StartB;->$_al_DeletedA;->$_al_InsertedB;->DB_al_LIneNumbers1;->DB_al_LIneNumbers2;->DB_al_DIffColours)")
											
										End if 
										$_t_LinesAddedToNew:=""
										$_t_LinesDeletedFromNew:=""
										$_t_EditedLines:=""
										For ($_l_Indexx; 1; Size of array:C274(DB_al_LIneNumbers1))
											If (DB_al_LIneNumbers1{$_l_Indexx}>0) & (DB_al_LIneNumbers2{$_l_Indexx}=0)
												$_l_DocumentRow:=Find in array:C230(DB_al_LIneNumbers2; DB_al_LIneNumbers1{$_l_Indexx})
												If ($_l_DocumentRow<0)
													$_t_LinesAddedToNew:=$_t_LinesAddedToNew+"("+String:C10(DB_al_LIneNumbers1{$_l_Indexx})+")"+DB_at_DocumentinArray1{$_l_Indexx}+Char:C90(10)
												Else 
													If (DB_at_DocumentinArray2{$_l_DocumentRow}#DB_at_DocumentinArray1{$_l_Indexx})
														$_t_EditedLines:=$_t_EditedLines+"("+String:C10(DB_al_LIneNumbers1{$_l_Indexx})+")"+DB_at_DocumentinArray2{$_l_DocumentRow}+"(Changed to)"+DB_at_DocumentinArray1{$_l_Indexx}+Char:C90(10)
													End if 
												End if 
											End if 
											If (DB_al_LIneNumbers1{$_l_Indexx}=0) & (DB_al_LIneNumbers2{$_l_Indexx}>0)
												$_l_DocumentRow:=Find in array:C230(DB_al_LIneNumbers1; DB_al_LIneNumbers2{$_l_Indexx})
												If ($_l_DocumentRow<0)
													$_t_LinesDeletedFromNew:=$_t_LinesDeletedFromNew+"("+String:C10(DB_al_LIneNumbers2{$_l_Indexx})+")"+DB_at_DocumentinArray2{$_l_Indexx}+Char:C90(10)
												Else 
													//this will have been added to the edit side until part one
												End if 
											End if 
											If (DB_al_LIneNumbers1{$_l_Indexx}>0) & (DB_al_LIneNumbers2{$_l_Indexx}>0)
												If (DB_at_DocumentinArray2{$_l_Indexx}#DB_at_DocumentinArray1{$_l_Indexx})
													$_t_EditedLines:=$_t_EditedLines+"("+String:C10(DB_al_LIneNumbers1{$_l_Indexx})+")"+DB_at_DocumentinArray2{$_l_Indexx}+"(Changed to)"+DB_at_DocumentinArray1{$_l_Indexx}+Char:C90(10)
												End if 
											End if 
										End for 
										If ($_t_LinesAddedToNew#"") | ($_t_LinesDeletedFromNew#"") | ($_t_LinesDeletedFromNew#"")
											$_l_Row:=Find in array:C230(DB_at_DocofChanges; $_t_Method)
											If ($_l_Row<0)
												APPEND TO ARRAY:C911(DB_at_DocofChanges; $_t_Method)
												APPEND TO ARRAY:C911(DB_al_ChangesDates; 0)
												APPEND TO ARRAY:C911(DB_at_ChangesList; "")
												$_l_Row:=Size of array:C274(DB_at_DocofChanges)
											End if 
											$_l_NextMethodRow:=0
											$_l_ItemRow:=-1
											For ($_l_Indexx; $_l_Row; Size of array:C274(DB_at_DocofChanges))
												If (DB_at_DocofChanges{$_l_Indexx}#"") & (DB_at_DocofChanges{$_l_Indexx}#$_t_Method)
													$_l_NextMethodRow:=$_l_Indexx
													$_l_ItemRow:=-1
													$_l_Indexx:=Size of array:C274(DB_at_DocofChanges)
												Else 
													If (DB_al_ChangesDates{$_l_Indexx}#0)
														If ($_al_DocumentDateTime{$_l_IndexP}=DB_al_ChangesDates{$_l_Indexx})
															$_l_ItemRow:=$_l_Indexx
															$_l_Indexx:=Size of array:C274(DB_at_DocofChanges)
														End if 
													End if 
												End if 
											End for 
											$_t_CombinedText:=""
											If ($_t_LinesAddedToNew#"")
												
												
												$_t_CombinedText:="Added"+Char:C90(10)+$_t_LinesAddedToNew+Char:C90(10)
											End if 
											If ($_t_LinesDeletedFromNew#"")
												$_t_CombinedText:=$_t_CombinedText+"Deleted"+Char:C90(10)+$_t_LinesDeletedFromNew+Char:C90(10)
											End if 
											If ($_t_EditedLines#"")
												$_t_CombinedText:=$_t_CombinedText+"Edited"+Char:C90(10)+$_t_EditedLines
											End if 
											If ($_l_ItemRow<0)  //This doc is not included
												If ($_l_NextMethodRow=0)  //its at the end of the array
													APPEND TO ARRAY:C911(DB_at_DocofChanges; "")
													APPEND TO ARRAY:C911(DB_al_ChangesDates; $_al_DocumentDateTime{$_l_IndexP})
													APPEND TO ARRAY:C911(DB_at_ChangesList; "")
													$_l_Row:=Size of array:C274(DB_at_DocofChanges)
													APPEND TO ARRAY:C911(DB_at_DocofChanges; "")
													APPEND TO ARRAY:C911(DB_al_ChangesDates; 0)
													
													APPEND TO ARRAY:C911(DB_at_ChangesList; $_t_CombinedText)
												Else 
													INSERT IN ARRAY:C227(DB_at_DocofChanges; $_l_NextMethodRow; 1)
													INSERT IN ARRAY:C227(DB_al_ChangesDates; $_l_NextMethodRow; 1)
													INSERT IN ARRAY:C227(DB_at_ChangesList; $_l_NextMethodRow; 1)
													
													DB_al_ChangesDates{$_l_NextMethodRow}:=$_al_DocumentDateTime{$_l_IndexP}
													$_l_NextMethodRow:=$_l_NextMethodRow+1
													INSERT IN ARRAY:C227(DB_at_DocofChanges; $_l_NextMethodRow; 1)
													INSERT IN ARRAY:C227(DB_al_ChangesDates; $_l_NextMethodRow; 1)
													INSERT IN ARRAY:C227(DB_at_ChangesList; $_l_NextMethodRow; 1)
													DB_at_ChangesList{$_l_NextMethodRow}:=$_t_CombinedText
												End if 
												
											Else 
												//doc is included already Update the changes
												DB_at_ChangesList{$_l_ItemRow+1}:=$_t_CombinedText
											End if 
										End if 
									End if 
									
								End if 
								
								
							End for 
							
							
						End if 
					End if 
				End if 
			End if 
		End if 
	End for 
	If (Size of array:C274(DB_at_DocofChanges)>0)
		$_ti_DocumentRef:=Create document:C266($_t_ChangeReportPath+".txt")
		For ($_l_Index; 1; Size of array:C274(DB_at_DocofChanges))
			Case of 
				: (DB_at_DocofChanges{$_l_Index}#"")
					SEND PACKET:C103($_ti_DocumentRef; DB_at_DocofChanges{$_l_Index}+"≈")
				: (DB_al_ChangesDates{$_l_Index}#0)
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+String:C10(DB_al_ChangesDates{$_l_Index})+"≈")
				: (DB_at_ChangesList{$_l_Index}#"")
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+(DB_at_ChangesList{$_l_Index})+"≈")
			End case 
			
			
		End for 
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_LocalizedValidator"; $_t_oldMethodName)
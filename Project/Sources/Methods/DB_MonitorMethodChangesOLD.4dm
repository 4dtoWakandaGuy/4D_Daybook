//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MonitorMethodChangesOLD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2009`Method: DB_MonitorMethodChanges`Description
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(<>MethodHistory_abo_Replace;0)
	//ARRAY BOOLEAN(<>MH_abo_HistoryClean;0)
	ARRAY BOOLEAN:C223($_abo_MethodClean; 0)
	ARRAY BOOLEAN:C223($_abo_MethodCodeChanged; 0)
	ARRAY DATE:C224($_ad_ChangeDates; 0; 0)
	//ARRAY LONGINT(<>DOC_al_DateTimeStamp;0)
	ARRAY LONGINT:C221($_al_DateTimeStamp; 0)
	//ARRAY LONGINT(DB_al_ChangesDates;0)
	//ARRAY TEXT(<>MH_at_MethodCode;0)
	//ARRAY TEXT(<>MH_at_MethodNames;0)
	//ARRAY TEXT(<>MH_at_VersionNotes;0)
	ARRAY TEXT:C222($_at_ChangeNotes; 0; 0)
	ARRAY TEXT:C222($_at_ChangesMethods; 0)
	ARRAY TEXT:C222($_at_ExistingDocuments; 0)
	ARRAY TEXT:C222($_at_MethodCodes; 0)
	ARRAY TEXT:C222($_at_MethodNames; 0)
	ARRAY TEXT:C222($_at_MethodVersionNotes; 0)
	//ARRAY TEXT(DB_at_ChangesDocument;0)
	//ARRAY TEXT(DB_at_ChangesList;0)
	//ARRAY TEXT(DB_at_DocofChanges;0)
	C_BLOB:C604($_blb_docAsBlob; $_blb_Document)
	C_BOOLEAN:C305(<>DB_bo_DesignManagerInited; <>MethodHistory_bo_Active; $_bo_ChangesMade; $_bo_Exit; $_bo_Invisible; $_bo_Locked; $_bo_MethodAutoCreate)
	C_DATE:C307($_d_CreatedOn; $_d_ModifiedOn)
	C_LONGINT:C283($_l_ArraySize; $_l_ChangedDateIndex; $_l_ChangedMethodsIndex; $_l_ChangedMethodsIndextemRow; $_l_ChangeDocIndex; $_l_DateTime; $_l_FIrstUncleanRow; $_l_NextMethodRow; $_l_ObjectRow; $_l_offset; $_l_Position)
	C_LONGINT:C283($_l_Retries; $_l_Row; $_l_YearPosition)
	C_TEXT:C284($_t_AddToName; $_t_ChangedDate; $_t_ChangeDocumentpath; $_t_ChangeNotes; $_t_Databasepath; $_t_DocumentName; $_t_DocumentPath2; $_t_DocumentText; $_t_ErrorMethod; $_t_MethodBlockElement; $_t_MethodChanges)
	C_TEXT:C284($_t_MethodCode; $_t_MethodNameElement; $_t_Module; $_t_ObjectName; $_t_oldMethodName; $_t_Replace; $_t_RootXML; $_t_SubText; $_t_user; $_t_Version; $_t_WrapperElement)
	C_TIME:C306($_ti_CreatedAt; $_ti_DocumentRef; $_ti_ModifiedAt)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_MonitorMethodChanges")


// ----------------------------------------------------
//Based on code from...(not using a database for storing the code)
// User name (OS): Thomas Maul, 4D Germany
// Date and time: 08.09.08
// ----------------------------------------------------
// Method: MethodHistory_Start
// Description
// Called to run as new process
//  $1 = Database/ODBC DSN name,  use constant SQL_INTERNAL for internal database
//  $2 = Username (empty for internal)
// $3 = password (empty for internal)
// $4 = Module/database name (if empty uses name of structure)
// $5 = Designer
// ----------------------------------------------------
If (Count parameters:C259>=0)  //Dont think we need parameters for this
	
	$_t_Version:=VER_GetVersion
	$_t_Version:=Replace string:C233($_t_Version; ":"; "")
	$_t_Version:=Replace string:C233($_t_Version; "/"; "_")
	$_t_Version:=Replace string:C233($_t_Version; "\\"; "_")
	$_t_Version:=Replace string:C233($_t_Version; "."; "_")
	$_t_Databasepath:=Get 4D folder:C485(4)
	$_t_Databasepath:=$_t_Databasepath+"CODEEXPORTS"
	If (Not:C34(Test path name:C476($_t_Databasepath)=0))
		CREATE FOLDER:C475($_t_Databasepath)
	End if 
	$_t_DocumentName:="Method_Changes_Report_"+$_t_Version
	$_t_ChangeDocumentpath:=$_t_Databasepath+Folder separator:K24:12+$_t_DocumentName
	
	If (Not:C34(Test path name:C476($_t_ChangeDocumentpath+".txt")=1))
		$_ti_DocumentRef:=Create document:C266($_t_ChangeDocumentpath+".txt")
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
	If (Not:C34(Test path name:C476($_t_ChangeDocumentpath+"BLOB.txt")=1))
		$_ti_DocumentRef:=Create document:C266($_t_ChangeDocumentpath+"BLOB.txt")
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
	
	If (Not:C34(<>DB_bo_DesignManagerInited))
		ARRAY TEXT:C222(<>MH_at_MethodNames; 0)
		ARRAY TEXT:C222(<>MH_at_MethodCode; 0)
		ARRAY TEXT:C222(<>MH_at_VersionNotes; 0)
		ARRAY BOOLEAN:C223(<>MH_abo_HistoryClean; 0)
		ARRAY BOOLEAN:C223(<>MethodHistory_abo_Replace; 0)
		ARRAY LONGINT:C221(<>DOC_al_DateTimeStamp; 0)
		<>DB_bo_DesignManagerInited:=True:C214
	End if 
	<>MethodHistory_bo_Active:=True:C214
	
	
	
	
	While (((<>MethodHistory_bo_Active) & (Not:C34(Process aborted:C672))) | (Size of array:C274(<>MH_at_MethodNames)>0))
		If (Semaphore:C143("$MethodHistory"; 10))
			DELAY PROCESS:C323(Current process:C322; 30)
		Else 
			While (Semaphore:C143("DBEditingArray"))
				DelayTicks
			End while 
			ARRAY BOOLEAN:C223(<>MH_abo_HistoryClean; Size of array:C274(<>MH_at_MethodNames))
			ARRAY TEXT:C222($_at_MethodNames; 0)
			ARRAY TEXT:C222($_at_MethodCodes; 0)
			ARRAY BOOLEAN:C223($_abo_MethodClean; 0)
			ARRAY TEXT:C222($_at_MethodVersionNotes; 0)
			If (Size of array:C274(<>MH_at_MethodNames)>0)
				COPY ARRAY:C226(<>MH_at_MethodNames; $_at_MethodNames)
				COPY ARRAY:C226(<>MH_at_MethodCode; $_at_MethodCodes)
				COPY ARRAY:C226(<>MH_abo_HistoryClean; $_abo_MethodClean)
				COPY ARRAY:C226(<>MH_at_VersionNotes; $_at_MethodVersionNotes)
				COPY ARRAY:C226(<>MethodHistory_abo_Replace; $_abo_MethodCodeChanged)  //because we might just be updating things and it may not have changed!!
				COPY ARRAY:C226(<>DOC_al_DateTimeStamp; $_al_DateTimeStamp)  //to find the place in the document
				
				
			End if 
			CLEAR SEMAPHORE:C144("DBEditingArray")
			CLEAR SEMAPHORE:C144("$MethodHistory")
			ARRAY TEXT:C222(DB_at_ChangesDocument; 0)
			ARRAY TEXT:C222(DB_at_DocofChanges; 0)
			ARRAY TEXT:C222(DB_at_ChangesList; 0)
			ARRAY LONGINT:C221(DB_al_ChangesDates; 0)
			SET BLOB SIZE:C606($_blb_docAsBlob; 0)
			
			DOCUMENT TO BLOB:C525($_t_ChangeDocumentpath+"BLOB.txt"; $_blb_docAsBlob)
			//BLOB to text($_blb_docAsBlob;$_t_DocumentText)
			ARRAY TEXT:C222($_at_ChangesMethods; 0)
			ARRAY DATE:C224($_ad_ChangeDates; 0; 0)
			ARRAY TEXT:C222($_at_ChangeNotes; 0; 0)
			$_l_offset:=0
			BLOB TO VARIABLE:C533($_blb_docAsBlob; $_at_ChangesMethods; $_l_offset)
			$_l_ArraySize:=Size of array:C274($_at_ChangesMethods)
			ARRAY DATE:C224($_ad_ChangeDates; Size of array:C274($_at_ChangesMethods); 0)
			ARRAY TEXT:C222($_at_ChangeNotes; Size of array:C274($_at_ChangesMethods); 0)
			For ($_l_ChangedMethodsIndex; 1; $_l_ArraySize)
				If (BLOB size:C605($_blb_docAsBlob)>$_l_offset)
					BLOB TO VARIABLE:C533($_blb_docAsBlob; $_ad_ChangeDates{$_l_ChangedMethodsIndex}; $_l_offset)
				End if 
				If (BLOB size:C605($_blb_docAsBlob)>$_l_offset)
					BLOB TO VARIABLE:C533($_blb_docAsBlob; $_at_ChangeNotes{$_l_ChangedMethodsIndex}; $_l_offset)
				End if 
			End for 
			
			If (False:C215)
				DB_Documenttoarray($_t_ChangeDocumentpath+".txt"; ->DB_at_ChangesDocument; "≈")
				For ($_l_ChangedMethodsIndex; 1; Size of array:C274(DB_at_ChangesDocument))
					Case of 
						: (Position:C15(Char:C90(9)+Char:C90(9); DB_at_ChangesDocument{$_l_ChangedMethodsIndex})>0)
							//DetailLine
							APPEND TO ARRAY:C911(DB_at_DocofChanges; "")
							APPEND TO ARRAY:C911(DB_al_ChangesDates; 0)
							APPEND TO ARRAY:C911(DB_at_ChangesList; Substring:C12(DB_at_ChangesDocument{$_l_ChangedMethodsIndex}; 3))
							
						: (Position:C15(Char:C90(9); DB_at_ChangesDocument{$_l_ChangedMethodsIndex})>0)
							//Date Line
							APPEND TO ARRAY:C911(DB_at_DocofChanges; "")
							APPEND TO ARRAY:C911(DB_al_ChangesDates; Num:C11(Substring:C12(DB_at_ChangesDocument{$_l_ChangedMethodsIndex}; 2)))
							APPEND TO ARRAY:C911(DB_at_ChangesList; "")
							
						Else 
							//Method name
							APPEND TO ARRAY:C911(DB_at_DocofChanges; DB_at_ChangesDocument{$_l_ChangedMethodsIndex})
							APPEND TO ARRAY:C911(DB_al_ChangesDates; 0)
							APPEND TO ARRAY:C911(DB_at_ChangesList; "")
							
					End case 
				End for 
			End if 
			If (Size of array:C274($_at_MethodNames)#0)
				$_l_FIrstUncleanRow:=Find in array:C230($_abo_MethodClean; False:C215)
				If ($_l_FIrstUncleanRow<2)
					$_l_FIrstUncleanRow:=2
				End if 
				$_l_FIrstUncleanRow:=$_l_FIrstUncleanRow-1
				$_bo_ChangesMade:=False:C215
				For ($_l_ChangedMethodsIndex; $_l_FIrstUncleanRow; Size of array:C274($_at_MethodNames))
					If ($_abo_MethodClean{$_l_ChangedMethodsIndex}=False:C215)
						$_t_ObjectName:=$_at_MethodNames{$_l_ChangedMethodsIndex}
						$_t_ObjectName:=DB_DecodeMethodPath($_t_ObjectName)
						$_t_MethodCode:=$_at_MethodCodes{$_l_ChangedMethodsIndex}
						$_t_MethodChanges:=$_at_MethodVersionNotes{$_l_ChangedMethodsIndex}
						$_l_DateTime:=$_al_DateTimeStamp{$_l_ChangedMethodsIndex}
						//$Date:=Current date(*)
						//$_l_Days:=$Date-!01/01/2010!
						//$TimLong:=(Current time(*))*1
						//$TimeLongint:=$TimLong+$_l_Days
						//Check the folder exists to store the Code in
						$_t_Databasepath:=Get 4D folder:C485(4)
						$_t_Databasepath:=$_t_Databasepath+"CODEEXPORTS"
						If (Not:C34(Test path name:C476($_t_Databasepath)=0))
							CREATE FOLDER:C475($_t_Databasepath)
						End if 
						$_t_DocumentPath2:=$_t_Databasepath+Folder separator:K24:12+"Previous_Versions"
						
						If (Not:C34(Test path name:C476($_t_DocumentPath2)=0))
							CREATE FOLDER:C475($_t_DocumentPath2)
							//TRACE
							DOCUMENT LIST:C474($_t_Databasepath; $_at_ExistingDocuments)
							For ($_l_ChangedMethodsIndex; 1; Size of array:C274($_at_ExistingDocuments))
								//move the documents
								If ($_at_ExistingDocuments{$_l_ChangedMethodsIndex}[[1]]#".") & ($_at_ExistingDocuments{$_l_ChangedMethodsIndex}[[1]]#"_")
									$_l_YearPosition:=Position:C15("_2010"; $_at_ExistingDocuments{$_l_ChangedMethodsIndex})
									If ($_l_YearPosition=0)
										$_l_YearPosition:=Position:C15("_2011"; $_at_ExistingDocuments{$_l_ChangedMethodsIndex})
										If ($_l_YearPosition=0)
											$_l_YearPosition:=Position:C15("_2012"; $_at_ExistingDocuments{$_l_ChangedMethodsIndex})
											If ($_l_YearPosition=0)
												$_l_YearPosition:=Position:C15("_2013"; $_at_ExistingDocuments{$_l_ChangedMethodsIndex})
												If ($_l_YearPosition=0)
													$_l_YearPosition:=Position:C15("_2015"; $_at_ExistingDocuments{$_l_ChangedMethodsIndex})
													If ($_l_YearPosition=0)
														$_l_YearPosition:=Position:C15("_2016"; $_at_ExistingDocuments{$_l_ChangedMethodsIndex})
														If ($_l_YearPosition=0)
															$_l_YearPosition:=Position:C15("_2016"; $_at_ExistingDocuments{$_l_ChangedMethodsIndex})
														End if 
													End if 
												End if 
											End if 
										End if 
									End if 
									If ($_l_YearPosition>0)
										MOVE DOCUMENT:C540($_t_Databasepath+Folder separator:K24:12+$_at_ExistingDocuments{$_l_ChangedMethodsIndex}; $_t_DocumentPath2+Folder separator:K24:12+$_at_ExistingDocuments{$_l_ChangedMethodsIndex})
										
										
									End if 
								End if 
								
							End for 
							
						End if 
						$_t_DocumentName:=$_t_ObjectName
						$_t_DocumentName:=Replace string:C233($_t_DocumentName; ":"; "")
						$_t_DocumentName:=Replace string:C233($_t_DocumentName; "/"; "_")
						$_t_DocumentName:=Replace string:C233($_t_DocumentName; "\\"; "_")
						
						$_t_Databasepath:=$_t_Databasepath+Folder separator:K24:12+$_t_DocumentName
						$_t_DocumentPath2:=$_t_DocumentPath2+Folder separator:K24:12+$_t_DocumentName
						
						
						If (Not:C34(Test path name:C476($_t_Databasepath+".txt")=1))
							If (Length:C16($_t_MethodCode)<30000)
								TEXT TO BLOB:C554($_t_MethodCode; $_blb_Document; Mac text without length:K22:10)
								
							Else 
								$_t_SubText:=""
								$_l_Position:=1
								Repeat 
									$_t_SubText:=Substring:C12($_t_MethodCode; $_l_Position; 32000)
									TEXT TO BLOB:C554($_t_SubText; $_blb_Document; Mac text without length:K22:10; *)
									
									$_l_Position:=$_l_Position+32000
								Until ($_t_SubText="")
							End if 
							BLOB TO DOCUMENT:C526($_t_Databasepath+".txt"; $_blb_Document)
							
							
						Else 
							//archive the saved version.
							
							If ($_abo_MethodCodeChanged{$_l_ChangedMethodsIndex})
								$_t_AddToName:=" "+String:C10(Current date:C33; System date short:K1:1)+" "+String:C10(Current time:C178; System time short:K7:9)
								
								$_t_AddToName:=Replace string:C233($_t_AddToName; ":"; "")
								$_t_AddToName:=Replace string:C233($_t_AddToName; "/"; "_")
								Repeat 
									GET DOCUMENT PROPERTIES:C477($_t_Databasepath+".txt"; $_bo_Locked; $_bo_Invisible; $_d_CreatedOn; $_ti_CreatedAt; $_d_ModifiedOn; $_ti_ModifiedAt)
									If ($_bo_Locked)
										DelayTicks(2)
										//TRACE
									End if 
								Until (Not:C34($_bo_Locked))
								$_bo_Exit:=False:C215
								$_l_Retries:=0
								Repeat 
									If (Not:C34(Test path name:C476($_t_DocumentPath2+$_t_AddToName+".txt")=1))
										MOVE DOCUMENT:C540($_t_Databasepath+".txt"; $_t_DocumentPath2+$_t_AddToName+".txt")
										$_bo_Exit:=True:C214
									Else 
										If ($_l_Retries=0)
											$_t_AddToName:=$_t_AddToName+"_1"
											$_l_Retries:=$_l_Retries+1
										Else 
											$_t_Replace:="_"+String:C10($_l_Retries)
											$_t_AddToName:=Substring:C12($_t_AddToName; 1; (Length:C16($_t_AddToName))-Length:C16($_t_Replace))
											$_t_AddToName:=$_t_AddToName+"+"+String:C10($_l_Retries)
											$_l_Retries:=$_l_Retries+1
											$_bo_Exit:=False:C215
										End if 
									End if 
									
								Until ($_bo_Exit)
								SET BLOB SIZE:C606($_blb_Document; 0)
								
								If (Length:C16($_t_MethodCode)<30000)
									TEXT TO BLOB:C554($_t_MethodCode; $_blb_Document; Mac text without length:K22:10)
									
								Else 
									$_t_SubText:=""
									$_l_Position:=1
									Repeat 
										$_t_SubText:=Substring:C12($_t_MethodCode; $_l_Position; 32000)
										TEXT TO BLOB:C554($_t_SubText; $_blb_Document; Mac text without length:K22:10; *)
										
										$_l_Position:=$_l_Position+32000
									Until ($_t_SubText="")
								End if 
								BLOB TO DOCUMENT:C526($_t_Databasepath+".txt"; $_blb_Document)
							End if 
							
							
						End if 
						
						While (Semaphore:C143("DBEditingArray"))
							DelayTicks
						End while 
						$_l_ObjectRow:=Find in array:C230(<>MH_at_MethodNames; $_t_ObjectName)
						If ($_l_ObjectRow>0)
							<>MH_abo_HistoryClean{$_l_ObjectRow}:=True:C214
							<>MH_at_VersionNotes{$_l_ObjectRow}:=""
							<>MethodHistory_abo_Replace{$_l_ObjectRow}:=False:C215
						End if 
						CLEAR SEMAPHORE:C144("DBEditingArray")
						If ($_t_MethodChanges#"") | ($_t_ObjectName#"")
							If (False:C215)
								$_l_Row:=Find in array:C230(DB_at_DocofChanges; $_t_ObjectName)
								If ($_l_Row<0)
									APPEND TO ARRAY:C911(DB_at_DocofChanges; $_t_ObjectName)
									APPEND TO ARRAY:C911(DB_al_ChangesDates; 0)
									APPEND TO ARRAY:C911(DB_at_ChangesList; "")
									$_l_Row:=Size of array:C274(DB_at_DocofChanges)
								End if 
								$_l_NextMethodRow:=0
								$_l_ChangedMethodsIndextemRow:=-1
								For ($_l_ChangeDocIndex; $_l_Row; Size of array:C274(DB_at_DocofChanges))
									If (DB_at_DocofChanges{$_l_ChangeDocIndex}#"") & (DB_at_DocofChanges{$_l_ChangeDocIndex}#$_t_ObjectName)
										$_l_NextMethodRow:=$_l_ChangeDocIndex
										$_l_ChangedMethodsIndextemRow:=-1
										$_l_ChangeDocIndex:=Size of array:C274(DB_at_DocofChanges)
									Else 
										If (DB_al_ChangesDates{$_l_ChangeDocIndex}#0)
											If ($_l_DateTime=DB_al_ChangesDates{$_l_ChangeDocIndex})
												$_l_ChangedMethodsIndextemRow:=$_l_ChangeDocIndex
												$_l_ChangeDocIndex:=Size of array:C274(DB_at_DocofChanges)
											End if 
										End if 
									End if 
								End for 
								If ($_l_ChangedMethodsIndextemRow<0)  //This doc is not included
									If ($_l_NextMethodRow=0)  //its at the end of the array
										
										
										$_bo_ChangesMade:=True:C214
										APPEND TO ARRAY:C911(DB_at_DocofChanges; "")
										APPEND TO ARRAY:C911(DB_al_ChangesDates; $_l_DateTime)
										APPEND TO ARRAY:C911(DB_at_ChangesList; "")
										$_l_Row:=Size of array:C274(DB_at_DocofChanges)
										APPEND TO ARRAY:C911(DB_at_DocofChanges; "")
										APPEND TO ARRAY:C911(DB_al_ChangesDates; 0)
										
										APPEND TO ARRAY:C911(DB_at_ChangesList; $_t_MethodChanges)
									Else 
										$_bo_ChangesMade:=True:C214
										INSERT IN ARRAY:C227(DB_at_DocofChanges; $_l_NextMethodRow; 1)
										INSERT IN ARRAY:C227(DB_al_ChangesDates; $_l_NextMethodRow; 1)
										INSERT IN ARRAY:C227(DB_at_ChangesList; $_l_NextMethodRow; 1)
										
										DB_al_ChangesDates{$_l_NextMethodRow}:=$_l_DateTime
										$_l_NextMethodRow:=$_l_NextMethodRow+1
										INSERT IN ARRAY:C227(DB_at_DocofChanges; $_l_NextMethodRow; 1)
										INSERT IN ARRAY:C227(DB_al_ChangesDates; $_l_NextMethodRow; 1)
										INSERT IN ARRAY:C227(DB_at_ChangesList; $_l_NextMethodRow; 1)
										DB_at_ChangesList{$_l_NextMethodRow}:=$_t_MethodChanges
									End if 
									
								Else   //doc is included already Update the changes
									
									DB_at_ChangesList{$_l_ChangedMethodsIndextemRow+1}:=$_t_MethodChanges
								End if 
							Else 
								//$XMLTREE
								//ARRAY TEXT($_at_ChangesMethods;0)
								//ARRAY DATE($_ad_ChangeDates;0;0)
								//ARRAY TEXT($_at_ChangeNotes;0;0)
								$_l_ObjectRow:=Find in array:C230($_at_ChangesMethods; $_t_ObjectName)
								If ($_l_ObjectRow<0)
									$_bo_ChangesMade:=True:C214
									APPEND TO ARRAY:C911($_at_ChangesMethods; $_t_ObjectName)
									$_l_ArraySize:=Size of array:C274($_ad_ChangeDates)
									INSERT IN ARRAY:C227($_ad_ChangeDates; $_l_ArraySize+1; 1)
									INSERT IN ARRAY:C227($_at_ChangeNotes; $_l_ArraySize+1; 1)
									$_l_ArraySize:=$_l_ArraySize+1
									APPEND TO ARRAY:C911($_ad_ChangeDates{$_l_ArraySize}; Current date:C33(*))
									APPEND TO ARRAY:C911($_at_ChangeNotes{$_l_ArraySize}; $_t_MethodChanges)
								Else 
									$_bo_ChangesMade:=True:C214
									APPEND TO ARRAY:C911($_ad_ChangeDates{$_l_ObjectRow}; Current date:C33(*))
									APPEND TO ARRAY:C911($_at_ChangeNotes{$_l_ObjectRow}; $_t_MethodChanges)
								End if 
							End if 
						End if 
					End if 
				End for 
				If (Size of array:C274($_at_ChangesMethods)>0) & ($_bo_ChangesMade)  //` recreate the document
					
					SET BLOB SIZE:C606($_blb_docAsBlob; 0)
					VARIABLE TO BLOB:C532($_at_ChangesMethods; $_blb_docAsBlob; *)
					$_l_ArraySize:=Size of array:C274($_at_ChangesMethods)
					For ($_l_ChangedMethodsIndex; 1; $_l_ArraySize)
						VARIABLE TO BLOB:C532($_ad_ChangeDates{$_l_ChangedMethodsIndex}; $_blb_docAsBlob; *)
						VARIABLE TO BLOB:C532($_at_ChangeNotes{$_l_ChangedMethodsIndex}; $_blb_docAsBlob; *)
					End for 
					BLOB TO DOCUMENT:C526($_t_ChangeDocumentpath+"BLOB.txt"; $_blb_docAsBlob)
					//Here make the blob into xml...
					$_t_RootXML:=DOM Create XML Ref:C861("Daybook_Changes")
					$_t_WrapperElement:=DOM Create XML element:C865($_t_RootXML; "Methods")  //may break this into different types
					
					For ($_l_ChangedMethodsIndex; 1; Size of array:C274($_at_ChangesMethods))
						$_t_MethodBlockElement:=DOM Create XML element:C865($_t_WrapperElement; "Method")
						$_t_MethodNameElement:=DOM Create XML element:C865($_t_MethodBlockElement; "Method_Name"; "Method_Name"; $_at_ChangesMethods{$_l_ChangedMethodsIndex})
						DOM SET XML ELEMENT VALUE:C868($_t_MethodNameElement; $_at_ChangesMethods{$_l_ChangedMethodsIndex})
						For ($_l_ChangedDateIndex; 1; Size of array:C274($_ad_ChangeDates{$_l_ChangedMethodsIndex}))
							$_t_ChangedDate:=DOM Create XML element:C865($_t_MethodBlockElement; "Change_Date"; "Date"; String:C10($_ad_ChangeDates{$_l_ChangedMethodsIndex}{$_l_ChangedDateIndex}))
							DOM SET XML ELEMENT VALUE:C868($_t_ChangedDate; String:C10($_ad_ChangeDates{$_l_ChangedMethodsIndex}{$_l_ChangedDateIndex}))
							$_t_ChangeNotes:=DOM Create XML element:C865($_t_MethodBlockElement; "Change_Notes")
							DOM SET XML ELEMENT VALUE:C868($_t_ChangeNotes; ($_at_ChangeNotes{$_l_ChangedMethodsIndex}{$_l_ChangedDateIndex}); *)
						End for 
					End for 
					$_ti_DocumentRef:=Create document:C266($_t_ChangeDocumentpath+".txt"; "TEXT")
					CLOSE DOCUMENT:C267($_ti_DocumentRef)
					DOM EXPORT TO FILE:C862($_t_RootXML; $_t_ChangeDocumentpath+".txt")
					If (False:C215)
						$_ti_DocumentRef:=Create document:C266($_t_ChangeDocumentpath+".txt")
						If ($_ti_DocumentRef#?00:00:00?)
							
							For ($_l_ChangedMethodsIndex; 1; Size of array:C274(DB_at_DocofChanges))
								Case of 
									: (DB_at_DocofChanges{$_l_ChangedMethodsIndex}#"")
										SEND PACKET:C103($_ti_DocumentRef; DB_at_DocofChanges{$_l_ChangedMethodsIndex}+"≈")
									: (DB_al_ChangesDates{$_l_ChangedMethodsIndex}#0)
										SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+String:C10(DB_al_ChangesDates{$_l_ChangedMethodsIndex})+"≈")
									: (DB_at_ChangesList{$_l_ChangedMethodsIndex}#"")
										SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+(DB_at_ChangesList{$_l_ChangedMethodsIndex})+"≈")
								End case 
								
								
							End for 
							CLOSE DOCUMENT:C267($_ti_DocumentRef)
						End if 
					End if 
				End if 
			End if 
			$_bo_ChangesMade:=False:C215
			ARRAY TEXT:C222($_at_MethodNames; 0)
			ARRAY TEXT:C222($_at_MethodCodes; 0)
			ARRAY BOOLEAN:C223($_abo_MethodClean; 0)
			
			DELAY PROCESS:C323(Current process:C322; 300)  //300/60
			
		End if 
	End while 
	
	<>MethodHistory_bo_Active:=False:C215
End if 
ERR_MethodTrackerReturn("DB_MonitorMethodChanges"; $_t_oldMethodName)
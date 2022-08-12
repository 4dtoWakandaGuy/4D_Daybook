//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_GetBKData
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DM_al_BKFieldNumbers;0)
	//ARRAY LONGINT(DM_al_DBFieldNUM;0)
	//ARRAY LONGINT(DM_al_DBTableNUM;0)
	//ARRAY LONGINT(DM_al_DestinationContext;0)
	ARRAY TEXT:C222($_at_RecordData; 0)
	//ARRAY TEXT(DM_at_BKDataFieldNM;0)
	//ARRAY TEXT(DM_at_BKDataModel;0)
	//ARRAY TEXT(DM_at_FieldData;0)
	//ARRAY TEXT(DM_at_FieldNames;0)
	C_DATE:C307($_d_LastUpdateDate; $DM_D_BkLastUpdateDate; DM_D_BkLastUpdateDate)
	C_LONGINT:C283($_l_BKRecordCount; $_l_CharPosition; $_l_Count; $_l_DataPosition; $_l_Element; $_l_Error; $_l_FieldCount; $_l_FieldNumber; $_l_Index; $_l_offset; $1)
	C_LONGINT:C283(DM_CB_BkActive; DM_l_BkConnectionID; DM_l_BKDataModelID; DM_l_BkFrequency; DM_l_BKLastTimeStamp; DM_l_BkLastUpdateTime; DM_l_BkMaxTime; DM_l_BKOptions; DM_l_BKPostAction; DM_l_BkRetrieveType; DM_l_BkserverID)
	C_LONGINT:C283(DM_l_BkserverPort; DM_l_BkstoreID; DM_l_BkTimeOut; DM_l_DestinationContext; DM_l_LastRecord; DM_l_RecordCount)
	C_POINTER:C301($3; $4)
	C_TEXT:C284($_t_BKFilePath; $_t_BKQuery; $_t_BKResult; $_t_DataValue; $_t_FieldData; $_t_oldMethodName; $_t_RecordData; $2; DM_t_BkConnectionName; DM_t_BkDataModel; DM_t_BKFileName)
	C_TEXT:C284(DM_t_BKFilePath; DM_t_BkFrequencyType; DM_t_BKServerIP; DM_t_BKStoreName; DM_t_BKStorePassword; DM_T_CustomQuery; DM_T_FieldNames)
	C_TIME:C306($_ti_Document; $_ti_LastUpdateTime; $_ti_BkLastUpdateTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_GetBKData")



If (Count parameters:C259>=1)  //1
	If (Count parameters:C259<2)  //2
		If (Record number:C243([PREFERENCES:116])#$1)  //2a
			GOTO RECORD:C242([PREFERENCES:116]; $1)
		End if   //2a
	End if   //2
	$_l_offset:=0
	If (Records in selection:C76([PREFERENCES:116])>0)  //3
		If (Count parameters:C259<2)  //4
			DM_BKConnectionBLobtovariables
		End if   //4
		
		
		
		//`````
		$_l_offset:=0
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=DM_l_BkserverID)
		If (Records in selection:C76([PREFERENCES:116])>0)  //5
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_BKServerIP; $_l_offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)  //6
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_BkserverPort; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)  //7
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_BKFilePath; $_l_offset)
				End if   //7
			End if   //6
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=DM_l_BkstoreID)
			If (Records in selection:C76([PREFERENCES:116])>0)  //8
				$_l_offset:=0
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_BKStoreName; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)  //9
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_BKStorePassword; $_l_offset)
				End if   //9
				ARRAY TEXT:C222(DM_at_BKDataModel; 0)  //Table
				ARRAY TEXT:C222(DM_at_BKDataFieldNM; 0)  //field name
				ARRAY LONGINT:C221(DM_al_DBTableNUM; 0)
				ARRAY LONGINT:C221(DM_al_DBFieldNUM; 0)
				ARRAY LONGINT:C221(DM_al_DestinationContext; 0)
				
				If ((DM_l_BKDataModelID)>0)  //10
					QUERY:C277([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]x_MapSetID:7=DM_l_BKDataModelID)
					If (Records in selection:C76([EW_BK_FieldMap:121])>0)  //this will be more than one record`10a
						SELECTION TO ARRAY:C260([EW_BK_FieldMap:121]BKTableName:6; DM_at_BKDataModel)
						SELECTION TO ARRAY:C260([EW_BK_FieldMap:121]BKFieldName:3; DM_at_BKDataFieldNM)
						SELECTION TO ARRAY:C260([EW_BK_FieldMap:121]DayBookTableNumber:1; DM_al_DBTableNUM)
						SELECTION TO ARRAY:C260([EW_BK_FieldMap:121]DayBookFieldNumber:2; DM_al_DBFieldNUM)
						SELECTION TO ARRAY:C260([EW_BK_FieldMap:121]x_DestinationContext:8; DM_al_DestinationContext)
						
						DM_t_BkDataModel:=DM_at_BKDataModel{1}
						DM_l_DestinationContext:=DM_al_DestinationContext{1}
					End if   //10a
					//if we get here there is a testable data model a server, a store and connection i
					//we can now get option information for the table for this table
					$_d_LastUpdateDate:=Current date:C33(*)
					$_ti_LastUpdateTime:=Current time:C178(*)
					
					$_t_BKResult:=""
					
					$_t_BKFilePath:=DM_SetFilePath(DM_t_BKFilePath; DM_t_BKFileName)
					
					If (DM_l_BkRetrieveType=0)  //11
						//TRACE
						DM_l_BkRetrieveType:=1
					End if   //11
					$_t_BKQuery:=""
					$_t_BKResult:=""
					Case of   //12
						: (DM_l_BkRetrieveType=1)  //ALL RECORDS
							$DM_D_BkLastUpdateDate:=!00-00-00!
							$_ti_BkLastUpdateTime:=Time:C179(Time string:C180(?00:00:00?))
							//$_t_BKQuery:="*Ts>="+4DBKC_ToolsString ("GET TIMESTAMP GMT";String($DM_D_BkLastUpdateDate);String($DM_ti_BkLastUpdateTime))
							//$_t_BKResult:=4DBKC_ImportFileFrom4DBK (DM_t_BKServerIP;DM_l_BkserverPort;DM_l_BkTimeOut;DM_l_BkMaxTime;DM_t_BKStorePassword;DM_t_BKStoreName;DM_t_BkDataModel;$_t_BKQuery;$_t_BKFilePath)
						: (DM_l_BkRetrieveType=2)  //since last update
							$DM_D_BkLastUpdateDate:=DM_D_BkLastUpdateDate
							$_ti_BkLastUpdateTime:=Time:C179(Time string:C180(DM_l_BkLastUpdateTime))
							//$_t_BKQuery:="*Ts>="+4DBKC_ToolsString ("GET TIMESTAMP GMT";String($DM_D_BkLastUpdateDate);String($DM_ti_BkLastUpdateTime))
							//$_t_BKResult:=4DBKC_ImportFileFrom4DBK (DM_t_BKServerIP;DM_l_BkserverPort;DM_l_BkTimeOut;DM_l_BkMaxTime;DM_t_BKStorePassword;DM_t_BKStoreName;DM_t_BkDataModel;$_t_BKQuery;$_t_BKFilePath)
							
						: (DM_l_BkRetrieveType=3)  //next "n" Record
							$DM_D_BkLastUpdateDate:=!00-00-00!
							$_ti_BkLastUpdateTime:=Time:C179(Time string:C180(?00:00:00?))
							//$_t_BKQuery:="*Ts>="+4DBKC_ToolsString ("GET TIMESTAMP GMT";String($DM_D_BkLastUpdateDate);String($DM_ti_BkLastUpdateTime))
							//$_t_BKResult:=4DBKC_ImportFileFrom4DBK (DM_t_BKServerIP;DM_l_BkserverPort;DM_l_BkTimeOut;DM_l_BkMaxTime;DM_t_BKStorePassword;DM_t_BKStoreName;DM_t_BkDataModel;$_t_BKQuery;$_t_BKFilePath;String(DM_l_LastRecord+1);String(DM_l_RecordCount))
							DM_l_LastRecord:=DM_l_LastRecord+1+DM_l_RecordCount
						: (DM_l_BkRetrieveType=4)  //Before
							$DM_D_BkLastUpdateDate:=DM_D_BkLastUpdateDate
							$_ti_BkLastUpdateTime:=Time:C179(Time string:C180(DM_l_BkLastUpdateTime))
							//$_t_BKQuery:="*Ts<="+4DBKC_ToolsString ("GET TIMESTAMP GMT";String($DM_D_BkLastUpdateDate);String($DM_ti_BkLastUpdateTime))
							//$_t_BKResult:=4DBKC_ImportFileFrom4DBK (DM_t_BKServerIP;DM_l_BkserverPort;DM_l_BkTimeOut;DM_l_BkMaxTime;DM_t_BKStorePassword;DM_t_BKStoreName;DM_t_BkDataModel;$_t_BKQuery;$_t_BKFilePath)
						: (DM_l_BKRetrieveType=5)
							//query string is passed to this method
							$_t_BKQuery:=$2
							
							
							
							
							//$_t_BKResult:=4DBKC_ImportFileFrom4DBK (DM_t_BKServerIP;DM_l_BkserverPort;DM_l_BkTimeOut;DM_l_BkMaxTime;DM_t_BKStorePassword;DM_t_BKStoreName;DM_t_BkDataModel;$_t_BKQuery;$_t_BKFilePath)
						: (DM_l_BKRetrieveType=6)
							//custom query
							$DM_D_BkLastUpdateDate:=DM_D_BkLastUpdateDate
							$_ti_BkLastUpdateTime:=Time:C179(Time string:C180(DM_l_BkLastUpdateTime))
							$_t_BKQuery:=DM_T_CustomQuery
							//$_t_BKResult:=4DBKC_ImportFileFrom4DBK (DM_t_BKServerIP;DM_l_BkserverPort;DM_l_BkTimeOut;DM_l_BkMaxTime;DM_t_BKStorePassword;DM_t_BKStoreName;DM_t_BkDataModel;$_t_BKQuery;$_t_BKFilePath)
							
						Else 
							
							//handle errors here
							$_l_Error:=4
							//OTHER SEARCH METHODS HERE
					End case   //12
					Case of   //13
						: ($_t_BKResult#("[err"+"@"))
							If (Num:C11($_t_BKResult)>0)  //13a
								If (Test path name:C476($_t_BKFilePath)=Is a document:K24:1)  //14
									$_l_BKRecordCount:=Num:C11($_t_BKResult)  //because we know the first row is the field names we can now get them
									$_ti_Document:=DB_OpenDocument($_t_BKFilePath)
									RECEIVE PACKET:C104($_ti_Document; DM_T_FieldNames; Char:C90(13))
									$_l_FieldCount:=0
									//$_l_FieldCount:=Num(4DBKC_ToolsString ("STRING TO FIELD COUNT";DM_T_FieldNames;Char(9)))
									ARRAY TEXT:C222(DM_at_FieldNames; 0)
									ARRAY TEXT:C222(DM_at_FieldNames; $_l_FieldCount)
									ARRAY LONGINT:C221(DM_al_BKFieldNumbers; Size of array:C274(DM_at_BKDataFieldNM))
									For ($_l_Index; 1; $_l_FieldCount)  //15
										//DM_at_FieldNames{$_l_Index}:=4DBKC_ToolsString ("STRING TO FIELD";DM_T_FieldNames;Char(9);$_l_Index)
									End for   //15
									//now we can check those field names received against the data map
									For ($_l_Index; 1; Size of array:C274(DM_at_FieldNames))  //16
										//take the "[" and "]" off first(not shown here)
										$_t_DataValue:=Replace string:C233(DM_at_FieldNames{$_l_Index}; "["; "")
										$_t_DataValue:=Replace string:C233($_t_DataValue; "]"; "")
										
										$_l_DataPosition:=Find in array:C230(DM_at_BKDataFieldNM; $_t_DataValue)
										If ($_l_DataPosition>0)  //17
											//Store the BK field number
											DM_al_BKFieldNumbers{$_l_DataPosition}:=$_l_Index
										Else 
											//map error-break out
											CLOSE DOCUMENT:C267($_ti_Document)
											$_l_Error:=1
										End if   //17
									End for   //16
									SORT ARRAY:C229(DM_al_BKFieldNumbers; DM_at_FieldNames; DM_at_BKDataModel; DM_at_BKDataFieldNM; DM_al_DBTableNUM; DM_al_DBFieldNUM; DM_al_DestinationContext)
									$_l_DataPosition:=Find in array:C230(DM_al_BKFieldNumbers; 0)
									If ($_l_DataPosition>0)  //19
										CLOSE DOCUMENT:C267($_ti_Document)
										//map error-break out
										$_l_Error:=2
									Else   //19
										//read the rest of the document
										ARRAY TEXT:C222($_at_RecordData; $_l_BKRecordCount)
										$_l_Element:=1
										$_l_Count:=0
										Repeat   // 20
											If ($_l_Element>Size of array:C274($_at_RecordData))  //21
												INSERT IN ARRAY:C227($_at_RecordData; $_at_RecordData+1; 100)
											End if   //21
											RECEIVE PACKET:C104($_ti_Document; $_at_RecordData{$_l_Element}; Char:C90(13))
											$_l_Element:=$_l_Element+1
											$_l_Count:=$_l_Count+1
										Until (OK=0) | ($_l_Count=$_l_BKRecordCount)  //20
										CLOSE DOCUMENT:C267($_ti_Document)
										ARRAY TEXT:C222($_at_RecordData; $_l_Element-1)
										ARRAY TEXT:C222(DM_at_FieldData; Size of array:C274($_at_RecordData); Size of array:C274(DM_at_BKDataModel))
										
										For ($_l_Index; 1; Size of array:C274($_at_RecordData))  //22
											$_t_RecordData:=$_at_RecordData{$_l_Index}
											$_l_FieldNumber:=0
											Repeat   //23
												$_l_CharPosition:=Position:C15(Char:C90(9); $_t_RecordData)
												If ($_l_CharPosition>0)  //24
													$_t_FieldData:=Substring:C12($_t_RecordData; 1; $_l_CharPosition-1)
													$_t_RecordData:=Substring:C12($_t_RecordData; $_l_CharPosition+1; Length:C16($_t_RecordData))
													$_l_FieldNumber:=$_l_FieldNumber+1
													DM_at_FieldData{$_l_Index}{$_l_FieldNumber}:=$_t_FieldData
												Else 
													//last field
													$_t_FieldData:=$_t_RecordData
													$_t_RecordData:=""
													$_t_FieldData:=Replace string:C233($_t_FieldData; Char:C90(13); "")
													If ($_t_FieldData#"")  //25
														$_l_FieldNumber:=$_l_FieldNumber+1
														DM_at_FieldData{$_l_Index}{$_l_FieldNumber}:=$_t_FieldData
													End if   //25
													
												End if   //24
											Until ($_t_RecordData="")  //23
											
										End for   //22 `
										//now we have all the data in field blocks
										For ($_l_Index; 1; Size of array:C274(DM_at_FieldData))  //26
											Case of   //27
												: (DM_at_BKDataModel{1}="ITM")
													Case of   //28
														: (Count parameters:C259=1)
															DM_HandleBKITMDATA($1)
														: (Count parameters:C259=2)
															DM_HandleBKITMDATA($1; $2)
														: (Count parameters:C259=3)
															DM_HandleBKITMDATA($1; $2; $3)
														: (Count parameters:C259=4)
															DM_HandleBKITMDATA($1; $2; $3; $4)
													End case   //29
												: (DM_at_BKDataModel{1}="ODR")
													Case of   //30
														: (Count parameters:C259=1)
															$_l_Index:=DM_HandleBKORDDATA($_l_Index; $1)
														: (Count parameters:C259=2)
															$_l_Index:=DM_HandleBKORDDATA($_l_Index; $1; $2)
														: (Count parameters:C259=3)
															$_l_Index:=DM_HandleBKORDDATA($_l_Index; $1; $2; $3)
														: (Count parameters:C259=4)
															$_l_Index:=DM_HandleBKORDDATA($_l_Index; $1; $2; $3; $4)
													End case   //30
												: (DM_at_BKDataModel{1}="CUS")
													Case of   //31
														: (Count parameters:C259=1)
															DM_HandleBKCUSDATA($_l_Index; $1)
														: (Count parameters:C259=2)
															DM_HandleBKCUSDATA($_l_Index; $1; $2)
														: (Count parameters:C259=3)
															DM_HandleBKCUSDATA($_l_Index; $1; $2; $3)
														: (Count parameters:C259=4)
															DM_HandleBKCUSDATA($_l_Index; $1; $2; $3; $4)
													End case   //31
													
													//````
											End case   //27
										End for   //26
										//here update the preferences
										DM_D_BkLastUpdateDate:=$_d_LastUpdateDate
										DM_l_BkLastUpdateTime:=$_ti_LastUpdateTime*1
										If (Count parameters:C259<2)  //32
											READ WRITE:C146([PREFERENCES:116])
											If (Record number:C243([PREFERENCES:116])#$1)  //33
												GOTO RECORD:C242([PREFERENCES:116]; $1)
											End if   //33
											LOAD RECORD:C52([PREFERENCES:116])
											SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
											VARIABLE TO BLOB:C532(DM_l_BkConnectionID; [PREFERENCES:116]DataBlob:2; *)
											VARIABLE TO BLOB:C532(DM_t_BkConnectionName; [PREFERENCES:116]DataBlob:2; *)
											VARIABLE TO BLOB:C532(DM_l_BkserverID; [PREFERENCES:116]DataBlob:2; *)  //²
											VARIABLE TO BLOB:C532(DM_l_BkstoreID; [PREFERENCES:116]DataBlob:2; *)  //²
											If (DM_l_BkTimeOut=0)  //34 `
												DM_l_BkTimeOut:=30  //defaults
											End if   //34
											If (DM_l_BkMaxTime=0)  //35
												DM_l_BkMaxTime:=300  //defaults
											End if   //35
											VARIABLE TO BLOB:C532(DM_l_BkTimeOut; [PREFERENCES:116]DataBlob:2; *)
											VARIABLE TO BLOB:C532(DM_l_BkMaxTime; [PREFERENCES:116]DataBlob:2; *)
											VARIABLE TO BLOB:C532(DM_l_BkFrequency; [PREFERENCES:116]DataBlob:2; *)  //²
											VARIABLE TO BLOB:C532(DM_l_BkRetrieveType; [PREFERENCES:116]DataBlob:2; *)  //²
											VARIABLE TO BLOB:C532(DM_t_BKFileName; [PREFERENCES:116]DataBlob:2; *)  //²
											VARIABLE TO BLOB:C532(DM_l_BKDataModelID; [PREFERENCES:116]DataBlob:2; *)  //²
											VARIABLE TO BLOB:C532(DM_l_BKPostAction; [PREFERENCES:116]DataBlob:2; *)  //²
											VARIABLE TO BLOB:C532(DM_l_BKOptions; [PREFERENCES:116]DataBlob:2; *)  //²
											VARIABLE TO BLOB:C532(DM_CB_BkActive; [PREFERENCES:116]DataBlob:2; *)  //²
											VARIABLE TO BLOB:C532(DM_D_BkLastUpdateDate; [PREFERENCES:116]DataBlob:2; *)  //²
											VARIABLE TO BLOB:C532(DM_l_BkLastUpdateTime; [PREFERENCES:116]DataBlob:2; *)  //²
											VARIABLE TO BLOB:C532(DM_l_BKLastTimeStamp; [PREFERENCES:116]DataBlob:2; *)
											VARIABLE TO BLOB:C532(DM_t_BkFrequencyType; [PREFERENCES:116]DataBlob:2; *)  //²
											VARIABLE TO BLOB:C532(DM_l_RecordCount; [PREFERENCES:116]DataBlob:2; *)  //²
											VARIABLE TO BLOB:C532(DM_l_LastRecord; [PREFERENCES:116]DataBlob:2; *)  //²
											VARIABLE TO BLOB:C532(DM_T_CustomQuery; [PREFERENCES:116]DataBlob:2; *)  //²
											DB_SaveRecord(->[PREFERENCES:116])
											UNLOAD RECORD:C212([PREFERENCES:116])
											READ ONLY:C145([PREFERENCES:116])
											
										End if   //32
										
										
									End if   //19` doc problem
								Else 
									//handle no file error here
									$_l_Error:=3
								End if   //14
							Else 
								//no records actually
								//here update the preferences
								DM_D_BkLastUpdateDate:=Current date:C33(*)
								DM_l_BkLastUpdateTime:=Current time:C178(*)*1
								
								If (Count parameters:C259<2)  //36
									READ WRITE:C146([PREFERENCES:116])
									If (Record number:C243([PREFERENCES:116])#$1)  //37
										GOTO RECORD:C242([PREFERENCES:116]; $1)
									End if   //37
									LOAD RECORD:C52([PREFERENCES:116])
									SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
									VARIABLE TO BLOB:C532(DM_l_BkConnectionID; [PREFERENCES:116]DataBlob:2; *)
									VARIABLE TO BLOB:C532(DM_t_BkConnectionName; [PREFERENCES:116]DataBlob:2; *)
									VARIABLE TO BLOB:C532(DM_l_BkserverID; [PREFERENCES:116]DataBlob:2; *)  //²
									VARIABLE TO BLOB:C532(DM_l_BkstoreID; [PREFERENCES:116]DataBlob:2; *)  //²
									If (DM_l_BkTimeOut=0)  //39`
										DM_l_BkTimeOut:=30  //defaults
									End if   //39
									If (DM_l_BkMaxTime=0)  //40
										DM_l_BkMaxTime:=300  //defaults
									End if   //40
									VARIABLE TO BLOB:C532(DM_l_BkTimeOut; [PREFERENCES:116]DataBlob:2; *)
									VARIABLE TO BLOB:C532(DM_l_BkMaxTime; [PREFERENCES:116]DataBlob:2; *)
									VARIABLE TO BLOB:C532(DM_l_BkFrequency; [PREFERENCES:116]DataBlob:2; *)  //²
									VARIABLE TO BLOB:C532(DM_l_BkRetrieveType; [PREFERENCES:116]DataBlob:2; *)  //²
									VARIABLE TO BLOB:C532(DM_t_BKFileName; [PREFERENCES:116]DataBlob:2; *)  //²
									VARIABLE TO BLOB:C532(DM_l_BKDataModelID; [PREFERENCES:116]DataBlob:2; *)  //²
									VARIABLE TO BLOB:C532(DM_l_BKPostAction; [PREFERENCES:116]DataBlob:2; *)  //²
									VARIABLE TO BLOB:C532(DM_l_BKOptions; [PREFERENCES:116]DataBlob:2; *)  //²
									VARIABLE TO BLOB:C532(DM_CB_BkActive; [PREFERENCES:116]DataBlob:2; *)  //²
									VARIABLE TO BLOB:C532(DM_D_BkLastUpdateDate; [PREFERENCES:116]DataBlob:2; *)  //²
									VARIABLE TO BLOB:C532(DM_l_BkLastUpdateTime; [PREFERENCES:116]DataBlob:2; *)  //²
									VARIABLE TO BLOB:C532(DM_l_BKLastTimeStamp; [PREFERENCES:116]DataBlob:2; *)
									VARIABLE TO BLOB:C532(DM_t_BkFrequencyType; [PREFERENCES:116]DataBlob:2; *)  //²
									VARIABLE TO BLOB:C532(DM_l_RecordCount; [PREFERENCES:116]DataBlob:2; *)  //²
									VARIABLE TO BLOB:C532(DM_l_LastRecord; [PREFERENCES:116]DataBlob:2; *)  //²
									VARIABLE TO BLOB:C532(DM_T_CustomQuery; [PREFERENCES:116]DataBlob:2; *)  //²
									DB_SaveRecord(->[PREFERENCES:116])
									UNLOAD RECORD:C212([PREFERENCES:116])
									READ ONLY:C145([PREFERENCES:116])
									
								End if   //36
							End if   //13a
							
					End case   //13
				End if   //10
				
			End if   //8
			
		End if   //5
		
	End if   //3
End if   //1
ERR_MethodTrackerReturn("DM_GetBKData"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetSetFromServer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 16:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($10)
	//C_UNKNOWN($11)
	//C_UNKNOWN($12)
	//C_UNKNOWN($13)
	//C_UNKNOWN($14)
	//C_UNKNOWN($15)
	//C_UNKNOWN($2)
	//C_UNKNOWN($9)
	//ARRAY DATE(SD_ad_SetDateFrom;0)
	//ARRAY DATE(SD_ad_SetDateTo;0)
	ARRAY LONGINT:C221($_al_FieldNumbers; 0)
	ARRAY LONGINT:C221($_al_PersonIDs; 0)
	ARRAY LONGINT:C221($_al_TableNumbers; 0)
	ARRAY LONGINT:C221($_al_Temp; 0)
	//ARRAY LONGINT(SD_al_IncludeDocs;0)
	//ARRAY LONGINT(SD_al_OtherSearchFields;0;0)
	//ARRAY LONGINT(SD_al_PersonOptions;0)
	//ARRAY LONGINT(SD_al_SearchrelatedTables;0;0)
	//ARRAY LONGINT(SD_al_SetDoneStamp;0)
	//ARRAY LONGINT(SD_al_SetIDs;0)
	//ARRAY LONGINT(SD_al_SetPersonIDs;0;0)
	//ARRAY LONGINT(SD_al_SetPriorityValue;0)
	//ARRAY LONGINT(SD_al_TimeFrom;0)
	//ARRAY LONGINT(SD_al_TimeTo;0)
	ARRAY TEXT:C222($_at_ActionCodes; 0)
	ARRAY TEXT:C222($_at_Conjunctions; 0)
	ARRAY TEXT:C222($_at_FieldConjuction; 0)
	ARRAY TEXT:C222($_at_FieldValues; 0)
	ARRAY TEXT:C222($_at_PriorityCodes; 0)
	ARRAY TEXT:C222($_at_ResultCodes; 0)
	ARRAY TEXT:C222($_at_StatusCodes; 0)
	//ARRAY TEXT(SD_at_othersearchConj;0;0)
	//ARRAY TEXT(SD_at_otherSearchValues;0;0)
	//ARRAY TEXT(SD_at_PreferenceactionCodes;0;0)
	//ARRAY TEXT(SD_at_PreferenceResultCodes;0;0)
	//ARRAY TEXT(SD_at_PreferenceStatusCodes;0;0)
	C_BLOB:C604(SD_Bl_SetLongintBlob)
	C_BOOLEAN:C305($_bo_IncludeClosed; $_bo_IncludeOpen; SD_bo_ServerSetInitialized; SD_bo_ServerSettingsInitialized; SD_bo_SetReady; SD_bo_SetReceived; <>SD_ServerSetServerInitialized; $_bo_IncludeClosed; $_bo_IncludeOpen; SD_bo_ServerSetInitialized; SD_bo_ServerSettingsInitialized)
	C_BOOLEAN:C305(SD_bo_SetReady; SD_bo_SetReceived)
	C_DATE:C307($_d_DateTo; $4; $5; SD_D_CurrentDateFromSetting; SD_D_CurrentDatetoSetting; $_d_DateFrom; $_d_DateTo; $4; $5)
	C_LONGINT:C283(<>SD_l_NextSetID; <>SD_l_SetServerProcess; $_l_BlobSize; $_l_FirstPersonID; $_l_FirstTable; $_l_IncludeDocs; $_l_Index; $_l_Index2; $_l_ItemID; $_l_NEXTsetID; $_l_OK)
	C_LONGINT:C283($_l_OpenClosed; $_l_PersonID; $_l_PersonOptions; $_l_Priority; $_l_PriorityNUM; $_l_Process; $_l_SetID; $_l_SizeofArray; $_l_Type; $8; SD_l_CurrentPersonSetting)
	C_LONGINT:C283(SD_l_CurrentprioritySetting; SD_l_CurrentSetID; SD_l_NextSetID; SD_l_SetServerProcess; <>SD_l_MonitorProcess; <>SD_l_NextSetID; <>SD_l_SetServerProcess; $_l_BlobSize; $_l_FirstPersonID; $_l_FirstTable; $_l_IncludeDocs)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_ItemID; $_l_NEXTsetID; $_l_offset; $_l_OK; $_l_OpenClosed; $_l_PersonID; $_l_PersonOptions; $_l_Priority; $_l_PriorityNUM)
	C_LONGINT:C283($_l_Process; $_l_SetID; $_l_SizeofArray; $_l_Type; $3; $8; SD_l_CurrentSetID; SD_l_SetServerProcess)
	C_POINTER:C301($10; $11; $12; $13; $14; $15; $2; $9; $1)
	C_REAL:C285(SD_S_NextSetID)
	C_TEXT:C284($_t_FirstAction; $_t_FirstPriority; $_t_FirstResult; $_t_FirstStatus; $_t_oldMethodName; $_t_ResultCode; $_t_Status; $_t_ActionCode; $_t_FirstAction; $_t_FirstPriority; $_t_FirstResult)
	C_TEXT:C284($_t_FirstStatus; $_t_oldMethodName; $_t_ResultCode; $_t_Status)
	C_TIME:C306($_ti_TimeTo; $6; $7; $_ti_TimeFrom; $_ti_TimeTo; $6; $7)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetSetFromServer")

While (Semaphore:C143("SD_CheckSets"))
	DelayTicks
End while 
//We can get the diary items for one person
//or for multiple people `
SET BLOB SIZE:C606(SD_Bl_SetLongintBlob; 0)
//The primary search parameters for the diary :are
//1) Diary item owner([diary]person or [DIARY_ITEMOWNERS]PERSONNEL_ID)

//2)Dates
//3)Times
//4)Open closed
//5)action code(s)
//6)Result Codes
//Status
//Subject
//Include documentss
ARRAY LONGINT:C221($_al_PersonIDs; 0)
ARRAY TEXT:C222($_at_ActionCodes; 0)
ARRAY TEXT:C222($_at_ResultCodes; 0)
ARRAY TEXT:C222($_at_StatusCodes; 0)
ARRAY TEXT:C222($_at_PriorityCodes; 0)
ARRAY LONGINT:C221($_al_TableNumbers; 0)
ARRAY LONGINT:C221($_al_FieldNumbers; 0)
ARRAY TEXT:C222($_at_Conjunctions; 0)
ARRAY TEXT:C222($_at_FieldValues; 0)
ARRAY TEXT:C222($_at_FieldConjuction; 0)
//$1=Poib
//$1=
If (Count parameters:C259>=3)
	$_l_Type:=Type:C295($1->)
	
	Case of 
		: ($_l_Type=9)  // longint
			APPEND TO ARRAY:C911($_al_PersonIDs; $1->)
			
		Else 
			For ($_l_Index; 1; Size of array:C274($1->))
				APPEND TO ARRAY:C911($_al_PersonIDs; $1->{$_l_Index})
			End for 
	End case 
	$_l_Type:=Type:C295($2->)
	
	Case of 
		: ($_l_Type=1)
			APPEND TO ARRAY:C911($_at_ActionCodes; $2->)
		Else 
			For ($_l_Index; 1; Size of array:C274($2->))
				APPEND TO ARRAY:C911($_at_ActionCodes; $2->{$_l_Index})
			End for 
	End case 
	$_l_IncludeDocs:=$3
	If (Count parameters:C259>=4)
		$_d_DateFrom:=$4
	Else 
		$_d_DateFrom:=!00-00-00!
	End if 
	If (Count parameters:C259>=5)
		$_d_DateTo:=$5
	Else 
		$_d_DateTo:=!00-00-00!
	End if 
	If (Count parameters:C259>=6)
		$_ti_TimeFrom:=$6
	Else 
		$_ti_TimeFrom:=?00:00:00?
	End if 
	If (Count parameters:C259>=7)
		$_ti_TimeTo:=$7
	Else 
		$_ti_TimeTo:=?00:00:00?
	End if 
	If (Count parameters:C259>=8)
		//1=Open only
		//2=Open and closed
		$_l_OpenClosed:=$8
		//3=closed only
		
		$_bo_IncludeOpen:=($8=1) | ($8=2)
		$_bo_IncludeClosed:=($8=2) | ($8=3)
	Else 
		$_l_OpenClosed:=0
		$_bo_IncludeOpen:=True:C214
		$_bo_IncludeClosed:=True:C214
	End if 
	If (Count parameters:C259>=9)
		$_l_Type:=Type:C295($9->)
		Case of 
			: ($_l_Type=1)  // longint
				APPEND TO ARRAY:C911($_at_ResultCodes; $9->)
				
			Else 
				For ($_l_Index; 1; Size of array:C274($9->))
					APPEND TO ARRAY:C911($_at_ResultCodes; $9->{$_l_Index})
				End for 
		End case 
	Else 
	End if 
	If (Count parameters:C259>=10)  //
		$_l_Type:=Type:C295($10->)
		
		Case of 
			: ($_l_Type=1)  // longint
				APPEND TO ARRAY:C911($_at_StatusCodes; $10->)
				
			Else 
				For ($_l_Index; 1; Size of array:C274($10->))
					APPEND TO ARRAY:C911($_at_StatusCodes; $10->{$_l_Index})
				End for 
		End case 
	Else 
	End if 
	If (Count parameters:C259>=11)  //
		$_l_Type:=Type:C295($11->)
		
		Case of 
			: ($_l_Type=1)  // longint
				APPEND TO ARRAY:C911($_at_PriorityCodes; $11->)
				
			Else 
				For ($_l_Index; 1; Size of array:C274($11->))
					APPEND TO ARRAY:C911($_at_PriorityCodes; $11->{$_l_Index})
				End for 
		End case 
	Else 
	End if 
	If (Count parameters:C259>=15)
		//$10=Pointer to array of table numbers
		//$11=Pointer to array of Field numbers
		//$12=Pointer to array of Field values(as text)
		//$13= pointer to array of conjuctions
		//this allows additional search values to be created looking at any field in the diary table
		COPY ARRAY:C226($12->; $_al_TableNumbers)
		COPY ARRAY:C226($13->; $_al_FieldNumbers)
		COPY ARRAY:C226($14->; $_at_FieldValues)
		COPY ARRAY:C226($15->; $_at_FieldConjuction)
	End if 
	If (Not:C34(SD_bo_ServerSettingsInitialized))  // In single user these are declard in SD_SetsMonitor so this wont reset them
		ARRAY LONGINT:C221(SD_al_SetIDs; 0)  //-`1
		ARRAY LONGINT:C221(SD_al_IncludeDocs; 0)  //- `²1
		ARRAY LONGINT:C221(SD_al_SetPersonIDs; 0; 0)  //- `²1
		ARRAY LONGINT:C221(SD_al_PersonOptions; 0)  //- `²1
		ARRAY DATE:C224(SD_ad_SetDateFrom; 0)  //-  `²1
		ARRAY DATE:C224(SD_ad_SetDateTo; 0)  //- `²1
		ARRAY LONGINT:C221(SD_al_SetDoneStamp; 0)  //--  `²
		ARRAY LONGINT:C221(SD_al_SetPriorityValue; 0)  //- ` ²
		ARRAY LONGINT:C221(SD_al_TimeFrom; 0)  //- `²
		ARRAY LONGINT:C221(SD_al_TimeTo; 0)  //- `²
		ARRAY TEXT:C222(SD_at_PreferenceactionCodes; 0; 0)  //-  `²
		ARRAY TEXT:C222(SD_at_PreferenceResultCodes; 0; 0)  //-  `²  `Note searching by result is pointless unless we are including done items!
		ARRAY TEXT:C222(SD_at_PreferenceStatusCodes; 0; 0)  //-  `²  `
		ARRAY LONGINT:C221(SD_al_SearchrelatedTables; 0; 0)  //²  `Search xdiary relations or actions
		ARRAY LONGINT:C221(SD_al_OtherSearchFields; 0; 0)  //²` field number to search-Note with actions this can be used to find actions with a property
		ARRAY TEXT:C222(SD_at_otherSearchValues; 0; 0)  //RelationsMatchThisone
		ARRAY TEXT:C222(SD_at_othersearchConj; 0; 0)  //RelationsMatchThisone
		SD_bo_ServerSettingsInitialized:=True:C214
		
	End if 
	If (SD_l_CurrentSetID=0)  //DONT KNOW WHAT SET TO GET
		
		$_l_ItemID:=PREF_GetPreferenceID("Diary Search Characteristics")
		READ WRITE:C146([PREFERENCES:116])
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		If (Records in selection:C76([PREFERENCES:116])=0)
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_ItemID
			SAVE RECORD:C53([PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			SAVE RECORD:C53([PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
		End if 
		//Here need to set semaphore so nobody else loads whilst we are checking it
		READ ONLY:C145([PREFERENCES:116])
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		$_l_BlobSize:=BLOB size:C605([PREFERENCES:116]DataBlob:2)
		If ($_l_BlobSize>0)
			$_l_offset:=0
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_SetIDs; $_l_offset)
			If (Size of array:C274(SD_al_SetIDs)>0)  //
				ARRAY LONGINT:C221(SD_al_SetPersonIDs; Size of array:C274(SD_al_SetIDs); 0)
				For ($_l_Index2; 1; Size of array:C274(SD_al_SetIDs))
					If ($_l_BlobSize>$_l_offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_SetPersonIDs{$_l_Index2}; $_l_offset)
					End if 
				End for 
				If ($_l_BlobSize>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_PersonOptions; $_l_offset)
					
					If ($_l_BlobSize>$_l_offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_IncludeDocs; $_l_offset)
						
						If ($_l_BlobSize>$_l_offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_ad_SetDateFrom; $_l_offset)
							
							If ($_l_BlobSize>$_l_offset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_ad_SetDateTo; $_l_offset)
								If ($_l_BlobSize>$_l_offset)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_SetDoneStamp; $_l_offset)
									If ($_l_BlobSize>$_l_offset)
										
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_SetPriorityValue; $_l_offset)
										If ($_l_BlobSize>$_l_offset)
											BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_TimeFrom; $_l_offset)
											If ($_l_BlobSize>$_l_offset)
												BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_TimeTo; $_l_offset)
												If ($_l_BlobSize>$_l_offset)
													
													
													If ($_l_BlobSize>$_l_offset)
														ARRAY TEXT:C222(SD_at_PreferenceactionCodes; Size of array:C274(SD_al_SetIDs); 0)
														For ($_l_Index2; 1; Size of array:C274(SD_al_SetIDs))
															If ($_l_BlobSize>$_l_offset)
																BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_at_PreferenceactionCodes{$_l_Index2}; $_l_offset)
															End if 
														End for 
														
														If ($_l_BlobSize>$_l_offset)
															ARRAY TEXT:C222(SD_at_PreferenceResultCodes; Size of array:C274(SD_al_SetIDs); 0)
															For ($_l_Index2; 1; Size of array:C274(SD_al_SetIDs))
																If ($_l_BlobSize>$_l_offset)
																	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_at_PreferenceResultCodes{$_l_Index2}; $_l_offset)
																End if 
															End for 
															If ($_l_BlobSize>$_l_offset)
																ARRAY TEXT:C222(SD_at_PreferenceStatusCodes; Size of array:C274(SD_al_SetIDs); 0)
																For ($_l_Index2; 1; Size of array:C274(SD_al_SetIDs))
																	If ($_l_BlobSize>$_l_offset)
																		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_at_PreferenceStatusCodes{$_l_Index2}; $_l_offset)
																	End if 
																End for 
																If ($_l_BlobSize>$_l_offset)
																	ARRAY LONGINT:C221(SD_al_SearchrelatedTables; Size of array:C274(SD_al_SetIDs); 0)
																	For ($_l_Index2; 1; Size of array:C274(SD_al_SetIDs))
																		If ($_l_BlobSize>$_l_offset)
																			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_SearchrelatedTables{$_l_Index2}; $_l_offset)
																		End if 
																	End for 
																	
																	If ($_l_BlobSize>$_l_offset)
																		ARRAY LONGINT:C221(SD_al_OtherSearchFields; Size of array:C274(SD_al_SetIDs); 0)
																		For ($_l_Index2; 1; Size of array:C274(SD_al_SetIDs))
																			If ($_l_BlobSize>$_l_offset)
																				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_OtherSearchFields{$_l_Index2}; $_l_offset)
																			End if 
																		End for 
																		If ($_l_BlobSize>$_l_offset)
																			ARRAY TEXT:C222(SD_at_otherSearchValues; Size of array:C274(SD_al_SetIDs); 0)
																			For ($_l_Index2; 1; Size of array:C274(SD_al_SetIDs))
																				If ($_l_BlobSize>$_l_offset)
																					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_at_otherSearchValues{$_l_Index2}; $_l_offset)
																				End if 
																			End for 
																			If ($_l_BlobSize>$_l_offset)
																				ARRAY TEXT:C222(SD_at_othersearchConj; Size of array:C274(SD_al_SetIDs); 0)
																				For ($_l_Index2; 1; Size of array:C274(SD_al_SetIDs))
																					If ($_l_BlobSize>$_l_offset)
																						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_at_othersearchConj{$_l_Index2}; $_l_offset)
																					End if 
																				End for 
																			End if 
																		End if 
																	End if 
																End if 
															End if 
														End if 
													End if 
													
												End if 
											End if 
										End if 
									End if 
									
								End if 
								//CLEAR SEMAPHORE("SD_CheckSets")
							End if 
						End if 
					End if 
				End if 
			End if 
			//The characteristics of each set curenltly managed  are now retreived
		End if 
		$_l_SizeofArray:=0
		For ($_l_Index; 1; Size of array:C274(SD_al_SetPersonIDs))
			$_l_OK:=0
			If (Size of array:C274($_al_PersonIDs)>0)
				$_l_FirstPersonID:=$_al_PersonIDs{1}
				If (Find in array:C230(SD_al_SetPersonIDs{$_l_Index}; $_l_FirstPersonID)>0)
					$_l_OK:=1
					For ($_l_Index2; 1; Size of array:C274(SD_al_SetPersonIDs{$_l_Index}))
						$_l_PersonID:=SD_al_SetPersonIDs{$_l_Index}{$_l_Index2}
						If (Find in array:C230($_al_PersonIDs; $_l_PersonID)<0)
							$_l_OK:=0
							$_l_Index2:=999999999
						End if 
					End for 
				End if 
				
			Else 
				If (Size of array:C274(SD_al_SetPersonIDs{$_l_Index})=0)
					$_l_OK:=1
				Else 
					//
				End if 
			End if 
			If ($_l_OK=1)  //Persons match
				If (SD_ad_SetDateFrom{$_l_Index}#$_d_DateFrom)
					$_l_OK:=0
				End if 
				If ($_l_OK=1)
					If (SD_al_IncludeDocs{$_l_Index}#$_l_IncludeDocs)
						$_l_OK:=0
					End if 
					If ($_l_OK=1)
						If (SD_ad_SetDateTo{$_l_Index}#$_d_DateTo)
							$_l_OK:=0
						End if 
						
						If ($_l_OK=1)
							If (SD_al_TimeFrom{$_l_Index}#($_ti_TimeFrom*1))
								$_l_OK:=0
							End if 
							If ($_l_OK=1)
								If (SD_al_Timeto{$_l_Index}#($_ti_TimeTo*1))
									$_l_OK:=0
								End if 
								If ($_l_OK=1)
									If (SD_al_SetDoneStamp{$_l_Index}#($_l_OpenClosed))
										$_l_OK:=0
									End if 
									If ($_l_OK=1)
										If (SD_al_SetPriorityValue{$_l_Index}#($_l_Priority))
											$_l_OK:=0
										End if 
										If ($_l_OK=1)
											If (SD_al_SetPriorityValue{$_l_Index}#($_l_Priority))
												$_l_OK:=0
											End if 
											//```
											If (Size of array:C274($_at_ActionCodes)>0)
												$_t_FirstAction:=$_at_ActionCodes{1}
												If (Find in array:C230(SD_at_PreferenceactionCodes{$_l_Index}; $_t_FirstAction)>0)
													$_l_OK:=1
													For ($_l_Index2; 1; Size of array:C274(SD_at_PreferenceactionCodes{$_l_Index}))
														$_t_ActionCode:=SD_at_PreferenceactionCodes{$_l_Index}{$_l_Index2}
														If (Find in array:C230($_at_ActionCodes; $_t_ActionCode)<0)
															$_l_OK:=0
															$_l_Index2:=999999999
														End if 
													End for 
												End if 
												
											Else 
												If (Size of array:C274(SD_at_PreferenceactionCodes{$_l_Index})=0)
													$_l_OK:=1
												Else 
													//
												End if 
											End if 
											
											//````
											If ($_l_OK=1)
												//```
												If (Size of array:C274($_at_ResultCodes)>0)
													$_t_FirstResult:=$_at_ResultCodes{1}
													If (Find in array:C230(SD_at_PreferenceResultCodes{$_l_Index}; $_t_FirstResult)>0)
														$_l_OK:=1
														For ($_l_Index2; 1; Size of array:C274(SD_at_PreferenceResultCodes{$_l_Index}))
															$_t_ResultCode:=SD_at_PreferenceResultCodes{$_l_Index}{$_l_Index2}
															If (Find in array:C230($_at_ResultCodes; $_t_ResultCode)<0)
																$_l_OK:=0
																$_l_Index2:=999999999
															End if 
														End for 
													End if 
													
												Else 
													If (Size of array:C274(SD_at_PreferenceResultCodes{$_l_Index})=0)
														$_l_OK:=1
													Else 
														//
													End if 
												End if 
												If ($_l_OK=1)
													
													//````
													If (Size of array:C274($_at_PriorityCodes)>0)
														$_t_FirstPriority:=$_at_PriorityCodes{1}
														If (Find in array:C230(SD_al_SetPriorityValue{$_l_Index}; Num:C11($_t_FirstPriority))>0)
															$_l_OK:=1
															For ($_l_Index2; 1; Size of array:C274(SD_al_SetPriorityValue{$_l_Index}))
																//$_l_PriorityNUM:=SD_al_SetPriorityValue{$_l_Index}{$_l_Index2}
																If (Find in array:C230($_at_PriorityCodes; String:C10($_l_PriorityNUM))<0)
																	$_l_OK:=0
																	$_l_Index2:=999999999
																End if 
															End for 
														End if 
														
													Else 
														//If (Size of array(SD_al_SetPriorityValue{$_l_Index})=0)
														$_l_OK:=1
														//Else
														//
														//End if
													End if 
													//``
													If ($_l_OK=1)
														
														//````
														If (Size of array:C274($_at_StatusCodes)>0)
															$_t_FirstStatus:=$_at_StatusCodes{1}
															If (Find in array:C230(SD_at_PreferenceStatusCodes{$_l_Index}; $_t_FirstStatus)>0)
																$_l_OK:=1
																For ($_l_Index2; 1; Size of array:C274(SD_at_PreferenceStatusCodes{$_l_Index}))
																	$_t_Status:=SD_at_PreferenceStatusCodes{$_l_Index}{$_l_Index2}
																	If (Find in array:C230($_at_StatusCodes; $_t_Status)<0)
																		$_l_OK:=0
																		$_l_Index2:=999999999
																	End if 
																End for 
															End if 
															
														Else 
															If (Size of array:C274(SD_at_PreferenceStatusCodes{$_l_Index})=0)
																$_l_OK:=1
															Else 
																//
															End if 
														End if 
														
														//`
														If ($_l_OK=1)
															If (Size of array:C274($_al_TableNumbers)>0)
																$_l_FirstTable:=$_al_TableNumbers{1}
																If (Find in array:C230(SD_al_SearchrelatedTables{$_l_Index}; $_l_FirstTable)>0)
																	$_l_OK:=1
																	For ($_l_Index2; 1; Size of array:C274(SD_al_SearchrelatedTables{$_l_Index}))
																		If ($_l_Index2<Size of array:C274($_al_TableNumbers))
																			
																			If ($_al_TableNumbers{$_l_Index}#SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}) | ($_al_FieldNumbers{$_l_Index}#SD_al_OtherSearchFields{$_l_Index}{$_l_Index2}) | ($_at_FieldValues{$_l_Index}#SD_at_otherSearchValues{$_l_Index}{$_l_Index2}) | ($_at_FieldConjuction{$_l_Index}#SD_at_othersearchConj{$_l_Index}{$_l_Index2})
																				$_l_OK:=0
																				$_l_Index2:=999999999
																			End if 
																		Else 
																			$_l_OK:=0
																		End if 
																	End for 
																End if 
															Else 
																If (Size of array:C274(SD_al_SearchrelatedTables)=0)
																	$_l_OK:=1
																End if 
																
															End if 
															
															//``
														End if 
													End if 
													
												End if 
												
											End if 
											
										End if 
										
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
				If ($_l_OK=1)
					$_l_SizeofArray:=$_l_Index
					$_l_Index:=Size of array:C274(SD_al_SetPersonIDs)
				End if 
			End if 
		End for 
		If ($_l_SizeofArray>0)
			//we can clear the semaphore here as we will not be updating the record
			CLEAR SEMAPHORE:C144("SD_CHECKSETS")
			//SET EXISTS ASK THE SERVER FOR THE SET
			If (Application type:C494=4D Remote mode:K5:5)
				GET PROCESS VARIABLE:C371(-1; <>SD_l_SetServerProcess; <>SD_l_SetServerProcess)
				<>SD_l_SetServerProcess:=-<>SD_l_SetServerProcess
			End if 
			If (<>SD_l_SetServerProcess=0)
				If (Application type:C494=4D Remote mode:K5:5)
					<>SD_ServerSetServerInitialized:=False:C215
					$_l_Process:=Execute on server:C373("SD_ServerSDsetServer"; 512000; "Diary_Selection Manager"; *)
					Repeat 
						GET PROCESS VARIABLE:C371(-1; <>SD_l_SetServerProcess; <>SD_l_SetServerProcess)
						<>SD_l_SetServerProcess:=-<>SD_l_SetServerProcess
						DELAY PROCESS:C323(Current process:C322; 10)
						
					Until (<>SD_l_SetServerProcess>0)
				Else 
					<>SD_ServerSetServerInitialized:=False:C215
					<>SD_l_SetServerProcess:=New process:C317("SD_ServerSDsetServer"; 512000; "Diary_Selection Manager"; *)
				End if 
			End if 
			Repeat 
				GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; <>SD_ServerSetServerInitialized; SD_bo_ServerSetInitialized)
			Until (SD_bo_ServerSetInitialized)
			$_l_SetID:=SD_al_SetIDs{$_l_SizeofArray}
			SD_bo_SetReady:=False:C215
			While (Semaphore:C143("SD_SetManagerBusy"))
				IDLE:C311
				DELAY PROCESS:C323(Current process:C322; 2)
			End while 
			While (Semaphore:C143("SD_CheckSets"))  //wait if the set manager is busy-note this iss the same semaphore used when updating arrays so hold up may in in set monitor
				IDLE:C311
				DELAY PROCESS:C323(Current process:C322; 2)
			End while 
			CLEAR SEMAPHORE:C144("SD_CheckSets")
			SET PROCESS VARIABLE:C370(<>SD_l_SetServerProcess; SD_bo_SetReady; False:C215)
			SET PROCESS VARIABLE:C370(<>SD_l_SetServerProcess; SD_l_GetSetID; $_l_SetID)
			RESUME PROCESS:C320(<>SD_l_SetServerProcess)
			
			Repeat 
				DELAY PROCESS:C323(Current process:C322; 5)
				GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; SD_bo_SetReady; SD_bo_SetReady)
			Until (SD_bo_SetReady)
			If (False:C215)
				GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; SD_Bl_SetLongintBlob; SD_Bl_SetLongintBlob)
				SD_bo_SetReceived:=True:C214
				SET PROCESS VARIABLE:C370(<>SD_l_SetServerProcess; SD_bo_SetReceived; SD_bo_SetReceived)
				
			End if 
			CLEAR SEMAPHORE:C144("SD_SetManagerBusy")
			QUERY:C277([SF_DiaryView:184]; [SF_DiaryView:184]DiaryView_UUID:1=$_l_SetID)
			
			
		Else 
			//HAVE TO ADD THE SET INTO THE PREF
			SD_S_NextSetID:=0
			If (Application type:C494=4D Remote mode:K5:5)
				
				$_l_NEXTsetID:=AA_GetNextID(->SD_S_NextSetID)
				SET PROCESS VARIABLE:C370(-1; <>SD_l_NextSetID; $_l_NEXTsetID)
			Else 
				$_l_NEXTsetID:=AA_GetNextID(->SD_S_NextSetID)
				
			End if 
			$_l_SizeofArray:=Size of array:C274(SD_al_SetIDs)
			
			
			APPEND TO ARRAY:C911(SD_al_SetIDs; $_l_NEXTsetID)
			APPEND TO ARRAY:C911(SD_al_IncludeDocs; $_l_IncludeDocs)
			INSERT IN ARRAY:C227(SD_al_SetPersonIDs; Size of array:C274(SD_al_SetPersonIDs)+1; 1)
			$_l_BlobSize:=Size of array:C274(SD_al_SetPersonIDs)
			If (Size of array:C274($_al_PersonIDs)>0)
				INSERT IN ARRAY:C227(SD_al_SetPersonIDs{$_l_BlobSize}; 1; Size of array:C274($_al_PersonIDs))  //Note this array is set up for multiple values here
				For ($_l_Index; 1; Size of array:C274($_al_PersonIDs))
					SD_al_SetPersonIDs{$_l_BlobSize}{$_l_Index}:=$_al_PersonIDs{$_l_Index}
				End for 
			End if 
			APPEND TO ARRAY:C911(SD_al_PersonOptions; $_l_PersonOptions)
			
			APPEND TO ARRAY:C911(SD_ad_SetDateFrom; $_d_DateFrom)
			APPEND TO ARRAY:C911(SD_ad_SetDateTo; $_d_DateTo)
			APPEND TO ARRAY:C911(SD_al_SetDoneStamp; $_l_OpenClosed)
			APPEND TO ARRAY:C911(SD_al_SetPriorityValue; $_l_Priority)
			APPEND TO ARRAY:C911(SD_al_TimeFrom; ($_ti_TimeFrom*1))
			APPEND TO ARRAY:C911(SD_al_TimeTo; ($_ti_TimeTo*1))
			INSERT IN ARRAY:C227(SD_at_PreferenceactionCodes; Size of array:C274(SD_at_PreferenceactionCodes)+1; 1)
			$_l_BlobSize:=Size of array:C274(SD_at_PreferenceactionCodes)
			If (Size of array:C274($_at_ActionCodes)>0)
				INSERT IN ARRAY:C227(SD_at_PreferenceactionCodes{$_l_BlobSize}; 1; Size of array:C274($_at_ActionCodes))
				For ($_l_Index2; 1; Size of array:C274($_at_ActionCodes))
					SD_at_PreferenceactionCodes{$_l_BlobSize}{$_l_Index2}:=$_at_ActionCodes{$_l_Index2}
				End for 
			End if 
			INSERT IN ARRAY:C227(SD_at_PreferenceResultCodes; Size of array:C274(SD_at_PreferenceResultCodes)+1; 1)
			$_l_BlobSize:=Size of array:C274(SD_at_PreferenceResultCodes)
			If (Size of array:C274($_at_ResultCodes)>0)
				INSERT IN ARRAY:C227(SD_at_PreferenceResultCodes{$_l_BlobSize}; 1; Size of array:C274($_at_ResultCodes))
				For ($_l_Index2; 1; Size of array:C274($_at_ResultCodes))
					SD_at_PreferenceResultCodes{$_l_BlobSize}{$_l_Index2}:=$_at_ResultCodes{$_l_Index2}
				End for 
			End if 
			INSERT IN ARRAY:C227(SD_at_PreferenceStatusCodes; Size of array:C274(SD_at_PreferenceStatusCodes)+1; 1)
			$_l_BlobSize:=Size of array:C274(SD_at_PreferenceStatusCodes)
			If (Size of array:C274($_at_StatusCodes)>0)
				INSERT IN ARRAY:C227(SD_at_PreferenceStatusCodes{$_l_BlobSize}; 1; Size of array:C274($_at_StatusCodes))
				For ($_l_Index2; 1; Size of array:C274($_at_StatusCodes))
					SD_at_PreferenceStatusCodes{$_l_BlobSize}{$_l_Index2}:=$_at_StatusCodes{$_l_Index2}
				End for 
			End if 
			INSERT IN ARRAY:C227(SD_al_SearchrelatedTables; Size of array:C274(SD_al_SearchrelatedTables)+1; 1)
			INSERT IN ARRAY:C227(SD_al_OtherSearchFields; Size of array:C274(SD_al_OtherSearchFields)+1; 1)
			INSERT IN ARRAY:C227(SD_at_otherSearchValues; Size of array:C274(SD_at_otherSearchValues)+1; 1)
			INSERT IN ARRAY:C227(SD_at_othersearchConj; Size of array:C274(SD_at_othersearchConj)+1; 1)
			
			$_l_BlobSize:=Size of array:C274(SD_al_SearchrelatedTables)
			If (Size of array:C274($_al_TableNumbers)>0)
				INSERT IN ARRAY:C227(SD_al_SearchrelatedTables{$_l_BlobSize}; 1; Size of array:C274($_al_TableNumbers))
				INSERT IN ARRAY:C227(SD_al_OtherSearchFields{$_l_BlobSize}; 1; Size of array:C274($_al_TableNumbers))
				INSERT IN ARRAY:C227(SD_at_otherSearchValues{$_l_BlobSize}; 1; Size of array:C274($_al_TableNumbers))
				INSERT IN ARRAY:C227(SD_at_othersearchConj{$_l_BlobSize}; 1; Size of array:C274($_al_TableNumbers))
				
				For ($_l_Index2; 1; Size of array:C274($_al_TableNumbers))
					SD_al_SearchrelatedTables{$_l_BlobSize}{$_l_Index2}:=$_al_TableNumbers{$_l_Index2}
					SD_al_OtherSearchFields{$_l_BlobSize}{$_l_Index2}:=$_al_FieldNumbers{$_l_Index2}
					SD_at_otherSearchValues{$_l_BlobSize}{$_l_Index2}:=$_at_FieldValues{$_l_Index2}
					SD_at_othersearchConj{$_l_BlobSize}{$_l_Index2}:=$_at_Conjunctions{$_l_Index2}
				End for 
			End if 
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(SD_al_SetIDs; [PREFERENCES:116]DataBlob:2; *)
			For ($_l_Index2; 1; Size of array:C274(SD_al_SetPersonIDs))
				VARIABLE TO BLOB:C532(SD_al_SetPersonIDs{$_l_Index2}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			VARIABLE TO BLOB:C532(SD_al_PersonOptions; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(SD_al_IncludeDocs; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(SD_ad_SetDateFrom; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(SD_ad_SetDateTo; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(SD_al_SetDoneStamp; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(SD_al_SetPriorityValue; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(SD_al_TimeFrom; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(SD_al_TimeTo; [PREFERENCES:116]DataBlob:2; *)
			For ($_l_Index2; 1; Size of array:C274(SD_at_PreferenceactionCodes))
				VARIABLE TO BLOB:C532(SD_at_PreferenceactionCodes{$_l_Index2}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			For ($_l_Index2; 1; Size of array:C274(SD_al_SetIDs))
				VARIABLE TO BLOB:C532(SD_at_PreferenceResultCodes{$_l_Index2}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			For ($_l_Index2; 1; Size of array:C274(SD_al_SetIDs))
				VARIABLE TO BLOB:C532(SD_at_PreferenceStatusCodes{$_l_Index2}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			For ($_l_Index2; 1; Size of array:C274(SD_al_SetIDs))
				VARIABLE TO BLOB:C532(SD_al_SearchrelatedTables{$_l_Index2}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			For ($_l_Index2; 1; Size of array:C274(SD_al_SetIDs))
				VARIABLE TO BLOB:C532(SD_al_OtherSearchFields{$_l_Index2}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			For ($_l_Index2; 1; Size of array:C274(SD_al_SetIDs))
				VARIABLE TO BLOB:C532(SD_at_otherSearchValues{$_l_Index2}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			For ($_l_Index2; 1; Size of array:C274(SD_al_SetIDs))
				VARIABLE TO BLOB:C532(SD_at_othersearchConj{$_l_Index2}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			//NOTE this array is ignored on the server side
			DB_SaveRecord(->[PREFERENCES:116])
			$_l_SizeofArray:=Size of array:C274(SD_al_SetIDs)
			CLEAR SEMAPHORE:C144("SD_CheckSets")
			SD_l_SetServerProcess:=0
			If (Application type:C494=4D Remote mode:K5:5)
				GET PROCESS VARIABLE:C371(-1; <>SD_l_MonitorProcess; SD_l_SetServerProcess)
				SD_l_SetServerProcess:=-SD_l_SetServerProcess
			Else 
				SD_l_SetServerProcess:=<>SD_l_MonitorProcess
			End if 
			If (SD_l_SetServerProcess>0)
				RESUME PROCESS:C320(SD_l_SetServerProcess)
			End if 
			
			//here resume the SD_setsMonitor on the server before we do anything else-that will initialize the new set
			
			
			If (Application type:C494=4D Remote mode:K5:5)
				GET PROCESS VARIABLE:C371(-1; <>SD_l_SetServerProcess; <>SD_l_SetServerProcess)
				<>SD_l_SetServerProcess:=-<>SD_l_SetServerProcess
			End if 
			If (<>SD_l_SetServerProcess=0)
				If (Application type:C494=4D Remote mode:K5:5)
					<>SD_ServerSetServerInitialized:=False:C215
					$_l_Process:=Execute on server:C373("SD_ServerSDsetServer"; 64000; "Diary_Selection Manager"; *)
					Repeat 
						GET PROCESS VARIABLE:C371(-1; <>SD_l_SetServerProcess; <>SD_l_SetServerProcess)
						<>SD_l_SetServerProcess:=-<>SD_l_SetServerProcess
						DELAY PROCESS:C323(Current process:C322; 10)
						
					Until (<>SD_l_SetServerProcess>0)
				Else 
					<>SD_ServerSetServerInitialized:=False:C215
					<>SD_l_SetServerProcess:=New process:C317("SD_ServerSDsetServer"; 64000; "Diary_Selection Manager"; *)
				End if 
			End if 
			Repeat 
				DELAY PROCESS:C323(Current process:C322; 2)
				GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; <>SD_ServerSetServerInitialized; SD_bo_ServerSetInitialized)
			Until (SD_bo_ServerSetInitialized)
			
			$_l_SetID:=SD_al_SetIDs{$_l_SizeofArray}
			SD_bo_SetReady:=False:C215
			GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; SD_bo_SetReady; SD_bo_SetReady)
			
			While (Semaphore:C143("SD_SetManagerBusy"))
				IDLE:C311
				DELAY PROCESS:C323(Current process:C322; 2)
			End while 
			While (Semaphore:C143("SD_CheckSets"))  //wait if the set manager is busy-note this iss the same semaphore used when updating arrays so hold up may in in set monitor
				IDLE:C311
				DELAY PROCESS:C323(Current process:C322; 2)
			End while 
			CLEAR SEMAPHORE:C144("SD_CheckSets")
			
			SET PROCESS VARIABLE:C370(<>SD_l_SetServerProcess; SD_bo_SetReady; False:C215)
			SET PROCESS VARIABLE:C370(<>SD_l_SetServerProcess; SD_l_GetSetID; $_l_SetID)
			RESUME PROCESS:C320(<>SD_l_SetServerProcess)
			Repeat 
				DELAY PROCESS:C323(Current process:C322; 5)
				GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; SD_bo_SetReady; SD_bo_SetReady)
			Until (SD_bo_SetReady)
			GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; SD_Bl_SetLongintBlob; SD_Bl_SetLongintBlob)
			SD_bo_SetReceived:=True:C214
			SET PROCESS VARIABLE:C370(<>SD_l_SetServerProcess; SD_bo_SetReceived; SD_bo_SetReceived)
			CLEAR SEMAPHORE:C144("SD_SetManagerBusy")
		End if 
	Else 
		CLEAR SEMAPHORE:C144("SD_CHECKSETS")
		If (Application type:C494=4D Remote mode:K5:5)
			GET PROCESS VARIABLE:C371(-1; <>SD_l_SetServerProcess; <>SD_l_SetServerProcess)
			<>SD_l_SetServerProcess:=-<>SD_l_SetServerProcess
		End if 
		If (<>SD_l_SetServerProcess=0)
			If (Application type:C494=4D Remote mode:K5:5)
				$_l_Process:=Execute on server:C373("SD_ServerSDsetServer"; 64000; "Diary_Selection Manager"; *)
				Repeat 
					GET PROCESS VARIABLE:C371(-1; <>SD_l_SetServerProcess; <>SD_l_SetServerProcess)
					<>SD_l_SetServerProcess:=-<>SD_l_SetServerProcess
					DELAY PROCESS:C323(Current process:C322; 10)
					
				Until (<>SD_l_SetServerProcess>0)
			Else 
				<>SD_ServerSetServerInitialized:=False:C215
				<>SD_l_SetServerProcess:=New process:C317("SD_ServerSDsetServer"; 64000; "Diary_Selection Manager"; *)
			End if 
		End if 
		Repeat 
			GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; <>SD_ServerSetServerInitialized; SD_bo_ServerSetInitialized)
		Until (SD_bo_ServerSetInitialized)
		
		$_l_SetID:=SD_al_SetIDs{$_l_SizeofArray}
		SD_bo_SetReady:=False:C215
		GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; SD_bo_SetReady; SD_bo_SetReady)
		
		While (Semaphore:C143("SD_SetManagerBusy"))
			IDLE:C311
			DELAY PROCESS:C323(Current process:C322; 2)
		End while 
		While (Semaphore:C143("SD_CheckSets"))  //wait if the set manager is busy-note this iss the same semaphore used when updating arrays so hold up may in in set monitor
			IDLE:C311
			DELAY PROCESS:C323(Current process:C322; 2)
		End while 
		CLEAR SEMAPHORE:C144("SD_CheckSets")
		
		
		SET PROCESS VARIABLE:C370(<>SD_l_SetServerProcess; SD_bo_SetReady; False:C215)
		SET PROCESS VARIABLE:C370(<>SD_l_SetServerProcess; SD_l_GetSetID; $_l_SetID)
		RESUME PROCESS:C320(<>SD_l_SetServerProcess)
		Repeat 
			DELAY PROCESS:C323(Current process:C322; 5)
			GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; SD_bo_SetReady; SD_bo_SetReady)
		Until (SD_bo_SetReady)
		GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; SD_Bl_SetLongintBlob; SD_Bl_SetLongintBlob)
		SD_bo_SetReceived:=True:C214
		SET PROCESS VARIABLE:C370(<>SD_l_SetServerProcess; SD_bo_SetReceived; SD_bo_SetReceived)
		CLEAR SEMAPHORE:C144("SD_SetManagerBusy")
		
		
		
	End if 
	
	CLEAR SEMAPHORE:C144("SD_CHECKSETS")
	If (BLOB size:C605(SD_Bl_SetLongintBlob)>0)
		ARRAY LONGINT:C221($_al_Temp; 0)
		BLOB TO VARIABLE:C533(SD_Bl_SetLongintBlob; $_al_Temp)
		CREATE SELECTION FROM ARRAY:C640([DIARY:12]; $_al_Temp)
		
	End if 
	
End if 
ERR_MethodTrackerReturn("SD2_GetSetFromServer"; $_t_oldMethodName)

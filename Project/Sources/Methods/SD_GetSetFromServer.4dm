//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_GetSetFromServer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2010 21:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(<>SD_abo_FloatingDiary;0)
	//ARRAY DATE(<>SD_ad_SetDateFrom;0)
	//ARRAY DATE(<>SD_ad_SetDateTo;0)
	//ARRAY LONGINT(<>SD_al_MonCombineGrpDiaries;0;0)
	//ARRAY LONGINT(<>SD_al_MonCombinePerDiaries;0;0)
	//ARRAY LONGINT(<>SD_al_MonCombineResDiaries;0;0)
	//ARRAY LONGINT(<>SD_al_SetDoneStamp;0)
	//ARRAY LONGINT(<>SD_al_SetIDs;0)
	//ARRAY LONGINT(<>SD_al_SetPersonIDs;0;0)
	//ARRAY LONGINT(<>SD_al_SetPriorityValue;0)
	//ARRAY LONGINT(<>SD_al_SetRelationsTables;0;0)
	//ARRAY LONGINT(SD_al_CurrentCombGroupIDS;0)
	//ARRAY LONGINT(SD_al_CurrentCombGroupIDS2;0)
	//ARRAY LONGINT(SD_al_CurrentCombPersonIDS;0)
	//ARRAY LONGINT(SD_al_CurrentCombPersonIDS2;0)
	//ARRAY LONGINT(SD_al_CurrentCombResourceIDS;0)
	//ARRAY LONGINT(SD_al_CurrentCombResourceIDS2;0)
	//ARRAY TEXT(<>SD_at_CombinedTextChars;0)
	//ARRAY TEXT(<>SD_at_DiaryActionCode;0)
	//ARRAY TEXT(<>SD_at_SetRelationCodes;0;0)
	C_BOOLEAN:C305(<>SD_bo_ServerSettingsInitialized; $_bo_ToModify; SD_bo_CurrentFloatingDiary; SD_bo_CurrentFloatingDiary2; SD_bo_SetReady; SD_bo_SetReceived)
	C_DATE:C307(SD_D_CurrentDateFromSetting; SD_D_CurrentDateFromSetting2; SD_D_CurrentDateToSetting; SD_D_CurrentDateToSetting2)
	C_LONGINT:C283(<>SD_l_NextSetID; <>SD_l_SetServerProcess; $_l_BlobSize; $_l_Index2; $_l_offset; $_l_ParameterRow; $_l_Process; $_l_SearchID; $_l_SetID; $SD_l_NEXTsetID; SD_l_CurrentDoneStampSetting)
	C_LONGINT:C283(SD_l_CurrentDoneStampSetting2; SD_l_CurrentPersonSetting; SD_l_CurrentPersonSetting2; SD_l_CurrentPrioritySetting; SD_l_CurrentPrioritySetting2; SD_l_CurrentSetID; SD_l_CurrentSetID2)
	C_POINTER:C301($2; $3; $4; $5; $6; $7; $8)
	C_REAL:C285($1; $9)
	C_TEXT:C284($_t_DiarySearchTextParam; $_t_oldMethodName; $_t_pString; $10; SD_t_CurrentDiaryactSetting; SD_t_CurrentDiaryactSetting2; SD_t_CurrentRelationApplCode; SD_t_CurrentRelationApplCode2; SD_t_CurrentRelationBookCode; SD_t_CurrentRelationBookCode2; SD_t_CurrentRelationCallCode)
	C_TEXT:C284(SD_t_CurrentRelationCallCode2; SD_t_CurrentRelationCompCode; SD_t_CurrentRelationCompCode2; SD_t_CurrentRelationContCode; SD_t_CurrentRelationContCode2; SD_t_CurrentRelationDiarCode2; SD_t_CurrentRelationDiaryCode; SD_t_CurrentRelationDocCode; SD_t_CurrentRelationDocCode2; SD_t_CurrentRelationEvntCode2; SD_t_CurrentRelationJobCode)
	C_TEXT:C284(SD_t_CurrentRelationJobCode2; SD_t_CurrentRelationOrdCode2; SD_t_CurrentRelationOrderCode; SD_t_CurrentRelationProdCode; SD_t_CurrentRelationProdCode2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_GetSetFromServer")

//This is a client side method
//it will check the settings to see if the current search parameters on this client exist on the server
//if they do it will set a set ID on the client which is then used to avoid the test until the seach parameters change
While (Semaphore:C143("SD_CheckSets"))
	DelayTicks
End while 
//We need to keep seperate values for schedule and for tasks
//Schedule


ARRAY LONGINT:C221(SD_al_CurrentCombGroupIDS; 0)
ARRAY LONGINT:C221(SD_al_CurrentCombPersonIDS; 0)
ARRAY LONGINT:C221(SD_al_CurrentCombResourceIDS; 0)
//end schedule
//Workflow
ARRAY LONGINT:C221(SD_al_CurrentCombGroupIDS2; 2)
ARRAY LONGINT:C221(SD_al_CurrentCombPersonIDS2; 2)
ARRAY LONGINT:C221(SD_al_CurrentCombResourceIDS2; 2)

//End Workflow
If (Count parameters:C259>=8)
	Case of 
		: ($1=1)  //Shedule)
			$_bo_ToModify:=False:C215
			If (SD_l_CurrentPersonSetting#$2->) | (SD_D_CurrentDateFromSetting#$3->) | (SD_D_CurrentDateToSetting#$4->) | (SD_l_CurrentDoneStampSetting#$5->) | (SD_l_CurrentDoneStampSetting#$6->) | (SD_l_CurrentPrioritySetting#$7->) | (SD_t_CurrentDiaryactSetting#$8->)
				
				$_bo_ToModify:=True:C214
			Else 
				If (Count parameters:C259>=9)
					//Relations into play
					If ($9>0)
						Case of 
							: ($9=2)  //companies(table num)
								$_bo_ToModify:=($10#SD_t_CurrentRelationCompCode) | (SD_t_CurrentRelationApplCode#"") | (SD_t_CurrentRelationContCode#"") | (SD_t_CurrentRelationProdCode#"") | (SD_t_CurrentRelationDocCode#"") | (SD_t_CurrentRelationJobCode#"") | (SD_t_CurrentRelationOrderCode#"") | (SD_t_CurrentRelationBookCode#"") | (SD_t_CurrentRelationCallCode#"") | (SD_t_CurrentRelationDiaryCode#"")
								
								
								
							: ($9=Table:C252(->[CONTACTS:1]))  //
								$_bo_ToModify:=(SD_t_CurrentRelationCompCode#"") | (SD_t_CurrentRelationApplCode#"") | (SD_t_CurrentRelationContCode#$10) | (SD_t_CurrentRelationProdCode#"") | (SD_t_CurrentRelationDocCode#"") | (SD_t_CurrentRelationJobCode#"") | (SD_t_CurrentRelationOrderCode#"") | (SD_t_CurrentRelationBookCode#"") | (SD_t_CurrentRelationCallCode#"") | (SD_t_CurrentRelationDiaryCode#"")
								
							: ($9=Table:C252(->[PRODUCTS:9]))  //product code
								$_bo_ToModify:=(SD_t_CurrentRelationCompCode#"") | (SD_t_CurrentRelationApplCode#"") | (SD_t_CurrentRelationContCode#"") | (SD_t_CurrentRelationProdCode#$10) | (SD_t_CurrentRelationDocCode#"") | (SD_t_CurrentRelationJobCode#"") | (SD_t_CurrentRelationOrderCode#"") | (SD_t_CurrentRelationBookCode#"") | (SD_t_CurrentRelationCallCode#"") | (SD_t_CurrentRelationDiaryCode#"")
								
							: ($9=Table:C252(->[DOCUMENTS:7]))  //document code
								$_bo_ToModify:=(SD_t_CurrentRelationCompCode#"") | (SD_t_CurrentRelationApplCode#"") | (SD_t_CurrentRelationContCode#"") | (SD_t_CurrentRelationProdCode#"") | (SD_t_CurrentRelationDocCode#$10) | (SD_t_CurrentRelationJobCode#"") | (SD_t_CurrentRelationOrderCode#"") | (SD_t_CurrentRelationBookCode#"") | (SD_t_CurrentRelationCallCode#"") | (SD_t_CurrentRelationDiaryCode#"")
								
								
							: ($9=Table:C252(->[JOBS:26]))  //Jobs_Code
								$_bo_ToModify:=(SD_t_CurrentRelationCompCode#"") | (SD_t_CurrentRelationApplCode#"") | (SD_t_CurrentRelationContCode#"") | (SD_t_CurrentRelationProdCode#"") | (SD_t_CurrentRelationDocCode#"") | (SD_t_CurrentRelationJobCode#$10) | (SD_t_CurrentRelationOrderCode#"") | (SD_t_CurrentRelationBookCode#"") | (SD_t_CurrentRelationCallCode#"") | (SD_t_CurrentRelationDiaryCode#"")
								
							: ($9=Table:C252(->[ORDERS:24]))  //Orders_Code
								$_bo_ToModify:=(SD_t_CurrentRelationCompCode#"") | (SD_t_CurrentRelationApplCode#"") | (SD_t_CurrentRelationContCode#"") | (SD_t_CurrentRelationProdCode#"") | (SD_t_CurrentRelationDocCode#"") | (SD_t_CurrentRelationJobCode#"") | (SD_t_CurrentRelationOrderCode#$10) | (SD_t_CurrentRelationBookCode#"") | (SD_t_CurrentRelationCallCode#"") | (SD_t_CurrentRelationDiaryCode#"")
								
								
							: ($9=Table:C252(->[SERVICE_CALLS:20]))  //service calls
								$_bo_ToModify:=(SD_t_CurrentRelationCompCode#"") | (SD_t_CurrentRelationApplCode#"") | (SD_t_CurrentRelationContCode#"") | (SD_t_CurrentRelationProdCode#"") | (SD_t_CurrentRelationDocCode#"") | (SD_t_CurrentRelationJobCode#"") | (SD_t_CurrentRelationOrderCode#"") | (SD_t_CurrentRelationBookCode#"") | (SD_t_CurrentRelationCallCode#$10) | (SD_t_CurrentRelationDiaryCode#"")
								
							: ($9=Table:C252(->[DIARY:12]))  //service calls
								$_bo_ToModify:=(SD_t_CurrentRelationCompCode#"") | (SD_t_CurrentRelationApplCode#"") | (SD_t_CurrentRelationContCode#"") | (SD_t_CurrentRelationProdCode#"") | (SD_t_CurrentRelationDocCode#"") | (SD_t_CurrentRelationJobCode#"") | (SD_t_CurrentRelationOrderCode#"") | (SD_t_CurrentRelationBookCode#"") | (SD_t_CurrentRelationCallCode#"") | (SD_t_CurrentRelationDiaryCode#$10)
								
						End case 
						
						
					End if 
				End if 
				
			End if 
			//and here check the combos have not changed
			If (Not:C34($_bo_ToModify))
			End if   //check the combos
			If ($_bo_ToModify)
				SD_l_CurrentSetID:=0  //because we dont know the set
				SD_l_CurrentPersonSetting:=$2->
				SD_D_CurrentDateFromSetting:=$3->
				SD_D_CurrentDateToSetting:=$4->
				SD_l_CurrentDoneStampSetting:=$5->
				SD_l_CurrentDoneStampSetting:=$6->
				SD_l_CurrentPrioritySetting:=$7->
				SD_t_CurrentDiaryactSetting:=$8->
				SD_t_CurrentRelationCompCodE:=""
				SD_t_CurrentRelationApplCode:=""
				
				SD_t_CurrentRelationContCode:=""
				SD_t_CurrentRelationProdCode:=""
				SD_t_CurrentRelationDocCode:=""
				
				SD_t_CurrentRelationJobCode:=""
				SD_t_CurrentRelationOrderCode:=""
				SD_t_CurrentRelationBookCode:=""
				SD_t_CurrentRelationCallCode:=""
				SD_t_CurrentRelationDiaryCode:=""
				
				
				If (Count parameters:C259>=10)
					//Relations into play
					If ($9>0)
						Case of 
							: ($9=2)  //companies(table num)
								SD_t_CurrentRelationCompCode:=$10
								
							: ($9=Table:C252(->[CONTACTS:1]))  //
								SD_t_CurrentRelationContCode:=$10
							: ($9=Table:C252(->[PRODUCTS:9]))  //product code
								SD_t_CurrentRelationProdCode:=$10
							: ($9=Table:C252(->[DOCUMENTS:7]))  //document code
								SD_t_CurrentRelationDocCode:=$10
							: ($9=Table:C252(->[JOBS:26]))  //Jobs_Code
								SD_t_CurrentRelationJobCode:=$10
							: ($9=Table:C252(->[ORDERS:24]))  //Orders_Code
								SD_t_CurrentRelationOrderCode:=$10
								
							: ($9=Table:C252(->[SERVICE_CALLS:20]))  //service calls
								SD_t_CurrentRelationCallCode:=$10
							: ($9=Table:C252(->[DIARY:12]))  //service calls
								SD_t_CurrentRelationDiaryCode:=$10
								
						End case 
						
						
					End if 
				End if 
				//AND GET THE COMBOS HERE
				$_t_pString:=String:C10(SD_l_CurrentPersonSetting)
				$_t_pString:=(" "*(50-Length:C16($_t_pString)))+$_t_pString
				$_t_DiarySearchTextParam:=$_t_pString
				
				$_t_pString:=String:C10(SD_D_CurrentDateFromSetting)
				$_t_pString:=(" "*(50-Length:C16($_t_pString)))+$_t_pString
				$_t_DiarySearchTextParam:=$_t_DiarySearchTextParam+$_t_pString
				
				$_t_pString:=String:C10(SD_D_CurrentDateToSetting)
				$_t_pString:=(" "*(50-Length:C16($_t_pString)))+$_t_pString
				$_t_DiarySearchTextParam:=$_t_DiarySearchTextParam+$_t_pString
				
				$_t_pString:=String:C10(SD_l_CurrentDoneStampSetting)
				$_t_pString:=(" "*(50-Length:C16($_t_pString)))+$_t_pString
				$_t_DiarySearchTextParam:=$_t_DiarySearchTextParam+$_t_pString
				
				$_t_pString:=String:C10(SD_l_CurrentPrioritySetting)
				$_t_pString:=(" "*(50-Length:C16($_t_pString)))+$_t_pString
				$_t_DiarySearchTextParam:=$_t_DiarySearchTextParam+$_t_pString
				
				
				$_t_pString:=(" "*(50-Length:C16(SD_t_CurrentDiaryactSetting)))+SD_t_CurrentDiaryactSetting
				$_t_DiarySearchTextParam:=$_t_DiarySearchTextParam+$_t_pString
				
				$_t_pString:=(" "*(50-Length:C16(SD_t_CurrentRelationCompCodE)))+SD_t_CurrentRelationCompCodE
				$_t_DiarySearchTextParam:=$_t_DiarySearchTextParam+$_t_pString
				
				$_t_pString:=(" "*(50-Length:C16(SD_t_CurrentRelationApplCode)))+SD_t_CurrentRelationApplCode
				$_t_DiarySearchTextParam:=$_t_DiarySearchTextParam+$_t_pString
				
				
				
				$_t_pString:=(" "*(50-Length:C16(SD_t_CurrentRelationContCode)))+SD_t_CurrentRelationContCode
				$_t_DiarySearchTextParam:=$_t_DiarySearchTextParam+$_t_pString
				
				$_t_pString:=(" "*(50-Length:C16(SD_t_CurrentRelationProdCode)))+SD_t_CurrentRelationProdCode
				$_t_DiarySearchTextParam:=$_t_DiarySearchTextParam+$_t_pString
				
				$_t_pString:=(" "*(50-Length:C16(SD_t_CurrentRelationDocCode)))+SD_t_CurrentRelationDocCode
				$_t_DiarySearchTextParam:=$_t_DiarySearchTextParam+$_t_pString
				
				
				$_t_pString:=(" "*(50-Length:C16(SD_t_CurrentRelationJobCode)))+SD_t_CurrentRelationJobCode
				$_t_DiarySearchTextParam:=$_t_DiarySearchTextParam+$_t_pString
				
				$_t_pString:=(" "*(50-Length:C16(SD_t_CurrentRelationOrderCode)))+SD_t_CurrentRelationOrderCode
				$_t_DiarySearchTextParam:=$_t_DiarySearchTextParam+$_t_pString
				
				$_t_pString:=(" "*(50-Length:C16(SD_t_CurrentRelationBookCode)))+SD_t_CurrentRelationBookCode
				$_t_DiarySearchTextParam:=$_t_DiarySearchTextParam+$_t_pString
				
				$_t_pString:=(" "*(50-Length:C16(SD_t_CurrentRelationCallCode)))+SD_t_CurrentRelationCallCode
				$_t_DiarySearchTextParam:=$_t_DiarySearchTextParam+$_t_pString
				$_t_pString:=(" "*(50-Length:C16(SD_t_CurrentRelationDiaryCode)))+SD_t_CurrentRelationDiaryCode
				$_t_DiarySearchTextParam:=$_t_DiarySearchTextParam+$_t_pString
				//HERE ADD THE COMBOS
				
			End if 
			
		: ($1=2)  //To do list
	End case 
	
	If (Not:C34(<>SD_bo_ServerSettingsInitialized))  // In single user these are declard in SD_SetsMonitor so this wont reset them
		//and on a client this will only declare them once.
		
		ARRAY LONGINT:C221(<>SD_al_SetIDs; 0)
		ARRAY LONGINT:C221(<>SD_al_SetPersonIDs; 0; 0)
		ARRAY DATE:C224(<>SD_ad_SetDateFrom; 0)
		ARRAY DATE:C224(<>SD_ad_SetDateTo; 0)
		ARRAY LONGINT:C221(<>SD_al_SetDoneStamp; 0)
		ARRAY LONGINT:C221(<>SD_al_SetPriorityValue; 0)
		ARRAY LONGINT:C221(<>SD_al_SetRelationsTables; 0; 0)
		ARRAY TEXT:C222(<>SD_at_SetRelationCodes; 0; 0)
		ARRAY LONGINT:C221(<>SD_al_MonCombineGrpDiaries; 0; 0)
		ARRAY LONGINT:C221(<>SD_al_MonCombinePerDiaries; 0; 0)
		ARRAY LONGINT:C221(<>SD_al_MonCombineResDiaries; 0; 0)
		ARRAY TEXT:C222(<>SD_at_DiaryActionCode; 0)
		ARRAY BOOLEAN:C223(<>SD_abo_FloatingDiary; 0)
		ARRAY TEXT:C222(<>SD_at_CombinedTextChars; 0)
		<>SD_bo_ServerSettingsInitialized:=True:C214
	End if 
	If (SD_l_CurrentSetID=0)  //DONT KNOW WHAT SET TO GET
		
		$_l_SearchID:=PREF_GetPreferenceID("Diary Search Characteristics")
		READ WRITE:C146([PREFERENCES:116])
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_SearchID)
		If (Records in selection:C76([PREFERENCES:116])=0)
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_SearchID
			SAVE RECORD:C53([PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_SearchID)
		End if 
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		SAVE RECORD:C53([PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_SearchID)
		$_l_BlobSize:=BLOB size:C605([PREFERENCES:116]DataBlob:2)
		If ($_l_BlobSize>0)
			$_l_offset:=0
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>SD_al_SetIDs; $_l_offset)
			If (Size of array:C274(<>SD_al_SetIDs)>0)  //
				ARRAY LONGINT:C221(<>SD_al_SetPersonIDs; Size of array:C274(<>SD_al_SetIDs); 0)
				For ($_l_Index2; 1; Size of array:C274(<>SD_al_SetIDs))
					If ($_l_BlobSize>$_l_offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>SD_al_SetPersonIDs{$_l_Index2}; $_l_offset)
					End if 
				End for 
				If ($_l_BlobSize>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>SD_ad_SetDateFrom; $_l_offset)
					If ($_l_BlobSize>$_l_offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>SD_ad_SetDateTo; $_l_offset)
						If ($_l_BlobSize>$_l_offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>SD_al_SetDoneStamp; $_l_offset)
							If ($_l_BlobSize>$_l_offset)
								
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>SD_al_SetPriorityValue; $_l_offset)
								If ($_l_BlobSize>$_l_offset)
									
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>SD_at_DiaryActionCode; $_l_offset)
									If ($_l_BlobSize>$_l_offset)
										ARRAY LONGINT:C221(<>SD_al_SetRelationsTables; Size of array:C274(<>SD_al_SetIDs); 0)
										For ($_l_Index2; 1; Size of array:C274(<>SD_al_SetIDs))
											If ($_l_BlobSize>$_l_offset)
												BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>SD_al_SetRelationsTables{$_l_Index2}; $_l_offset)
											End if 
										End for 
										
										If ($_l_BlobSize>$_l_offset)
											ARRAY TEXT:C222(<>SD_at_SetRelationCodes; Size of array:C274(<>SD_al_SetIDs); 0)
											For ($_l_Index2; 1; Size of array:C274(<>SD_al_SetIDs))
												If ($_l_BlobSize>$_l_offset)
													BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>SD_at_SetRelationCodes{$_l_Index2}; $_l_offset)
												End if 
											End for 
											If ($_l_BlobSize>$_l_offset)
												ARRAY LONGINT:C221(<>SD_al_MonCombineGrpDiaries; Size of array:C274(<>SD_al_SetIDs); 0)
												For ($_l_Index2; 1; Size of array:C274(<>SD_al_SetIDs))
													If ($_l_BlobSize>$_l_offset)
														BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>SD_al_MonCombineGrpDiaries{$_l_Index2}; $_l_offset)
													End if 
												End for 
												
												If ($_l_BlobSize>$_l_offset)
													ARRAY LONGINT:C221(<>SD_al_MonCombinePerDiaries; Size of array:C274(<>SD_al_SetIDs); 0)
													For ($_l_Index2; 1; Size of array:C274(<>SD_al_SetIDs))
														If ($_l_BlobSize>$_l_offset)
															BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>SD_al_MonCombinePerDiaries{$_l_Index2}; $_l_offset)
														End if 
													End for 
													If ($_l_BlobSize>$_l_offset)
														ARRAY LONGINT:C221(<>SD_al_MonCombineResDiaries; Size of array:C274(<>SD_al_SetIDs); 0)
														For ($_l_Index2; 1; Size of array:C274(<>SD_al_SetIDs))
															If ($_l_BlobSize>$_l_offset)
																BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>SD_al_MonCombineResDiaries{$_l_Index2}; $_l_offset)
															End if 
														End for 
														If ($_l_BlobSize>$_l_offset)
															
															BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>SD_abo_FloatingDiary; $_l_offset)
															If ($_l_BlobSize>$_l_offset)
																//NOTE this array is ignored on the server side
																BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>SD_at_CombinedTextChars; $_l_offset)
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
						CLEAR SEMAPHORE:C144("SD_CheckSets")
					End if 
				End if 
			End if 
			//The characteristics of each set are now retreived
		End if 
		$_l_ParameterRow:=Find in array:C230(<>SD_at_CombinedTextChars; $_t_DiarySearchTextParam)
		If ($_l_ParameterRow>0)
			//SET EXISTS ASK THE SERVER FOR THE SET
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
						DelayTicks(10)
						
					Until (<>SD_l_SetServerProcess>0)
				Else 
					<>SD_l_SetServerProcess:=New process:C317("SD_ServerSDsetServer"; 64000; "Diary_Selection Manager"; *)
				End if 
			End if 
			
			CLEAR SEMAPHORE:C144("SD_CHECKSETS")
			$_l_SetID:=<>SD_al_SetIDs{$_l_ParameterRow}
			SD_bo_SetReady:=False:C215
			GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; SD_bo_SetReady; SD_bo_SetReady)
			SET PROCESS VARIABLE:C370(<>SD_l_SetServerProcess; <>SD_al_SetIDs; $_l_SetID)
			Repeat 
				DelayTicks(2)
				GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; SD_bo_SetReady; SD_bo_SetReady)
			Until (SD_bo_SetReady)
			GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; SD_Bl_SetLongintBlob; SD_Bl_SetLongintBlob)
			SD_bo_SetReceived:=True:C214
			SET PROCESS VARIABLE:C370(<>SD_l_SetServerProcess; SD_bo_SetReceived; SD_bo_SetReceived)
			
			
			
		Else 
			//HAVE TO ADD THE SET INTO THE PREF
			If (Application type:C494=4D Remote mode:K5:5)
				GET PROCESS VARIABLE:C371(-1; <>SD_l_NextSetID; $SD_l_NEXTsetID)
				SET PROCESS VARIABLE:C370(-1; <>SD_l_NextSetID; (<>SD_l_NextSetID+1))
			Else 
				$SD_l_NEXTsetID:=<>SD_l_NextSetID
				<>SD_l_NextSetID:=<>SD_l_NextSetID+1
			End if 
			While (Semaphore:C143("Inserting"+"◊SD_al_SetIDs"))
				DelayTicks
			End while 
			$_l_ParameterRow:=Size of array:C274(<>SD_al_SetIDs)
			INSERT IN ARRAY:C227(<>SD_al_SetIDs; Size of array:C274(<>SD_al_SetIDs)+1; 1)
			<>SD_al_SetIDs{Size of array:C274(<>SD_al_SetIDs)}:=$SD_l_NEXTsetID
			
			INSERT IN ARRAY:C227(<>SD_al_SetPersonIDs; Size of array:C274(<>SD_al_SetPersonIDs)+1; 1)
			INSERT IN ARRAY:C227(<>SD_al_SetPersonIDs{Size of array:C274(<>SD_al_SetPersonIDs)}; 1; 1)  //Note this array is set up for multiple values here
			<>SD_al_SetPersonIDs{Size of array:C274(<>SD_al_SetPersonIDs)}{1}:=SD_l_CurrentPersonSetting
			
			INSERT IN ARRAY:C227(<>SD_ad_SetDateFrom; Size of array:C274(<>SD_ad_SetDateFrom)+1; 1)
			<>SD_ad_SetDateFrom{Size of array:C274(<>SD_ad_SetDateFrom)}:=SD_D_CurrentDateFromSetting
			
			INSERT IN ARRAY:C227(<>SD_ad_SetDateTo; Size of array:C274(<>SD_al_SetIDs)+1; 1)
			<>SD_ad_SetDateTo{Size of array:C274(<>SD_ad_SetDateTo)}:=SD_D_CurrentDateToSetting
			
			INSERT IN ARRAY:C227(<>SD_al_SetDoneStamp; Size of array:C274(<>SD_al_SetDoneStamp)+1; 1)
			<>SD_al_SetDoneStamp{Size of array:C274(<>SD_al_SetDoneStamp)}:=SD_l_CurrentDoneStampSetting
			
			INSERT IN ARRAY:C227(<>SD_al_SetPriorityValue; Size of array:C274(<>SD_al_SetPriorityValue)+1; 1)
			<>SD_al_SetPriorityValue{Size of array:C274(<>SD_al_SetPriorityValue)}:=SD_l_CurrentPrioritySetting
			
			INSERT IN ARRAY:C227(<>SD_at_DiaryActionCode; Size of array:C274(<>SD_at_DiaryActionCode)+1; 1)
			<>SD_at_DiaryActionCode{Size of array:C274(<>SD_at_DiaryActionCode)}:=SD_t_CurrentDiaryactSetting
			
			
			INSERT IN ARRAY:C227(<>SD_al_SetRelationsTables; Size of array:C274(<>SD_al_SetRelationsTables)+1; 1)
			INSERT IN ARRAY:C227(<>SD_at_SetRelationCodes; Size of array:C274(<>SD_al_SetRelationsTables)+1; 1)
			//``
			If (SD_t_CurrentRelationCompCode#"")
				INSERT IN ARRAY:C227(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)}; Size of array:C274(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)})+1; 1)
				<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)}{Size of array:C274(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)})}:=Table:C252(->[COMPANIES:2])
				INSERT IN ARRAY:C227(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)}; Size of array:C274(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)})+1; 1)
				<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)}{Size of array:C274(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)})}:=SD_t_CurrentRelationCompCode
			End if 
			
			
			If (SD_t_CurrentRelationContCode#"")
				INSERT IN ARRAY:C227(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)}; Size of array:C274(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)})+1; 1)
				<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)}{Size of array:C274(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)})}:=Table:C252(->[CONTACTS:1])
				INSERT IN ARRAY:C227(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)}; Size of array:C274(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)})+1; 1)
				<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)}{Size of array:C274(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)})}:=SD_t_CurrentRelationContCode
			End if 
			If (SD_t_CurrentRelationProdCode#"")
				INSERT IN ARRAY:C227(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)}; Size of array:C274(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)})+1; 1)
				<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)}{Size of array:C274(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)})}:=Table:C252(->[PRODUCTS:9])
				INSERT IN ARRAY:C227(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)}; Size of array:C274(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)})+1; 1)
				<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)}{Size of array:C274(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)})}:=SD_t_CurrentRelationProdCode
			End if 
			If (SD_t_CurrentRelationDocCode#"")
				INSERT IN ARRAY:C227(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)}; Size of array:C274(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)})+1; 1)
				<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)}{Size of array:C274(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)})}:=Table:C252(->[DOCUMENTS:7])
				INSERT IN ARRAY:C227(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)}; Size of array:C274(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)})+1; 1)
				<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)}{Size of array:C274(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)})}:=SD_t_CurrentRelationDocCode
			End if 
			
			If (SD_t_CurrentRelationJobCode#"")
				INSERT IN ARRAY:C227(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)}; Size of array:C274(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)})+1; 1)
				<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)}{Size of array:C274(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)})}:=Table:C252(->[JOBS:26])
				INSERT IN ARRAY:C227(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)}; Size of array:C274(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)})+1; 1)
				<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)}{Size of array:C274(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)})}:=SD_t_CurrentRelationJobCode
			End if 
			If (SD_t_CurrentRelationOrderCode#"")
				INSERT IN ARRAY:C227(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)}; Size of array:C274(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)})+1; 1)
				<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)}{Size of array:C274(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)})}:=Table:C252(->[ORDERS:24])
				INSERT IN ARRAY:C227(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)}; Size of array:C274(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)})+1; 1)
				<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)}{Size of array:C274(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)})}:=SD_t_CurrentRelationOrderCode
			End if 
			
			If (SD_t_CurrentRelationCallCode#"")
				INSERT IN ARRAY:C227(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)}; Size of array:C274(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)})+1; 1)
				<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)}{Size of array:C274(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)})}:=Table:C252(->[SERVICE_CALLS:20])
				INSERT IN ARRAY:C227(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)}; Size of array:C274(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)})+1; 1)
				<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)}{Size of array:C274(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)})}:=SD_t_CurrentRelationCallCode
				
			End if 
			If (SD_t_CurrentRelationDiaryCode#"")
				INSERT IN ARRAY:C227(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)}; Size of array:C274(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)})+1; 1)
				<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)}{Size of array:C274(<>SD_al_SetRelationsTables{Size of array:C274(<>SD_al_SetRelationsTables)})}:=Table:C252(->[DIARY:12])
				INSERT IN ARRAY:C227(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)}; Size of array:C274(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)})+1; 1)
				<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)}{Size of array:C274(<>SD_at_SetRelationCodes{Size of array:C274(<>SD_at_SetRelationCodes)})}:=SD_t_CurrentRelationDiaryCode
				
			End if 
			
			//````
			
			INSERT IN ARRAY:C227(<>SD_al_MonCombineGrpDiaries; Size of array:C274(<>SD_al_MonCombineGrpDiaries)+1; 1)
			INSERT IN ARRAY:C227(<>SD_al_MonCombinePerDiaries; Size of array:C274(<>SD_al_MonCombinePerDiaries)+1; 1)
			INSERT IN ARRAY:C227(<>SD_al_MonCombineResDiaries; Size of array:C274(<>SD_al_MonCombineResDiaries)+1; 1)
			INSERT IN ARRAY:C227(<>SD_abo_FloatingDiary; Size of array:C274(<>SD_al_SetIDs)+1; 1)
			INSERT IN ARRAY:C227(<>SD_at_CombinedTextChars; Size of array:C274(<>SD_at_CombinedTextChars)+1; 1)
			<>SD_at_CombinedTextChars{Size of array:C274($_t_DiarySearchTextParam)}:=$_t_DiarySearchTextParam
			CLEAR SEMAPHORE:C144("Inserting"+"◊SD_al_SetIDs")
			While (Semaphore:C143("SD_CheckSets"))
				DelayTicks(2)
			End while 
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_SearchID)
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(<>SD_al_SetIDs; [PREFERENCES:116]DataBlob:2; *)
			For ($_l_Index2; 1; Size of array:C274(<>SD_al_SetIDs))
				VARIABLE TO BLOB:C532(<>SD_al_SetPersonIDs{$_l_Index2}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			VARIABLE TO BLOB:C532(<>SD_ad_SetDateFrom; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(<>SD_ad_SetDateTo; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(<>SD_al_SetDoneStamp; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(<>SD_al_SetPriorityValue; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(<>SD_at_DiaryActionCode; [PREFERENCES:116]DataBlob:2; *)
			For ($_l_Index2; 1; Size of array:C274(<>SD_al_SetIDs))
				VARIABLE TO BLOB:C532(<>SD_al_SetRelationsTables{$_l_Index2}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			For ($_l_Index2; 1; Size of array:C274(<>SD_al_SetIDs))
				VARIABLE TO BLOB:C532(<>SD_at_SetRelationCodes{$_l_Index2}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			For ($_l_Index2; 1; Size of array:C274(<>SD_al_SetIDs))
				VARIABLE TO BLOB:C532(<>SD_al_MonCombineGrpDiaries{$_l_Index2}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			For ($_l_Index2; 1; Size of array:C274(<>SD_al_SetIDs))
				VARIABLE TO BLOB:C532(<>SD_al_MonCombinePerDiaries{$_l_Index2}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			For ($_l_Index2; 1; Size of array:C274(<>SD_al_SetIDs))
				VARIABLE TO BLOB:C532(<>SD_al_MonCombineResDiaries{$_l_Index2}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			VARIABLE TO BLOB:C532(<>SD_abo_FloatingDiary; [PREFERENCES:116]DataBlob:2; *)
			//NOTE this array is ignored on the server side
			VARIABLE TO BLOB:C532(<>SD_at_CombinedTextChars; [PREFERENCES:116]DataBlob:2; *)
			
		End if 
		CLEAR SEMAPHORE:C144("SD_CheckSets")
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
					DelayTicks(10)
					
				Until (<>SD_l_SetServerProcess>0)
			Else 
				<>SD_l_SetServerProcess:=New process:C317("SD_ServerSDsetServer"; 64000; "Diary_Selection Manager"; *)
			End if 
		End if 
		
		CLEAR SEMAPHORE:C144("SD_CHECKSETS")
		$_l_SetID:=<>SD_al_SetIDs{$_l_ParameterRow}
		SD_bo_SetReady:=False:C215
		GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; SD_bo_SetReady; SD_bo_SetReady)
		SET PROCESS VARIABLE:C370(<>SD_l_SetServerProcess; <>SD_al_SetIDs; $_l_SetID)
		Repeat 
			DelayTicks(5)
			GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; SD_bo_SetReady; SD_bo_SetReady)
		Until (SD_bo_SetReady)
		GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; SD_Bl_SetLongintBlob; SD_Bl_SetLongintBlob)
		SD_bo_SetReceived:=True:C214
		SET PROCESS VARIABLE:C370(<>SD_l_SetServerProcess; SD_bo_SetReceived; SD_bo_SetReceived)
		
		
	Else 
		//ASK THE SERVER FOR THE SET
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
					DelayTicks(10)
					
				Until (<>SD_l_SetServerProcess>0)
			Else 
				<>SD_l_SetServerProcess:=New process:C317("SD_ServerSDsetServer"; 64000; "Diary_Selection Manager"; *)
			End if 
		End if 
		
		CLEAR SEMAPHORE:C144("SD_CHECKSETS")
		$_l_SetID:=SD_l_CurrentSetID
		SD_bo_SetReady:=False:C215
		GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; SD_bo_SetReady; SD_bo_SetReady)
		SET PROCESS VARIABLE:C370(<>SD_l_SetServerProcess; <>SD_al_SetIDs; $_l_SetID)
		Repeat 
			DelayTicks(5)
			GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; SD_bo_SetReady; SD_bo_SetReady)
		Until (SD_bo_SetReady)
		GET PROCESS VARIABLE:C371(<>SD_l_SetServerProcess; SD_Bl_SetLongintBlob; SD_Bl_SetLongintBlob)
		SD_bo_SetReceived:=True:C214
		SET PROCESS VARIABLE:C370(<>SD_l_SetServerProcess; SD_bo_SetReceived; SD_bo_SetReceived)
		
	End if 
End if 
CLEAR SEMAPHORE:C144("SD_CHECKSETS")
ERR_MethodTrackerReturn("SD_GetSetFromServer"; $_t_oldMethodName)

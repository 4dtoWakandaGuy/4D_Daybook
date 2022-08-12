//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DiaryOnEdit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/03/2010 14:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(diaryDetails)
	//C_UNKNOWN(DiaryDetailsTXT)
	//ARRAY TEXT(SD2_at_DurationNames;0)
	//ARRAY TEXT(SD2_at_PlanResultTab;0)
	C_BLOB:C604($_blb_Temp)
	C_BOOLEAN:C305($_bo_UpdateResultBLob; SD2_bo_RecordModified; SD2_bo_ShowDetailsASWP; $_bo_UpdateActionBLob; $_bo_UpdateResultBLob; SD2_bo_RecordModified; SD2_bo_ShowDetailsASWP)
	C_LONGINT:C283($_l_DataType; $_l_FieldNumber; $_l_TableNumber; $_l_TempArea; diaryDetails; SD_l_CurrentTab; SD2_l_DiaryDuration; SD2_l_FieldLevelMacros; SD2_l_IgnoreStdMacros; $_l_Count; $_l_DataType)
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber; $_l_TempArea; SD_l_CurrentTab; SD2_l_DiaryDuration; SD2_l_FieldLevelMacros; SD2_l_IgnoreStdMacros)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; DiaryDetailsTXT; SD2_t_DocumentDisplayCode; $_t_ActionDetails; $_t_oldMethodName; $_t_VariableName; SD2_t_DocumentDisplayCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryOnEdit")

If (Count parameters:C259>=1)
	$_l_DataType:=Type:C295($1->)
	If (Not:C34((Is a variable:C294($1))))
		
		
		Case of 
			: (Modified:C32($1->))
				SD2_DiaryinLPX($1; (SD2_l_FieldLevelMacros=1); (SD2_l_IgnoreStdMacros=1))
				
				SD2_bo_RecordModified:=True:C214
		End case 
	Else 
		//Modified data is a varaible-note that clicking a button does not  cause a data modified event-so calendar buttons must call the LPX themselves
		RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		
		Case of 
			: ($_t_VariableName="SD2_l_DiaryDuration")  //duration was modified this will have changed the start and edn times
				If (SD2_l_DiaryDuration>0)
					SD2_SetDiaryTimeFromDuration(SD2_at_DurationNames; ->SD2_l_DiaryDuration)
					If (Modified:C32([DIARY:12]Display_Date_From:51))
						SD2_DiaryinLPX(->[DIARY:12]Display_Date_From:51; (SD2_l_FieldLevelMacros=1); (SD2_l_IgnoreStdMacros=1))
					End if 
					If (Modified:C32([DIARY:12]Display_Date_To:52))
						SD2_DiaryinLPX(->[DIARY:12]Display_Date_To:52; (SD2_l_FieldLevelMacros=1); (SD2_l_IgnoreStdMacros=1))
					End if 
					If (Modified:C32([DIARY:12]Display_Time_From:53))
						SD2_DiaryinLPX(->[DIARY:12]Display_Time_From:53; (SD2_l_FieldLevelMacros=1); (SD2_l_IgnoreStdMacros=1))
					End if 
					If (Modified:C32([DIARY:12]Display_Time_To:54))
						SD2_DiaryinLPX(->[DIARY:12]Display_Time_To:54; (SD2_l_FieldLevelMacros=1); (SD2_l_IgnoreStdMacros=1))
					End if 
				End if 
			: ($_t_VariableName="SD2_l_DiaryReminder")
				SD2_SetAlarmInterface
			: ($_t_VariableName="DiaryDetails") | ($_t_VariableName="DiaryDetailsTXT")
				$_bo_UpdateActionBLob:=False:C215
				$_bo_UpdateResultBLob:=False:C215
				If (SD_l_CurrentTab#0)
					$_bo_UpdateActionBLob:=(SD_l_CurrentTab=1)
					$_bo_UpdateResultBLob:=(SD_l_CurrentTab=2)
				End if 
				If (SD2_bo_ShowDetailsASWP)  //we display this using a 4D write area
					If ($_bo_UpdateActionBLob)
						//Put the current copy of the document into the blob
						[DIARY:12]x_Action_Description_Blob:72:=WR Area to blob:P12000:140(diaryDetails; 1)
						//and extract the text to the Action desc
						$_l_Count:=WR Count:P12000:143(diaryDetails; 0)
						If ($_l_Count>0)
							$_t_ActionDetails:=[DIARY:12]Action_Details:10
							[DIARY:12]Action_Details:10:=WR Get text:P12000:20(diaryDetails; 0; $_l_Count)
							If ($_t_ActionDetails#[DIARY:12]Action_Details:10)
								SD2_DiaryinLPX(->[DIARY:12]Action_Details:10; (SD2_l_FieldLevelMacros=1); (SD2_l_IgnoreStdMacros=1))
							End if 
						Else 
							$_t_ActionDetails:=[DIARY:12]Action_Details:10
							[DIARY:12]Action_Details:10:=""
							If ($_t_ActionDetails#[DIARY:12]Action_Details:10)
								SD2_DiaryinLPX(->[DIARY:12]Action_Details:10; (SD2_l_FieldLevelMacros=1); (SD2_l_IgnoreStdMacros=1))
							End if 
						End if 
					Else 
						If ($_bo_UpdateResultBLob)
							[DIARY:12]x_Result_Description_Blob:73:=WR Area to blob:P12000:140(diaryDetails; 1)
							//and extract the text to the result desc
							$_l_Count:=WR Count:P12000:143(diaryDetails; 0)
							If ($_l_Count>0)
								$_t_ActionDetails:=[DIARY:12]Result_Description:12
								[DIARY:12]Result_Description:12:=WR Get text:P12000:20(diaryDetails; 0; $_l_Count)
								If ($_t_ActionDetails#[DIARY:12]Result_Description:12)
									SD2_DiaryinLPX(->[DIARY:12]Result_Description:12; (SD2_l_FieldLevelMacros=1); (SD2_l_IgnoreStdMacros=1))
								End if 
							Else 
								$_t_ActionDetails:=[DIARY:12]Result_Description:12
								[DIARY:12]Result_Description:12:=""
								If ($_t_ActionDetails#[DIARY:12]Result_Description:12)
									SD2_DiaryinLPX(->[DIARY:12]Result_Description:12; (SD2_l_FieldLevelMacros=1); (SD2_l_IgnoreStdMacros=1))
								End if 
								
							End if 
						End if 
					End if 
					//here clear the area
					$_l_TempArea:=WR New offscreen area:P12000:47  //wr new offscreen area
					SET BLOB SIZE:C606($_blb_Temp; 0)
					$_blb_Temp:=WR Area to blob:P12000:140($_l_TempArea; 1)
					WR DELETE OFFSCREEN AREA:P12000:38($_l_TempArea)
					WR BLOB TO AREA:P12000:142(diarydetails; $_blb_Temp)
					SET BLOB SIZE:C606($_blb_Temp; 0)
					//````
					OBJECT SET VISIBLE:C603(DiaryDetailsTXT; False:C215)
					OBJECT SET VISIBLE:C603(DiaryDetails; True:C214)
					If (SD2_t_DocumentDisplayCode#"")
						//Load the template
						If (SD2_at_PlanResultTab=2)  // load result
							If (BLOB size:C605([DIARY:12]x_Result_Description_Blob:73)=0)  //The result template is not loaded
								QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=SD2_t_DocumentDisplayCode)
								WR PICTURE TO AREA:P12000:141(DiaryDetails; [DOCUMENTS:7]Write_:5)
							Else 
								//the result template is known
								WR BLOB TO AREA:P12000:142(diarydetails; [DIARY:12]x_Result_Description_Blob:73)
							End if 
						Else   //load action plan
							If (BLOB size:C605([DIARY:12]x_Action_Description_Blob:72)=0)
								QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=SD2_t_DocumentDisplayCode)
								WR PICTURE TO AREA:P12000:141(DiaryDetails; [DOCUMENTS:7]Write_:5)
								
							Else 
								//the result template is known
								WR BLOB TO AREA:P12000:142(diarydetails; [DIARY:12]x_Result_Description_Blob:73)
							End if 
							
						End if 
						//The template SHOULD have its own code for loading the action or result description to -This should call SD2_LoadDescription-which loads the action or result text to the area
					Else 
						//no template-insert some default stuff here-it will show the possibilities
						If (SD2_at_PlanResultTab=2)  // load result
							If (BLOB size:C605([DIARY:12]x_Result_Description_Blob:73)=0)
								WR INSERT TEXT:P12000:19(diaryDetails; "Date & Time"+Char:C90(9))
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Display_Date_From:51); ""; 4)
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Display_Time_From:53); ""; 2)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Company")
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Company_Code:1))
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT EXPRESSION:P12000:24(diarydetails; SD2_FLookupCompany)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Contact")
								WR INSERT TEXT:P12000:19(diarydetails; [DIARY:12]Contact_Code:2)
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT EXPRESSION:P12000:24(diarydetails; SD2_FLookupContact)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Details: "+Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; [DIARY:12]Result_Description:12)
							Else 
								//the result template is known
								WR BLOB TO AREA:P12000:142(diarydetails; [DIARY:12]x_Result_Description_Blob:73)
							End if 
							
						Else 
							If (BLOB size:C605([DIARY:12]x_Action_Description_Blob:72)=0)
								WR INSERT TEXT:P12000:19(diaryDetails; "Date & Time"+Char:C90(9))
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Display_Date_From:51); ""; 4)
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Display_Time_From:53); ""; 2)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Company")
								WR INSERT FIELD:P12000:22(diarydetails; Table:C252(->[DIARY:12]); Field:C253(->[DIARY:12]Company_Code:1))
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT EXPRESSION:P12000:24(diarydetails; SD2_FLookupCompany)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Contact")
								WR INSERT TEXT:P12000:19(diarydetails; [DIARY:12]Contact_Code:2)
								WR INSERT TEXT:P12000:19(diaryDetails; " ")
								WR INSERT EXPRESSION:P12000:24(diarydetails; SD2_FLookupContact)
								WR INSERT TEXT:P12000:19(diaryDetails; Char:C90(13))
								WR INSERT TEXT:P12000:19(diaryDetails; "Details: "+Char:C90(13))
								
								WR INSERT TEXT:P12000:19(diaryDetails; [DIARY:12]Action_Details:10)
							Else 
								WR BLOB TO AREA:P12000:142(diarydetails; [DIARY:12]x_Action_Description_Blob:72)
							End if 
						End if 
						
					End if 
					
					DOC_SetWriteModifiable(diaryDetails; -2; True:C214)
					
					
					
				Else 
					OBJECT SET VISIBLE:C603(DiaryDetailsTXT; True:C214)
					OBJECT SET VISIBLE:C603(DiaryDetails; False:C215)
					// as well as the change of tab here we have to udate if the text is altered
					If ($_bo_UpdateActionBLob)
						//Put the current copy of the document into the blob
						$_t_ActionDetails:=[DIARY:12]Action_Details:10
						
						[DIARY:12]Action_Details:10:=DiaryDetailsTXT
						//and extract the text to the Action desc
						If ($_t_ActionDetails#[DIARY:12]Action_Details:10)
							SD2_DiaryinLPX(->[DIARY:12]Action_Details:10; (SD2_l_FieldLevelMacros=1); (SD2_l_IgnoreStdMacros=1))
						End if 
						
					Else 
						If ($_bo_UpdateResultBLob)
							$_t_ActionDetails:=[DIARY:12]Result_Description:12
							[DIARY:12]Result_Description:12:=DiaryDetailsTXT
							If ($_t_ActionDetails#[DIARY:12]Result_Description:12)
								SD2_DiaryinLPX(->[DIARY:12]Action_Details:10; (SD2_l_FieldLevelMacros=1); (SD2_l_IgnoreStdMacros=1))
							End if 
							
						End if 
					End if 
					DiaryDetailsTXT:=""
					If (SD2_at_PlanResultTab=1)
						DiaryDetailsTXT:=[DIARY:12]Action_Details:10
					Else 
						DiaryDetailsTXT:=[DIARY:12]Result_Description:12
					End if 
				End if 
				
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("SD2_DiaryOnEdit"; $_t_oldMethodName)

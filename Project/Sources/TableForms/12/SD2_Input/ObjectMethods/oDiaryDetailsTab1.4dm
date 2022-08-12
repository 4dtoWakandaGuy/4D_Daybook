If (False:C215)
	//object Name: [DIARY]SD2_Input.oDiaryDetailsTab1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(diaryDetails)
	//C_UNKNOWN(DiaryDetailsTXT)
	//ARRAY TEXT(SD2_at_PlanResultTab;0)
	C_BLOB:C604($_blb_TempBlob)
	C_BOOLEAN:C305($_bo_UpdateResultBLob; SD2_bo_ShowDetailsASWP; $_bo_UpdateActionBLob; $_bo_UpdateResultBLob; SD2_bo_ShowDetailsASWP)
	C_LONGINT:C283($_l_TempArea; diaryDetails; SD_l_CurrentTab; $_l_Count; $_l_TempArea; SD_l_CurrentTab)
	C_TEXT:C284($_t_oldMethodName; DiaryDetailsTXT; SD2_t_DocumentDisplayCode; $_t_ActionDescription; $_t_oldMethodName; SD2_t_DocumentDisplayCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_Input.oDiaryDetailsTab1"; Form event code:C388)

If (SD_l_CurrentTab#SD2_at_PlanResultTab)
	$_bo_UpdateActionBLob:=False:C215
	$_bo_UpdateResultBLob:=False:C215
	If (SD_l_CurrentTab#0)
		$_bo_UpdateActionBLob:=(SD_l_CurrentTab=1)
		$_bo_UpdateResultBLob:=(SD_l_CurrentTab=2)
	End if 
	SD_l_CurrentTab:=SD2_at_PlanResultTab  //so we don;t keep reloading
	If (SD2_bo_ShowDetailsASWP)  //we display this using a 4D write area
		If ($_bo_UpdateActionBLob)
			//Put the current copy of the document into the blob
			[DIARY:12]x_Action_Description_Blob:72:=WR Area to blob:P12000:140(diaryDetails; 1)
			//and extract the text to the Action desc
			$_l_Count:=WR Count:P12000:143(diaryDetails; 0)
			If ($_l_Count>0)
				$_t_ActionDescription:=[DIARY:12]Action_Details:10
				[DIARY:12]Action_Details:10:=WR Get text:P12000:20(diaryDetails; 0; $_l_Count)
				If ($_t_ActionDescription#[DIARY:12]Action_Details:10)
					SD2_DiaryinLPX(->[DIARY:12]Action_Details:10)
				End if 
			Else 
				$_t_ActionDescription:=[DIARY:12]Action_Details:10
				[DIARY:12]Action_Details:10:=""
				If ($_t_ActionDescription#[DIARY:12]Action_Details:10)
					SD2_DiaryinLPX(->[DIARY:12]Action_Details:10)
				End if 
			End if 
		Else 
			If ($_bo_UpdateResultBLob)
				[DIARY:12]x_Result_Description_Blob:73:=WR Area to blob:P12000:140(diaryDetails; 1)
				//and extract the text to the result desc
				$_l_Count:=WR Count:P12000:143(diaryDetails; 0)
				If ($_l_Count>0)
					$_t_ActionDescription:=[DIARY:12]Result_Description:12
					[DIARY:12]Result_Description:12:=WR Get text:P12000:20(diaryDetails; 0; $_l_Count)
					If ($_t_ActionDescription#[DIARY:12]Result_Description:12)
						SD2_DiaryinLPX(->[DIARY:12]Result_Description:12)
					End if 
				Else 
					$_t_ActionDescription:=[DIARY:12]Result_Description:12
					[DIARY:12]Result_Description:12:=""
					If ($_t_ActionDescription#[DIARY:12]Result_Description:12)
						SD2_DiaryinLPX(->[DIARY:12]Result_Description:12)
					End if 
					
				End if 
			End if 
		End if 
		//here clear the area
		$_l_TempArea:=WR New offscreen area:P12000:47  //wr new offscreen area
		SET BLOB SIZE:C606($_blb_TempBlob; 0)
		$_blb_TempBlob:=WR Area to blob:P12000:140($_l_TempArea; 1)
		WR DELETE OFFSCREEN AREA:P12000:38($_l_TempArea)
		WR BLOB TO AREA:P12000:142(diarydetails; $_blb_TempBlob)
		SET BLOB SIZE:C606($_blb_TempBlob; 0)
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
			$_t_ActionDescription:=[DIARY:12]Action_Details:10
			
			[DIARY:12]Action_Details:10:=DiaryDetailsTXT
			//and extract the text to the Action desc
			If ($_t_ActionDescription#[DIARY:12]Action_Details:10)
				SD2_DiaryinLPX(->[DIARY:12]Action_Details:10)
			End if 
			
		Else 
			If ($_bo_UpdateResultBLob)
				$_t_ActionDescription:=[DIARY:12]Result_Description:12
				[DIARY:12]Result_Description:12:=DiaryDetailsTXT
				If ($_t_ActionDescription#[DIARY:12]Result_Description:12)
					SD2_DiaryinLPX(->[DIARY:12]Action_Details:10)
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
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_Input.oDiaryDetailsTab1"; $_t_oldMethodName)

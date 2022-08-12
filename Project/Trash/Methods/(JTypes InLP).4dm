//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JTypes_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/03/2010 12:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(CU_ai_CodeUsed;0)
	//ARRAY INTEGER(JOB_ai_AutoAdd;0)
	//ARRAY INTEGER(JOB_ai_Include;0)
	//ARRAY INTEGER(JOB_ai_JobClassINC;0)
	//ARRAY LONGINT(JOB_al_JobClassINT;0)
	//ARRAY LONGINT(JOB_al_RelateAutoAdd;0)
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY TEXT(JOB_at_JobCodes;0)
	//ARRAY TEXT(JOB_at_RelatedStageCodes;0)
	//ARRAY TEXT(JOB_at_StageCodes;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	C_BOOLEAN:C305($_bo_StageChanges; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_CodeusedRow; $_l_CountTables; $_l_Event; $_l_Index; $_l_JobCodeRow; $_l_JobSalesType; $_l_RestrictionRow; $_l_StageCodeRow; $_l_TableNumber; DB_l_ButtonClickedFunction; iCancel)
	C_LONGINT:C283(iOK; JT_l_ResListID; JT_l_TableRestrictionID; RBTemp)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; PAL_BUTTON; vButtDisJtypes; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JTypes_InLP")
//JTypes_InLP

$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[JOB_TYPES:65]); WIN_t_CurrentInputForm)
		JTypes_InLPB
		In_ButtChkDis(->vButtDisJtypes)
		
		
		
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[JOB_TYPES:65]); "Types In13")
		OpenHelp(Table:C252(->[JOB_TYPES:65]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisJtypes)
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[JOB_TYPES:65]); "Types In13")
		In_ButtChkDis(->vButtDisJtypes)
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		If (DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK")) | (iOK=1)
			//we are about to save this record
			//if the code uses only define one table
			//then put that in the sale type too
			$_l_JobSalesType:=0
			//TRACE
			If (False:C215)
				For ($_l_Index; 1; Size of array:C274(JOB_ai_JobClassINC))
					If ($_l_Index<Size of array:C274(JOB_ai_JobClassINC))
						$_l_JobSalesType:=$_l_JobSalesType+JOB_al_JobClassINT{$_l_Index}
					Else 
						If (RBTemp=1)
							$_l_JobSalesType:=$_l_JobSalesType+JOB_al_JobClassINT{$_l_Index}
						Else 
							$_l_JobSalesType:=$_l_JobSalesType+JOB_al_JobClassINT{$_l_Index+1}
						End if 
						
					End if 
					
				End for 
			End if 
			$_bo_StageChanges:=False:C215
			If (False:C215)
				$_l_JobCodeRow:=Find in array:C230(JOB_at_JobCodes; [JOB_TYPES:65]Type_Code:1)
				For ($_l_Index; 1; Size of array:C274(JOB_at_StageCodes))
					If (JOB_ai_Include{$_l_Index}=1)
						If ($_l_JobCodeRow<0)
							APPEND TO ARRAY:C911(JOB_at_JobCodes; [JOB_TYPES:65]Type_Code:1)
							INSERT IN ARRAY:C227(JOB_at_RelatedStageCodes; Size of array:C274(JOB_at_RelatedStageCodes)+1; 1)
							INSERT IN ARRAY:C227(JOB_al_RelateAutoAdd; Size of array:C274(JOB_al_RelateAutoAdd)+1; 1)
							$_l_JobCodeRow:=Size of array:C274(JOB_at_JobCodes)
						End if 
						$_l_StageCodeRow:=Find in array:C230(JOB_at_RelatedStageCodes{$_l_JobCodeRow}; JOB_at_StageCodes{$_l_Index})
						If ($_l_StageCodeRow<0)
							$_bo_StageChanges:=True:C214
							INSERT IN ARRAY:C227(JOB_at_RelatedStageCodes{$_l_JobCodeRow}; Size of array:C274(JOB_at_RelatedStageCodes{$_l_JobCodeRow})+1; 1)
							INSERT IN ARRAY:C227(JOB_al_RelateAutoAdd{$_l_JobCodeRow}; Size of array:C274(JOB_al_RelateAutoAdd{$_l_JobCodeRow})+1; 1)
							
							JOB_at_RelatedStageCodes{$_l_JobCodeRow}{Size of array:C274(JOB_at_RelatedStageCodes{$_l_JobCodeRow})}:=JOB_at_StageCodes{$_l_Index}
							JOB_al_RelateAutoAdd{$_l_JobCodeRow}{Size of array:C274(JOB_al_RelateAutoAdd{$_l_JobCodeRow})}:=JOB_ai_AutoAdd{$_l_Index}
						Else 
							If (JOB_ai_AutoAdd{$_l_Index}#JOB_al_RelateAutoAdd{$_l_JobCodeRow}{$_l_StageCodeRow})
								$_bo_StageChanges:=True:C214
								JOB_al_RelateAutoAdd{$_l_JobCodeRow}{$_l_StageCodeRow}:=JOB_ai_AutoAdd{$_l_Index}
							End if 
						End if 
						
					End if 
				End for 
				//and reverse it to check for deletions
				For ($_l_Index; Size of array:C274(JOB_at_RelatedStageCodes{$_l_JobCodeRow}); 1; -1)
					$_l_StageCodeRow:=Find in array:C230(JOB_at_StageCodes; JOB_at_RelatedStageCodes{$_l_JobCodeRow}{$_l_Index})
					If ($_l_StageCodeRow>0)
						If (JOB_ai_Include{$_l_StageCodeRow}=0)
							$_bo_StageChanges:=True:C214
							DELETE FROM ARRAY:C228(JOB_at_RelatedStageCodes{$_l_JobCodeRow}; $_l_Index; 1)
							DELETE FROM ARRAY:C228(JOB_al_RelateAutoAdd{$_l_JobCodeRow}; $_l_Index; 1)
						Else 
							//removal of auto setting was handled in the first bit
						End if 
					Else 
						//job stage must no longer exist
						$_bo_StageChanges:=True:C214
						DELETE FROM ARRAY:C228(JOB_at_RelatedStageCodes{$_l_JobCodeRow}; $_l_Index; 1)
						DELETE FROM ARRAY:C228(JOB_al_RelateAutoAdd{$_l_JobCodeRow}; $_l_Index; 1)
						
					End if 
				End for 
				If ($_bo_StageChanges)
					JOB_LoadStageTypeLinks(False:C215)
					
				End if 
			End if 
			
			
			If ([JOB_TYPES:65]ProjectedSaleTypeID:11>0) & (Old:C35([JOB_TYPES:65]ProjectedSaleTypeID:11)#[JOB_TYPES:65]ProjectedSaleTypeID:11)
				//its been changed
				$_l_CountTables:=0
				For ($_l_Index; 1; Size of array:C274(CU_ai_CodeUsed))
					If (CU_ai_CodeUsed{$_l_Index}=1)
						$_l_CountTables:=$_l_CountTables+1
					End if 
				End for 
				If ($_l_CountTables=1)
					//only used with one table
					//what table is it
					$_l_CodeusedRow:=Find in array:C230(CU_ai_CodeUsed; 1)
					Case of 
						: ($_l_CodeusedRow=1)  //orders
							$_l_TableNumber:=Table:C252(->[ORDERS:24])
						: ($_l_CodeusedRow=2)  //Projects
							$_l_TableNumber:=Table:C252(->[PROJECTS:89])
						: ($_l_CodeusedRow=3)  //Jobs
							$_l_TableNumber:=Table:C252(->[JOBS:26])
					End case 
					$_l_RestrictionRow:=Find in array:C230(QV_at_TableRestrictionNMs; Table name:C256($_l_TableNumber))
					If ($_l_RestrictionRow<0)
						JT_l_TableRestrictionID:=AA_ListAddItembyID(JT_l_ResListID; Table name:C256($_l_TableNumber))
						AA_LoadListbyID(JT_l_ResListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
					Else 
						JT_l_TableRestrictionID:=QV_al_TableRestrictionIDs{$_l_RestrictionRow}
					End if 
					AA_ListItemAddProperty([JOB_TYPES:65]ProjectedSaleTypeID:11; JT_l_ResListID; JT_l_TableRestrictionID; "Table Restriction")
					
				End if 
				
			End if 
			
		End if 
		
		//End if
		
		In_ButtCall("Gen_CULPA"; ""; "Minor_DelSinCU"; ->[JOB_TYPES:65]; ->[JOB_TYPES:65]Type_Code:1; "Job Types"; "1"; "JTypes_InLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisJtypes)
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([JOB_TYPES:65]Type_Code:1))
				RemoveLeadTr(Uppercase:C13([JOB_TYPES:65]Type_Code:1); ->[JOB_TYPES:65]Type_Code:1)
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([JOB_TYPES:65]Type_Name:2))
				[JOB_TYPES:65]Type_Name:2:=Uppers2([JOB_TYPES:65]Type_Name:2)
				DB_bo_RecordModified:=True:C214
			: ((Modified:C32([JOB_TYPES:65]Client_Text:3)) | (Modified:C32([JOB_TYPES:65]Applic_Text:4)) | (Modified:C32([JOB_TYPES:65]Invoice_Text:5)) | (Modified:C32([JOB_TYPES:65]Terms:6)) | (Modified:C32([JOB_TYPES:65]Invoice_Comment:7)) | (Modified:C32([JOB_TYPES:65]Default_Tax:8)) | (Modified:C32([JOB_TYPES:65]Default_Allow:9)))
				DB_bo_RecordModified:=True:C214
		End case 
	: ($_l_Event=On Clicked:K2:4)
		If (PAL_BUTTON#"")
			$_t_PalletButtonName:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalletButtonName)
			PAL_bo_ButtonSubFunction:=False:C215
		End if 
		
	: ($_l_Event=On Deactivate:K2:10)
		
End case 
ERR_MethodTrackerReturn("JTypes_InLP"; $_t_oldMethodName)
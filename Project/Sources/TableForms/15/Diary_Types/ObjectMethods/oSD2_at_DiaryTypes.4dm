If (False:C215)
	//object Name: [USER]Diary_Types.oSD2_at_DiaryTypes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/01/2013 09:16
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	//ARRAY LONGINT(SD2_al_DiaryDone;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeDiary;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeIDS;0)
	//ARRAY LONGINT(SD2_AL_DiaryTypeIDS2;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeOriginal;0)
	//ARRAY LONGINT(SD2_AL_DiaryTypeSettings;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeThreaded;0)
	//ARRAY TEXT(SD2_at_DiaryTypes;0)
	//ARRAY TEXT(SD2_at_DiaryTypes2;0)
	C_BOOLEAN:C305($_bo_Continue; SD2_bo_recordModified)
	C_LONGINT:C283($_l_Count; $_l_CurrentRow; $_l_Delete; $_l_DiaryTypeRow; $_l_Index; $_l_Insert; SD2_l_actionID; SD2_l_CBPostAction; SD2_l_CBThreaded; SD2_l_CurrentDiaryType; sRB_l_Diary)
	C_LONGINT:C283(sRB_l_Original)
	C_TEXT:C284($_t_NewDiaryTypeName; $_t_oldMethodName; SD2_t_DiaryType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Diary_Types.oSD2_at_DiaryTypes"; Form event code:C388)
If (SD2_at_DiaryTypes2>0)
	
	If (SD2_AL_DiaryTypeIDS2{SD2_at_DiaryTypes2}#SD2_l_CurrentDiaryType)
		$_bo_Continue:=True:C214
		If (SD2_bo_recordModified)
			If (SD2_t_DiaryType#"")
				Gen_Confirm("Do you wish to save changes to "+SD2_t_DiaryType; "Yes"; "No")
				If (OK=1)
					If (SD2_l_CurrentDiaryType>0)
						Gen_Alert("Note : These changes will not be re-applied to existing diary actions of this typ"+"e")
						$_l_DiaryTypeRow:=Find in array:C230(SD2_al_DiaryTypeIDS; SD2_l_CurrentDiaryType)
					Else 
						$_l_DiaryTypeRow:=Size of array:C274(SD2_at_DiaryTypes)+1
						APPEND TO ARRAY:C911(SD2_al_DiaryTypeIDS; AA_GetNextID(->SD2_l_actionID))
						
						APPEND TO ARRAY:C911(SD2_at_DiaryTypes; SD2_t_DiaryType)
						INSERT IN ARRAY:C227(SD2_AL_DiaryTypeSettings; $_l_DiaryTypeRow; 1)
						APPEND TO ARRAY:C911(SD2_al_DiaryTypeThreaded; SD2_l_CBThreaded)
						APPEND TO ARRAY:C911(SD2_al_DiaryTypeOriginal; sRB_l_Original)
						APPEND TO ARRAY:C911(SD2_al_DiaryTypeDiary; sRB_l_Diary)
						APPEND TO ARRAY:C911(SD2_al_DiaryDone; SD2_l_CBPostAction)
					End if 
					$_l_Count:=0
					For ($_l_Index; 1; Size of array:C274(SD2_aI_DiaryLocationsSEL))
						If (SD2_aI_DiaryLocationsSEL{$_l_Index}=1)
							$_l_Count:=$_l_Count+1
						End if 
					End for 
					
					Case of 
						: (Size of array:C274(SD2_AL_DiaryTypeSettings{$_l_DiaryTypeRow})<$_l_Count)
							$_l_Insert:=($_l_Count)-(Size of array:C274(SD2_AL_DiaryTypeSettings{$_l_DiaryTypeRow}))
							INSERT IN ARRAY:C227(SD2_AL_DiaryTypeSettings{$_l_DiaryTypeRow}; Size of array:C274(SD2_AL_DiaryTypeSettings{$_l_DiaryTypeRow})+1; $_l_Insert)
						: (Size of array:C274(SD2_AL_DiaryTypeSettings{$_l_DiaryTypeRow})>$_l_Count)
							$_l_Delete:=(Size of array:C274(SD2_AL_DiaryTypeSettings{$_l_DiaryTypeRow}))-($_l_Count)
							DELETE FROM ARRAY:C228(SD2_AL_DiaryTypeSettings{$_l_DiaryTypeRow}; Size of array:C274(SD2_AL_DiaryTypeSettings{$_l_DiaryTypeRow}); $_l_Delete)
					End case 
					$_l_CurrentRow:=0
					For ($_l_Index; 1; Size of array:C274(SD2_aI_DiaryLocationsSEL))
						If (SD2_aI_DiaryLocationsSEL{$_l_Index}=1)
							$_l_CurrentRow:=$_l_CurrentRow+1
							SD2_AL_DiaryTypeSettings{$_l_DiaryTypeRow}{$_l_CurrentRow}:=SD2_al_DiaryLocations
						End if 
					End for 
					SD2_al_DiaryTypeThreaded{$_l_DiaryTypeRow}:=SD2_l_CBThreaded
					SD2_al_DiaryTypeOriginal{$_l_DiaryTypeRow}:=sRB_l_Original
					SD2_al_DiaryTypeDiary{$_l_DiaryTypeRow}:=sRB_l_Diary
					SD2_al_DiaryDone{$_l_DiaryTypeRow}:=SD2_l_CBPostAction
					
					SD2_LoadDiaryTypes(False:C215)
					COPY ARRAY:C226(SD2_al_DiaryTypeIDS; SD2_Al_DiaryTypeIDs2)
					COPY ARRAY:C226(SD2_at_DiaryTypes; SD2_at_DiaryTypes2)
					
					$_l_DiaryTypeRow:=Find in array:C230(SD2_Al_DiaryTypeIDs2; -999)
					If ($_l_DiaryTypeRow<0)
						APPEND TO ARRAY:C911(SD2_Al_DiaryTypeIDs2; -9991)
						APPEND TO ARRAY:C911(SD2_at_DiaryTypes2; "-")
						
						APPEND TO ARRAY:C911(SD2_Al_DiaryTypeIDs2; -999)
						APPEND TO ARRAY:C911(SD2_at_DiaryTypes2; "Add Time Manager Type")
					End if 
				End if 
				$_bo_Continue:=True:C214
				
			Else 
				Gen_Alert("You must give this Diary Type an name!")
				$_bo_Continue:=False:C215
			End if 
		Else 
			$_bo_Continue:=True:C214
			
		End if 
		If ($_bo_Continue)
			If (SD2_Al_DiaryTypeIDs2{SD2_at_DiaryTypes2}>0)
				SD2_at_DiaryTypes:=SD2_at_DiaryTypes2
				SD2_LoadDiaryActionType(->SD2_l_CurrentDiaryType; ->SD2_t_DiaryType)
			Else 
				HIDE WINDOW:C436
				//Add a new action type
				$_t_NewDiaryTypeName:=Gen_Request("Enter Name for new Diary Type")
				If ($_t_NewDiaryTypeName#"")
					APPEND TO ARRAY:C911(SD2_al_DiaryTypeIDS; AA_GetNextID(->SD2_l_actionID))
					APPEND TO ARRAY:C911(SD2_at_DiaryTypes; $_t_NewDiaryTypeName)
					APPEND TO ARRAY:C911(SD2_al_DiaryTypethreaded; 0)
					APPEND TO ARRAY:C911(SD2_al_DiaryTypeOriginal; 0)
					APPEND TO ARRAY:C911(SD2_al_DiaryTypeDiary; 0)
					APPEND TO ARRAY:C911(SD2_al_DiaryDone; 0)
					INSERT IN ARRAY:C227(SD2_AL_DIARYTYPESETTINGS; Size of array:C274(SD2_AL_DiaryTypeSettings)+1; 1)
					APPEND TO ARRAY:C911(SD2_AL_DIARYTYPESETTINGS{Size of array:C274(SD2_AL_DIARYTYPESETTINGS)}; 2)
					
					SD2_LoadDiaryTypes(True:C214)
					SD2_LoadDiaryTypes
					COPY ARRAY:C226(SD2_al_DiaryTypeIDS; SD2_Al_DiaryTypeIDs2)
					COPY ARRAY:C226(SD2_at_DiaryTypes; SD2_at_DiaryTypes2)
					
					$_l_DiaryTypeRow:=Find in array:C230(SD2_Al_DiaryTypeIDs2; -999)
					If ($_l_DiaryTypeRow<0)
						APPEND TO ARRAY:C911(SD2_Al_DiaryTypeIDs2; -9991)
						APPEND TO ARRAY:C911(SD2_at_DiaryTypes2; "-")
						
						APPEND TO ARRAY:C911(SD2_Al_DiaryTypeIDs2; -999)
						APPEND TO ARRAY:C911(SD2_at_DiaryTypes2; "Add Time Manager Type")
					End if 
					
					$_l_DiaryTypeRow:=Find in array:C230(SD2_at_DiaryTypes; $_t_NewDiaryTypeName)
					If ($_l_DiaryTypeRow>0)
						SD2_at_DiaryTypes:=$_l_DiaryTypeRow
						SD2_LoadDiaryActionType(->SD2_l_CurrentDiaryType; ->SD2_t_DiaryType)
					End if 
					SHOW WINDOW:C435
					
				Else 
					SD2_at_DiaryTypes2:=1
					SD2_at_DiaryTypes:=1
					SD2_LoadDiaryActionType(->SD2_l_CurrentDiaryType; ->SD2_t_DiaryType)
				End if 
				
				
				
				
				
			End if 
			
		End if 
		
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].Diary_Types.oSD2_at_DiaryTypes"; $_t_oldMethodName)

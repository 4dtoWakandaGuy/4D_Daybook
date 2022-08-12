If (False:C215)
	//object Name: [USER]Diary_Types.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	//ARRAY LONGINT(SD2_al_DiaryActionClassIDs;0)
	//ARRAY LONGINT(SD2_al_DiaryDone;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeDiary;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeIDS;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeOriginal;0)
	//ARRAY LONGINT(SD2_AL_DiaryTypeSettings;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeThreaded;0)
	//ARRAY TEXT(SD2_at_DiaryTypes;0)
	C_BOOLEAN:C305(SD2_bo_recordModified)
	C_LONGINT:C283($_l_Count; $_l_CurrentRow; $_l_Delete; $_l_DiaryTypeRow; $_l_Index; $_l_Insert; SD2_l_ActionID; SD2_l_CBPostAction; SD2_l_CBThreaded; SD2_l_CurrentDiaryType; sRB_l_Diary)
	C_LONGINT:C283(sRB_l_Original)
	C_TEXT:C284($_t_oldMethodName; SD2_t_DiaryType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Diary_Types.Variable7"; Form event code:C388)
If (SD2_bo_recordModified)
	If (SD2_t_DiaryType#"")
		Gen_Confirm("Do you wish to save changes to "+SD2_t_DiaryType; "Yes"; "No")
		If (OK=1)
			If (SD2_l_CurrentDiaryType>0)
				Gen_Alert("Note : These changes will not be re-applied to existing diary actions of this typ"+"e")
				$_l_DiaryTypeRow:=Find in array:C230(SD2_al_DiaryTypeIDS; SD2_l_CurrentDiaryType)
			Else 
				$_l_DiaryTypeRow:=Size of array:C274(SD2_at_DiaryTypes)+1
				INSERT IN ARRAY:C227(SD2_al_DiaryTypeIDS; $_l_DiaryTypeRow; 1)
				
				INSERT IN ARRAY:C227(SD2_at_DiaryTypes; $_l_DiaryTypeRow; 1)
				INSERT IN ARRAY:C227(SD2_AL_DiaryTypeSettings; $_l_DiaryTypeRow; 1)
				INSERT IN ARRAY:C227(SD2_al_DiaryTypeThreaded; $_l_DiaryTypeRow; 1)
				INSERT IN ARRAY:C227(SD2_al_DiaryTypeOriginal; $_l_DiaryTypeRow; 1)
				INSERT IN ARRAY:C227(SD2_al_DiaryTypeDiary; $_l_DiaryTypeRow; 1)
				INSERT IN ARRAY:C227(SD2_al_DiaryDone; $_l_DiaryTypeRow; 1)
			End if 
			SD2_l_ActionID:=0
			If (SD2_al_DiaryActionClassIDs{$_l_DiaryTypeRow}=0)
				SD2_al_DiaryActionClassIDs{$_l_DiaryTypeRow}:=AA_GetNextID(->SD2_l_ActionID)
			End if 
			
			SD2_at_DiaryTypes{$_l_DiaryTypeRow}:=SD2_t_DiaryType
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
		End if 
		CANCEL:C270
		
	Else 
		Gen_Alert("You must give this Diary Type an name!")
	End if 
Else 
	CANCEL:C270
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].Diary_Types.Variable7"; $_t_oldMethodName)

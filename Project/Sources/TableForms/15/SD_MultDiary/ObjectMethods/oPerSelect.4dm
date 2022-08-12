If (False:C215)
	//object Name: [USER]SD_MultDiary.oPerSelect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/02/2010 18:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DIA_lb_Documents;0)
	//ARRAY BOOLEAN(SD_abo_IncludeDiaries;0)
	//ARRAY INTEGER(SD_ai_includeDiary;0)
	//ARRAY LONGINT(<>SD_al_CombineGroupDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombinePersonDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombineResourceDiaries;0)
	//ARRAY LONGINT(SD_al_IncludeItemIDs;0)
	//ARRAY LONGINT(SD2_al_CombineGroupDiaries;0)
	//ARRAY LONGINT(SD2_al_CombinePersonDiaries;0)
	//ARRAY LONGINT(SD2_al_CombineResourceDiaries;0)
	//ARRAY TEXT(SD_at_includeDiaries;0)
	C_BOOLEAN:C305($_bo_Expanded)
	C_LONGINT:C283($_l_ComboRow; $_l_event; $_l_FieldNumber; $_l_IncludeRow; $_l_itemReference2; $_l_ListItemReference; $_l_Max; $_l_ProcessNumber; $_l_Row; $_l_SelectedListItem; $_l_SourceProcess)
	C_LONGINT:C283($_l_SourceRow; $_l_SubListID; $_l_SubListID2; $_l_TableNumber; SD_HL_aDiaries; SD_l_NoClick; SD2_l_CallBackProcessID; SD2_l_UseProcessArrays; SD3_l_CallActionNum; SD3_l_DiaryActionNum)
	C_POINTER:C301($_Ptr_SourceObject)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_ItemText; $_t_oldMethodName; $_t_SDProcName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD_MultDiary.oPerSelect"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Data Change:K2:15)
		//
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			
			SD_l_NoClick:=1
			SD_at_includeDiaries:=$_l_Row
			SD_ai_includeDiary{$_l_Row}:=Num:C11(SD_abo_IncludeDiaries{$_l_Row})
			If (SD_ai_includeDiary{$_l_Row}=1)
				$_l_ListItemReference:=SD_al_IncludeItemIDs{SD_at_includeDiaries}
				Case of 
					: ($_l_ListItemReference>0) & ($_l_ListItemReference<9999)  //its a person
						If (SD2_l_UseProcessArrays=0)
							$_l_ComboRow:=Find in array:C230(<>SD_al_CombinePersonDiaries; $_l_ListItemReference)
							If ($_l_ComboRow<0)
								INSERT IN ARRAY:C227(<>SD_al_CombinePersonDiaries; Size of array:C274(<>SD_al_CombinePersonDiaries)+1; 1)
								<>SD_al_CombinePersonDiaries{Size of array:C274(<>SD_al_CombinePersonDiaries)}:=$_l_ListItemReference
							End if 
						Else 
							$_l_ComboRow:=Find in array:C230(SD2_al_CombinePersonDiaries; $_l_ListItemReference)
							If ($_l_ComboRow<0)
								INSERT IN ARRAY:C227(SD2_al_CombinePersonDiaries; Size of array:C274(SD2_al_CombinePersonDiaries)+1; 1)
								SD2_al_CombinePersonDiaries{Size of array:C274(SD2_al_CombinePersonDiaries)}:=$_l_ListItemReference
							End if 
							
						End if 
					: ($_l_ListItemReference>9999)  //its a resource
						If (SD2_l_UseProcessArrays=0)
							$_l_ComboRow:=Find in array:C230(<>SD_al_CombineResourceDiaries; ($_l_ListItemReference-9999))
							If ($_l_ComboRow<0)
								INSERT IN ARRAY:C227(<>SD_al_CombineResourceDiaries; Size of array:C274(<>SD_al_CombineResourceDiaries)+1; 1)
								<>SD_al_CombineResourceDiaries{Size of array:C274(<>SD_al_CombineResourceDiaries)}:=$_l_ListItemReference-9999
							End if 
						Else 
							$_l_ComboRow:=Find in array:C230(SD2_al_CombineResourceDiaries; ($_l_ListItemReference-9999))
							If ($_l_ComboRow<0)
								INSERT IN ARRAY:C227(SD2_al_CombineResourceDiaries; Size of array:C274(SD2_al_CombineResourceDiaries)+1; 1)
								SD2_al_CombineResourceDiaries{Size of array:C274(SD2_al_CombineResourceDiaries)}:=$_l_ListItemReference-9999
							End if 
							
						End if 
					: ($_l_ListItemReference<0)  //its a group
						If (SD2_l_UseProcessArrays=0)
							$_l_ComboRow:=Find in array:C230(<>SD_al_CombineGroupDiaries; Abs:C99($_l_ListItemReference-9999))
							If ($_l_ComboRow<0)
								INSERT IN ARRAY:C227(<>SD_al_CombineGroupDiaries; Size of array:C274(<>SD_al_CombineGroupDiaries)+1; 1)
								<>SD_al_CombineGroupDiaries{Size of array:C274(<>SD_al_CombineGroupDiaries)}:=Abs:C99($_l_ListItemReference-9999)
							End if 
						Else 
							$_l_ComboRow:=Find in array:C230(SD2_al_CombineGroupDiaries; Abs:C99($_l_ListItemReference-9999))
							If ($_l_ComboRow<0)
								INSERT IN ARRAY:C227(SD2_al_CombineGroupDiaries; Size of array:C274(SD2_al_CombineGroupDiaries)+1; 1)
								SD2_al_CombineGroupDiaries{Size of array:C274(SD2_al_CombineGroupDiaries)}:=Abs:C99($_l_ListItemReference-9999)
							End if 
							
						End if 
				End case 
			Else 
				$_l_ListItemReference:=SD_al_IncludeItemIDs{$_l_Row}
				Case of 
					: ($_l_ListItemReference>0) & ($_l_ListItemReference<9999)  //its a person
						If (SD2_l_UseProcessArrays=0)
							$_l_ComboRow:=Find in array:C230(<>SD_al_CombinePersonDiaries; $_l_ListItemReference)
							If ($_l_ComboRow>0)
								DELETE FROM ARRAY:C228(<>SD_al_CombinePersonDiaries; $_l_ComboRow; 1)
							End if 
						Else 
							$_l_ComboRow:=Find in array:C230(SD2_al_CombinePersonDiaries; $_l_ListItemReference)
							If ($_l_ComboRow>0)
								DELETE FROM ARRAY:C228(SD2_al_CombinePersonDiaries; $_l_ComboRow; 1)
							End if 
							
						End if 
					: ($_l_ListItemReference>9999)  //its a resource
						If (SD2_l_UseProcessArrays=0)
							$_l_ComboRow:=Find in array:C230(<>SD_al_CombineResourceDiaries; $_l_ListItemReference-9999)
							If ($_l_ComboRow>0)
								DELETE FROM ARRAY:C228(<>SD_al_CombineResourceDiaries; $_l_ComboRow; 1)
							End if 
						Else 
							$_l_ComboRow:=Find in array:C230(SD2_al_CombineResourceDiaries; $_l_ListItemReference-9999)
							If ($_l_ComboRow>0)
								DELETE FROM ARRAY:C228(SD2_al_CombineResourceDiaries; $_l_ComboRow; 1)
							End if 
							
						End if 
						
					: ($_l_ListItemReference<0)  //its a group
						If (SD2_l_UseProcessArrays=0)
							$_l_ComboRow:=Find in array:C230(<>SD_al_CombineGroupDiaries; Abs:C99($_l_ListItemReference-9999))
							
							If ($_l_ComboRow>0)
								DELETE FROM ARRAY:C228(<>SD_al_CombineGroupDiaries; $_l_ComboRow; 1)
							End if 
						Else 
							$_l_ComboRow:=Find in array:C230(SD2_al_CombineGroupDiaries; Abs:C99($_l_ListItemReference-9999))
							If ($_l_ComboRow>0)
								DELETE FROM ARRAY:C228(SD2_al_CombineGroupDiaries; $_l_ComboRow; 1)
							End if 
							
						End if 
						
				End case 
			End if 
			
			If (SD2_l_CallBackProcessID=0)
				$_t_SDProcName:="View SuperDiary"+"-"+<>PER_t_CurrentUserInitials
				$_l_ProcessNumber:=Process number:C372($_t_SDProcName)
				If ($_l_ProcessNumber>0)
					SD3_l_CallActionNum:=13
					SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
					POST OUTSIDE CALL:C329($_l_ProcessNumber)
					SD3_l_CallActionNum:=4
				End if 
			Else 
				If (SD2_l_UseProcessArrays=1)
					//Pass the elements of the array to the processs
					VARIABLE TO VARIABLE:C635(SD2_l_CallBackProcessID; SD2_al_CombineGroupDiaries; SD2_al_CombineGroupDiaries; SD2_al_CombinePersonDiaries; SD2_al_CombinePersonDiaries; SD2_al_CombineResourceDiaries; SD2_al_CombineResourceDiaries)
				End if 
				
				SD3_l_CallActionNum:=13
				SET PROCESS VARIABLE:C370(SD2_l_CallBackProcessID; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
				POST OUTSIDE CALL:C329(SD2_l_CallBackProcessID)
			End if 
			
			
			SD_l_NoClick:=0
			
			
		Else 
			LISTBOX SELECT ROW:C912(DIA_lb_Documents; 1; 0)
		End if 
	: ($_l_event=On Drop:K2:12)
		
		
		_O_DRAG AND DROP PROPERTIES:C607($_Ptr_SourceObject; $_l_SourceRow; $_l_SourceProcess)
		RESOLVE POINTER:C394($_Ptr_SourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		If ($_t_VariableName="SD_HL_aDiaries")
			
			GET LIST ITEM:C378(SD_HL_aDiaries; $_l_SourceRow; $_l_ListItemReference; $_t_ItemText; $_l_SubListID2; $_bo_Expanded)
			If ($_l_SubListID2>0)
				//the dragged item either
				//PersonsDiaries or resource  diaries or group diaries
				//so put them all in
				$_l_Max:=Count list items:C380($_l_SubListID)
				For ($_l_SelectedListItem; 1; $_l_Max)
					GET LIST ITEM:C378($_l_SubListID; $_l_SelectedListItem; $_l_ListItemReference; $_t_ItemText; $_l_SubListID; $_bo_Expanded)
					Case of 
						: ($_l_ListItemReference>0) & ($_l_ListItemReference<9999)  //its a person
							$_l_IncludeRow:=Find in array:C230(SD_al_IncludeItemIDs; $_l_ListItemReference)
							If ($_l_IncludeRow<0)
								INSERT IN ARRAY:C227(SD_abo_IncludeDiaries; Size of array:C274(SD_abo_IncludeDiaries)+1; 1)
								
								INSERT IN ARRAY:C227(SD_at_includeDiaries; Size of array:C274(SD_at_includeDiaries)+1; 1)
								INSERT IN ARRAY:C227(SD_al_IncludeItemIDs; Size of array:C274(SD_al_IncludeItemIDs)+1; 1)
								INSERT IN ARRAY:C227(SD_ai_includeDiary; Size of array:C274(SD_ai_includeDiary)+1; 1)
								SD_at_includeDiaries{Size of array:C274(SD_at_includeDiaries)}:=$_t_ItemText
								SD_al_IncludeItemIDs{Size of array:C274(SD_al_IncludeItemIDs)}:=$_l_ListItemReference
								SD_ai_includeDiary{Size of array:C274(SD_ai_includeDiary)}:=1
								SD_abo_IncludeDiaries{Size of array:C274(SD_abo_IncludeDiaries)}:=True:C214
								If (SD2_l_UseProcessArrays=0)
									$_l_ComboRow:=Find in array:C230(<>SD_al_CombinePersonDiaries; $_l_ListItemReference)
									If ($_l_ComboRow<0)
										INSERT IN ARRAY:C227(<>SD_al_CombinePersonDiaries; Size of array:C274(<>SD_al_CombinePersonDiaries)+1; 1)
										<>SD_al_CombinePersonDiaries{Size of array:C274(<>SD_al_CombinePersonDiaries)}:=$_l_ListItemReference
									End if 
								Else 
									$_l_ComboRow:=Find in array:C230(SD2_al_CombinePersonDiaries; $_l_ListItemReference)
									If ($_l_ComboRow<0)
										INSERT IN ARRAY:C227(SD2_al_CombinePersonDiaries; Size of array:C274(SD2_al_CombinePersonDiaries)+1; 1)
										SD2_al_CombinePersonDiaries{Size of array:C274(SD2_al_CombinePersonDiaries)}:=$_l_ListItemReference
									End if 
									
								End if 
							Else 
								SD_abo_IncludeDiaries{$_l_IncludeRow}:=True:C214
								SD_ai_includeDiary{$_l_IncludeRow}:=1
								
							End if 
							
						: ($_l_ListItemReference>9999)  //its a resource
							$_l_IncludeRow:=Find in array:C230(SD_al_IncludeItemIDs; $_l_ListItemReference)
							If ($_l_IncludeRow<0)
								INSERT IN ARRAY:C227(SD_abo_IncludeDiaries; Size of array:C274(SD_abo_IncludeDiaries)+1; 1)
								INSERT IN ARRAY:C227(SD_at_includeDiaries; Size of array:C274(SD_at_includeDiaries)+1; 1)
								INSERT IN ARRAY:C227(SD_al_IncludeItemIDs; Size of array:C274(SD_al_IncludeItemIDs)+1; 1)
								INSERT IN ARRAY:C227(SD_ai_includeDiary; Size of array:C274(SD_ai_includeDiary)+1; 1)
								SD_at_includeDiaries{Size of array:C274(SD_at_includeDiaries)}:=$_t_ItemText
								SD_al_IncludeItemIDs{Size of array:C274(SD_al_IncludeItemIDs)}:=$_l_ListItemReference
								SD_ai_includeDiary{Size of array:C274(SD_ai_includeDiary)}:=1
								SD_abo_IncludeDiaries{Size of array:C274(SD_abo_IncludeDiaries)}:=True:C214
								If (SD2_l_UseProcessArrays=0)
									$_l_ComboRow:=Find in array:C230(<>SD_al_CombineResourceDiaries; ($_l_ListItemReference-9999))
									If ($_l_ComboRow<0)
										INSERT IN ARRAY:C227(<>SD_al_CombineResourceDiaries; Size of array:C274(<>SD_al_CombineResourceDiaries)+1; 1)
										<>SD_al_CombineResourceDiaries{Size of array:C274(<>SD_al_CombineResourceDiaries)}:=$_l_ListItemReference-9999
									End if 
									
								Else 
									$_l_ComboRow:=Find in array:C230(SD2_al_CombineResourceDiaries; ($_l_ListItemReference-9999))
									If ($_l_ComboRow<0)
										INSERT IN ARRAY:C227(SD2_al_CombineResourceDiaries; Size of array:C274(SD2_al_CombineResourceDiaries)+1; 1)
										SD2_al_CombineResourceDiaries{Size of array:C274(SD2_al_CombineResourceDiaries)}:=$_l_ListItemReference-9999
									End if 
									
								End if 
								
							Else 
								SD_abo_IncludeDiaries{$_l_IncludeRow}:=True:C214
								SD_ai_includeDiary{$_l_IncludeRow}:=1
								
							End if 
							
							
						: ($_l_ListItemReference<0)  //its a group
							$_l_IncludeRow:=Find in array:C230(SD_al_IncludeItemIDs; $_l_ListItemReference)
							If ($_l_IncludeRow<0)
								INSERT IN ARRAY:C227(SD_abo_IncludeDiaries; Size of array:C274(SD_abo_IncludeDiaries)+1; 1)
								
								INSERT IN ARRAY:C227(SD_at_includeDiaries; Size of array:C274(SD_at_includeDiaries)+1; 1)
								INSERT IN ARRAY:C227(SD_al_IncludeItemIDs; Size of array:C274(SD_al_IncludeItemIDs)+1; 1)
								INSERT IN ARRAY:C227(SD_ai_includeDiary; Size of array:C274(SD_ai_includeDiary)+1; 1)
								SD_at_includeDiaries{Size of array:C274(SD_at_includeDiaries)}:=$_t_ItemText
								SD_al_IncludeItemIDs{Size of array:C274(SD_al_IncludeItemIDs)}:=$_l_ListItemReference
								SD_ai_includeDiary{Size of array:C274(SD_ai_includeDiary)}:=1
								SD_abo_IncludeDiaries{Size of array:C274(SD_abo_IncludeDiaries)}:=True:C214
								If (SD2_l_UseProcessArrays=0)
									$_l_ComboRow:=Find in array:C230(<>SD_al_CombineGroupDiaries; (Abs:C99($_l_ListItemReference-9999)))
									If ($_l_ComboRow<0)
										INSERT IN ARRAY:C227(<>SD_al_CombineGroupDiaries; Size of array:C274(<>SD_al_CombineGroupDiaries)+1; 1)
										<>SD_al_CombineGroupDiaries{Size of array:C274(<>SD_al_CombineGroupDiaries)}:=Abs:C99($_l_ListItemReference-9999)
									End if 
									
								Else 
									$_l_ComboRow:=Find in array:C230(SD2_al_CombineGroupDiaries; (Abs:C99($_l_ListItemReference-9999)))
									If ($_l_ComboRow<0)
										INSERT IN ARRAY:C227(SD2_al_CombineGroupDiaries; Size of array:C274(SD2_al_CombineGroupDiaries)+1; 1)
										SD2_al_CombineGroupDiaries{Size of array:C274(SD2_al_CombineGroupDiaries)}:=Abs:C99($_l_ListItemReference-9999)
									End if 
									
								End if 
							Else 
								SD_abo_IncludeDiaries{$_l_IncludeRow}:=True:C214
								SD_ai_includeDiary{$_l_IncludeRow}:=1
								
							End if 
					End case 
					
				End for 
				If (SD2_l_CallBackProcessID=0)
					$_t_SDProcName:="View SuperDiary"+"-"+<>PER_t_CurrentUserInitials
					$_l_ProcessNumber:=Process number:C372($_t_SDProcName)
					If ($_l_ProcessNumber>0)
						SD3_l_CallActionNum:=13
						SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
						POST OUTSIDE CALL:C329($_l_ProcessNumber)
					End if 
				Else 
					If (SD2_l_UseProcessArrays=1)
						//Pass the elements of the array to the processs
						VARIABLE TO VARIABLE:C635(SD2_l_CallBackProcessID; SD2_al_CombineGroupDiaries; SD2_al_CombineGroupDiaries; SD2_al_CombinePersonDiaries; SD2_al_CombinePersonDiaries; SD2_al_CombineResourceDiaries; SD2_al_CombineResourceDiaries)
					End if 
					SD3_l_CallActionNum:=13
					SET PROCESS VARIABLE:C370(SD2_l_CallBackProcessID; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
					POST OUTSIDE CALL:C329(SD2_l_CallBackProcessID)
				End if 
				//SD2_l_CallBackProcessID
			Else 
				//selected an item
				Case of 
					: ($_l_ListItemReference>0) & ($_l_ListItemReference<9999)  //its a person
						$_l_IncludeRow:=Find in array:C230(SD_al_IncludeItemIDs; $_l_ListItemReference)
						If ($_l_IncludeRow<0)
							INSERT IN ARRAY:C227(SD_abo_IncludeDiaries; Size of array:C274(SD_abo_IncludeDiaries)+1; 1)
							INSERT IN ARRAY:C227(SD_at_includeDiaries; Size of array:C274(SD_at_includeDiaries)+1; 1)
							INSERT IN ARRAY:C227(SD_al_IncludeItemIDs; Size of array:C274(SD_al_IncludeItemIDs)+1; 1)
							INSERT IN ARRAY:C227(SD_ai_includeDiary; Size of array:C274(SD_ai_includeDiary)+1; 1)
							SD_at_includeDiaries{Size of array:C274(SD_at_includeDiaries)}:=$_t_ItemText
							SD_al_IncludeItemIDs{Size of array:C274(SD_al_IncludeItemIDs)}:=$_l_ListItemReference
							SD_ai_includeDiary{Size of array:C274(SD_ai_includeDiary)}:=1
							SD_abo_IncludeDiaries{Size of array:C274(SD_abo_IncludeDiaries)}:=True:C214
							If (SD2_l_UseProcessArrays=0)
								$_l_ComboRow:=Find in array:C230(<>SD_al_CombinePersonDiaries; $_l_ListItemReference)
								If ($_l_ComboRow<0)
									INSERT IN ARRAY:C227(<>SD_al_CombinePersonDiaries; Size of array:C274(<>SD_al_CombinePersonDiaries)+1; 1)
									<>SD_al_CombinePersonDiaries{Size of array:C274(<>SD_al_CombinePersonDiaries)}:=$_l_ListItemReference
								End if 
							Else 
								$_l_ComboRow:=Find in array:C230(SD2_al_CombinePersonDiaries; $_l_ListItemReference)
								If ($_l_ComboRow<0)
									INSERT IN ARRAY:C227(SD2_al_CombinePersonDiaries; Size of array:C274(SD2_al_CombinePersonDiaries)+1; 1)
									SD2_al_CombinePersonDiaries{Size of array:C274(SD2_al_CombinePersonDiaries)}:=$_l_ListItemReference
								End if 
								
							End if 
						Else 
							SD_abo_IncludeDiaries{$_l_IncludeRow}:=True:C214
							SD_ai_includeDiary{$_l_IncludeRow}:=1
							
						End if 
						
						
					: ($_l_ListItemReference>9999)  //its a resource
						$_l_IncludeRow:=Find in array:C230(SD_al_IncludeItemIDs; $_l_ListItemReference)
						If ($_l_IncludeRow<0)
							INSERT IN ARRAY:C227(SD_abo_IncludeDiaries; Size of array:C274(SD_abo_IncludeDiaries)+1; 1)
							INSERT IN ARRAY:C227(SD_at_includeDiaries; Size of array:C274(SD_at_includeDiaries)+1; 1)
							INSERT IN ARRAY:C227(SD_al_IncludeItemIDs; Size of array:C274(SD_al_IncludeItemIDs)+1; 1)
							INSERT IN ARRAY:C227(SD_ai_includeDiary; Size of array:C274(SD_ai_includeDiary)+1; 1)
							SD_at_includeDiaries{Size of array:C274(SD_at_includeDiaries)}:=$_t_ItemText
							SD_al_IncludeItemIDs{Size of array:C274(SD_al_IncludeItemIDs)}:=$_l_ListItemReference
							SD_ai_includeDiary{Size of array:C274(SD_ai_includeDiary)}:=1
							SD_abo_IncludeDiaries{Size of array:C274(SD_abo_IncludeDiaries)}:=True:C214
							If (SD2_l_UseProcessArrays=0)
								$_l_ComboRow:=Find in array:C230(<>SD_al_CombineResourceDiaries; ($_l_ListItemReference-9999))
								If ($_l_ComboRow<0)
									INSERT IN ARRAY:C227(<>SD_al_CombineResourceDiaries; Size of array:C274(<>SD_al_CombineResourceDiaries)+1; 1)
									<>SD_al_CombineResourceDiaries{Size of array:C274(<>SD_al_CombineResourceDiaries)}:=$_l_ListItemReference-9999
								End if 
							Else 
								$_l_ComboRow:=Find in array:C230(SD2_al_CombineResourceDiaries; ($_l_ListItemReference-9999))
								If ($_l_ComboRow<0)
									INSERT IN ARRAY:C227(SD2_al_CombineResourceDiaries; Size of array:C274(SD2_al_CombineResourceDiaries)+1; 1)
									SD2_al_CombineResourceDiaries{Size of array:C274(SD2_al_CombineResourceDiaries)}:=$_l_ListItemReference-9999
								End if 
								
							End if 
						Else 
							SD_abo_IncludeDiaries{$_l_IncludeRow}:=True:C214
							SD_ai_includeDiary{$_l_IncludeRow}:=1
							
						End if 
						
					: ($_l_ListItemReference<0)  //its a group
						$_l_IncludeRow:=Find in array:C230(SD_al_IncludeItemIDs; $_l_ListItemReference)
						If ($_l_IncludeRow<0)
							INSERT IN ARRAY:C227(SD_abo_IncludeDiaries; Size of array:C274(SD_abo_IncludeDiaries)+1; 1)
							
							INSERT IN ARRAY:C227(SD_at_includeDiaries; Size of array:C274(SD_at_includeDiaries)+1; 1)
							INSERT IN ARRAY:C227(SD_al_IncludeItemIDs; Size of array:C274(SD_al_IncludeItemIDs)+1; 1)
							INSERT IN ARRAY:C227(SD_ai_includeDiary; Size of array:C274(SD_ai_includeDiary)+1; 1)
							SD_at_includeDiaries{Size of array:C274(SD_at_includeDiaries)}:=$_t_ItemText
							SD_al_IncludeItemIDs{Size of array:C274(SD_al_IncludeItemIDs)}:=$_l_ListItemReference
							SD_ai_includeDiary{Size of array:C274(SD_ai_includeDiary)}:=1
							SD_abo_IncludeDiaries{Size of array:C274(SD_abo_IncludeDiaries)}:=True:C214
							If (SD2_l_UseProcessArrays=0)
								$_l_ComboRow:=Find in array:C230(<>SD_al_CombineGroupDiaries; Abs:C99($_l_ListItemReference-9999))
								If ($_l_ComboRow<0)
									INSERT IN ARRAY:C227(<>SD_al_CombineGroupDiaries; Size of array:C274(<>SD_al_CombineGroupDiaries)+1; 1)
									<>SD_al_CombineGroupDiaries{Size of array:C274(<>SD_al_CombineGroupDiaries)}:=Abs:C99($_l_ListItemReference-9999)
								End if 
							Else 
								$_l_ComboRow:=Find in array:C230(SD2_al_CombineGroupDiaries; Abs:C99($_l_ListItemReference-9999))
								If ($_l_ComboRow<0)
									INSERT IN ARRAY:C227(SD2_al_CombineGroupDiaries; Size of array:C274(SD2_al_CombineGroupDiaries)+1; 1)
									SD2_al_CombineGroupDiaries{Size of array:C274(SD2_al_CombineGroupDiaries)}:=Abs:C99($_l_ListItemReference-9999)
								End if 
								
							End if 
						Else 
							SD_abo_IncludeDiaries{$_l_IncludeRow}:=True:C214
							SD_ai_includeDiary{$_l_IncludeRow}:=1
							
						End if 
						
				End case 
				//call the diary to update
				If (SD2_l_CallBackProcessID=0)
					$_t_SDProcName:="View SuperDiary"+"-"+<>PER_t_CurrentUserInitials
					$_l_ProcessNumber:=Process number:C372($_t_SDProcName)
					If ($_l_ProcessNumber>0)
						SD3_l_CallActionNum:=13
						SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
						POST OUTSIDE CALL:C329($_l_ProcessNumber)
					End if 
				Else 
					
					If (SD2_l_UseProcessArrays=1)
						//Pass the elements of the array to the processs
						VARIABLE TO VARIABLE:C635(SD2_l_CallBackProcessID; SD2_al_CombineGroupDiaries; SD2_al_CombineGroupDiaries; SD2_al_CombinePersonDiaries; SD2_al_CombinePersonDiaries; SD2_al_CombineResourceDiaries; SD2_al_CombineResourceDiaries)
						
						
					End if 
					SD3_l_CallActionNum:=13
					SET PROCESS VARIABLE:C370(SD2_l_CallBackProcessID; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
					POST OUTSIDE CALL:C329(SD2_l_CallBackProcessID)
				End if 
				
			End if 
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ:SD_MultDiary,SD2_lb_Persons"; $_t_oldMethodName)

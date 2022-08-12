If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.oProbTypesPopup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SC_al_ProblemTypeIdsTemp;0)
	//ARRAY LONGINT(SD2_al_ProblemTypeIDs;0)
	ARRAY TEXT:C222($_at_DiaryCodes; 0)
	//ARRAY TEXT(SC_at_ProblemTypes;0)
	//ARRAY TEXT(SD_at_ProblemTypeActions;0)
	//ARRAY TEXT(SD2_at_ProblemTypeNames;0)
	C_BOOLEAN:C305($_bo_Expanded; DB_bo_RecordModified)
	C_LONGINT:C283($_l_Index; $_l_ItemReference; $_l_ProblemIDRow; $_l_ProblemTypeRow; $_l_SelectedItemParent; $_l_SelectedListItem; $_l_SublistID; SC_l_problemtypes)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.oProbTypesPopup"; Form event code:C388)
$_l_SelectedListItem:=Selected list items:C379(SC_l_problemtypes)
If ($_l_SelectedListItem>0)
	ARRAY TEXT:C222($_at_DiaryCodes; 0)
	GET LIST ITEM:C378(SC_l_problemtypes; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
	If ($_l_ItemReference<0)
		$_l_ProblemTypeRow:=Find in array:C230(SC_al_ProblemTypeIdsTemp; Abs:C99($_l_ItemReference))
		If ($_l_ProblemTypeRow>0)  //it should be
			[SERVICE_CALLS:20]Problem_Code:14:=SC_at_ProblemTypes{$_l_ProblemTypeRow}
			QUERY:C277([PROBLEMS:22]; [PROBLEMS:22]Problem_Code:1=[SERVICE_CALLS:20]Problem_Code:14)
			[SERVICE_CALLS:20]x_ProblemTypeID:30:=[PROBLEMS:22]ProblemTypeID:3
			$_l_SelectedItemParent:=List item parent:C633(SC_at_problemtypes; $_l_ItemReference)
			If ($_l_SelectedItemParent>0)
				
				$_l_ProblemIDRow:=Find in array:C230(SD2_al_ProblemTypeIDs; $_l_SelectedItemParent)
				If ($_l_ProblemIDRow>0)
					[SERVICE_CALLS:20]x_ProblemTypeName:31:=SD2_at_ProblemTypeNames{$_l_ProblemIDRow}
					//this is a defined problem type
					For ($_l_Index; 1; Size of array:C274(SD_at_ProblemTypeActions{$_l_ProblemIDRow}))
						APPEND TO ARRAY:C911($_at_DiaryCodes; SD_at_ProblemTypeActions{$_l_ProblemIDRow}{$_l_Index})
						
					End for 
					
				End if 
				
			End if 
		End if 
		
		If (Size of array:C274($_at_DiaryCodes)>0)
			//Note that theses are the header items so get updated automatically
			//this will transfer the problem description into the diary items and create 'n' actions-all of which will get their appropriate properties
			For ($_l_Index; 1; Size of array:C274($_at_DiaryCodes))
				SC_CreateDiaryItem([SERVICE_CALLS:20]Call_Code:4; $_at_DiaryCodes{$_l_Index})
				
			End for 
			//And update the arrays
		End if 
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[SERVICE_CALLS:20]Priority:10)
		
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.oProbTypesPopup"; $_t_oldMethodName)

//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      FurthFld Arr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 14:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_2dDisplayasComment; 0; 0)
	ARRAY BOOLEAN:C223($_abo_DisplayasComment; 0)
	ARRAY INTEGER:C220($_ai_Sort; 0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableRecordNameField;0)
	ARRAY LONGINT:C221($_al_CommentSort; 0)
	//ARRAY LONGINT(FUR_al_FFTableRef;0)
	//ARRAY TEXT(<>FUR_at_2dCustomFieldFormat;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	ARRAY TEXT:C222($_at_CommentFDCode; 0)
	ARRAY TEXT:C222($_at_CommentLabels; 0)
	ARRAY TEXT:C222($_at_DefinitionCodes; 0)
	ARRAY TEXT:C222($_at_FDC; 0)
	ARRAY TEXT:C222($_at_FPA; 0)
	C_LONGINT:C283($_l_DefinitionCodeRow; $_l_index; $_l_RecordsInselection; $_l_Ref; $_l_TableNumber; $1)
	C_POINTER:C301($_Ptr_ReturnFFList; $_Ptr_ReturnFFNames; $_Ptr_ReturnFFshowComment; $_Ptr_ReturnFFTypes; $_Ptr_ReturnParentTableNum; $_Ptr_ReturnShowCommentList; $_Ptr_ReturnShowCommentListID; $_ptr_ReturnTableRef; $2; $3; $4)
	C_POINTER:C301($5; $6; $7; $8; $9)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_AccessCode; $_t_AccessType; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFld Arr")
//FurthFld Arr

If (True:C214)
	If (Count parameters:C259>=1)
		$_l_TableNumber:=$1
		
		If (Count parameters:C259>=9)
			$_ptr_ReturnTableRef:=$2
			$_Ptr_ReturnFFNames:=$3  //2d array
			$_Ptr_ReturnFFList:=$4  //2d array
			$_Ptr_ReturnFFTypes:=$5  //2d array
			$_Ptr_ReturnFFshowComment:=$6  //2d array
			$_Ptr_ReturnShowCommentListID:=$7
			$_Ptr_ReturnShowCommentList:=$8
			$_Ptr_ReturnParentTableNum:=$9
			$_l_Ref:=Find in array:C230($_Ptr_ReturnParentTableNum->; $_l_TableNumber)
			If ($_l_Ref<0)
				APPEND TO ARRAY:C911($_Ptr_ReturnParentTableNum->; $_l_TableNumber)
				APPEND TO ARRAY:C911($_ptr_ReturnTableRef->; <>SYS_al_TableRecordNameField{$_l_TableNumber})
				$_l_Ref:=Size of array:C274(FUR_al_FFTableRef)
				INSERT IN ARRAY:C227($_Ptr_ReturnFFNames->; $_l_Ref+1; 1)  //<>FUR_at_CustomFieldNames
				INSERT IN ARRAY:C227($_Ptr_ReturnFFList->; $_l_Ref+1; 1)  //<>FUR_at_2dCustomFieldFormat
				INSERT IN ARRAY:C227($_Ptr_ReturnFFTypes->; $_l_Ref+1; 1)  //<>FUR_at_2dCustomFieldFormat
				INSERT IN ARRAY:C227($_Ptr_ReturnFFshowComment->; $_l_Ref+1; 1)  //<>FUR_at_2dCustomFieldFormat
				
			End if 
			
		Else 
			$_l_Ref:=Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)
			
			$_Ptr_ReturnFFNames:=-><>FUR_at_CustomFieldNames  //2d array
			$_Ptr_ReturnFFList:=-><>FUR_at_2dCustomFieldFormat  //2d array
			$_Ptr_ReturnFFTypes:=-><>FUR_at_CustomFieldTypes  //2d array
			ARRAY BOOLEAN:C223($_abo_2dDisplayasComment; $_l_Ref; 0)
			$_Ptr_ReturnFFshowComment:=->$_abo_2dDisplayasComment  //2d array
			$_Ptr_ReturnShowCommentListID:=->$_at_CommentFDCode
			$_Ptr_ReturnShowCommentList:=->$_at_CommentLabels
			
			
		End if 
		$_l_TableNumber:=<>DB_al_TableNums{Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)}
		
		
		
		QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3=$_l_TableNumber)
		If (Records in selection:C76([CUSTOM_FIELD_DEFINITiONS:99])>0)
			$_t_AccessCode:=Str LeadZeros(String:C10($_l_TableNumber); 3)+Str_TrailSpaces(<>PER_t_CurrentUserInitials; 5)+"@"
			
			QUERY:C277([CUSTOM_FIELDS_PERSONNEL:100]; [CUSTOM_FIELDS_PERSONNEL:100]Table_Personnel_Access:1=$_t_AccessCode)
			$_l_RecordsInselection:=Records in selection:C76([CUSTOM_FIELDS_PERSONNEL:100])
			If ($_l_RecordsInselection>0)
				// Join_SelFast (»[FIELD DEF PERS];»[FIELD DEF PERS]FD Code
				//;»[FIELD DEFS];»[FIELD DEFS]FD Code)
				ARRAY TEXT:C222($_at_FPA; 0)
				ARRAY TEXT:C222($_at_FDC; 0)
				SELECTION TO ARRAY:C260([CUSTOM_FIELDS_PERSONNEL:100]Table_Personnel_Access:1; $_at_FPA; [CUSTOM_FIELDS_PERSONNEL:100]FD_Code:2; $_at_FDC)
				
				QUERY WITH ARRAY:C644([CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1; $_at_FDC)
				
				
			End if 
			
			ARRAY TEXT:C222($_at_DefinitionCodes; 0)
			ARRAY INTEGER:C220($_ai_Sort; 0)
			SELECTION TO ARRAY:C260([CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2; $_Ptr_ReturnFFNames->{$_l_Ref}; [CUSTOM_FIELD_DEFINITiONS:99]List_Name:5; $_Ptr_ReturnFFList->{$_l_Ref}; [CUSTOM_FIELD_DEFINITiONS:99]Type:6; $_Ptr_ReturnFFTypes->{$_l_Ref}; [CUSTOM_FIELD_DEFINITiONS:99]Sort_Order:4; $_ai_Sort; [CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1; $_at_DefinitionCodes; [CUSTOM_FIELD_DEFINITiONS:99]DisplayAsComment:8; $_Ptr_ReturnFFshowComment->{$_l_Ref})
			
			SORT ARRAY:C229($_ai_Sort; $_Ptr_ReturnFFNames->{$_l_Ref}; $_Ptr_ReturnFFList->{$_l_Ref}; $_Ptr_ReturnFFTypes->{$_l_Ref}; $_at_DefinitionCodes; $_Ptr_ReturnFFshowComment->{$_l_Ref}; >)
			//ARRAY INTEGER($_ai_Sort;0)
			
			If ($_l_RecordsInselection>0)  //set Type to store RO states
				For ($_l_index; 1; $_l_RecordsInselection)
					$_t_AccessType:=Substring:C12($_at_FPA{$_l_index}; 9; 1)
					If ($_t_AccessType="3")  //read only
						$_l_DefinitionCodeRow:=Find in array:C230($_at_DefinitionCodes; $_at_FDC{$_l_index})
						If ($_l_DefinitionCodeRow>0)
							$_Ptr_ReturnFFTypes->{$_l_Ref}{$_l_DefinitionCodeRow}:=$_Ptr_ReturnFFTypes->{$_l_Ref}{$_l_DefinitionCodeRow}+"-"
						End if 
					End if 
				End for 
			End if 
			ARRAY TEXT:C222($_at_CommentLabels; 0)
			ARRAY TEXT:C222($_at_CommentFDCode; 0)
			ARRAY LONGINT:C221($_al_CommentSort; 0)
			For ($_l_index; Size of array:C274($_Ptr_ReturnFFshowComment->{$_l_Ref}); 1; -1)
				If ($_Ptr_ReturnFFshowComment->{$_l_Ref}{$_l_index})
					APPEND TO ARRAY:C911($_at_CommentLabels; $_Ptr_ReturnFFNames->{$_l_Ref}{$_l_index})
					APPEND TO ARRAY:C911($_al_CommentSort; $_ai_Sort{$_l_index})
					APPEND TO ARRAY:C911($_at_CommentFDCode; $_at_DefinitionCodes{$_l_index})
					//DELETE FROM ARRAY($_ai_Sort;$_l_index)
					//DELETE FROM ARRAY($_Ptr_ReturnFFNames->{$_l_Ref};$_l_index)
					//DELETE FROM ARRAY($_at_DefinitionCodes;$_l_index)
					//DELETE FROM ARRAY($_Ptr_ReturnFFList->{$_l_Ref};$_l_index)
					//DELETE FROM ARRAY($_Ptr_ReturnFFTypes->{$_l_Ref};$_l_index)
					//DELETE FROM ARRAY($_abo_DisplayasComment;$_l_index)
				End if 
			End for 
			If (Count parameters:C259>=3)
				SORT ARRAY:C229($_al_CommentSort; $_at_CommentFDCode; $_at_CommentLabels)
				COPY ARRAY:C226($_at_CommentFDCode; $_Ptr_ReturnShowCommentListID->)
				COPY ARRAY:C226($_at_CommentLabels; $_Ptr_ReturnShowCommentList->)
			End if 
			
			
		End if 
	End if 
Else 
	If (Count parameters:C259>=1)
		$_l_TableNumber:=$1
		
		If (Count parameters:C259>=8)
			$_ptr_ReturnTableRef:=$2
			$_Ptr_ReturnFFNames:=$3  //2d array
			$_Ptr_ReturnFFList:=$4  //2d array
			$_Ptr_ReturnFFTypes:=$5  //2d array
			$_Ptr_ReturnFFshowComment:=$6  //2d array
			$_Ptr_ReturnShowCommentListID:=$7
			$_Ptr_ReturnShowCommentList:=$8
			$_l_Ref:=Find in array:C230($_ptr_ReturnTableRef->; $_l_TableNumber)
			
		Else 
			$_l_Ref:=Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)
			
			$_Ptr_ReturnFFNames:=-><>FUR_at_CustomFieldNames  //2d array
			$_Ptr_ReturnFFList:=-><>FUR_at_2dCustomFieldFormat  //2d array
			$_Ptr_ReturnFFTypes:=-><>FUR_at_CustomFieldTypes  //2d array
			ARRAY BOOLEAN:C223($_abo_2dDisplayasComment; $_l_Ref; 0)
			$_Ptr_ReturnFFshowComment:=->$_abo_2dDisplayasComment  //2d array
			$_Ptr_ReturnShowCommentListID:=->$_at_CommentFDCode
			$_Ptr_ReturnShowCommentList:=->$_at_CommentLabels
			
			
		End if 
		$_l_TableNumber:=<>DB_al_TableNums{Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)}
		
		
		
		QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3=$_l_TableNumber)
		If (Records in selection:C76([CUSTOM_FIELD_DEFINITiONS:99])>0)
			$_t_AccessCode:=Str LeadZeros(String:C10($_l_TableNumber); 3)+Str_TrailSpaces(<>PER_t_CurrentUserInitials; 5)+"@"
			
			QUERY:C277([CUSTOM_FIELDS_PERSONNEL:100]; [CUSTOM_FIELDS_PERSONNEL:100]Table_Personnel_Access:1=$_t_AccessCode)
			$_l_RecordsInselection:=Records in selection:C76([CUSTOM_FIELDS_PERSONNEL:100])
			If ($_l_RecordsInselection>0)
				// Join_SelFast (»[FIELD DEF PERS];»[FIELD DEF PERS]FD Code
				//;»[FIELD DEFS];»[FIELD DEFS]FD Code)
				ARRAY TEXT:C222($_at_FPA; 0)
				ARRAY TEXT:C222($_at_FDC; 0)
				SELECTION TO ARRAY:C260([CUSTOM_FIELDS_PERSONNEL:100]Table_Personnel_Access:1; $_at_FPA; [CUSTOM_FIELDS_PERSONNEL:100]FD_Code:2; $_at_FDC)
				
				QUERY WITH ARRAY:C644([CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1; $_at_FDC)
				
				
			End if 
			
			ARRAY TEXT:C222($_at_DefinitionCodes; 0)
			ARRAY INTEGER:C220($_ai_Sort; 0)
			//SELECTION TO ARRAY([CUSTOM_FIELD_DEFINITiONS]Field_Name;$_Ptr_ReturnFFNames->{$_l_Ref};[CUSTOM_FIELD_DEFINITiONS]List_Name;$_Ptr_ReturnFFList->{$_l_Ref};
			SELECTION TO ARRAY:C260([CUSTOM_FIELD_DEFINITiONS:99]Type:6; $_Ptr_ReturnFFTypes->{$_l_Ref})
			
			
			//;[CUSTOM_FIELD_DEFINITiONS]Sort_Order;$_ai_Sort;[CUSTOM_FIELD_DEFINITiONS]FD_Code;$_at_DefinitionCodes;[CUSTOM_FIELD_DEFINITiONS]DisplayAsComment;$_Ptr_ReturnFFshowComment->{$_l_Ref})
			SORT ARRAY:C229($_ai_Sort; $_Ptr_ReturnFFNames->{$_l_Ref}; $_Ptr_ReturnFFList->{$_l_Ref}; $_Ptr_ReturnFFTypes->{$_l_Ref}; $_at_DefinitionCodes; $_Ptr_ReturnFFshowComment->{$_l_Ref}; >)
			//ARRAY INTEGER($_ai_Sort;0)
			
			If ($_l_RecordsInselection>0)  //set Type to store RO states
				For ($_l_index; 1; $_l_RecordsInselection)
					$_t_AccessType:=Substring:C12($_at_FPA{$_l_index}; 9; 1)
					If ($_t_AccessType="3")  //read only
						$_l_DefinitionCodeRow:=Find in array:C230($_at_DefinitionCodes; $_at_FDC{$_l_index})
						If ($_l_DefinitionCodeRow>0)
							$_Ptr_ReturnFFTypes->{$_l_Ref}{$_l_DefinitionCodeRow}:=$_Ptr_ReturnFFTypes->{$_l_Ref}{$_l_DefinitionCodeRow}+"-"
						End if 
					End if 
				End for 
			End if 
			ARRAY TEXT:C222($_at_CommentLabels; 0)
			ARRAY TEXT:C222($_at_CommentFDCode; 0)
			ARRAY LONGINT:C221($_al_CommentSort; 0)
			For ($_l_index; Size of array:C274($_Ptr_ReturnFFshowComment->{$_l_Ref}); 1; -1)
				If ($_Ptr_ReturnFFshowComment->{$_l_Ref}{$_l_index})
					APPEND TO ARRAY:C911($_at_CommentLabels; $_Ptr_ReturnFFNames->{$_l_Ref}{$_l_index})
					APPEND TO ARRAY:C911($_al_CommentSort; $_ai_Sort{$_l_index})
					APPEND TO ARRAY:C911($_at_CommentFDCode; $_at_DefinitionCodes{$_l_index})
					//DELETE FROM ARRAY($_ai_Sort;$_l_index)
					//DELETE FROM ARRAY($_Ptr_ReturnFFNames->{$_l_Ref};$_l_index)
					//DELETE FROM ARRAY($_at_DefinitionCodes;$_l_index)
					//DELETE FROM ARRAY($_Ptr_ReturnFFList->{$_l_Ref};$_l_index)
					//DELETE FROM ARRAY($_Ptr_ReturnFFTypes->{$_l_Ref};$_l_index)
					//DELETE FROM ARRAY($_abo_DisplayasComment;$_l_index)
				End if 
			End for 
			If (Count parameters:C259>=3)
				SORT ARRAY:C229($_al_CommentSort; $_at_CommentFDCode; $_at_CommentLabels)
				COPY ARRAY:C226($_at_CommentFDCode; $_Ptr_ReturnShowCommentListID->)
				COPY ARRAY:C226($_at_CommentLabels; $_Ptr_ReturnShowCommentList->)
			End if 
			
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("FurthFld Arr"; $_t_oldMethodName)
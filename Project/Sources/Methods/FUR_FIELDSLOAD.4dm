//%attributes = {}
If (False:C215)
	//Project Method Name:      FUR_FIELDSLOAD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(FUR_abo_2DShowasComment;0;0)
	//ARRAY BOOLEAN(FUR_abo_ShowAsComment;0)
	ARRAY DATE:C224($_ad_FieldDataDate; 0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableRecordNameField;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	ARRAY LONGINT:C221($_al_CommentSort; 0)
	//ARRAY LONGINT(FUR_al_FFTableRef;0)
	//ARRAY LONGINT(FUR_al_FFTyes;0;0)
	//ARRAY LONGINT(FUR_al_FFTypes;0)
	//ARRAY LONGINT(FUR_at_ParentTableNum;0)
	ARRAY REAL:C219($_ar_FieldDataReal; 0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	ARRAY TEXT:C222($_at_CommentFDCode; 0)
	ARRAY TEXT:C222($_at_CommentLabel; 0)
	ARRAY TEXT:C222($_at_CommentLabels; 0)
	ARRAY TEXT:C222($_at_FieldDataString; 0)
	ARRAY TEXT:C222($_at_FieldDataText; 0)
	ARRAY TEXT:C222($_at_FieldName; 0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(FUR_at_2DCustomCommentList;0;0)
	//ARRAY TEXT(FUR_at_2dCustomFieldFormat;0;0)
	//ARRAY TEXT(FUR_at_2DCustomFieldNames;0)
	//ARRAY TEXT(FUR_at_2DCustomFieldTypes;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305($_bo_Coded; FUR_bo_Inited; vAutoFind)
	C_LONGINT:C283($_l_ArraySize; $_l_CustomFieldPosition; $_l_index; $_l_Ref; $_l_Response; $_l_TableNumber; $_l_TablePosition; $0; MOD_l_CurrentModuleAccess)
	C_POINTER:C301($_Ptr_FieldReference; $_Ptr_ReturnFFNames; $_ptr_UniqueFIeld; $1; $2; $3)
	C_TEXT:C284($_t_CustomFieldType; $_t_LayoutIdent; $_t_oldMethodName; $_t_Semaphore; $_t_TableNumStr; $layout; $layout2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FUR_FIELDSLOAD")

CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "FUR_FFSelection")
ARRAY TEXT:C222($_at_CommentFDCode; 0)
ARRAY TEXT:C222($_at_CommentLabel; 0)

$_l_Response:=-1
If (Count parameters:C259>=1)
	$_l_Response:=0
	$_l_TableNumber:=Table:C252($1)
	$_l_TablePosition:=Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)
	If (FUR_FieldsAvailable($1))
		$_ptr_UniqueFIeld:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
		$_t_TableNumStr:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
		$_t_Semaphore:="ALFF"+$_t_TableNumStr+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
		If (Type:C295($_ptr_UniqueFIeld->)=9)
			$_t_LayoutIdent:=String:C10($_ptr_UniqueFIeld->)
			$_bo_Coded:=($_t_LayoutIdent#"0")
		Else 
			$_t_LayoutIdent:=$_ptr_UniqueFIeld->
			$_bo_Coded:=($_t_LayoutIdent#"")
		End if 
		//$_bo_Coded:=TRUE
		If (Not:C34(FUR_bo_Inited))
			//SORT ARRAY($aSort;<>FUR_at_CustomFieldNames{$ref};<>FUR_at_2dCustomFieldFormat{$ref};<>FUR_at_CustomFieldTypes{$ref};$aFD;$_abo_DisplayasComment;>)
			ARRAY LONGINT:C221(FUR_at_ParentTableNum; 0)
			ARRAY TEXT:C222(FUR_at_2DCustomFieldNames; 0; 0)  //<>FUR_at_CustomFieldNames
			ARRAY TEXT:C222(FUR_at_2dCustomFieldFormat; 0; 0)  //<>FUR_at_2dCustomFieldFormat
			ARRAY TEXT:C222(FUR_at_2DCustomFieldTypes; 0; 0)  //<>FUR_at_CustomFieldTypes
			ARRAY BOOLEAN:C223(FUR_abo_2DShowasComment; 0; 0)
			ARRAY LONGINT:C221(FUR_al_FFTableRef; 0)
			ARRAY TEXT:C222(FUR_at_2DCustomCommentList; 0; 0)
			FUR_bo_Inited:=True:C214
		End if 
		$_l_Ref:=Find in array:C230(FUR_at_ParentTableNum; $_l_TableNumber)
		If ($_l_Ref<0)
			APPEND TO ARRAY:C911(FUR_at_ParentTableNum; $_l_TableNumber)
			APPEND TO ARRAY:C911(FUR_al_FFTableRef; <>SYS_al_TableRecordNameField{$_l_TableNumber})
			$_l_Ref:=Size of array:C274(FUR_al_FFTableRef)
			INSERT IN ARRAY:C227(FUR_at_2DCustomFieldNames; Size of array:C274(FUR_at_2DCustomFieldNames)+1; 1)  //<>FUR_at_CustomFieldNames
			INSERT IN ARRAY:C227(FUR_at_2dCustomFieldFormat; Size of array:C274(FUR_at_2dCustomFieldFormat)+1; 1)  //<>FUR_at_2dCustomFieldFormat
			INSERT IN ARRAY:C227(FUR_at_2DCustomFieldTypes; Size of array:C274(FUR_at_2DCustomFieldTypes)+1; 1)  //<>FUR_at_2dCustomFieldFormat
			INSERT IN ARRAY:C227(FUR_abo_2DShowasComment; Size of array:C274(FUR_abo_2DShowasComment)+1; 1)  //<>FUR_at_2dCustomFieldFormat
			INSERT IN ARRAY:C227(FUR_at_2DCustomCommentList; Size of array:C274(FUR_at_2DCustomCommentList)+1; 1)  //<>FUR_at_2dCustomFieldFormat
			
			
		End if 
		//TRACE
		If ($_bo_Coded) | (True:C214)
			$layout:=$_t_TableNumStr+$_t_LayoutIdent
			If (<>SYS_al_TableRecordNameField{$_l_TableNumber}#0)
				$_Ptr_FieldReference:=Field:C253($_l_TableNumber; <>SYS_al_TableRecordNameField{$_l_TableNumber})
				$_t_LayoutIdent:=$_t_LayoutIdent+"   "+$_Ptr_FieldReference->
			End if 
			$layout2:=Uppers2(Lowercase:C14(<>DB_at_TableNames{$_l_TablePosition}))
			vTitle:=<>DB_at_TableNames{$_l_TablePosition}+" FURTHER FIELD VALUES"
			If (Size of array:C274(FUR_at_2DCustomFieldNames{$_l_Ref})=0)
				FurthFld_Arr($_l_TableNumber; ->FUR_al_FFTableRef; ->FUR_at_2DCustomFieldNames; ->FUR_at_2dCustomFieldFormat; ->FUR_at_2DCustomFieldTypes; ->FUR_abo_2DShowasComment; ->$_at_CommentFDCode; ->$_at_CommentLabel; ->FUR_at_ParentTableNum)
				ARRAY TEXT:C222($_at_CommentFDCode; 0)
				ARRAY LONGINT:C221($_al_CommentSort; 0)
				For ($_l_index; Size of array:C274(FUR_abo_2DShowasComment{$_l_Ref}); 1; -1)
					If (FUR_abo_2DShowasComment{$_l_Ref}{$_l_index})
						//APPEND TO ARRAY($_at_CommentLabel;$_Ptr_ReturnFFNames->{$_l_Ref}{$_l_index})
						APPEND TO ARRAY:C911($_al_CommentSort; $_al_CommentSort{$_l_index})
						APPEND TO ARRAY:C911($_at_CommentFDCode; $_at_CommentFDCode{$_l_index})
					End if 
				End for 
				
			Else 
				ARRAY TEXT:C222($_at_CommentLabel; 0)
				ARRAY TEXT:C222($_at_CommentFDCode; 0)
				ARRAY LONGINT:C221($_al_CommentSort; 0)
				For ($_l_index; Size of array:C274(FUR_abo_2DShowasComment{$_l_Ref}); 1; -1)
					If (FUR_abo_2DShowasComment{$_l_Ref}{$_l_index})
						APPEND TO ARRAY:C911($_at_CommentLabel; $_Ptr_ReturnFFNames->{$_l_Ref}{$_l_index})
						APPEND TO ARRAY:C911($_al_CommentSort; $_al_CommentSort{$_l_index})
						APPEND TO ARRAY:C911($_at_CommentFDCode; $_at_CommentFDCode{$_l_index})
						//DELETE FROM ARRAY($aSort;$_l_index)
						//DELETE FROM ARRAY($_Ptr_ReturnFFNames->{$_l_Ref};$_l_index)
						//DELETE FROM ARRAY($aFD;$_l_index)
						//DELETE FROM ARRAY($_Ptr_ReturnFFList->{$_l_Ref};$_l_index)
						//DELETE FROM ARRAY($_Ptr_ReturnFFTypes->{$_l_Ref};$_l_index)
						//DELETE FROM ARRAY($_abo_DisplayasComment;$_l_index)
					End if 
				End for 
				If (Count parameters:C259>=3)
					SORT ARRAY:C229($_al_CommentSort; $_at_CommentFDCode; $_at_CommentLabels)
				End if 
				
			End if 
			
			If (Size of array:C274($_at_CommentFDCode)>0)
				If (Count parameters:C259>=3)
					COPY ARRAY:C226($_at_CommentFDCode; $2->)
					COPY ARRAY:C226($_at_CommentLabel; $3->)
					
				End if 
			End if 
			FurthFld_ArrZer
			$_l_ArraySize:=Size of array:C274(FUR_at_2DCustomFieldNames{$_l_Ref})
			COPY ARRAY:C226(FUR_at_2DCustomFieldNames{$_l_Ref}; FUR_at_CustomFieldNames)
			COPY ARRAY:C226(FUR_at_2dCustomFieldFormat{$_l_Ref}; FUR_at_CustomFieldFormat)
			COPY ARRAY:C226(FUR_at_2DCustomFieldTypes{$_l_Ref}; FUR_at_CustomFieldTypes)
			COPY ARRAY:C226(FUR_abo_2DShowasComment{$_l_Ref}; FUR_abo_ShowAsComment)
			For ($_l_index; Size of array:C274(FUR_abo_ShowAsComment); 1; -1)
				If (FUR_abo_ShowAsComment{$_l_index})
					DELETE FROM ARRAY:C228(FUR_at_CustomFieldNames; $_l_index)
					DELETE FROM ARRAY:C228(FUR_at_CustomFieldFormat; $_l_index)
					DELETE FROM ARRAY:C228(FUR_at_CustomFieldTypes; $_l_index)
					DELETE FROM ARRAY:C228(FUR_abo_ShowAsComment; $_l_index)
				End if 
			End for 
			$_l_ArraySize:=Size of array:C274(FUR_at_CustomFieldNames)
			
			
			If ($_l_ArraySize#0)
				If (Test semaphore:C652($_t_Semaphore))
					vAutoFind:=False:C215  //Read Only
				Else 
					If (MOD_l_CurrentModuleAccess=3)
						vAutoFind:=False:C215
					Else 
						vAutoFind:=True:C214  //Read Write
						READ WRITE:C146([CUSTOM_FIELDS:98])
					End if 
				End if 
				If ($_bo_Coded)
					QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Unique_Code:2=$layout)
					QUERY SELECTION WITH ARRAY:C1050([CUSTOM_FIELDS:98]Field_Name:3; FUR_at_CustomFieldNames)
					QUERY SELECTION:C341([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Deleted:8=0)
					
				Else 
					REDUCE SELECTION:C351([CUSTOM_FIELDS:98]; 0)
				End if 
				CREATE SET:C116([CUSTOM_FIELDS:98]; "FUR_FFSelection")
				
				ARRAY TEXT:C222($_at_FieldName; 0)
				ARRAY TEXT:C222($_at_FieldDataString; 0)  //NG November 2004...changed to allow longer values in String 31(NOTE NOT CHANGING FIELD NAME)
				ARRAY REAL:C219($_ar_FieldDataReal; 0)
				ARRAY TEXT:C222($_at_FieldDataText; 0)
				ARRAY DATE:C224($_ad_FieldDataDate; 0)
				
				
				ARRAY TEXT:C222(CUS_at_DisplayedData; $_l_ArraySize)
				
				For ($_l_Index; 1; $_l_ArraySize)  //clear the arr first
					CUS_at_DisplayedData{$_l_Index}:=""
				End for 
				
				If (Records in selection:C76([CUSTOM_FIELDS:98])#0)
					SELECTION TO ARRAY:C260([CUSTOM_FIELDS:98]Field_Name:3; $_at_FieldName; [CUSTOM_FIELDS:98]String_31:4; $_at_FieldDataString; [CUSTOM_FIELDS:98]Real_or_Integer:5; $_ar_FieldDataReal; [CUSTOM_FIELDS:98]Text_Field:6; $_at_FieldDataText; [CUSTOM_FIELDS:98]Date_Field:7; $_ad_FieldDataDate)
					$_l_ArraySize:=Size of array:C274($_at_FieldName)
					For ($_l_Index; 1; $_l_ArraySize)
						$_l_CustomFieldPosition:=Find in array:C230(FUR_at_CustomFieldNames; $_at_FieldName{$_l_Index})
						If ($_l_CustomFieldPosition>0)
							$_t_CustomFieldType:=Substring:C12(FUR_at_CustomFieldTypes{$_l_CustomFieldPosition}; 1; 1)
							Case of 
								: ($_t_CustomFieldType="T")
									CUS_at_DisplayedData{$_l_CustomFieldPosition}:=$_at_FieldDataText{$_l_Index}
								: ($_t_CustomFieldType="N")
									CUS_at_DisplayedData{$_l_CustomFieldPosition}:=String:C10($_ar_FieldDataReal{$_l_Index}; FUR_at_CustomFieldFormat{$_l_CustomFieldPosition})
								: ($_t_CustomFieldType="D")
									CUS_at_DisplayedData{$_l_CustomFieldPosition}:=String:C10($_ad_FieldDataDate{$_l_Index}; FUR_at_CustomFieldFormat{$_l_CustomFieldPosition})
								Else 
									CUS_at_DisplayedData{$_l_CustomFieldPosition}:=$_at_FieldDataString{$_l_Index}
							End case 
						End if 
					End for 
				End if 
				
				$_l_Response:=0
				
			Else 
				$_l_Response:=3
				//Gen_Alert ("No Further Fields have been defined for "+$layout2;"Cancel")
			End if 
		Else 
			$_l_Response:=2
			//Gen_Alert ("Further Fields cannot be accessed unless the Unique Code is filled in";"Cancel")
		End if 
	Else 
		$_l_Response:=1
		//Gen_Alert ("Further Fields cannot be used with this File";"Cancel")
	End if 
End if 
$0:=$_l_Response
ERR_MethodTrackerReturn("FUR_FIELDSLOAD"; $_t_oldMethodName)
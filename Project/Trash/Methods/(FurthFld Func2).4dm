//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      FurthFld Func2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 19:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_DateData; 0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableRecordNameField;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	ARRAY REAL:C219($_ar_NumberData; 0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>FUR_at_2dCustomFieldFormat;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	ARRAY TEXT:C222($_at_AlphaData; 0)
	ARRAY TEXT:C222($_at_FieldNames; 0)
	ARRAY TEXT:C222($_at_TextData; 0)
	ARRAY TEXT:C222($_at_UniqueCode; 0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305($_bo_AutoFind; $_bo_Coded; $_bo_Delete; $_bo_Modified; DB_bo_RecordModified; vAutoFind)
	C_LONGINT:C283($_l_CurrentRow; $_l_Error; $_l_Index; $_l_RecordsinSelection; $_l_SizeofArray; $_l_SizeofArray2; $_l_TableNumber; $_l_TableRow; bd35; MOD_l_CurrentModuleAccess)
	C_POINTER:C301($_ptr_Field; $1)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_CurrentFormUsage2; $_t_CurrentFormUsage3; $_t_CurrentInputForm; $_t_DataType; $_t_oldMethodName; $_t_RecordID; $_t_SemaphoreName; $_t_TableName; $_t_TableNumAsString; $_t_Title)
	C_TEXT:C284($_t_UniqueCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vTitle; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFld Func2")
//FurthFld Func2
//TRACE
Load_Fields


If ((DB_GetModuleSettingByNUM(1))#5)
	bd35:=0
	$_bo_AutoFind:=vAutoFind
	$_bo_Modified:=DB_bo_RecordModified
	$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
	$_t_CurrentFormUsage2:=DB_t_CurrentFormUsage2
	$_t_CurrentFormUsage3:=DB_t_CurrentFormUsage3
	$_t_Title:=vTitle
	//$_l_TableNumber:=Table($1)
	//$_l_TableRow:=Find in array(◊Files_ID;$_l_TableNumber)
	If (True:C214)
		$_l_Error:=FUR_FIELDSLOAD($1)
		
	Else 
		If (FUR_FieldsAvailable($1))
			$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
			$_t_TableNumAsString:=Str LeadZeros(String:C10($_l_TableNumber); 3)
			$_t_SemaphoreName:="ALFF"+$_t_TableNumAsString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
			If (Type:C295($_ptr_Field->)=9)
				DB_t_CurrentFormUsage3:=String:C10($_ptr_Field->)
				$_bo_Coded:=(DB_t_CurrentFormUsage3#"0")
			Else 
				DB_t_CurrentFormUsage3:=$_ptr_Field->
				$_bo_Coded:=(DB_t_CurrentFormUsage3#"")
			End if 
			If ($_bo_Coded)
				DB_t_CurrentFormUsage:=$_t_TableNumAsString+DB_t_CurrentFormUsage3
				If (<>SYS_al_TableRecordNameField{$_l_TableNumber}#0)
					$_Ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableRecordNameField{$_l_TableNumber})
					DB_t_CurrentFormUsage3:=DB_t_CurrentFormUsage3+"   "+$_Ptr_Field->
				End if 
				DB_t_CurrentFormUsage2:=Uppers2(Lowercase:C14(<>DB_at_TableNames{$_l_TableRow}))
				vTitle:=<>DB_at_TableNames{$_l_TableRow}+" FURTHER FIELD VALUES"
				If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})=0)
					FurthFld_Arr($_l_TableNumber)
				End if 
				$_l_SizeofArray:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})
				If ($_l_SizeofArray#0)
					If (Semaphore:C143($_t_SemaphoreName))
						vAutoFind:=False:C215  //Read Only
					Else 
						If (MOD_l_CurrentModuleAccess=3)
							vAutoFind:=False:C215
						Else 
							vAutoFind:=True:C214  //Read Write
							READ WRITE:C146([CUSTOM_FIELDS:98])
						End if 
					End if 
					QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Unique_Code:2=DB_t_CurrentFormUsage)
					FurthFld_ArrZer
					ARRAY TEXT:C222($_at_FieldNames; 0)
					ARRAY TEXT:C222($_at_AlphaData; 0)  //NG November 2004...changed to allow longer values in String 31(NOTE NOT CHANGING FIELD NAME)
					ARRAY REAL:C219($_ar_NumberData; 0)
					ARRAY TEXT:C222($_at_TextData; 0)
					ARRAY DATE:C224($_ad_DateData; 0)
					
					COPY ARRAY:C226(<>FUR_at_CustomFieldNames{$_l_TableRow}; FUR_at_CustomFieldNames)
					COPY ARRAY:C226(<>FUR_at_2dCustomFieldFormat{$_l_TableRow}; FUR_at_CustomFieldFormat)
					COPY ARRAY:C226(<>FUR_at_CustomFieldTypes{$_l_TableRow}; FUR_at_CustomFieldTypes)
					ARRAY TEXT:C222(CUS_at_DisplayedData; $_l_SizeofArray)
					
					For ($_l_Index; 1; $_l_SizeofArray)  //clear the arr first
						CUS_at_DisplayedData{$_l_Index}:=""
					End for 
					
					If (Records in selection:C76([CUSTOM_FIELDS:98])#0)
						SELECTION TO ARRAY:C260([CUSTOM_FIELDS:98]Field_Name:3; $_at_FieldNames; [CUSTOM_FIELDS:98]String_31:4; $_at_AlphaData; [CUSTOM_FIELDS:98]Real_or_Integer:5; $_ar_NumberData; [CUSTOM_FIELDS:98]Text_Field:6; $_at_TextData; [CUSTOM_FIELDS:98]Date_Field:7; $_ad_DateData)
						$_l_SizeofArray2:=Size of array:C274($_at_FieldNames)
						For ($_l_Index; 1; $_l_SizeofArray2)
							$_l_CurrentRow:=Find in array:C230(FUR_at_CustomFieldNames; $_at_FieldNames{$_l_Index})
							If ($_l_CurrentRow>0)
								$_t_DataType:=Substring:C12(FUR_at_CustomFieldTypes{$_l_CurrentRow}; 1; 1)
								Case of 
									: ($_t_DataType="T")
										CUS_at_DisplayedData{$_l_CurrentRow}:=$_at_TextData{$_l_Index}
									: ($_t_DataType="N")
										CUS_at_DisplayedData{$_l_CurrentRow}:=String:C10($_ar_NumberData{$_l_Index}; FUR_at_CustomFieldFormat{$_l_CurrentRow})
									: ($_t_DataType="D")
										CUS_at_DisplayedData{$_l_CurrentRow}:=String:C10($_ad_DateData{$_l_Index}; FUR_at_CustomFieldFormat{$_l_CurrentRow})
									Else 
										CUS_at_DisplayedData{$_l_CurrentRow}:=$_at_AlphaData{$_l_Index}
								End case 
							End if 
						End for 
					End if 
					
					$_t_CurrentInputForm:=WIN_t_CurrentInputForm
					WIN_t_CurrentInputForm:="dFurthFld"  //Rollo 12/8/2004
					
					Open_Pro_Window("Further Fields"; 0; 3; ->[CUSTOM_FIELDS:98]; "dFurthFld")  //NG may 2004 added form
					
					DIALOG:C40([CUSTOM_FIELDS:98]; "dFurthFld")
					Close_ProWin
					
					WIN_t_CurrentInputForm:=$_t_CurrentInputForm
					
					If ((OK=1) & (vAutoFind) & (DB_bo_RecordModified))
						//There is no requirement to delete first
						//TRACE
						DELETE SELECTION:C66([CUSTOM_FIELDS:98])
						$_l_RecordsinSelection:=Records in selection:C76([CUSTOM_FIELDS:98])
						ARRAY TEXT:C222($_at_FieldNames; 0)
						ARRAY TEXT:C222($_at_AlphaData; 0)
						ARRAY TEXT:C222($_at_UniqueCode; 0)
						//ARRAY STRING(11;$aFFC;0)
						ARRAY REAL:C219($_ar_NumberData; 0)
						ARRAY TEXT:C222($_at_TextData; 0)
						ARRAY DATE:C224($_ad_DateData; 0)
						$_l_CurrentRow:=0
						For ($_l_Index; 1; $_l_SizeofArray)
							If (CUS_at_DisplayedData{$_l_Index}#"")  //& (Length(FUR_at_CustomFieldTypes{$_l_Index})=1)) `NO! Do have to save even if RO
								$_l_CurrentRow:=$_l_CurrentRow+1
								INSERT IN ARRAY:C227($_at_FieldNames; $_l_CurrentRow; 1)
								INSERT IN ARRAY:C227($_at_AlphaData; $_l_CurrentRow; 1)
								INSERT IN ARRAY:C227($_at_UniqueCode; $_l_CurrentRow; 1)
								//INSERT ELEMENT($aFFC;$_l_CurrentRow;1)
								INSERT IN ARRAY:C227($_ar_NumberData; $_l_CurrentRow; 1)
								INSERT IN ARRAY:C227($_at_TextData; $_l_CurrentRow; 1)
								INSERT IN ARRAY:C227($_ad_DateData; $_l_CurrentRow; 1)
								$_at_UniqueCode{$_l_CurrentRow}:=DB_t_CurrentFormUsage
								// $aFFC{$_l_CurrentRow}:=String(Sequence number(File($_l_TableNumber)»))
								$_at_FieldNames{$_l_CurrentRow}:=FUR_at_CustomFieldNames{$_l_Index}
								$_t_DataType:=Substring:C12(FUR_at_CustomFieldTypes{$_l_Index}; 1; 1)
								Case of 
									: ($_t_DataType="T")
										$_at_TextData{$_l_CurrentRow}:=CUS_at_DisplayedData{$_l_Index}
									: ($_t_DataType="N")
										$_ar_NumberData{$_l_CurrentRow}:=Num:C11(CUS_at_DisplayedData{$_l_Index})
									: ($_t_DataType="D")
										$_ad_DateData{$_l_CurrentRow}:=Date:C102(CUS_at_DisplayedData{$_l_Index})
									Else 
										$_at_AlphaData{$_l_CurrentRow}:=CUS_at_DisplayedData{$_l_Index}
								End case 
							End if 
						End for 
						//$aFFC;[FURTHER FIELDS]FF Code
						If (False:C215)
							If (Size of array:C274($_ad_DateData)<$_l_RecordsinSelection)
								//There will be records to delete
								//$_bo_Delete:=$_l_RecordsinSelection-(Size of array($_ad_DateData))
								CREATE SET:C116([CUSTOM_FIELDS:98]; "$toDelete")
								REDUCE SELECTION:C351([CUSTOM_FIELDS:98]; (Size of array:C274($_ad_DateData)))
								CREATE SET:C116([CUSTOM_FIELDS:98]; "$toKeep")
								DIFFERENCE:C122("$toDelete"; "$toKeep"; "$toDelete")
								USE SET:C118("$toKeep")
								CLEAR SET:C117("$toKeep")
							End if 
						End if 
						ARRAY TO SELECTION:C261($_at_UniqueCode; [CUSTOM_FIELDS:98]Unique_Code:2; $_at_FieldNames; [CUSTOM_FIELDS:98]Field_Name:3; $_at_AlphaData; [CUSTOM_FIELDS:98]String_31:4; $_ar_NumberData; [CUSTOM_FIELDS:98]Real_or_Integer:5; $_at_TextData; [CUSTOM_FIELDS:98]Text_Field:6; $_ad_DateData; [CUSTOM_FIELDS:98]Date_Field:7)
						If (False:C215)
							If (Size of array:C274($_ad_DateData)<$_l_RecordsinSelection)
								USE SET:C118("$toDelete")
								DELETE SELECTION:C66([CUSTOM_FIELDS:98])
								CLEAR SET:C117("$toDelete")
							End if 
							
						End if 
					End if 
					
					FurthFld_ArrZer
					ARRAY TEXT:C222(CUS_at_DisplayedData; 0)
					READ ONLY:C145([CUSTOM_FIELDS:98])
					UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
					CLEAR SEMAPHORE:C144($_t_SemaphoreName)
					
				Else 
					Gen_Alert("No Further Fields have been defined for "+DB_t_CurrentFormUsage2; "Cancel")
				End if 
			Else 
				Gen_Alert("Further Fields cannot be accessed unless the Unique Code is filled in"; "Cancel")
			End if 
		Else 
			Gen_Alert("Further Fields cannot be used with this File"; "Cancel")
		End if 
	End if 
	Case of 
		: ($_l_Error=0)
			$_t_CurrentInputForm:=WIN_t_CurrentInputForm
			WIN_t_CurrentInputForm:="dFurthFld"  //Rollo 12/8/2004
			
			Open_Pro_Window("Further Fields"; 0; 3; ->[CUSTOM_FIELDS:98]; "dFurthFld")  //NG may 2004 added form
			
			DIALOG:C40([CUSTOM_FIELDS:98]; "dFurthFld")
			Close_ProWin
			
			WIN_t_CurrentInputForm:=$_t_CurrentInputForm
			
			If ((OK=1) & (vAutoFind) & (DB_bo_RecordModified))
				//There is no requirement to delete first
				$_l_TableNumber:=Table:C252($1)
				$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)
				$_l_SizeofArray:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})
				$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
				$_t_TableNumAsString:=Str LeadZeros(String:C10($_l_TableNumber); 3)
				If (Type:C295($_ptr_Field->)=9)
					$_t_RecordID:=String:C10($_ptr_Field->)
					$_bo_Coded:=($_t_RecordID#"0")
				Else 
					$_t_RecordID:=$_ptr_Field->
					$_bo_Coded:=($_t_RecordID#"")
				End if 
				$_t_UniqueCode:=$_t_TableNumAsString+$_t_RecordID
				DELETE SELECTION:C66([CUSTOM_FIELDS:98])
				$_l_RecordsinSelection:=Records in selection:C76([CUSTOM_FIELDS:98])
				ARRAY TEXT:C222($_at_FieldNames; 0)
				ARRAY TEXT:C222($_at_AlphaData; 0)
				ARRAY TEXT:C222($_at_UniqueCode; 0)
				//ARRAY STRING(11;$aFFC;0)
				ARRAY REAL:C219($_ar_NumberData; 0)
				ARRAY TEXT:C222($_at_TextData; 0)
				ARRAY DATE:C224($_ad_DateData; 0)
				$_l_CurrentRow:=0
				$_l_TableNumber:=Table:C252($1)
				$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)
				
				$_l_SizeofArray:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableRow})
				
				For ($_l_Index; 1; $_l_SizeofArray)
					If (CUS_at_DisplayedData{$_l_Index}#"")  //& (Length(FUR_at_CustomFieldTypes{$_l_Index})=1)) `NO! Do have to save even if RO
						$_l_CurrentRow:=$_l_CurrentRow+1
						INSERT IN ARRAY:C227($_at_FieldNames; $_l_CurrentRow; 1)
						INSERT IN ARRAY:C227($_at_AlphaData; $_l_CurrentRow; 1)
						INSERT IN ARRAY:C227($_at_UniqueCode; $_l_CurrentRow; 1)
						//INSERT ELEMENT($aFFC;$_l_CurrentRow;1)
						INSERT IN ARRAY:C227($_ar_NumberData; $_l_CurrentRow; 1)
						INSERT IN ARRAY:C227($_at_TextData; $_l_CurrentRow; 1)
						INSERT IN ARRAY:C227($_ad_DateData; $_l_CurrentRow; 1)
						$_at_UniqueCode{$_l_CurrentRow}:=$_t_UniqueCode
						// $aFFC{$_l_CurrentRow}:=String(Sequence number(File($_l_TableNumber)»))
						$_at_FieldNames{$_l_CurrentRow}:=FUR_at_CustomFieldNames{$_l_Index}
						$_t_DataType:=Substring:C12(FUR_at_CustomFieldTypes{$_l_Index}; 1; 1)
						Case of 
							: ($_t_DataType="T")
								$_at_TextData{$_l_CurrentRow}:=CUS_at_DisplayedData{$_l_Index}
							: ($_t_DataType="N")
								$_ar_NumberData{$_l_CurrentRow}:=Num:C11(CUS_at_DisplayedData{$_l_Index})
							: ($_t_DataType="D")
								$_ad_DateData{$_l_CurrentRow}:=Date:C102(CUS_at_DisplayedData{$_l_Index})
							Else 
								$_at_AlphaData{$_l_CurrentRow}:=CUS_at_DisplayedData{$_l_Index}
						End case 
					End if 
				End for 
				//$aFFC;[FURTHER FIELDS]FF Code
				If (False:C215)
					If (Size of array:C274($_ad_DateData)<$_l_RecordsinSelection)
						//There will be records to delete
						//$_bo_Delete:=$_l_RecordsinSelection-(Size of array($_ad_DateData))
						CREATE SET:C116([CUSTOM_FIELDS:98]; "$toDelete")
						REDUCE SELECTION:C351([CUSTOM_FIELDS:98]; (Size of array:C274($_ad_DateData)))
						CREATE SET:C116([CUSTOM_FIELDS:98]; "$toKeep")
						DIFFERENCE:C122("$toDelete"; "$toKeep"; "$toDelete")
						USE SET:C118("$toKeep")
						CLEAR SET:C117("$toKeep")
					End if 
				End if 
				ARRAY TO SELECTION:C261($_at_UniqueCode; [CUSTOM_FIELDS:98]Unique_Code:2; $_at_FieldNames; [CUSTOM_FIELDS:98]Field_Name:3; $_at_AlphaData; [CUSTOM_FIELDS:98]String_31:4; $_ar_NumberData; [CUSTOM_FIELDS:98]Real_or_Integer:5; $_at_TextData; [CUSTOM_FIELDS:98]Text_Field:6; $_ad_DateData; [CUSTOM_FIELDS:98]Date_Field:7)
				If (False:C215)
					If (Size of array:C274($_ad_DateData)<$_l_RecordsinSelection)
						USE SET:C118("$toDelete")
						DELETE SELECTION:C66([CUSTOM_FIELDS:98])
						CLEAR SET:C117("$toDelete")
					End if 
					
				End if 
			End if 
			
			FurthFld_ArrZer
			ARRAY TEXT:C222(CUS_at_DisplayedData; 0)
			READ ONLY:C145([CUSTOM_FIELDS:98])
			UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
			CLEAR SEMAPHORE:C144($_t_SemaphoreName)
		: ($_l_Error=1)
			Gen_Alert("Further Fields cannot be used with this File"; "Cancel")
		: ($_l_Error=2)
			Gen_Alert("Further Fields cannot be accessed unless the Unique Code is filled in"; "Cancel")
		: ($_l_Error=3)
			$_t_TableName:=Table name:C256($1)
			$_t_TableName:=Replace string:C233($_t_TableName; "_"; " ")
			
			Gen_Alert("No Further Fields have been defined for "+$_t_TableName; "Cancel")
	End case 
	
	DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
	DB_t_CurrentFormUsage2:=$_t_CurrentFormUsage2
	DB_t_CurrentFormUsage3:=$_t_CurrentFormUsage3
	DB_bo_RecordModified:=$_bo_Modified
	vAutoFind:=$_bo_AutoFind
	vTitle:=$_t_Title
	
Else 
	Gen_Alert("Further Fields are not available in Daybook Silver"; "Cancel")
End if 
ERR_MethodTrackerReturn("FurthFld Func2"; $_t_oldMethodName)
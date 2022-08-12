//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_CheckUUID
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 28/01/2014 12:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_Ids; 0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; $_bo_HasUUID)
	C_LONGINT:C283($_l_FieldLength; $_l_FieldType; $_l_index; $_l_RecordCount; $_l_RecordNumber; $_l_TableNumber; $1)
	C_POINTER:C301($_ptr_FieldPointer; $_ptr_TablePointer; $_ptr_UUIDField)
	C_TEXT:C284($_t_oldMethodName; $_t_TableName; $_t_UniqueFields; $_t_UUID)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("AA_CheckUUID")

If (Count parameters:C259>=1)
	$_l_TableNumber:=$1
Else 
	If (Not:C34(Is nil pointer:C315(Current default table:C363)))
		$_l_TableNumber:=Table:C252(Current default table:C363)
	Else 
		$_l_TableNumber:=0
	End if 
End if 
$_bo_HasUUID:=False:C215



Case of 
	: ($_l_TableNumber=Table:C252(->[xOtherRelations:138]))
		$_ptr_UUIDField:=->[xOtherRelations:138]x_UUID:9
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[xDiaryRelations:137]))
		$_ptr_UUIDField:=->[xDiaryRelations:137]X_UUID:8
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[xBatchItemRelations:140]))
		$_ptr_UUIDField:=->[xBatchItemRelations:140]x_UUID:8
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[xBatchItemRelations:140]))
		$_ptr_UUIDField:=->[xDiaryRelations:137]X_UUID:8
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[X_URL_LInks:101]))
		$_ptr_UUIDField:=->[X_URL_LInks:101]x_UUID:4
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[x_ProductLocations:185]))
		$_ptr_UUIDField:=->[x_ProductLocations:185]x_UUID:3
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[X_DIaryDisplay:142]))
		$_ptr_UUIDField:=->[X_DIaryDisplay:142]X_UUID:19
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[WEBSETUP_4D:129]))
		$_ptr_UUIDField:=->[WEBSETUP_4D:129]x_UUID:38
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
		$_ptr_UUIDField:=->[TIME_BILLING_CATEGORIES:46]X_UUID:5
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[TERMINOLOGY:75]))
		$_ptr_UUIDField:=->[TERMINOLOGY:75]x_UUID:11
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[TABLE_RECORD_STATES:90]))
		$_ptr_UUIDField:=->[TABLE_RECORD_STATES:90]x_UUID:10
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[SF_UserPreferences:171]))
		$_ptr_UUIDField:=->[SF_UserPreferences:171]x_UUID:7
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[SF_PURCHASE_ORDER:43]))
		$_ptr_UUIDField:=->[SF_PURCHASE_ORDER:43]PURCHASE_UUID:1
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[SF_PURCHASE_ITEM:21]))
		$_ptr_UUIDField:=->[SF_PURCHASE_ITEM:21]PURCHASEITEM_UUID:1
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[SF_PURCHASE_ITEM:21]))
		$_ptr_UUIDField:=->[SF_PURCHASE_ITEM:21]PURCHASEITEM_UUID:1
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[SF_PRODUCTS:67]))
		$_ptr_UUIDField:=->[SF_PRODUCTS:67]PRODUCT_UUID:1
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[SF_PRODUCTS:67]))
		$_ptr_UUIDField:=->[SF_PRODUCTS:67]PRODUCT_UUID:1
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[SF_DiaryView:184]))
		$_ptr_UUIDField:=->[SF_DiaryView:184]DiaryView_UUID:1
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[SD_Settings:107]))
		$_ptr_UUIDField:=->[SD_Settings:107]x_UUID:15
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[PROCESSES_TO_HANDLE:115]))
		$_ptr_UUIDField:=->[PROCESSES_TO_HANDLE:115]x_UUID:14
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[PREFERENCES:116]))
		$_ptr_UUIDField:=->[PREFERENCES:116]x_UUID:6
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[PREFERENCES:116]))
		$_ptr_UUIDField:=->[PREFERENCES:116]x_UUID:6
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[MODULES:63]))
		$_ptr_UUIDField:=->[MODULES:63]X_UUID:9
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[LIST_LAYOUTS:96]))
		$_ptr_UUIDField:=->[LIST_LAYOUTS:96]X_UUID:21
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[INFORMATION:55]))
		$_ptr_UUIDField:=->[INFORMATION:55]X_UUID:17
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
		$_ptr_UUIDField:=->[IDENTIFIERS_MULTI_NUMBERS:94]X_UUID:5
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[IDENTIFIERS:16]))
		$_ptr_UUIDField:=->[IDENTIFIERS:16]x_UUID:10
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[EW_StepActions:119]))
		$_ptr_UUIDField:=->[EW_StepActions:119]X_UUID:15
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[EW_ExportSteps:118]))
		$_ptr_UUIDField:=->[EW_ExportSteps:118]X_UUID:10
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[EW_BKFields:122]))
		$_ptr_UUIDField:=->[EW_BKFields:122]X_UUID:6
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[EMAIL_RECIPIENTS:104]))
		$_ptr_UUIDField:=->[EMAIL_RECIPIENTS:104]X_UUID:8
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[EMAIL_ATTACHMENTS:103]))
		$_ptr_UUIDField:=->[EMAIL_ATTACHMENTS:103]X_UUID:9
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[DIARY_ITEMOWNERS:106]))
		$_ptr_UUIDField:=->[DIARY_ITEMOWNERS:106]X_UUID:7
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
		$_ptr_UUIDField:=->[CUSTOM_FIELDS_PERSONNEL:100]X_UUID:3
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
		$_ptr_UUIDField:=->[CUSTOM_FIELDS_PERSONNEL:100]X_UUID:3
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
		$_ptr_UUIDField:=->[CUSTOM_FIELDS:98]X_UUID:9
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[Contract_Type_Products:191]))
		$_ptr_UUIDField:=->[Contract_Type_Products:191]X_UUID:4
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
		$_ptr_UUIDField:=->[CONTRACT_RECORD_ANALYSIS:88]X_UUID:4
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
		$_ptr_UUIDField:=->[CONTRACT_RECORD_ANALYSIS:88]X_UUID:4
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[CODE_USES:91]))
		$_ptr_UUIDField:=->[CODE_USES:91]X_UUID:3
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[CLIENT_SERVERMESSAGES:123]))
		$_ptr_UUIDField:=->[CLIENT_SERVERMESSAGES:123]UUID:5
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[ACTIONS_STATICRELATIONS:204]))
		$_ptr_UUIDField:=->[ACTIONS_STATICRELATIONS:204]UUID:1
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[ACTIONS_RESULTSLINK:203]))
		$_ptr_UUIDField:=->[ACTIONS_RESULTSLINK:203]UUID:1
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[ACTIONS_RESTRICTABLES:201]))
		$_ptr_UUIDField:=->[ACTIONS_RESTRICTABLES:201]UUID:1
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[ACTIONS_RELATIONRESTRICTIONS:205]))
		$_ptr_UUIDField:=->[ACTIONS_RELATIONRESTRICTIONS:205]UUID:1
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[ACTIONS_MACROS:202]))
		$_ptr_UUIDField:=->[ACTIONS_MACROS:202]UUID:1
		$_bo_HasUUID:=True:C214
	: ($_l_TableNumber=Table:C252(->[ACTIONS_DEFAULTDIARIES:200]))
		$_ptr_UUIDField:=->[ACTIONS_DEFAULTDIARIES:200]xUUID:1
		$_bo_HasUUID:=True:C214
End case 
//temporary-build string of unique field names.
$_t_UniqueFields:=""

If (Is table number valid:C999($_l_TableNumber))
	$_t_TableName:=Table name:C256($_l_TableNumber)
	For ($_l_index; 1; Get last field number:C255($_l_TableNumber))
		If (Is field number valid:C1000($_l_TableNumber; $_l_index))
			$_ptr_FieldPointer:=Field:C253($_l_TableNumber; $_l_index)
			$_ptr_TablePointer:=Table:C252($_l_TableNumber)
			
			GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
			If ($_bo_FieldIndexed)
				$_t_UniqueFields:=$_t_UniqueFields+","+Field name:C257($_l_TableNumber; $_l_index)
			End if 
		End if 
	End for 
End if 
If ($_bo_HasUUID)
	
	If ($_ptr_UUIDField->#"")
		$_t_TableName:=Table name:C256($_ptr_UUIDField)
		$_t_FieldName:=Field name:C257($_ptr_UUIDField)
		
		$_t_UUID:=$_ptr_UUIDField->
		$_l_RecordCount:=0
		$_l_RecordNumber:=Record number:C243(Table:C252($_l_TableNumber)->)
		//SET QUERY DESTINATION(Into variable;$_l_RecordCount)
		$_ptr_TablePointer:=Table:C252($_l_TableNumber)
		$_obj_MatchingRecords:=ds:C1482[$_t_TableName].query($_t_FieldName+" =:1"; $_t_UUID)
		//QUERY($_ptr_TablePointer->;$_ptr_UUIDField->=$_t_UUID)
		//SET QUERY DESTINATION(Into current selection)
		If ($_l_RecordNumber=-3)
			If ($_l_RecordCount>0)
				$_ptr_UUIDField->:=Generate UUID:C1066
			End if 
		Else 
			If ($_l_RecordCount>1)
				$_ptr_UUIDField->:=Generate UUID:C1066
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("AA_CheckUUID"; $_t_oldMethodName)

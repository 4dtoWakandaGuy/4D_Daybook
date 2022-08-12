//%attributes = {}

If (False:C215)
	//Database Method Name:      SD3_SetDiaryRelationsArray
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/11/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ActionREALFieldNum; 0)
	ARRAY LONGINT:C221($_al_ActionVirtFieldNum; 0)
	ARRAY LONGINT:C221($_al_ActionVirtFieldType; 0)
	ARRAY LONGINT:C221($_al_AttributeTypes; 0)
	ARRAY LONGINT:C221($_al_FieldReferences; 0)
	ARRAY LONGINT:C221($_al_ObjectAttributeTypes; 0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_RelatedRecordID;0)
	//ARRAY LONGINT(SD2_al_RelatedRecordTableNum;0)
	//ARRAY LONGINT(SD2_al_RelatedtoDiaryfield;0)
	//ARRAY LONGINT(SD2_al_relationDiaryField;0)
	//ARRAY LONGINT(SD2_al_RelationTable;0)
	ARRAY TEXT:C222($_at_ActionVirtFieldName; 0)
	ARRAY TEXT:C222($_at_FieldRecordCode; 0)
	ARRAY TEXT:C222($_at_ObjectAttributeNames; 0)
	ARRAY TEXT:C222($_at_ObjectAttributes; 0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataMA;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_RelatedRecordCode;0)
	//ARRAY TEXT(SD2_at_RelatedRecordName;0)
	//ARRAY TEXT(SD2_at_RelatedRecordType;0)
	//ARRAY TEXT(SD2_at_RelationNames;0)
	C_BOOLEAN:C305($_bo_AppendToArray; $_bo_CheckRestrictions; $_bo_CopyFromAttributes; $_bo_SetupRelationTypes; $_bo_Unload; $_bo_Unload2; $1; SD_bo_NewRecord; SD3_bo_RelationTypesInit)
	C_LONGINT:C283($_l_ArraySIze; $_l_CallCodePosition; $_l_FormEvent; $_l_Index; $_l_IndexStart; $_l_InvoiceCodeFIeld; $_l_InvoiceCodePosition; $_l_InvoiceTablePosition; $_l_JobField; $_l_JobFieldPosition; $_l_JobsTablePosition)
	C_LONGINT:C283($_l_JobStageField; $_l_JobStageFieldPosition; $_l_JobTablePosition; $_l_ModuleAccess; $_l_offset; $_l_OrderFIeld; $_l_OrderFieldPosition; $_l_PICodeFIeld; $_l_PICodePosition; $_l_PITablePosition; $_l_POCodeFIeld)
	C_LONGINT:C283($_l_POCodePosition; $_l_POTablePosition; $_l_ProductField; $_l_ProductFieldPosition; $_l_ProductTablePosition; $_l_Ref; $_l_RelatedTablePosition; $_l_RelationFieldPosition; $_l_RelationPosition; $_l_RelationTableRow; $_l_SCFieldPosition)
	C_LONGINT:C283($_l_ServiceCallCodeFIeld; $_l_ServiceTablePosition; $_l_SMCodeFIeld; $_l_SMCodePosition; $_l_SMTablePosition; $_l_StaticFieldPosition; $_l_StaticRecordPosition; $_l_TablePosition)
	C_POINTER:C301($_ptr_Attributes; $_Ptr_DiaryAttributes; $_ptr_RelatedDiaryField; $_Ptr_RelatedRecordCode; $_ptr_RelatedRecordID; $_Ptr_RelatedRecordName; $_ptr_RelatedRecordTable; $_ptr_RelatedRecordType; $_ptr_RelationDiaryField; $_ptr_RelationNames; $_ptr_RelationTable)
	C_POINTER:C301($_Ptr_RelationTables; $10; $11; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_DateString; $_t_FieldReferenceName; $_t_InvoiceCode; $_t_JobCode; $_t_JobName; $_t_JobStageCode; $_t_JobStageName; $_t_oldMethodName; $_t_OrderCode; $_t_PICode; $_t_POCode)
	C_TEXT:C284($_t_ProblemCode; $_t_ProductCode; $_t_RecordReferenceName; $_t_ServiceCallCode; $_t_SMCode; $_t_StageCode; $_t_StatusString)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD3_SetDiaryRelationsArray")
$_l_FormEvent:=Form event code:C388
$_bo_CopyFromAttributes:=$1  //if this is a new record we get the defaults from the attributes.
$_Ptr_DiaryAttributes:=$2
$_ptr_RelatedRecordType:=$3  //ARRAY TEXT(SD2_at_RelatedRecordType;0)
$_ptr_RelatedRecordTable:=$4  //ARRAY LONGINT(SD2_al_RelatedRecordTableNum;0)  //²
$_ptr_RelatedDiaryField:=$5  //ARRAY LONGINT(SD2_al_RelatedtoDiaryfield;0)
$_ptr_RelatedRecordID:=$6  //ARRAY LONGINT(SD2_al_RelatedRecordID;0)  //²
$_Ptr_RelatedRecordCode:=$7  //ARRAY TEXT(SD2_at_RelatedRecordCode;0)  //²
$_Ptr_RelatedRecordName:=$8  //ARRAY TEXT(SD2_at_RelatedRecordName;0)  //²
If (Count parameters:C259>=11)
	$_bo_SetupRelationTypes:=SD3_bo_RelationTypesInit
	$_ptr_RelationNames:=$9  //ARRAY TEXT($_ptr_RelationNames;0)
	$_ptr_RelationTable:=$10  //ARRAY LONGINT(SD2_al_RelationTable;0)
	$_ptr_RelationDiaryField:=$11  //ARRAY LONGINT(SD2_al_relationDiaryField;0)
Else 
	$_bo_SetupRelationTypes:=True:C214  //its already setup
End if 

If (Not:C34($_bo_SetupRelationTypes))
	SD3_bo_RelationTypesInit:=True:C214
	ARRAY TEXT:C222($_ptr_RelationNames->; 0)
	ARRAY LONGINT:C221($_ptr_RelationTable->; 0)
	ARRAY LONGINT:C221($_ptr_RelationDiaryField->; 0)
	
	APPEND TO ARRAY:C911($_ptr_RelationNames->; "Company")
	APPEND TO ARRAY:C911($_ptr_RelationTable->; Table:C252(->[COMPANIES:2]))
	APPEND TO ARRAY:C911($_ptr_RelationDiaryField->; Field:C253(->[DIARY:12]Company_Code:1))
	APPEND TO ARRAY:C911($_ptr_RelationNames->; "Contact")
	APPEND TO ARRAY:C911($_ptr_RelationTable->; Table:C252(->[CONTACTS:1]))
	APPEND TO ARRAY:C911($_ptr_RelationDiaryField->; Field:C253(->[DIARY:12]Contact_Code:2))
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesOrders)  //Sales Orders"
	If ($_bo_CheckRestrictions)
		$_l_TablePosition:=Find in array:C230($_ptr_RelationTable->; Table:C252(->[ORDERS:24]))
	End if 
	If ($_l_ModuleAccess>1)
		APPEND TO ARRAY:C911($_ptr_RelationNames->; "Order")
		APPEND TO ARRAY:C911($_ptr_RelationTable->; Table:C252(->[ORDERS:24]))
		APPEND TO ARRAY:C911($_ptr_RelationDiaryField->; Field:C253(->[DIARY:12]Order_Code:26))
	End if 
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesLedger)  //
	If ($_l_ModuleAccess>1)
		APPEND TO ARRAY:C911($_ptr_RelationNames->; "Invoice")
		APPEND TO ARRAY:C911($_ptr_RelationTable->; Table:C252(->[INVOICES:39]))
		APPEND TO ARRAY:C911($_ptr_RelationDiaryField->; 0)
	End if 
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseOrders)
	If ($_l_ModuleAccess>1)
		APPEND TO ARRAY:C911($_ptr_RelationNames->; "Purchase order")
		APPEND TO ARRAY:C911($_ptr_RelationTable->; Table:C252(->[PURCHASE_ORDERS:57]))
		APPEND TO ARRAY:C911($_ptr_RelationDiaryField->; 0)
	End if 
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseLedger)
	If ($_l_ModuleAccess>1)
		APPEND TO ARRAY:C911($_ptr_RelationNames->; "Purchase invoice")
		APPEND TO ARRAY:C911($_ptr_RelationTable->; Table:C252(->[PURCHASE_INVOICES:37]))
		APPEND TO ARRAY:C911($_ptr_RelationDiaryField->; 0)
	End if 
	
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Products)  //products"
	If ($_l_ModuleAccess>1)
		APPEND TO ARRAY:C911($_ptr_RelationNames->; "Product")
		APPEND TO ARRAY:C911($_ptr_RelationTable->; Table:C252(->[PRODUCTS:9]))
		APPEND TO ARRAY:C911($_ptr_RelationDiaryField->; Field:C253(->[DIARY:12]Product_Code:13))
	End if 
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)  //products"
	If ($_l_ModuleAccess>1)
		APPEND TO ARRAY:C911($_ptr_RelationNames->; "Stock Movement")
		APPEND TO ARRAY:C911($_ptr_RelationTable->; Table:C252(->[STOCK_MOVEMENTS:40]))
		APPEND TO ARRAY:C911($_ptr_RelationDiaryField->; 0)
	End if 
	
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_ServiceCentre)  //service"
	If ($_l_ModuleAccess>1)
		APPEND TO ARRAY:C911($_ptr_RelationNames->; "Service")
		APPEND TO ARRAY:C911($_ptr_RelationTable->; Table:C252(->[CONTRACTS:17]))
		APPEND TO ARRAY:C911($_ptr_RelationDiaryField->; Field:C253(->[DIARY:12]Call_Code:25))
	End if 
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)  //Job costign"
	If ($_l_ModuleAccess>1)
		APPEND TO ARRAY:C911($_ptr_RelationNames->; "Job")
		APPEND TO ARRAY:C911($_ptr_RelationTable->; Table:C252(->[JOBS:26]))
		APPEND TO ARRAY:C911($_ptr_RelationDiaryField->; Field:C253(->[DIARY:12]Job_Code:19))
	End if 
	If ($_l_ModuleAccess>1)
		APPEND TO ARRAY:C911($_ptr_RelationNames->; "Job Stage")
		APPEND TO ARRAY:C911($_ptr_RelationTable->; Table:C252(->[JOB_STAGES:47]))
		APPEND TO ARRAY:C911($_ptr_RelationDiaryField->; Field:C253(->[DIARY:12]Stage_Code:21))
		APPEND TO ARRAY:C911($_ptr_RelationNames->; "Job Person")
		APPEND TO ARRAY:C911($_ptr_RelationTable->; Table:C252(->[JOB PERSONNEL:48]))
		APPEND TO ARRAY:C911($_ptr_RelationDiaryField->; 0)
	End if 
	
	$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Subscriptions)  //Subsriptions"
	If ($_l_ModuleAccess>1)
		APPEND TO ARRAY:C911($_ptr_RelationNames->; "Subscriptions")
		APPEND TO ARRAY:C911($_ptr_RelationTable->; Table:C252(->[SUBSCRIPTIONS:93]))
		APPEND TO ARRAY:C911($_ptr_RelationDiaryField->; 0)
	End if 
	
End if 

If ($_l_FormEvent=On Load:K2:1)
	
	If ([DIARY:12]x_ID:50>0) & (Not:C34(SD_bo_NewRecord))
		QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
		QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3#Table:C252(->[CONTACTS:1]); *)
		QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3#Table:C252(->[COMPANIES:2]))
		If (Records in selection:C76([xDiaryRelations:137])>0)
			SELECTION TO ARRAY:C260([xDiaryRelations:137]xTableNUM:3; SD2_al_RelatedRecordTableNum; [xDiaryRelations:137]xRecordID:4; SD2_al_RelatedRecordID; [xDiaryRelations:137]XRecord_Code:5; SD2_at_RelatedRecordCode; [xDiaryRelations:137]X_DisplayedName:6; SD2_at_RelatedRecordName)
			$_l_ArraySIze:=Size of array:C274(SD2_al_RelatedRecordTableNum)
			ARRAY TEXT:C222(SD2_at_RelatedRecordType; $_l_ArraySIze)
			ARRAY LONGINT:C221(SD2_al_RelatedtoDiaryfield; $_l_ArraySIze)
			For ($_l_Index; 1; $_l_ArraySIze)
				$_l_RelatedTablePosition:=Find in array:C230(SD2_al_RelationTable; SD2_al_RelatedRecordTableNum{$_l_Index})
				If ($_l_RelatedTablePosition>0)
					SD2_at_RelatedRecordType{$_l_Index}:=SD2_at_RelationNames{$_l_RelatedTablePosition}
					If (SD2_al_relationDiaryField{$_l_RelatedTablePosition}>0)
						$_l_RelationFieldPosition:=Find in array:C230(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_RelatedTablePosition})
						If ($_l_RelationFieldPosition<0)
							SD2_al_RelatedtoDiaryfield{$_l_Index}:=SD2_al_relationDiaryField{$_l_RelationFieldPosition}
						End if 
					End if 
				Else 
					SD2_at_RelatedRecordType{$_l_Index}:="Other.."
				End if 
			End for 
			
		End if 
	End if 
End if 

$_l_offset:=SD2_ActionFields(->$_al_ActionVirtFieldNum; ->$_al_ActionREALFieldNum; ->$_at_ActionVirtFieldName; ->$_al_ActionVirtFieldType)
OB GET PROPERTY NAMES:C1232($_Ptr_DiaryAttributes->; $_at_ObjectAttributeNames; $_al_ObjectAttributeTypes)
$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_JobCosting)  //Job costing"
$_t_FieldReferenceName:="Static Record Fields"
$_t_RecordReferenceName:="Static Record Codes"
$_l_StaticFieldPosition:=Find in array:C230($_at_ObjectAttributeNames; $_t_FieldReferenceName)
$_l_StaticRecordPosition:=Find in array:C230($_at_ObjectAttributeNames; $_t_RecordReferenceName)


If ($_l_ModuleAccess>1)  // | ($_l_ModuleAccess2>1)
	If (SD_bo_NewRecord)  //it is a new record so add any static JOB from the action
		$_l_JobField:=Field:C253(->[DIARY:12]Job_Code:19)
		
		If ($_l_StaticFieldPosition>0) & ($_l_StaticRecordPosition>0)
			
			OB GET ARRAY:C1229($_Ptr_DiaryAttributes->; $_t_FieldReferenceName; $_al_FieldReferences)
			$_l_JobFieldPosition:=Find in array:C230($_al_FieldReferences; $_l_JobField)  //is there a static Job Field
			If ($_l_JobFieldPosition>0)
				
				OB GET ARRAY:C1229($_ptr_Attributes->; $_t_RecordReferenceName; $_at_FieldRecordCode)
				For ($_l_Index; $_l_JobFieldPosition; $_al_FieldReferences)
					If ($_al_FieldReferences{$_l_Index}=$_l_JobField)
						$_t_JobCode:=$_at_FieldRecordCode{$_l_Index}
						$_bo_Unload:=False:C215
						If ([JOBS:26]Job_Code:1#$_t_JobCode)
							QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$_t_JobCode)
							$_bo_Unload:=True:C214
						End if 
						If (Records in selection:C76([JOBS:26])=1)
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordTableNum; Table:C252(->[JOBS:26]))
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; [JOBS:26]Job_Code:1)
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; [JOBS:26]Job_Name:2)
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [JOBS:26]x_ID:49)
							$_l_JobsTablePosition:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[JOBS:26]))
							If ($_l_JobsTablePosition>0)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; SD2_at_RelationNames{$_l_JobsTablePosition})
								If (SD2_al_relationDiaryField{$_l_JobsTablePosition}>0)
									//only the FIRST job is going on to the diary job code field
									$_l_RelationPosition:=Find in array:C230(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_JobsTablePosition})
									If ($_l_RelationPosition<0)
										APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_JobsTablePosition})
									Else 
										APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
									End if 
								Else 
									APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
								End if 
								
							Else   //This should NEVER happen
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; "Other...")
								APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
							End if 
							
						End if 
						If ($_bo_Unload)
							UNLOAD RECORD:C212([JOBS:26])
							
						End if 
					End if 
				End for 
			End if 
		End if 
	End if 
End if 

//[DIARY]Job Code
//So we end up with an array of the table(SD2_al_RelatedRecordTableNum) and an array of the record code(SD2_at_RelatedRecordCode) and an array(SD2_at_RelatedRecordName) and an array of the record id SD2_al_RelatedRecordID and an array of relation names(SD2_at_RelatedRecordType) and a field number in the diary this is related to
///BUT we have not at this point filled the diary field. below we do that if it is not already filled.
//even if we dont have access to the Jobs_Module this record could be related to an job(stage)

If ([DIARY:12]Job_Code:19#"")
	$_t_JobCode:=[DIARY:12]Job_Code:19
	If (Size of array:C274(SD2_al_RelatedRecordTableNum)>0)
		$_bo_AppendToArray:=True:C214
		$_l_IndexStart:=Find in array:C230(SD2_al_RelatedRecordTableNum; Table:C252(->[JOBS:26]))
		If ($_l_IndexStart>0)
			For ($_l_Index; $_l_IndexStart; Size of array:C274(SD2_al_RelatedRecordTableNum))
				If (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[JOBS:26]))
					If (SD2_al_RelatedtoDiaryfield{$_l_Index}=Field:C253(->[DIARY:12]Job_Code:19))
						If (SD2_at_RelatedRecordCode{$_l_Index}=$_t_JobCode)
							$_bo_AppendToArray:=False:C215
							$_l_Index:=Size of array:C274(SD2_al_RelatedRecordTableNum)
						End if 
					End if 
				End if 
			End for 
		End if 
	Else 
		$_bo_AppendToArray:=True:C214
	End if 
	If ($_bo_AppendToArray)
		$_bo_Unload:=False:C215
		If ([JOBS:26]Job_Code:1#$_t_JobCode)
			QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$_t_JobCode)
			$_bo_Unload:=True:C214
		End if 
		If (Records in selection:C76([JOBS:26])>0)
			APPEND TO ARRAY:C911(SD2_al_RelatedRecordTableNum; Table:C252(->[JOBS:26]))
			APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; [JOBS:26]Job_Code:1)
			APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; [JOBS:26]Job_Name:2)
			APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [JOBS:26]x_ID:49)
			$_l_JobTablePosition:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[JOBS:26]))
			If ($_l_JobTablePosition>0)
				APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; SD2_at_RelationNames{$_l_JobTablePosition})
				APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_JobTablePosition})
			Else   //This should NEVER happen
				APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; "Other...")
				APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
			End if 
			
		End if 
		If ($_bo_Unload)
			UNLOAD RECORD:C212([JOBS:26])
		End if 
	End if 
Else 
	If (Size of array:C274(SD2_al_RelatedRecordTableNum)>0)
		$_l_IndexStart:=Find in array:C230(SD2_al_RelatedRecordTableNum; Table:C252(->[JOBS:26]))
		If ($_l_IndexStart>0)
			For ($_l_Index; $_l_IndexStart; Size of array:C274(SD2_al_RelatedRecordTableNum))
				If (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[JOBS:26]))
					If (SD2_al_RelatedtoDiaryfield{$_l_Index}=Field:C253(->[DIARY:12]Job_Code:19))
						If (SD2_at_RelatedRecordCode{$_l_Index}#"")
							[DIARY:12]Job_Code:19:=SD2_at_RelatedRecordCode{$_l_Index}
							$_l_Index:=Size of array:C274(SD2_al_RelatedRecordTableNum)
						End if 
					End if 
				End if 
			End for 
		End if 
		
	End if 
End if 

//[DIARY]Stage Code
//we alreadly looked at the module status for jobs above
If ($_l_ModuleAccess>1)
	If (SD_bo_NewRecord)  //it is a new record so add any static JOB from the action
		$_l_JobStageField:=Field:C253(->[DIARY:12]Stage_Code:21)
		If ($_l_StaticFieldPosition>0) & ($_l_StaticRecordPosition>0)
			OB GET ARRAY:C1229($_Ptr_DiaryAttributes->; $_t_FieldReferenceName; $_al_FieldReferences)
			$_l_JobStageFieldPosition:=Find in array:C230($_al_FieldReferences; $_l_JobStageField)  //is there a static Job Field
			If ($_l_JobStageFieldPosition>0)
				OB GET ARRAY:C1229($_ptr_Attributes->; $_t_RecordReferenceName; $_at_FieldRecordCode)
				For ($_l_Index; $_l_JobStageFieldPosition; $_al_FieldReferences)
					If ($_al_FieldReferences{$_l_Index}=$_l_JobStageField)
						$_t_JobStageCode:=$_at_FieldRecordCode{$_l_Index}
						//SD2_al_StaticFieldNUMs{2}:=Field(->[DIARY]Contact Code)
						$_bo_Unload:=False:C215
						$_bo_Unload2:=False:C215
						If ([JOB_STAGES:47]Job_Stage_code:52#$_t_JobStageCode)
							QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Stage_code:52=$_t_JobStageCode)
							$_bo_Unload:=True:C214
						End if 
						If (Records in selection:C76([JOB_STAGES:47])=1)
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordTableNum; Table:C252(->[JOB_STAGES:47]))
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; [JOB_STAGES:47]Job_Stage_code:52)
							If ([JOBS:26]Job_Code:1#[JOB_STAGES:47]Job_Code:1)
								$_bo_Unload2:=True:C214
								QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[JOB_STAGES:47]Job_Code:1)
							End if 
							$_t_JobName:=[JOBS:26]Job_Name:2
							QUERY:C277([STAGES:45]; [STAGES:45]Stage_Code:1=[JOB_STAGES:47]Stage_Code:2)
							$_t_JobStageName:=[STAGES:45]Stage_Name:2
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; $_t_JobName+" "+$_t_JobStageName)
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [JOB_STAGES:47]x_ID:54)
							$_l_RelationTableRow:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[JOB_STAGES:47]))
							If ($_l_RelationTableRow>0)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; SD2_at_RelationNames{$_l_RelationTableRow})
								APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_RelationTableRow})
							Else   //This should NEVER happen
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; "Other...")
								APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
							End if 
						End if 
						If ($_bo_Unload2)
							UNLOAD RECORD:C212([JOBS:26])
						End if 
						If ($_bo_Unload)
							UNLOAD RECORD:C212([JOB_STAGES:47])
						End if 
					End if 
				End for 
			End if 
		End if 
	End if 
	
End if 
//So we end up with an array of the table(SD2_al_RelatedRecordTableNum) and an array of the record code(SD2_at_RelatedRecordCode) and an array(SD2_at_RelatedRecordName) and an array of the record id SD2_al_RelatedRecordID and an array of relation names(SD2_at_RelatedRecordType) and a field number in the diary this is related to
///BUT we have not at this point filled the diary field. below we do that if it is not already filled.
//even if we dont have access to the Jobs_Module this record could be related to an job(stage)
//note that this one is a bit more complex because of the relationship between jobs and job stages

If ([DIARY:12]Stage_Code:21#"")
	$_t_JobCode:=[DIARY:12]Job_Code:19
	$_t_StageCode:=[DIARY:12]Stage_Code:21
	//the
	If (Size of array:C274(SD2_al_RelatedRecordTableNum)>0)
		$_bo_AppendToArray:=True:C214
		$_l_IndexStart:=Find in array:C230(SD2_al_RelatedRecordTableNum; Table:C252(->[JOB_STAGES:47]))
		If ($_l_IndexStart>0)
			For ($_l_Index; $_l_IndexStart; Size of array:C274(SD2_al_RelatedRecordTableNum))
				If (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[JOB_STAGES:47]))
					If (SD2_al_RelatedtoDiaryfield{$_l_Index}=Field:C253(->[DIARY:12]Stage_Code:21))
						If (SD2_at_RelatedRecordCode{$_l_Index}=$_t_StageCode)
							$_bo_AppendToArray:=False:C215
							$_l_Index:=Size of array:C274(SD2_al_RelatedRecordTableNum)
						End if 
					End if 
				End if 
			End for 
		End if 
	Else 
		$_bo_AppendToArray:=True:C214
	End if 
	If ($_bo_AppendToArray)
		$_bo_Unload:=False:C215
		$_bo_Unload2:=False:C215  //note here that we have to unload the job as well-the diary must be related to the job and job stage
		If ([JOB_STAGES:47]Job_Stage_code:52#$_t_JobStageCode)
			QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Stage_code:52=$_t_StageCode)
			$_bo_Unload:=True:C214
		End if 
		
		QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Stage_code:52=$_t_StageCode)  //NOTE THIS IS LOOKINGFOR THE UNIQUE REFERENCE NOT THE STAGE TYPE
		If (Records in selection:C76([JOB_STAGES:47])>0)
			APPEND TO ARRAY:C911(SD2_al_RelatedRecordTableNum; Table:C252(->[JOB_STAGES:47]))
			APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; [JOB_STAGES:47]Job_Stage_code:52)
			If ([JOBS:26]Job_Code:1#[JOB_STAGES:47]Job_Code:1)
				QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[JOB_STAGES:47]Job_Code:1)
				$_bo_Unload2:=True:C214
			End if 
			$_t_JobName:=[JOBS:26]Job_Name:2
			QUERY:C277([STAGES:45]; [STAGES:45]Stage_Code:1=[JOB_STAGES:47]Stage_Code:2)
			$_t_JobStageName:=[STAGES:45]Stage_Name:2
			APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; $_t_JobName+" "+$_t_JobStageName)
			APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [JOB_STAGES:47]x_ID:54)
			$_l_RelationTableRow:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[JOB_STAGES:47]))
			If ($_l_RelationTableRow>0)
				APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; SD2_at_RelationNames{$_l_RelationTableRow})
				APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_RelationTableRow})
			Else   //This should NEVER happen
				APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; "Other...")
				APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
			End if 
		Else 
			//Becuase we are changing the JOB STAGE code field on the diary from using the the STAGE CODE to the JOB STAGE CODE..
			///(2019) although its very unlikely we are going to have residue data here from an old client
			//so here we did not find a job stage with the stage code on..so we look for the stage code as opposed to the job stage code. IE the old data.
			//in the old data there was no unique ID on a Job stage record it had a job and a job stage, but this meant you could not distinguish between two stages on a job of the same(so i meant you could only have one 'development' stage for example)
			
			//and we will update the diary record..
			If ([DIARY:12]Job_Code:19#"")
				If ([JOB_STAGES:47]Stage_Code:2#$_t_StageCode) | ([JOB_STAGES:47]Job_Code:1#[DIARY:12]Job_Code:19)
					$_bo_Unload:=True:C214
					QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Stage_Code:2=$_t_StageCode; *)
					QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Job_Code:1=[DIARY:12]Job_Code:19)
				End if 
				If (Records in selection:C76([JOB_STAGES:47])>0)  //(2019) so we found a Job stage code matching but what want is the JOB_STAGE_CODE i.e the individual record ID
					APPEND TO ARRAY:C911(SD2_al_RelatedRecordTableNum; Table:C252(->[JOB_STAGES:47]))
					APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; [JOB_STAGES:47]Job_Stage_code:52)
					If ([JOBS:26]Job_Code:1#[JOB_STAGES:47]Job_Code:1)
						QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[JOB_STAGES:47]Job_Code:1)
						$_bo_Unload2:=True:C214
					End if 
					$_t_JobName:=[JOBS:26]Job_Name:2
					QUERY:C277([STAGES:45]; [STAGES:45]Stage_Code:1=[JOB_STAGES:47]Stage_Code:2)
					$_t_JobStageName:=[STAGES:45]Stage_Name:2
					APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; $_t_JobName+" "+$_t_JobStageName)
					APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [JOB_STAGES:47]x_ID:54)
					$_l_JobTablePosition:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[JOB_STAGES:47]))
					If ($_l_JobTablePosition>0)
						APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; SD2_at_RelationNames{$_l_JobTablePosition})
						APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_JobTablePosition})
					Else   //This should NEVER happen
						APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; "Other...")
						APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
					End if 
				End if 
			End if 
		End if 
		If ($_bo_Unload2)
			UNLOAD RECORD:C212([JOBS:26])
		End if 
		If ($_bo_Unload)
			UNLOAD RECORD:C212([JOB_STAGES:47])
		End if 
	End if 
Else 
	If (Size of array:C274(SD2_al_RelatedRecordTableNum)>0)
		$_l_IndexStart:=Find in array:C230(SD2_al_RelatedRecordTableNum; Table:C252(->[JOB_STAGES:47]))
		If ($_l_IndexStart>0)
			For ($_l_Index; $_l_IndexStart; Size of array:C274(SD2_al_RelatedRecordTableNum))
				If (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[JOB_STAGES:47]))
					If (SD2_al_RelatedtoDiaryfield{$_l_Index}=Field:C253(->[DIARY:12]Stage_Code:21))
						If (SD2_at_RelatedRecordCode{$_l_Index}#"")
							[DIARY:12]Stage_Code:21:=SD2_at_RelatedRecordCode{$_l_Index}
							$_l_Index:=Size of array:C274(SD2_al_RelatedRecordTableNum)
						End if 
					End if 
				End if 
			End for 
		End if 
	End if 
End if 
//``



//[DIARY]Product Code

$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_Products)  //products"
If ($_l_ModuleAccess>1)
	If (SD_bo_NewRecord)  //it is a new record so add any static product from the action
		$_l_ProductField:=Field:C253(->[DIARY:12]Product_Code:13)
		
		If ($_l_StaticFieldPosition>0) & ($_l_StaticRecordPosition>0)
			OB GET ARRAY:C1229($_Ptr_DiaryAttributes->; $_t_FieldReferenceName; $_al_FieldReferences)
			
			$_l_ProductFieldPosition:=Find in array:C230($_al_FieldReferences; $_l_ProductField)
			If ($_l_ProductFieldPosition>0)
				OB GET ARRAY:C1229($_ptr_Attributes->; $_t_RecordReferenceName; $_at_FieldRecordCode)
				For ($_l_Index; $_l_ProductFieldPosition; Size of array:C274($_al_FieldReferences))
					If ($_al_FieldReferences{$_l_Index}=$_l_ProductField)
						$_t_ProductCode:=$_at_FieldRecordCode{$_l_Index}
						QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_ProductCode)
						If (Records in selection:C76([PRODUCTS:9])=1)
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordTableNum; Table:C252(->[PRODUCTS:9]))
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; [PRODUCTS:9]Product_Code:1)
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; [PRODUCTS:9]Product_Name:2)
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [PRODUCTS:9]X_ID:43)
							$_l_ProductTablePosition:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[PRODUCTS:9]))
							If ($_l_ProductTablePosition>0)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; SD2_at_RelationNames{$_l_ProductTablePosition})
								APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_ProductTablePosition})
							Else   //This should NEVER happen
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; "Other...")
								APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
							End if 
						End if 
					End if 
				End for 
			End if 
		End if 
	End if 
End if 
//So we end up with an array of the table(SD2_al_RelatedRecordTableNum) and an array of the record code(SD2_at_RelatedRecordCode) and an array(SD2_at_RelatedRecordName) and an array of the record id SD2_al_RelatedRecordID and an array of relation names(SD2_at_RelatedRecordType) and a field number in the diary this is related to
///BUT we have not at this point filled the diary field. below we do that if it is not already filled.
//even if we dont have access to the Products_Module this record could be related to an product

If ([DIARY:12]Product_Code:13#"")
	$_t_ProductCode:=[DIARY:12]Product_Code:13
	If (Size of array:C274(SD2_al_RelatedRecordTableNum)>0)
		$_bo_AppendToArray:=True:C214
		$_l_IndexStart:=Find in array:C230(SD2_al_RelatedRecordTableNum; Table:C252(->[PRODUCTS:9]))
		If ($_l_IndexStart>0)
			For ($_l_Index; $_l_IndexStart; Size of array:C274(SD2_al_RelatedRecordTableNum))
				If (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[PRODUCTS:9]))
					If (SD2_al_RelatedtoDiaryfield{$_l_Index}=Field:C253(->[PRODUCTS:9]Product_Code:1))
						If (SD2_at_RelatedRecordCode{$_l_Index}=$_t_ProductCode)
							$_bo_AppendToArray:=False:C215
							$_l_Index:=Size of array:C274(SD2_al_RelatedRecordTableNum)
						End if 
					End if 
				End if 
			End for 
		End if 
	Else 
		$_bo_AppendToArray:=True:C214
	End if 
	If ($_bo_AppendToArray)
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_ProductCode)
		If (Records in selection:C76([JOBS:26])>0)
			APPEND TO ARRAY:C911(SD2_al_RelatedRecordTableNum; Table:C252(->[PRODUCTS:9]))
			APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; [PRODUCTS:9]Product_Code:1)
			APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; [PRODUCTS:9]Product_Name:2)
			APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [PRODUCTS:9]X_ID:43)
			$_l_RelationTableRow:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[PRODUCTS:9]))
			If ($_l_RelationTableRow>0)
				APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; SD2_at_RelationNames{$_l_RelationTableRow})
				APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_RelationTableRow})
			Else   //This should NEVER happen
				APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; "Other...")
				APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
			End if 
			
		End if 
	End if 
Else 
	If (Size of array:C274(SD2_al_RelatedRecordTableNum)>0)
		$_l_IndexStart:=Find in array:C230(SD2_al_RelatedRecordTableNum; Table:C252(->[PRODUCTS:9]))
		If ($_l_IndexStart>0)
			For ($_l_Index; $_l_IndexStart; Size of array:C274(SD2_al_RelatedRecordTableNum))
				If (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[PRODUCTS:9]))
					If (SD2_al_RelatedtoDiaryfield{$_l_Index}=Field:C253(->[DIARY:12]Product_Code:13))
						If (SD2_at_RelatedRecordCode{$_l_Index}#"")
							[DIARY:12]Product_Code:13:=SD2_at_RelatedRecordCode{$_l_Index}
							$_l_Index:=Size of array:C274(SD2_al_RelatedRecordTableNum)
						End if 
					End if 
				End if 
			End for 
		End if 
	End if 
End if 


//Module_Products
//[DIARY]Order Code
$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesOrders)  //Orders
If ($_l_ModuleAccess>1)
	If (SD_bo_NewRecord)  //it is a new record so add any static JOB from the action
		$_l_OrderFIeld:=Field:C253(->[DIARY:12]Order_Code:26)
		If ($_l_StaticFieldPosition>0) & ($_l_StaticRecordPosition>0)
			OB GET ARRAY:C1229($_Ptr_DiaryAttributes->; $_t_FieldReferenceName; $_al_FieldReferences)
			$_l_OrderFieldPosition:=Find in array:C230($_al_FieldReferences; $_l_ProductField)
			If ($_l_OrderFieldPosition>0)
				OB GET ARRAY:C1229($_ptr_Attributes->; $_t_RecordReferenceName; $_at_FieldRecordCode)
				For ($_l_Index; $_l_OrderFieldPosition; Size of array:C274($_al_FieldReferences))
					If ($_al_FieldReferences{$_l_Index}=$_l_OrderFIeld)
						$_t_OrderCode:=$_at_FieldRecordCode{$_l_Index}
						QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_OrderCode)
						If (Records in selection:C76([ORDERS:24])=1)
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordTableNum; Table:C252(->[ORDERS:24]))
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; [ORDERS:24]Order_Code:3)
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; "Order "+[ORDERS:24]Order_Code:3)
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [ORDERS:24]x_ID:58)
							$_l_RelationTableRow:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[ORDERS:24]))
							If ($_l_RelationTableRow>0)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; SD2_at_RelationNames{$_l_RelationTableRow})
								APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_RelationTableRow})
							Else   //This should NEVER happen
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; "Other...")
								APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
							End if 
						End if 
					End if 
				End for 
			End if 
		End if 
	End if 
End if 
//So we end up with an array of the table(SD2_al_RelatedRecordTableNum) and an array of the record code(SD2_at_RelatedRecordCode) and an array(SD2_at_RelatedRecordName) and an array of the record id SD2_al_RelatedRecordID and an array of relation names(SD2_at_RelatedRecordType) and a field number in the diary this is related to
///BUT we have not at this point filled the diary field. below we do that if it is not already filled.
//even if we dont have access to the Orders_Module this record could be related to an order

If ([DIARY:12]Order_Code:26#"")
	$_t_OrderCode:=[DIARY:12]Order_Code:26
	If (Size of array:C274(SD2_al_RelatedRecordTableNum)>0)
		$_bo_AppendToArray:=True:C214
		$_l_IndexStart:=Find in array:C230(SD2_al_RelatedRecordTableNum; Table:C252(->[ORDERS:24]))
		If ($_l_IndexStart>0)
			For ($_l_Index; $_l_IndexStart; Size of array:C274(SD2_al_RelatedRecordTableNum))
				If (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[ORDERS:24]))
					If (SD2_al_RelatedtoDiaryfield{$_l_Index}=Field:C253(->[ORDERS:24]Order_Code:3))
						If (SD2_at_RelatedRecordCode{$_l_Index}=$_t_OrderCode)
							$_bo_AppendToArray:=False:C215
							$_l_Index:=Size of array:C274(SD2_al_RelatedRecordTableNum)
						End if 
					End if 
				End if 
			End for 
		End if 
	Else 
		$_bo_AppendToArray:=True:C214
	End if 
	If ($_bo_AppendToArray)
		QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_OrderCode)
		If (Records in selection:C76([JOBS:26])>0)
			APPEND TO ARRAY:C911(SD2_al_RelatedRecordTableNum; Table:C252(->[ORDERS:24]))
			APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; [ORDERS:24]Order_Code:3)
			APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; "Order "+[ORDERS:24]Order_Code:3)
			APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [ORDERS:24]x_ID:58)
			$_l_RelationTableRow:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[ORDERS:24]))
			If ($_l_RelationTableRow>0)
				APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; SD2_at_RelationNames{$_l_RelationTableRow})
				APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_RelationTableRow})
			Else   //This should NEVER happen
				APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; "Other...")
				APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
			End if 
			
		End if 
	End if 
Else 
	If (Size of array:C274(SD2_al_RelatedRecordTableNum)>0)
		$_l_IndexStart:=Find in array:C230(SD2_al_RelatedRecordTableNum; Table:C252(->[ORDERS:24]))
		If ($_l_IndexStart>0)
			For ($_l_Index; 1; Size of array:C274(SD2_al_RelatedRecordTableNum))
				If (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[ORDERS:24]))
					If (SD2_al_RelatedtoDiaryfield{$_l_Index}=Field:C253(->[ORDERS:24]Order_Code:3))
						If (SD2_at_RelatedRecordCode{$_l_Index}#"")
							[DIARY:12]Order_Code:26:=SD2_at_RelatedRecordCode{$_l_Index}
							$_l_Index:=Size of array:C274(SD2_al_RelatedRecordTableNum)
						End if 
					End if 
				End if 
			End for 
		End if 
	End if 
End if 
//[DIARY]call code


$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_ServiceCentre)  //Service control
If ($_l_ModuleAccess>1)
	If (SD_bo_NewRecord)  //it is a new record so add any static JOB from the action
		$_l_ServiceCallCodeFIeld:=Field:C253(->[DIARY:12]Call_Code:25)
		If ($_l_StaticFieldPosition>0) & ($_l_StaticRecordPosition>0)
			OB GET ARRAY:C1229($_Ptr_DiaryAttributes->; $_t_FieldReferenceName; $_al_FieldReferences)
			$_l_SCFieldPosition:=Find in array:C230($_al_FieldReferences; $_l_ProductField)
			If ($_l_SCFieldPosition>0)
				OB GET ARRAY:C1229($_ptr_Attributes->; $_t_RecordReferenceName; $_at_FieldRecordCode)
				For ($_l_Index; $_l_SCFieldPosition; Size of array:C274($_al_FieldReferences))
					If ($_al_FieldReferences{$_l_Index}=$_l_ServiceCallCodeFIeld)
						$_t_ServiceCallCode:=$_at_FieldRecordCode{$_l_Index}
						//SD2_al_StaticFieldNUMs{2}:=Field(->[DIARY]Contact Code)
						$_bo_Unload:=False:C215
						If ([SERVICE_CALLS:20]Call_Code:4#$_t_ServiceCallCode)
							QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=$_t_ServiceCallCode)
							$_bo_Unload:=True:C214
						End if 
						If (Records in selection:C76([SERVICE_CALLS:20])=1)
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordTableNum; Table:C252(->[SERVICE_CALLS:20]))
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; [SERVICE_CALLS:20]Call_Code:4)
							$_t_DateString:=" "+String:C10([SERVICE_CALLS:20]Call_Date:5; 4)
							$_t_ProblemCode:=[SERVICE_CALLS:20]Problem_Code:14
							If ($_t_ProblemCode#"")
								QUERY:C277([PROBLEMS:22]; [PROBLEMS:22]Problem_Code:1=$_t_ProblemCode)
								$_t_ProblemCode:=" "+[PROBLEMS:22]Problem_Name:2  //Note adding the spaces here
								UNLOAD RECORD:C212([PROBLEMS:22])
							End if 
							If ([SERVICE_CALLS:20]Resolved:9)
								$_t_StatusString:=" (Closed)"
							Else 
								$_t_StatusString:=" (Open)"
							End if 
							
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; "Call:"+$_t_ProblemCode+$_t_DateString+$_t_StatusString)
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [SERVICE_CALLS:20]x_ID:27)
							$_l_ServiceTablePosition:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[SERVICE_CALLS:20]))
							If ($_l_ServiceTablePosition>0)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; SD2_at_RelationNames{$_l_ServiceTablePosition})
								APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_ServiceTablePosition})
							Else   //This should NEVER happen
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; "Other...")
								APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
							End if 
						End if 
						If ($_bo_Unload)
							UNLOAD RECORD:C212([SERVICE_CALLS:20])
						End if 
					End if 
				End for 
			End if 
		End if 
	End if 
End if 
//So we end up with an array of the table(SD2_al_RelatedRecordTableNum) and an array of the record code(SD2_at_RelatedRecordCode) and an array(SD2_at_RelatedRecordName) and an array of the record id SD2_al_RelatedRecordID and an array of relation names(SD2_at_RelatedRecordType) and a field number in the diary this is related to
///BUT we have not at this point filled the diary field. below we do that if it is not already filled.
//even if we dont have access to the service module this record could be related to a service call.
If ([DIARY:12]Call_Code:25#"")
	$_t_ServiceCallCode:=[DIARY:12]Call_Code:25
	If (Size of array:C274(SD2_al_RelatedRecordTableNum)>0)
		$_bo_AppendToArray:=True:C214
		$_l_IndexStart:=Find in array:C230(SD2_al_RelatedRecordTableNum; Table:C252(->[SERVICE_CALLS:20]))
		If ($_l_IndexStart>0)
			For ($_l_Index; $_l_IndexStart; Size of array:C274(SD2_al_RelatedRecordTableNum))
				If (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[SERVICE_CALLS:20]))
					If (SD2_al_RelatedtoDiaryfield{$_l_Index}=Field:C253(->[SERVICE_CALLS:20]Call_Code:4))
						If (SD2_at_RelatedRecordCode{$_l_Index}=$_t_ServiceCallCode)
							$_bo_AppendToArray:=False:C215
							$_l_Index:=Size of array:C274(SD2_al_RelatedRecordTableNum)
						End if 
					End if 
				End if 
			End for 
		Else 
			
		End if 
	Else 
		$_bo_AppendToArray:=True:C214
	End if 
	If ($_bo_AppendToArray)
		$_bo_Unload:=False:C215
		If ([SERVICE_CALLS:20]Call_Code:4#$_t_ServiceCallCode)
			QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=$_t_ServiceCallCode)
			$_bo_Unload:=True:C214
		End if 
		If (Records in selection:C76([SERVICE_CALLS:20])>0)
			$_t_DateString:=" "+String:C10([SERVICE_CALLS:20]Call_Date:5; 4)
			$_t_ProblemCode:=[SERVICE_CALLS:20]Problem_Code:14
			If ($_t_ProblemCode#"")
				QUERY:C277([PROBLEMS:22]; [PROBLEMS:22]Problem_Code:1=$_t_ProblemCode)
				$_t_ProblemCode:=" "+[PROBLEMS:22]Problem_Name:2  //Note adding the spaces here
				UNLOAD RECORD:C212([PROBLEMS:22])
			End if 
			If ([SERVICE_CALLS:20]Resolved:9)
				$_t_StatusString:=" (Closed)"
			Else 
				$_t_StatusString:=" (Open)"
			End if 
			APPEND TO ARRAY:C911(SD2_al_RelatedRecordTableNum; Table:C252(->[SERVICE_CALLS:20]))
			APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; [SERVICE_CALLS:20]Call_Code:4)
			APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; "Call:"+$_t_ProblemCode+$_t_DateString+$_t_StatusString)
			APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [SERVICE_CALLS:20]x_ID:27)
			$_l_ServiceTablePosition:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[SERVICE_CALLS:20]))
			If ($_l_ServiceTablePosition>0)
				APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; SD2_at_RelationNames{$_l_ServiceTablePosition})
				APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_ServiceTablePosition})
			Else   //This should NEVER happen
				APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; "Other...")
				APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
			End if 
			UNLOAD RECORD:C212([SERVICE_CALLS:20])
			
		End if 
		If ($_bo_Unload)
			UNLOAD RECORD:C212([SERVICE_CALLS:20])
		End if 
	End if 
Else 
	
	If (Size of array:C274(SD2_al_RelatedRecordTableNum)>0)
		$_l_IndexStart:=Find in array:C230(SD2_al_RelatedRecordTableNum; Table:C252(->[SERVICE_CALLS:20]))
		If ($_l_IndexStart>0)
			For ($_l_Index; $_l_IndexStart; Size of array:C274(SD2_al_RelatedRecordTableNum))
				If (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[SERVICE_CALLS:20]))
					If (SD2_al_RelatedtoDiaryfield{$_l_Index}=Field:C253(->[SERVICE_CALLS:20]Call_Code:4))
						If (SD2_at_RelatedRecordCode{$_l_Index}#"")
							[DIARY:12]Call_Code:25:=SD2_at_RelatedRecordCode{$_l_Index}
							$_l_Index:=Size of array:C274(SD2_al_RelatedRecordTableNum)
						End if 
					End if 
				End if 
			End for 
		End if 
	End if 
End if 

//So above we have loaded the Service call, Job, Job stage, Product(s), Sales order
//
//The following relations have no FIELD in the diary. Invoices, purchase orders,purchase ledger stock mov ment
//subscription, stock movement
//at this moment(2019) these fields are not included as available on the static bit of a diary action. so the NOTe the virtual field numbers hard coded below
//these would need to match whatever we would store in the action attributes.
$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesLedger)  //Sales invoicings
$_t_InvoiceCode:=""
If ($_l_ModuleAccess>1)
	If (SD_bo_NewRecord)  //it is a new record so add any static Invoice from the action
		$_l_InvoiceCodeFIeld:=-9000  //so this is a virtual field number here and because is negative it can never clash with the real fields.
		
		If ($_l_StaticFieldPosition>0) & ($_l_StaticRecordPosition>0)
			OB GET ARRAY:C1229($_Ptr_DiaryAttributes->; $_t_FieldReferenceName; $_al_FieldReferences)
			$_l_InvoiceCodePosition:=Find in array:C230($_al_FieldReferences; $_l_ProductField)
			If ($_l_InvoiceCodePosition>0)
				OB GET ARRAY:C1229($_ptr_Attributes->; $_t_RecordReferenceName; $_at_FieldRecordCode)
				For ($_l_Index; $_l_InvoiceCodePosition; Size of array:C274($_al_FieldReferences))
					If ($_al_FieldReferences{$_l_Index}=$_l_InvoiceCodeFIeld)
						$_t_InvoiceCode:=$_at_FieldRecordCode{$_l_Index}
						//SD2_al_StaticFieldNUMs{2}:=Field(->[DIARY]Contact Code)
						$_bo_Unload:=False:C215
						
						If ([INVOICES:39]Invoice_Number:1#$_t_InvoiceCode)
							QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceCode)
							$_bo_Unload:=True:C214
						End if 
						If (Records in selection:C76([INVOICES:39])=1)
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordTableNum; Table:C252(->[INVOICES:39]))
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; $_t_InvoiceCode)
							$_t_DateString:=" "+String:C10([INVOICES:39]Invoice_Date:4; 4)
							
							//[INVOICES]State
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; "Invoice:"+$_t_InvoiceCode+"("+$_t_DateString+")")
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [INVOICES:39]X_ID:49)
							$_l_InvoiceTablePosition:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[INVOICES:39]))
							If ($_l_InvoiceTablePosition>0)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; SD2_at_RelationNames{$_l_InvoiceTablePosition})
								APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_InvoiceTablePosition})
							Else   //This should NEVER happen
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; "Other...")
								APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
							End if 
						End if 
						If ($_bo_Unload)
							UNLOAD RECORD:C212([SERVICE_CALLS:20])
						End if 
					End if 
				End for 
			End if 
		End if 
	Else 
		///
		$_l_IndexStart:=Find in array:C230(SD2_al_RelatedRecordTableNum; Table:C252(->[INVOICES:39]))
		If ($_l_IndexStart>0)
			For ($_l_Index; $_l_IndexStart; Size of array:C274(SD2_al_RelatedRecordTableNum))
				If (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[INVOICES:39]))
					If (SD2_al_RelatedtoDiaryfield{$_l_Index}=Field:C253(->[INVOICES:39]Invoice_Number:1))
						If (SD2_at_RelatedRecordCode{$_l_Index}#"")
							///
							$_t_InvoiceCode:=SD2_at_RelatedRecordCode{$_l_Index}
							$_bo_Unload:=False:C215
							
							If ([INVOICES:39]Invoice_Number:1#$_t_InvoiceCode)
								QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceCode)
								$_bo_Unload:=True:C214
							End if 
							If (Records in selection:C76([INVOICES:39])=1)
								$_t_DateString:=" "+String:C10([INVOICES:39]Invoice_Date:4; 4)
								//[INVOICES]State
								SD2_at_RelatedRecordName{$_l_Index}:="Invoice:"+$_t_InvoiceCode+"("+$_t_DateString+")"
								SD2_al_RelatedRecordID{$_l_Index}:=[INVOICES:39]X_ID:49
								$_l_InvoiceTablePosition:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[INVOICES:39]))
								If ($_l_InvoiceTablePosition>0)
									SD2_at_RelatedRecordType{$_l_Index}:=SD2_at_RelationNames{$_l_ServiceTablePosition}
									SD2_al_RelatedtoDiaryfield{$_l_Index}:=SD2_al_relationDiaryField{$_l_ServiceTablePosition}
									
								Else   //This should NEVER happen
									SD2_at_RelatedRecordType{$_l_Index}:="Other..."
									SD2_al_RelatedtoDiaryfield{$_l_Index}:=0
								End if 
							End if 
							If ($_bo_Unload)
								UNLOAD RECORD:C212([INVOICES:39])
							End if 
							
							///
							
						End if 
					End if 
				End if 
			End for 
		Else 
			
		End if 
		
	End if 
End if 
////
$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseOrders)  //Purchase Orders
$_t_POCode:=""
If ($_l_ModuleAccess>1)
	If (SD_bo_NewRecord)  //it is a new record so add any static Invoice from the action
		$_l_POCodeFIeld:=-9001  //so this is a virtual field number here and because is negative it can never clash with the real fields.
		
		
		If ($_l_StaticFieldPosition>0) & ($_l_StaticRecordPosition>0)
			OB GET ARRAY:C1229($_Ptr_DiaryAttributes->; $_t_FieldReferenceName; $_al_FieldReferences)
			$_l_POCodePosition:=Find in array:C230($_al_FieldReferences; $_l_ProductField)
			If ($_l_POCodePosition>0)
				OB GET ARRAY:C1229($_ptr_Attributes->; $_t_RecordReferenceName; $_at_FieldRecordCode)
				For ($_l_Index; $_l_POCodePosition; Size of array:C274($_al_FieldReferences))
					If ($_al_FieldReferences{$_l_Index}=$_l_POCodeFIeld)
						$_t_POCode:=$_at_FieldRecordCode{$_l_Index}
						$_bo_Unload:=False:C215
						
						If ([PURCHASE_ORDERS:57]Purchase_Order_Number:2#$_t_POCode)
							QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=$_t_POCode)
							$_bo_Unload:=True:C214
						End if 
						If (Records in selection:C76([PURCHASE_ORDERS:57])=1)
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordTableNum; Table:C252(->[PURCHASE_ORDERS:57]))
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; $_t_POCode)
							$_t_DateString:=" "+String:C10([PURCHASE_ORDERS:57]Purchase_Order_Date:3; 4)
							
							//[INVOICES]State
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; "Purchase Order:"+$_t_POCode+"("+$_t_DateString+")")
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [PURCHASE_ORDERS:57]x_ID:21)
							$_l_POTablePosition:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[INVOICES:39]))
							If ($_l_POTablePosition>0)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; SD2_at_RelationNames{$_l_POTablePosition})
								APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_POTablePosition})
							Else   //This should NEVER happen
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; "Other...")
								APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
							End if 
						End if 
						If ($_bo_Unload)
							UNLOAD RECORD:C212([SERVICE_CALLS:20])
						End if 
					End if 
				End for 
			End if 
		End if 
	Else 
		///
		$_l_IndexStart:=Find in array:C230(SD2_al_RelatedRecordTableNum; Table:C252(->[PURCHASE_ORDERS:57]))
		If ($_l_IndexStart>0)
			For ($_l_Index; $_l_IndexStart; Size of array:C274(SD2_al_RelatedRecordTableNum))
				If (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[PURCHASE_ORDERS:57]))
					If (SD2_al_RelatedtoDiaryfield{$_l_Index}=Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2))
						If (SD2_at_RelatedRecordCode{$_l_Index}#"")
							///
							$_t_POCode:=SD2_at_RelatedRecordCode{$_l_Index}
							$_bo_Unload:=False:C215
							
							If ([PURCHASE_ORDERS:57]Purchase_Order_Number:2#$_t_POCode)
								QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=$_t_POCode)
								$_bo_Unload:=True:C214
							End if 
							If (Records in selection:C76([PURCHASE_ORDERS:57])=1)
								$_t_DateString:=" "+String:C10([PURCHASE_ORDERS:57]Purchase_Order_Date:3; 4)
								//[INVOICES]State
								SD2_at_RelatedRecordName{$_l_Index}:="Purchase Order:"+$_t_POCode+"("+$_t_DateString+")"
								SD2_al_RelatedRecordID{$_l_Index}:=[PURCHASE_ORDERS:57]x_ID:21
								$_l_POTablePosition:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[PURCHASE_ORDERS:57]))
								If ($_l_POTablePosition>0)
									SD2_at_RelatedRecordType{$_l_Index}:=SD2_at_RelationNames{$_l_POTablePosition}
									SD2_al_RelatedtoDiaryfield{$_l_Index}:=SD2_al_relationDiaryField{$_l_POTablePosition}
									
								Else   //This should NEVER happen
									SD2_at_RelatedRecordType{$_l_Index}:="Other..."
									SD2_al_RelatedtoDiaryfield{$_l_Index}:=0
								End if 
							End if 
							If ($_bo_Unload)
								UNLOAD RECORD:C212([PURCHASE_ORDERS:57])
							End if 
							
							///
							
						End if 
					End if 
				End if 
			End for 
		Else 
			
		End if 
		
	End if 
End if 

///
$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseLedger)  //Purchase invoice
$_t_PICode:=""
If ($_l_ModuleAccess>1)
	If (SD_bo_NewRecord)  //it is a new record so add any static Invoice from the action
		$_l_PICodeFIeld:=-9002  //so this is a virtual field number here and because is negative it can never clash with the real fields.
		
		
		If ($_l_StaticFieldPosition>0) & ($_l_StaticRecordPosition>0)
			OB GET ARRAY:C1229($_Ptr_DiaryAttributes->; $_t_FieldReferenceName; $_al_FieldReferences)
			$_l_PICodePosition:=Find in array:C230($_al_FieldReferences; $_l_ProductField)
			If ($_l_PICodePosition>0)
				OB GET ARRAY:C1229($_ptr_Attributes->; $_t_RecordReferenceName; $_at_FieldRecordCode)
				For ($_l_Index; $_l_PICodePosition; Size of array:C274($_al_FieldReferences))
					If ($_al_FieldReferences{$_l_Index}=$_l_PICodeFIeld)
						$_t_PICode:=$_at_FieldRecordCode{$_l_Index}
						$_bo_Unload:=False:C215
						
						If ([PURCHASE_INVOICES:37]Purchase_Code:1#$_t_PICode)
							QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_t_PICode)
							$_bo_Unload:=True:C214
						End if 
						If (Records in selection:C76([PURCHASE_INVOICES:37])=1)
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordTableNum; Table:C252(->[PURCHASE_INVOICES:37]))
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; $_t_PICode)
							$_t_DateString:=" "+String:C10([PURCHASE_INVOICES:37]Invoice_Date:5; 4)
							
							//[INVOICES]State
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; "Purchase Invoice:"+$_t_PICode+"("+$_t_DateString+")")
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [PURCHASE_INVOICES:37]x_ID:35)
							$_l_PITablePosition:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[PURCHASE_INVOICES:37]))
							If ($_l_PITablePosition>0)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; SD2_at_RelationNames{$_l_PITablePosition})
								APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_PITablePosition})
							Else   //This should NEVER happen
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; "Other...")
								APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
							End if 
						End if 
						If ($_bo_Unload)
							UNLOAD RECORD:C212([SERVICE_CALLS:20])
						End if 
					End if 
				End for 
			End if 
		End if 
	Else 
		///
		$_l_IndexStart:=Find in array:C230(SD2_al_RelatedRecordTableNum; Table:C252(->[PURCHASE_INVOICES:37]))
		If ($_l_IndexStart>0)
			For ($_l_Index; $_l_IndexStart; Size of array:C274(SD2_al_RelatedRecordTableNum))
				If (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[PURCHASE_INVOICES:37]))
					If (SD2_al_RelatedtoDiaryfield{$_l_Index}=Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1))
						If (SD2_at_RelatedRecordCode{$_l_Index}#"")
							///
							$_t_PICode:=SD2_at_RelatedRecordCode{$_l_Index}
							$_bo_Unload:=False:C215
							
							If ([PURCHASE_INVOICES:37]Purchase_Code:1#$_t_PICode)
								QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_t_PICode)
								$_bo_Unload:=True:C214
							End if 
							If (Records in selection:C76([PURCHASE_INVOICES:37])=1)
								$_t_DateString:=" "+String:C10([PURCHASE_INVOICES:37]Invoice_Date:5; 4)
								//[INVOICES]State
								SD2_at_RelatedRecordName{$_l_Index}:="Purchase Invoice:"+$_t_PICode+"("+$_t_DateString+")"
								SD2_al_RelatedRecordID{$_l_Index}:=[PURCHASE_INVOICES:37]x_ID:35
								$_l_PITablePosition:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[PURCHASE_INVOICES:37]))
								If ($_l_PITablePosition>0)
									SD2_at_RelatedRecordType{$_l_Index}:=SD2_at_RelationNames{$_l_PITablePosition}
									SD2_al_RelatedtoDiaryfield{$_l_Index}:=SD2_al_relationDiaryField{$_l_PITablePosition}
									
								Else   //This should NEVER happen
									SD2_at_RelatedRecordType{$_l_Index}:="Other..."
									SD2_al_RelatedtoDiaryfield{$_l_Index}:=0
								End if 
							End if 
							If ($_bo_Unload)
								UNLOAD RECORD:C212([PURCHASE_ORDERS:57])
							End if 
							
							///
							
						End if 
					End if 
				End if 
			End for 
		Else 
			
		End if 
		
	End if 
End if 

$_l_ModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)  //Stock Movement
$_t_SMCode:=""
If ($_l_ModuleAccess>1)
	If (SD_bo_NewRecord)  //it is a new record so add any static Invoice from the action
		$_l_SMCodeFIeld:=-9003  //so this is a virtual field number here and because is negative it can never clash with the real fields.
		
		If ($_l_StaticFieldPosition>0) & ($_l_StaticRecordPosition>0)
			OB GET ARRAY:C1229($_Ptr_DiaryAttributes->; $_t_FieldReferenceName; $_al_FieldReferences)
			$_l_SMCodePosition:=Find in array:C230($_al_FieldReferences; $_l_ProductField)
			If ($_l_SMCodePosition>0)
				OB GET ARRAY:C1229($_ptr_Attributes->; $_t_RecordReferenceName; $_at_FieldRecordCode)
				For ($_l_Index; $_l_SMCodePosition; Size of array:C274($_al_FieldReferences))
					If ($_al_FieldReferences{$_l_Index}=$_l_SMCodeFIeld)
						$_t_SMCode:=$_at_FieldRecordCode{$_l_Index}
						
						$_bo_Unload:=False:C215
						
						If ([STOCK_MOVEMENTS:40]Movement_Code:1#$_t_SMCode)
							QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=$_t_SMCode)
							$_bo_Unload:=True:C214
						End if 
						If (Records in selection:C76([STOCK_MOVEMENTS:40])=1)
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordTableNum; Table:C252(->[STOCK_MOVEMENTS:40]))
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; $_t_SMCode)
							$_t_DateString:=" "+String:C10([STOCK_MOVEMENTS:40]Movement_Date:5; 4)
							
							//[INVOICES]State
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; "Stock Movement:"+$_t_SMCode+"("+$_t_DateString+")")
							APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [PURCHASE_INVOICES:37]x_ID:35)
							$_l_SMTablePosition:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[STOCK_MOVEMENTS:40]))
							If ($_l_SMTablePosition>0)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; SD2_at_RelationNames{$_l_SMTablePosition})
								APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_SMTablePosition})
							Else   //This should NEVER happen
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; "Other...")
								APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
							End if 
						End if 
						If ($_bo_Unload)
							UNLOAD RECORD:C212([SERVICE_CALLS:20])
						End if 
					End if 
				End for 
			End if 
		End if 
	Else 
		///
		$_l_IndexStart:=Find in array:C230(SD2_al_RelatedRecordTableNum; Table:C252(->[STOCK_MOVEMENTS:40]))
		If ($_l_IndexStart>0)
			For ($_l_Index; $_l_IndexStart; Size of array:C274(SD2_al_RelatedRecordTableNum))
				If (SD2_al_RelatedRecordTableNum{$_l_Index}=Table:C252(->[STOCK_MOVEMENTS:40]))
					If (SD2_al_RelatedtoDiaryfield{$_l_Index}=Field:C253(->[STOCK_MOVEMENTS:40]Movement_Code:1))
						If (SD2_at_RelatedRecordCode{$_l_Index}#"")
							///
							$_t_SMCode:=SD2_at_RelatedRecordCode{$_l_Index}
							$_bo_Unload:=False:C215
							
							If ([STOCK_MOVEMENTS:40]Movement_Code:1#$_t_SMCode)
								QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=$_t_SMCode)
								$_bo_Unload:=True:C214
							End if 
							If (Records in selection:C76([STOCK_MOVEMENTS:40])=1)
								$_t_DateString:=" "+String:C10([STOCK_MOVEMENTS:40]Movement_Date:5; 4)
								//[INVOICES]State
								SD2_at_RelatedRecordName{$_l_Index}:="Stock Movement:"+$_t_SMCode+"("+$_t_DateString+")"
								SD2_al_RelatedRecordID{$_l_Index}:=[STOCK_MOVEMENTS:40]x_ID:22
								$_l_SMTablePosition:=Find in array:C230(SD2_al_RelationTable; Table:C252(->[STOCK_MOVEMENTS:40]))
								If ($_l_SMTablePosition>0)
									SD2_at_RelatedRecordType{$_l_Index}:=SD2_at_RelationNames{$_l_SMTablePosition}
									SD2_al_RelatedtoDiaryfield{$_l_Index}:=SD2_al_relationDiaryField{$_l_SMTablePosition}
									
								Else   //This should NEVER happen
									SD2_at_RelatedRecordType{$_l_Index}:="Other..."
									SD2_al_RelatedtoDiaryfield{$_l_Index}:=0
								End if 
							End if 
							If ($_bo_Unload)
								UNLOAD RECORD:C212([PURCHASE_ORDERS:57])
							End if 
							
							///
							
						End if 
					End if 
				End if 
			End for 
		Else 
			
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("SD3_SetDiaryRelationsArray"; $_t_oldMethodName)

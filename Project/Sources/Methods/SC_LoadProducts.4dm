//%attributes = {}
If (False:C215)
	//Project Method Name:      SC_LoadProducts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SC_LoadProducts
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SC_abo_PartsOrdered;0)
	//ARRAY BOOLEAN(SC_abo_ProductisForRepair;0)
	//ARRAY BOOLEAN(SC_abo_RelatedContract;0)
	//ARRAY BOOLEAN(SC_abo_RelatedOrder;0)
	//ARRAY BOOLEAN(SC_lb_PROD;0)
	//ARRAY LONGINT(SC_al_ComponentID;0)
	//ARRAY LONGINT(SC_al_LocationID;0)
	//ARRAY LONGINT(SC_al_OrderitemNumber;0)
	//ARRAY LONGINT(SC_al_PartsrequiredStatus;0)
	//ARRAY LONGINT(SC_al_ProductItemID;0)
	//ARRAY LONGINT(SC_al_RepairedID;0)
	//ARRAY LONGINT(SC_al_RepairStatus;0)
	//ARRAY LONGINT(SC_al_SeverityID;0)
	//ARRAY LONGINT(SC_al_SymptomID;0)
	//ARRAY LONGINT(SC_al_SystemsIDs;0)
	//ARRAY LONGINT(SC_al_WarrantyStatus;0)
	//ARRAY LONGINT(STK_al_CallLocations;0)
	//ARRAY LONGINT(SVS_al_Accessory;0)
	//ARRAY LONGINT(SVS_al_repairStatus;0)
	//ARRAY LONGINT(SVS_al_ServiceSeverityIDs;0)
	//ARRAY LONGINT(SVS_al_ServiceSymptomIDs;0)
	//ARRAY LONGINT(SVS_al_SIStatusIDs;0)
	//ARRAY LONGINT(SVS_al_WarrantyStatusIDs;0)
	//ARRAY TEXT(SC_at_additionalInformation;0)
	//ARRAY TEXT(SC_at_ComponentName;0)
	//ARRAY TEXT(SC_at_ContractDatesStrings;0)
	//ARRAY TEXT(SC_at_ContractTypeCode;0)
	//ARRAY TEXT(SC_at_ContractTypeName;0)
	//ARRAY TEXT(SC_at_FaultNotes;0)
	//ARRAY TEXT(SC_at_LocationName;0)
	//ARRAY TEXT(SC_at_OrderCode;0)
	//ARRAY TEXT(SC_at_PartsrequiredName;0)
	//ARRAY TEXT(SC_at_ProductCode;0)
	//ARRAY TEXT(SC_at_ProductContract;0)
	//ARRAY TEXT(SC_at_ProductName;0)
	//ARRAY TEXT(SC_at_ProductSerial;0)
	//ARRAY TEXT(SC_at_RelatedRecordCode;0)
	//ARRAY TEXT(SC_at_Relatedtype;0)
	//ARRAY TEXT(SC_at_RepairedName;0)
	//ARRAY TEXT(SC_at_RepairStatusName;0)
	//ARRAY TEXT(SC_at_severityName;0)
	//ARRAY TEXT(SC_at_SymptomName;0)
	//ARRAY TEXT(SC_at_SystemNames;0)
	//ARRAY TEXT(SC_at_Systems;0)
	//ARRAY TEXT(SC_at_Warranty;0)
	//ARRAY TEXT(SVS_at_Accessory;0)
	//ARRAY TEXT(SVS_at_CallLocationCodes;0)
	//ARRAY TEXT(SVS_at_CallLocations;0)
	//ARRAY TEXT(SVS_at_RepairStatus;0)
	//ARRAY TEXT(SVS_at_ServiceSeverity;0)
	//ARRAY TEXT(SVS_at_ServiceSymptoms;0)
	//ARRAY TEXT(SVS_at_SIStatus;0)
	//ARRAY TEXT(SVS_at_StorageLocation;0)
	//ARRAY TEXT(SVS_at_StorageLocations;0)
	//ARRAY TEXT(SVS_at_WarrantyStatus;0)
	C_LONGINT:C283($_l_CallLocationRow; $_l_Index; $_l_ListID; $_l_PartsStatusRow; $_l_RecordsinSelection; $_l_RepairStatusRow; $_l_SeverityRow; $_l_SymptomRow; $_l_WarrantyStatusRow; SC_l_BUT1; SC_l_BUT10)
	C_LONGINT:C283(SC_l_BUT11; SC_l_BUT12; SC_l_BUT13; SC_l_BUT14; SC_l_BUT15; SC_l_BUT16; SC_l_BUT17; SC_l_BUT18; SC_l_BUT19; SC_l_BUT2; SC_l_BUT20)
	C_LONGINT:C283(SC_l_BUT21; SC_l_BUT22; SC_l_BUT23; SC_l_BUT24; SC_l_BUT25; SC_l_BUT26; SC_l_BUT27; SC_l_BUT28; SC_l_BUT29; SC_l_BUT3; SC_l_BUT30)
	C_LONGINT:C283(SC_l_BUT31; SC_l_BUT32; SC_l_BUT33; SC_l_BUT34; SC_l_BUT35; SC_l_BUT36; SC_l_BUT37; SC_l_BUT38; SC_l_BUT39; SC_l_BUT4; SC_l_BUT40)
	C_LONGINT:C283(SC_l_BUT41; SC_l_BUT42; SC_l_BUT5; SC_l_BUT6; SC_l_BUT7; SC_l_BUT8; SC_l_BUT9; SC_l_ItemID; SC_ServiceCallProdID; SVS_l_DefaultLocationID)
	C_TEXT:C284($_t_oldMethodName; oSC_COL1; oSC_COL10; oSC_COL11; oSC_COL12; oSC_COL13; oSC_COL14; oSC_COL15; oSC_COL16; oSC_COL17; oSC_COL18)
	C_TEXT:C284(oSC_COL19; oSC_COL2; oSC_COL20; oSC_COL21; oSC_COL22; oSC_COL23; oSC_COL24; oSC_COL25; oSC_COL26; oSC_COL27; oSC_COL28)
	C_TEXT:C284(oSC_COL29; oSC_COL3; oSC_COL30; oSC_COL31; oSC_COL32; oSC_COL33; oSC_COL34; oSC_COL35; oSC_COL36; oSC_COL37; oSC_COL4)
	C_TEXT:C284(oSC_COL5; oSC_COL6; oSC_COL7; oSC_COL8; oSC_COL9; oSC_HED1; oSC_HED10; oSC_HED11; oSC_HED12; oSC_HED13; oSC_HED14)
	C_TEXT:C284(oSC_HED15; oSC_HED16; oSC_HED17; oSC_HED18; oSC_HED19; oSC_HED2; oSC_HED20; oSC_HED21; oSC_HED22; oSC_HED23; oSC_HED24)
	C_TEXT:C284(oSC_HED25; oSC_HED26; oSC_HED27; oSC_HED28; oSC_HED29; oSC_HED3; oSC_HED30; oSC_HED31; oSC_HED32; oSC_HED33; oSC_HED34)
	C_TEXT:C284(oSC_HED35; oSC_HED36; oSC_HED37; oSC_HED38; oSC_HED39; oSC_HED4; oSC_HED40; oSC_HED5; oSC_HED6; oSC_HED7; oSC_HED8)
	C_TEXT:C284(oSC_HED9; SC_t_prodcIDPtr)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SC_LoadProducts")
//This method bring the Products_Involved in a support call into arrays
//so we can display them in an area list window

//and
QUERY:C277([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8=[SERVICE_CALLS:20]Call_Code:4)
$_l_RecordsinSelection:=Records in selection:C76([SERVICE_CALLS_PRODUCTS:152])
ARRAY TEXT:C222(SC_at_ProductCode; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(SC_at_ProductSerial; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(SC_at_Systems; $_l_RecordsinSelection)
ARRAY TEXT:C222(SC_at_ProductName; $_l_RecordsinSelection)
ARRAY TEXT:C222(SC_at_ProductContract; $_l_RecordsinSelection)
ARRAY TEXT:C222(SC_at_Systems; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(SC_at_ProductName; $_l_RecordsinSelection)  //²
ARRAY BOOLEAN:C223(SC_abo_RelatedContract; $_l_RecordsinSelection)
ARRAY BOOLEAN:C223(SC_abo_RelatedOrder; $_l_RecordsinSelection)
ARRAY TEXT:C222(SC_at_ContractTypeCode; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(SC_at_ContractDatesStrings; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(SC_at_ContractTypeName; $_l_RecordsinSelection)  //²
ARRAY LONGINT:C221(SC_al_ProductItemID; $_l_RecordsinSelection)
ARRAY LONGINT:C221(SC_al_RepairStatus; $_l_RecordsinSelection)
ARRAY TEXT:C222(SC_at_RepairStatusName; $_l_RecordsinSelection)
ARRAY LONGINT:C221(SC_al_SymptomID; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(SC_at_SymptomName; $_l_RecordsinSelection)  //²
ARRAY LONGINT:C221(SC_al_PartsrequiredStatus; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(SC_at_PartsrequiredName; $_l_RecordsinSelection)  //²
ARRAY LONGINT:C221(SC_al_WarrantyStatus; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(SC_at_Warranty; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(SC_at_OrderCode; $_l_RecordsinSelection)  //²
ARRAY LONGINT:C221(SC_al_OrderitemNumber; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(SC_at_Relatedtype; $_l_RecordsinSelection)

ARRAY BOOLEAN:C223(SC_abo_PartsOrdered; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(SC_at_severityName; $_l_RecordsinSelection)  //²
ARRAY LONGINT:C221(SC_al_SeverityID; $_l_RecordsinSelection)  //²
ARRAY LONGINT:C221(SC_al_LocationID; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(SC_at_LocationName; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(SC_at_FaultNotes; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(SC_at_additionalInformation; $_l_RecordsinSelection)  //²
ARRAY LONGINT:C221(SC_al_ComponentID; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(SC_at_ComponentName; $_l_RecordsinSelection)  //
ARRAY BOOLEAN:C223(SC_abo_ProductisForRepair; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(SC_at_RelatedRecordCode; $_l_RecordsinSelection)

ARRAY TEXT:C222(SVS_at_ServiceSymptoms; 0)
ARRAY LONGINT:C221(SVS_al_ServiceSymptomIDs; 0)
ARRAY TEXT:C222(SVS_at_WarrantyStatus; 0)
ARRAY LONGINT:C221(SVS_al_WarrantyStatusIDs; 0)
ARRAY LONGINT:C221(SC_al_RepairedID; 0)
ARRAY TEXT:C222(SC_at_RepairedName; 0)
$_l_ListID:=AA_LoadListByName("Service Symptom"; ->SVS_at_ServiceSymptoms; ->SVS_al_ServiceSymptomIDs)
If (Size of array:C274(SVS_al_ServiceSymptomIDs)=0)
	$_l_ListID:=AA_ListAddItembyID($_l_ListID; "Not Applicable"; "None"; "Other...")
	$_l_ListID:=AA_LoadListByName("Service Symptom"; ->SVS_at_ServiceSymptoms; ->SVS_al_ServiceSymptomIDs)
End if 
ARRAY TEXT:C222(SVS_at_ServiceSeverity; 0)
ARRAY LONGINT:C221(SVS_al_ServiceSeverityIDs; 0)

$_l_ListID:=AA_LoadListByName("Problem Severity"; ->SVS_at_ServiceSeverity; ->SVS_al_ServiceSeverityIDs)
If (Size of array:C274(SVS_al_ServiceSeverityIDs)=0)
	$_l_ListID:=AA_ListAddItembyID($_l_ListID; "Not Applicable"; "Continuous"; "Intermittent")
	$_l_ListID:=AA_LoadListByName("Problem Severity"; ->SVS_at_ServiceSeverity; ->SVS_al_ServiceSeverityIDs)
End if 
ARRAY TEXT:C222(SVS_at_WarrantyStatus; 0)
ARRAY LONGINT:C221(SVS_al_WarrantyStatusIDs; 0)
$_l_ListID:=AA_LoadListByName("Warranty Status"; ->SVS_at_WarrantyStatus; ->SVS_al_WarrantyStatusIDs)
If (Size of array:C274(SVS_al_WarrantyStatusIDs)=0)
	$_l_ListID:=AA_ListAddItembyID($_l_ListID; "Not Applicable"; "In Warranty"; "Expired")
	$_l_ListID:=AA_LoadListByName("Warranty Status"; ->SVS_at_WarrantyStatus; ->SVS_al_WarrantyStatusIDs)
End if 
ARRAY TEXT:C222(SVS_at_SIStatus; 0)
ARRAY LONGINT:C221(SVS_al_SIStatusIDs; 0)
$_l_ListID:=AA_LoadListByName("Service Item Status"; ->SVS_at_SIStatus; ->SVS_al_SIStatusIDs)
If (Size of array:C274(SVS_al_SIStatusIDs)=0)
	$_l_ListID:=AA_ListAddItembyID($_l_ListID; "Not Applicable"; "To be Ordered"; "Ordered"; "Received"; "Completed")
	$_l_ListID:=AA_LoadListByName("Service Item Status"; ->SVS_at_SIStatus; ->SVS_al_SIStatusIDs)
End if 
ARRAY TEXT:C222(SVS_at_Accessory; 0)
ARRAY LONGINT:C221(SVS_al_Accessory; 0)

$_l_ListID:=AA_LoadListByName("Stored Service Items"; ->SVS_at_Accessory; ->SVS_al_Accessory)
If (Size of array:C274(SVS_al_Accessory)=0)
	$_l_ListID:=AA_ListAddItembyID($_l_ListID; "Not Applicable"; "Original Packaging"; "Missing Parts...")
	$_l_ListID:=AA_LoadListByName("Stored Service Items"; ->SVS_at_Accessory; ->SVS_al_Accessory)
End if 
ARRAY TEXT:C222(SVS_at_RepairStatus; 0)
ARRAY LONGINT:C221(SVS_al_repairStatus; 0)

$_l_ListID:=AA_LoadListByName("Repaired Status"; ->SVS_at_RepairStatus; ->SVS_al_repairStatus)
If (Size of array:C274(SVS_al_repairStatus)=0)
	$_l_ListID:=AA_ListAddItembyID($_l_ListID; "Not Applicable"; "Not looked at"; "Repaired")
	$_l_ListID:=AA_LoadListByName("Repaired Status"; ->SVS_at_RepairStatus; ->SVS_al_repairStatus)
End if 
ARRAY TEXT:C222(SVS_at_StorageLocations; 0)
ARRAY TEXT:C222(SVS_at_StorageLocation; 0)
QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=0)

If (Records in selection:C76([LOCATIONS:61])>0)
	READ WRITE:C146([LOCATIONS:61])
	QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=0)
	APPLY TO SELECTION:C70([LOCATIONS:61]; [LOCATIONS:61]LocationID:4:=AA_GetNextID(->[LOCATIONS:61]LocationID:4))
End if 
ARRAY TEXT:C222(SVS_at_CallLocationCodes; 0)
ARRAY TEXT:C222(SVS_at_CallLocations; 0)
ARRAY LONGINT:C221(STK_al_CallLocations; 0)
If (SVS_l_DefaultLocationID>0)
	QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]ParentLocationID:3=SVS_l_DefaultLocationID)  //These are the top level locations.
	SELECTION TO ARRAY:C260([LOCATIONS:61]Location_Code:1; SVS_at_CallLocationCodes; [LOCATIONS:61]Location_Name:2; SVS_at_CallLocations; [LOCATIONS:61]LocationID:4; STK_al_CallLocations)
End if 

//We want
//1)Symptom²
//2)Severity²
//3)Location²
//4)warranty Status²
//5)Item status(none, to be ordered, ordered, received)²
//6) product involved needs an ID...because the Order item link will need to know it is for this product
//7)'Type' Accessories..things with the item not for repair th...0 means its an item

FIRST RECORD:C50([SERVICE_CALLS_PRODUCTS:152])

For ($_l_Index; 1; $_l_RecordsinSelection)
	If (False:C215)
		SC_at_ProductCode{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]Product_Code:1
		SC_at_ProductSerial{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]Serial_Number:2
		SC_at_Systems{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]System:4
		SC_at_ProductName{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]Product_Name:5
		SC_at_ProductContract{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]Contract_Code:3
		RELATE ONE:C42([SERVICE_CALLS_PRODUCTS:152]Contract_Code:3)
		SC_at_ContractTypeCode{$_l_Index}:=[CONTRACTS:17]Contract_Type_Code:4
		SC_at_ContractDatesStrings{$_l_Index}:=String:C10([CONTRACTS:17]Start_Date:5; "Short")+" - "+String:C10([CONTRACTS:17]End_Date:6; "Short")
		RELATE ONE:C42([CONTRACTS:17]Contract_Type_Code:4)
		SC_at_ContractTypeName{$_l_Index}:=[CONTRACT_TYPES:19]Contract_Type_Name:2
		If ([SERVICE_CALLS_PRODUCTS:152]SCProductXID:6=0)
			SC_t_prodcIDPtr:="SC_ServiceCallProdID"
			[SERVICE_CALLS_PRODUCTS:152]SCProductXID:6:=AA_GetNextIDinMethod(->SC_t_prodcIDPtr)
		End if 
		
		SC_al_ProductItemID{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]SCProductXID:6
	Else 
		SC_l_ItemID:=0
		If ([SERVICE_CALLS_PRODUCTS:152]SCProductXID:6=0)
			[SERVICE_CALLS_PRODUCTS:152]SCProductXID:6:=AA_GetNextID(->SC_l_ItemID)
		End if 
		
		SC_at_ProductCode{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]Product_Code:1
		SC_at_ProductSerial{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]Serial_Number:2
		SC_at_Systems{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]System:4
		SC_at_ProductName{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]Product_Name:5
		SC_at_ProductContract{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]Contract_Code:3
		SC_abo_RelatedContract{$_l_Index}:=False:C215
		If (SC_at_ProductContract{$_l_Index}#"")
			SC_at_RelatedRecordCode{$_l_Index}:=SC_at_ProductContract{$_l_Index}
			SC_abo_RelatedContract{$_l_Index}:=True:C214
		End if 
		RELATE ONE:C42([SERVICE_CALLS_PRODUCTS:152]Contract_Code:3)
		SC_at_ContractTypeCode{$_l_Index}:=[CONTRACTS:17]Contract_Type_Code:4
		SC_at_Relatedtype{$_l_Index}:=SC_at_ContractTypeCode{$_l_Index}
		SC_at_ContractDatesStrings{$_l_Index}:=String:C10([CONTRACTS:17]Start_Date:5; "Short")+" - "+String:C10([CONTRACTS:17]End_Date:6; "Short")
		RELATE ONE:C42([CONTRACTS:17]Contract_Type_Code:4)
		SC_at_ContractTypeName{$_l_Index}:=[CONTRACT_TYPES:19]Contract_Type_Name:2
		//If ([SERVICE CALLS_PRODUCTS]SCProductXID=0)
		//C_LONGINT(SC_ServiceCallProdID)
		//C_TEXT(SC_t_prodcIDPtr)
		//SC_t_prodcIDPtr:="SC_ServiceCallProdID"
		//[SERVICE CALLS_PRODUCTS]SCProductXID:=AA_GetNextIDinMethod (->SC_t_prodcIDPtr)
		//End if
		//``
		//Note that the following fields are for recording that the item was supplied on a given order item
		SC_al_OrderitemNumber{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]xRelatedOrderItemNumber:13
		If (SC_al_OrderitemNumber{$_l_Index}#0)
			SC_abo_RelatedOrder{$_l_Index}:=True:C214
			If (SC_at_RelatedRecordCode{$_l_Index}="")
				SC_at_RelatedRecordCode{$_l_Index}:=String:C10(SC_al_OrderitemNumber{$_l_Index})
				If (SC_at_Relatedtype{$_l_Index}="")
					SC_at_Relatedtype{$_l_Index}:="Order Item"
					SC_at_ContractDatesStrings{$_l_Index}:="N/A"
				End if 
			End if 
		End if 
		SC_at_OrderCode{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]xRelatedOrderItemCode:12
		SC_al_WarrantyStatus{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]xProductWarrentyStatus:11
		//Parts ordered to fix are recorded in the related table xServiceSalesItemLink
		QUERY:C277([xServiceSalesItemLink:186]; [xServiceSalesItemLink:186]SC_ProductInvolvedID:6=[SERVICE_CALLS_PRODUCTS:152]SCProductXID:6)
		SC_abo_PartsOrdered{$_l_Index}:=False:C215
		If (Records in selection:C76([xServiceSalesItemLink:186])>0)
			SC_abo_PartsOrdered{$_l_Index}:=True:C214
			If ([SERVICE_CALLS_PRODUCTS:152]xProductWarrentyStatus:11>0)
				$_l_WarrantyStatusRow:=Find in array:C230(SVS_al_WarrantyStatusIDs; [SERVICE_CALLS_PRODUCTS:152]xProductWarrentyStatus:11)
				If ($_l_WarrantyStatusRow>0)  //it should be
					SC_at_Warranty{$_l_Index}:=SVS_at_WarrantyStatus{$_l_WarrantyStatusRow}
				End if 
			End if 
		End if 
		SC_al_SymptomID{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]xIdentifiedsympton:9
		If ([SERVICE_CALLS_PRODUCTS:152]xIdentifiedsympton:9>0)
			$_l_SymptomRow:=Find in array:C230(SVS_al_ServiceSymptomIDs; [SERVICE_CALLS_PRODUCTS:152]xIdentifiedsympton:9)
			If ($_l_SymptomRow>0)
				SC_at_SymptomName{$_l_Index}:=SVS_at_ServiceSymptoms{$_l_SymptomRow}
			End if 
		End if 
		SC_al_SeverityID{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]xSeverityID:22
		SC_at_severityName{$_l_Index}:=""
		If (SC_al_SeverityID{$_l_Index}>0)
			$_l_SeverityRow:=Find in array:C230(SVS_al_ServiceSeverityIDs; SC_al_SeverityID{$_l_Index})
			If ($_l_SeverityRow>0)
				SC_at_severityName{$_l_Index}:=SVS_at_ServiceSeverity{$_l_SeverityRow}
			End if 
		End if 
		SC_al_PartsrequiredStatus{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]xPartRequiredStatus:10
		SC_at_PartsrequiredName{$_l_Index}:="'"
		If (SC_al_PartsrequiredStatus{$_l_Index}>0)
			$_l_PartsStatusRow:=Find in array:C230(SVS_al_SIStatusIDs; SC_al_PartsrequiredStatus{$_l_Index})
			If ($_l_PartsStatusRow>0)
				SC_at_PartsrequiredName{$_l_Index}:=SVS_at_SIStatus{$_l_PartsStatusRow}
			End if 
		End if 
		SC_al_WarrantyStatus{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]xProductWarrentyStatus:11
		SC_at_Warranty{$_l_Index}:=""
		If (SC_al_WarrantyStatus{$_l_Index}>0)
			$_l_WarrantyStatusRow:=Find in array:C230(SVS_al_WarrantyStatusIDs; SC_al_WarrantyStatus{$_l_Index})
			If ($_l_WarrantyStatusRow>0)
				SC_at_Warranty{$_l_Index}:=SVS_at_WarrantyStatus{$_l_WarrantyStatusRow}
			End if 
		End if 
		SC_al_LocationID{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]xStorageLocationID:17
		SC_at_LocationName{$_l_Index}:="N/A"
		If (SC_al_LocationID{$_l_Index}>0)
			$_l_CallLocationRow:=Find in array:C230(STK_al_CallLocations; SC_al_LocationID{$_l_Index})
			If ($_l_CallLocationRow>0)
				SC_at_LocationName{$_l_Index}:=SVS_at_CallLocations{$_l_CallLocationRow}
			Else 
				QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=SC_al_LocationID{$_l_Index})
				SC_at_LocationName{$_l_Index}:=[LOCATIONS:61]Location_Name:2
				UNLOAD RECORD:C212([LOCATIONS:61])
			End if 
		End if 
		SC_at_FaultNotes{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]Fault_Note:15
		SC_at_additionalInformation{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]Additional_Information:16
		SC_al_ComponentID{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]xNonInvolvedComponentID:20
		SC_at_ComponentName{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]xNonInvolcedComponentName:21
		SC_abo_ProductisForRepair{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]x_involved:19
		SC_al_ProductItemID{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]SCProductXID:6
		SC_al_RepairStatus{$_l_Index}:=[SERVICE_CALLS_PRODUCTS:152]xRepairStatus:23
		//SC_al_RepairedID{$_l_Index}:=[SERVICE CALLS_PRODUCTS]xRepairStatus
		If (SC_al_RepairStatus{$_l_Index}>0)
			$_l_RepairStatusRow:=Find in array:C230(SVS_al_repairStatus; SC_al_RepairStatus{$_l_Index})
			If ($_l_RepairStatusRow>0)
				SC_at_RepairStatusName{$_l_Index}:=SVS_at_RepairStatus{$_l_RepairStatusRow}
			End if 
		End if 
	End if 
	NEXT RECORD:C51([SERVICE_CALLS_PRODUCTS:152])
	
End for 
ARRAY TEXT:C222(SC_at_SystemNames; 0)
ARRAY LONGINT:C221(SC_al_SystemsIDs; 0)
$_l_ListID:=AA_LoadListByName("Serviced Systems"; ->SC_at_SystemNames; ->SC_al_SystemsIDs; True:C214)




LB_SetupListbox(->SC_lb_PROD; "oSC"; "SC_L"; 1; ->SC_at_ProductCode; ->SC_at_ProductName; ->SC_abo_RelatedContract; ->SC_abo_RelatedOrder; ->SC_at_RelatedRecordCode; ->SC_at_Relatedtype; ->SC_at_ContractDatesStrings; ->SC_at_ProductSerial; ->SC_at_Systems; ->SC_abo_ProductisForRepair; ->SC_at_ComponentName; ->SC_at_Warranty; ->SC_at_LocationName; ->SC_at_PartsrequiredName; ->SC_abo_PartsOrdered; ->SC_at_SymptomName; ->SC_at_severityName; ->SC_at_RepairStatusName; ->SC_at_FaultNotes; ->SC_at_additionalInformation)

LB_SetupListbox(->SC_lb_PROD; "oSC"; "SC_L"; 21; ->SC_at_OrderCode; ->SC_al_OrderitemNumber; ->SC_al_PartsrequiredStatus; ->SC_al_WarrantyStatus; ->SC_al_ProductItemID; ->SC_al_SymptomID; ->SC_al_SeverityID; ->SC_al_LocationID; ->SC_al_ComponentID; ->SC_al_RepairStatus; ->SC_at_ContractTypeCode; ->SC_at_ProductContract)
LB_SetColumnHeaders(->SC_lb_PROD; "SC_L"; 1; "Product"; ""; "Contract?"; "Order?"; "Related Record"; "Type"; "Contract Dates"; "Serial No"; "System"; "is for repair"; "Accessory Type"; "Warranty Status"; "Location"; "Parts Status"; "Parts ordered"; "Symptom"; "Severity"; "Repair Status"; "Fault Notes"; "Additional Information")
LB_SetColumnWidths(->SC_lb_PROD; "oSC"; 1; 70; 188; 60; 60; 100; 100; 150; 200; 50; 60; 100; 100; 100; 100; 100; 100; 100; 100; 100; 100)
LB_SetColumnWidths(->SC_lb_PROD; "oSC"; 21; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0)
LB_SetEnterable(->SC_lb_PROD; False:C215; 0)
If ([SERVICE_CALLS:20]Resolved:9=False:C215) & (False:C215)
	
	LB_SetEnterable(->SC_lb_PROD; True:C214; 1)
	LB_SetEnterable(->SC_lb_PROD; True:C214; 2)
	LB_SetEnterable(->SC_lb_PROD; True:C214; 8)
	LB_SetEnterable(->SC_lb_PROD; True:C214; 9)  //Pop up of systems(add to as well)
	LB_SetChoiceList("Pop_Systems"; ->SC_at_SystemNames; ->SC_at_Systems)
	LB_SetEnterable(->SC_lb_PROD; True:C214; 10)  //Boolean..is for repair
	LB_SetEnterable(->SC_lb_PROD; True:C214; 13)  //Pop up of warrenty statatus
	LB_SetChoiceList("Pop_Warr"; ->SVS_at_WarrantyStatus; ->SC_at_Warranty)
	LB_SetEnterable(->SC_lb_PROD; True:C214; 14)  //Pop up of locations(add to as well)
	LB_SetChoiceList("Pop_Location"; ->SVS_at_StorageLocations; ->SC_at_LocationName)
	LB_SetEnterable(->SC_lb_PROD; True:C214; 15)  //Parts or status pop up
	LB_SetChoiceList("Pop_Parts"; ->SVS_at_SIStatus; ->SC_at_PartsrequiredName)
	LB_SetEnterable(->SC_lb_PROD; True:C214; 17)  //pop up of symptoms
	LB_SetChoiceList("Pop_Symptom"; ->SVS_at_ServiceSymptoms; ->SC_at_SymptomName)
	
	LB_SetEnterable(->SC_lb_PROD; True:C214; 18)  //Pop up of severity
	LB_SetChoiceList("Pop_Severity"; ->SVS_at_ServiceSeverity; ->SC_at_severityName)
	LB_SetEnterable(->SC_lb_PROD; True:C214; 19)  //Pop up of repair status
	LB_SetChoiceList("Pop_Fix"; ->SVS_at_RepairStatus; ->SC_at_severityName)
	
	LB_SetEnterable(->SC_lb_PROD; True:C214; 19)  //fault note
	LB_SetEnterable(->SC_lb_PROD; True:C214; 20)
	//additional Infomation
End if 

LB_SetScroll(->SC_lb_PROD; -2; -2)

If ([SERVICE_CALLS:20]Resolved:9=False:C215)  //can add products
	LB_SetEnterable(->SC_lb_PROD; True:C214; 1; "")
	LB_SetEnterable(->SC_lb_PROD; True:C214; 2; "")
	LB_SetChoiceList("lbProdSystems"; ->SC_at_SystemNames; ->SC_at_Systems)
	LB_SetEnterable(->SC_lb_PROD; True:C214; 4; "")
	LB_SetEnterable(->SC_lb_PROD; True:C214; 5; "")
	LB_SetEnterable(->SC_lb_PROD; False:C215; 6; "")
	LB_SetEnterable(->SC_lb_PROD; False:C215; 7; "")
	LB_SetEnterable(->SC_lb_PROD; False:C215; 8; "")
Else 
	LB_SetEnterable(->SC_lb_PROD; False:C215; 0; "")
End if 
LB_StyleSettings(->SC_lb_PROD; "Black"; 9; "SC"; ->[SERVICE_CALLS:20])
ERR_MethodTrackerReturn("SC_LoadProducts"; $_t_oldMethodName)

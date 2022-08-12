If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.oSCProducts
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
	//C_UNKNOWN(SC_ExitCalled)
	//ARRAY BOOLEAN(SC_abo_PartsOrdered;0)
	//ARRAY BOOLEAN(SC_abo_ProductisForRepair;0)
	//ARRAY BOOLEAN(SC_abo_RelatedContract;0)
	//ARRAY BOOLEAN(SC_abo_RelatedOrder;0)
	//ARRAY BOOLEAN(SC_lb_PROD;0)
	//ARRAY BOOLEAN(SVS_abo_AccessoryIncluded;0)
	//ARRAY LONGINT(SC_al_ComponentID;0)
	//ARRAY LONGINT(SC_al_LocationID;0)
	//ARRAY LONGINT(SC_al_OrderitemNumber;0)
	//ARRAY LONGINT(SC_al_PartsrequiredStatus;0)
	//ARRAY LONGINT(SC_al_ProductItemID;0)
	//ARRAY LONGINT(SC_al_RepairStatus;0)
	//ARRAY LONGINT(SC_al_SeverityID;0)
	//ARRAY LONGINT(SC_al_SymptomID;0)
	//ARRAY LONGINT(SC_al_WarrantyStatus;0)
	//ARRAY LONGINT(SVS_al_Accessory;0)
	//ARRAY LONGINT(SVS_al_IncProdID;0)
	//ARRAY LONGINT(SVS_al_LocationID;0)
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
	//ARRAY TEXT(SC_at_RepairStatusName;0)
	//ARRAY TEXT(SC_at_severityName;0)
	//ARRAY TEXT(SC_at_SymptomName;0)
	//ARRAY TEXT(SC_at_Systems;0)
	//ARRAY TEXT(SC_at_Warranty;0)
	//ARRAY TEXT(SVS_at_Accessory;0)
	//ARRAY TEXT(SVS_at_AnLocationnames;0)
	C_LONGINT:C283($_l_CurrentSortColumn; $_l_CurrentWinRefOLD; $_l_event; $_l_FieldNumber; $_l_Index; $_l_ProductCodeRow; $_l_Row; $_l_TableNumber; SC_ExitCalled; SC_l_ItemID; SVS_l_ItemForRepair)
	C_LONGINT:C283(SVS_l_Itemlocation; SVS_l_PartsStatus; SVS_l_RepairStatus; SVS_l_SelectedItem; SVS_l_Severity; SVS_l_SOitem; SVS_l_Symptom; SVS_l_Warranty; WIN_l_CurrentWinRef; $_l_Column; $_l_CurrentSortColumn)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_event; $_l_FieldNumber; $_l_Index; $_l_ProductCodeRow; $_l_Row; $_l_TableNumber; SC_l_ItemID; SC_ServiceCallProdID; SVS_l_ItemForRepair; SVS_l_Itemlocation)
	C_LONGINT:C283(SVS_l_PartsStatus; SVS_l_RepairStatus; SVS_l_SelectedItem; SVS_l_Severity; SVS_l_SOitem; SVS_l_Symptom; SVS_l_Warranty; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_ProductCodeOLD; $_t_VariableName; SVS_t_ContractCode; SVS_t_ContractType; SVS_t_FaultNote; SVS_t_ItemLocation; SVS_t_PartsStatus; SVS_t_ProductCode; SVS_t_ProductName; SVS_t_RepairStatus; SVS_t_Severity)
	C_TEXT:C284(SVS_t_SOCode; SVS_t_Symptom; SVS_t_SystemName; SVS_t_Warranty; $_t_oldMethodName; $_t_ProductCodeOLD; $_t_VariableName; SVS_t_ContractCode; SVS_t_ContractType; SVS_t_FaultNote; SVS_t_ItemLocation)
	C_TEXT:C284(SVS_t_PartsStatus; SVS_t_ProductCode; SVS_t_ProductName; SVS_t_RepairStatus; SVS_t_SerialNumber; SVS_t_Severity; SVS_t_SOCode; SVS_t_Symptom; SVS_t_SystemName; SVS_t_Warranty)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS]Calls_in.oSCProducts"; Form event code:C388)

//`SC_PowerViewPRODScpt
ERR_MethodTrackerReturn("OBJ:Calls_In,SC_lb_PROD"; $_t_oldMethodName)
$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.oSCProducts"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentSortColumn:=LB_GetColumn(->SC_lb_PROD; ""; $_t_VariableName)
		
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
	: ($_l_event=On Clicked:K2:4)
		$_l_Row:=Self:C308->
		If (SC_al_ComponentID{$_l_Row}>0)
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153(40; 100; 100; 280+40; 34)
			DIALOG:C40([USER:15]; "SVS_AncillaryProducts")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			For ($_l_Index; 1; Size of array:C274(SVS_abo_AccessoryIncluded))
				If (SVS_abo_AccessoryIncluded{$_l_Index})
					If (SVS_al_IncProdID{$_l_Index}#0)  //is already in list
						$_l_ProductCodeRow:=Find in array:C230(SC_al_ProductItemID; SVS_al_IncProdID{$_l_Index})
						SC_al_ComponentID{$_l_ProductCodeRow}:=SVS_al_Accessory{$_l_Index}
						SC_at_ComponentName{$_l_ProductCodeRow}:=SVS_at_Accessory{$_l_Index}
						SC_abo_ProductisForRepair{$_l_ProductCodeRow}:=False:C215
						SC_al_LocationID{$_l_ProductCodeRow}:=SVS_al_LocationID{$_l_Index}
						SC_at_LocationName{$_l_ProductCodeRow}:=SVS_at_AnLocationnames{$_l_Index}
					Else 
						//add to list
						APPEND TO ARRAY:C911(SC_at_ProductCode; "")
						APPEND TO ARRAY:C911(SC_at_ProductSerial; "")
						APPEND TO ARRAY:C911(SC_at_ProductContract; "")
						APPEND TO ARRAY:C911(SC_at_Systems; "")
						APPEND TO ARRAY:C911(SC_at_ProductName; "")
						APPEND TO ARRAY:C911(SC_abo_RelatedContract; False:C215)
						APPEND TO ARRAY:C911(SC_at_OrderCode; "")
						APPEND TO ARRAY:C911(SC_abo_RelatedOrder; False:C215)
						APPEND TO ARRAY:C911(SC_at_ContractTypeCode; "")
						APPEND TO ARRAY:C911(SC_at_ContractDatesStrings; "")
						APPEND TO ARRAY:C911(SC_at_Relatedtype; "")
						SC_l_ItemID:=0
						If (SC_l_ItemID=0)
							SC_l_ItemID:=AA_GetNextID(->SC_l_ItemID)
						End if 
						APPEND TO ARRAY:C911(SC_al_ProductItemID; -(SC_l_ItemID))
						APPEND TO ARRAY:C911(SC_al_RepairStatus; 0)
						APPEND TO ARRAY:C911(SC_at_RepairStatusName; "")
						APPEND TO ARRAY:C911(SC_al_SymptomID; 0)
						APPEND TO ARRAY:C911(SC_at_SymptomName; "")
						APPEND TO ARRAY:C911(SC_al_PartsrequiredStatus; 0)
						APPEND TO ARRAY:C911(SC_at_PartsrequiredName; "")  //²
						APPEND TO ARRAY:C911(SC_al_WarrantyStatus; 0)  //²
						APPEND TO ARRAY:C911(SC_at_Warranty; "")  //²
						APPEND TO ARRAY:C911(SC_al_OrderitemNumber; 0)  //²
						APPEND TO ARRAY:C911(SC_abo_PartsOrdered; False:C215)
						APPEND TO ARRAY:C911(SC_at_severityName; "")
						APPEND TO ARRAY:C911(SC_al_SeverityID; 0)
						APPEND TO ARRAY:C911(SC_al_LocationID; SVS_al_LocationID{$_l_Index})
						APPEND TO ARRAY:C911(SC_at_LocationName; SVS_at_AnLocationnames{$_l_Index})
						APPEND TO ARRAY:C911(SC_at_FaultNotes; "")
						APPEND TO ARRAY:C911(SC_at_additionalInformation; "")
						APPEND TO ARRAY:C911(SC_al_ComponentID; SVS_al_Accessory{$_l_Index})
						APPEND TO ARRAY:C911(SC_at_ComponentName; SVS_at_Accessory{$_l_Index})
						APPEND TO ARRAY:C911(SC_abo_ProductisForRepair; False:C215)
						APPEND TO ARRAY:C911(SC_at_RelatedRecordCode; "")
						APPEND TO ARRAY:C911(SC_al_RepairStatus; 0)
						APPEND TO ARRAY:C911(SC_at_RepairStatusName; "")
					End if 
				Else 
					If (SVS_al_IncProdID{$_l_Index}#0)
						//Is already in list-deleted it
						$_l_ProductCodeRow:=Find in array:C230(SC_al_ProductItemID; SVS_al_IncProdID{$_l_Index})
						DELETE FROM ARRAY:C228(SC_at_ProductCode; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_ProductSerial; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_ProductContract; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_Systems; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_ProductName; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_abo_RelatedContract; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_OrderCode; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_abo_RelatedOrder; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_ContractTypeCode; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_ContractDatesStrings; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_Relatedtype; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_al_ProductItemID; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_al_RepairStatus; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_RepairStatusName; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_al_SymptomID; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_SymptomName; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_al_PartsrequiredStatus; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_PartsrequiredName; $_l_ProductCodeRow)  //²
						DELETE FROM ARRAY:C228(SC_al_WarrantyStatus; $_l_ProductCodeRow)  //²
						DELETE FROM ARRAY:C228(SC_at_Warranty; $_l_ProductCodeRow)  //²
						DELETE FROM ARRAY:C228(SC_al_OrderitemNumber; $_l_ProductCodeRow)  //²
						DELETE FROM ARRAY:C228(SC_abo_PartsOrdered; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_severityName; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_al_SeverityID; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_al_LocationID; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_LocationName; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_FaultNotes; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_additionalInformation; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_al_ComponentID; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_ComponentName; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_abo_ProductisForRepair; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_RelatedRecordCode; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_al_RepairStatus; $_l_ProductCodeRow)
						DELETE FROM ARRAY:C228(SC_at_RepairStatusName; $_l_ProductCodeRow)
					Else 
						//do nothing
					End if 
				End if 
			End for 
			
		Else 
			If (SC_al_ProductItemID{$_l_Row}#0)
				SVS_l_SelectedItem:=SC_al_ProductItemID{$_l_Row}
				Open window:C153(40; 100; 100; 280+40; 34)
				DIALOG:C40([USER:15]; "SVS_EditProductInvolved")
				SC_al_ProductItemID{$_l_Row}:=SVS_l_SelectedItem
				SC_at_ProductCode{$_l_Row}:=SVS_t_ProductCode
				SC_at_ProductSerial{$_l_Row}:=SVS_t_SerialNumber
				SC_at_ProductContract{$_l_Row}:=SVS_t_ContractCode
				SC_at_Systems{$_l_Row}:=SVS_t_SystemName
				SC_at_ProductName{$_l_Row}:=SVS_t_ProductName
				SC_at_OrderCode{$_l_Row}:=SVS_t_SOCode
				SC_at_ContractTypeCode{$_l_Row}:=SVS_t_ContractType
				SC_al_RepairStatus{$_l_Row}:=SVS_l_RepairStatus
				SC_at_RepairStatusName{$_l_Row}:=SVS_t_RepairStatus
				SC_al_SymptomID{$_l_Row}:=SVS_l_Symptom
				SC_at_SymptomName{$_l_Row}:=SVS_t_Symptom
				SC_al_PartsrequiredStatus{$_l_Row}:=SVS_l_PartsStatus
				SC_at_PartsrequiredName{$_l_Row}:=SVS_t_PartsStatus
				SC_al_WarrantyStatus{$_l_Row}:=SVS_l_Warranty
				SC_at_Warranty{$_l_Row}:=SVS_t_Warranty
				SC_al_OrderitemNumber{$_l_Row}:=SVS_l_SOitem
				SC_at_severityName{$_l_Row}:=SVS_t_Severity
				SC_al_SeverityID{$_l_Row}:=SVS_l_Severity
				SC_al_LocationID{$_l_Row}:=SVS_l_Itemlocation
				SC_at_LocationName{$_l_Row}:=SVS_t_ItemLocation
				SC_at_FaultNotes{$_l_Row}:=SVS_t_FaultNote
				SC_abo_ProductisForRepair{$_l_Row}:=(SVS_l_ItemForRepair=1)
				SC_al_RepairStatus{$_l_Row}:=SVS_l_RepairStatus
				SC_at_RepairStatusName{$_l_Row}:=SVS_t_RepairStatus
				If (SC_at_ProductContract{$_l_Row}#"")
					SC_abo_RelatedContract{$_l_Row}:=True:C214
				End if 
				If (SC_at_OrderCode{$_l_Row}#"")
					SC_abo_RelatedOrder{$_l_Row}:=True:C214
				End if 
				If (SC_abo_RelatedContract{$_l_Row})
					SC_at_Relatedtype{$_l_Row}:="Contract"
					QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Contract_Code:3=SC_at_ProductContract{$_l_Row})
					SC_at_ContractDatesStrings{$_l_Row}:=String:C10([CONTRACTS:17]Start_Date:5; "Short")+" - "+String:C10([CONTRACTS:17]End_Date:6; "Short")
				Else 
					SC_at_Relatedtype{$_l_Row}:="Order Item"
					SC_at_ContractDatesStrings{$_l_Row}:="N/A"
				End if 
				If (SC_at_ProductContract{$_l_Row}#"")
					SC_at_RelatedRecordCode{$_l_Row}:=SC_at_ProductContract{$_l_Row}
				Else 
					SC_at_RelatedRecordCode{$_l_Row}:=SC_at_OrderCode{$_l_Row}
				End if 
			End if 
		End if 
		
		
	: ($_l_event=On Data Change:K2:15)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_Column:=LB_GetColumn(->SC_lb_PROD; $_t_VariableName)
		If ($_l_Column>0) & ($_l_Row>0)
			Case of 
				: ($_l_Column=1)  //Product Code
					If (Not:C34(SC_ExitCalled=1))
						SC_ExitCalled:=1
						$_t_ProductCodeOLD:=SC_at_ProductCode{0}
						Check_Product(->SC_at_ProductCode{$_l_Row}; "Product")
						
						If ((SC_at_ProductContract{$_l_Row}#"") & (SC_at_ProductCode{$_l_Row}#$_t_ProductCodeOLD))
							SC_at_ProductContract{$_l_Row}:=""
						End if 
						If (SC_at_ProductContract{$_l_Row}="")
							[SERVICE_CALLS:20]Charge:8:="Y"
							SC_at_ContractTypeCode{$_l_Row}:=""
							SC_at_ContractDatesStrings{$_l_Row}:=""
							SC_at_ContractTypeName{$_l_Row}:=""
						End if 
						If (SC_at_ProductName{$_l_Row}="")
							SC_at_ProductName{$_l_Row}:=[PRODUCTS:9]Product_Name:2
						End if 
						
						If (SC_al_ProductItemID{$_l_Row}=0)
							SC_al_ProductItemID{$_l_Row}:=AA_GetNextIDinMethod(->SC_ServiceCallProdID)
						End if 
						If (SC_al_ProductItemID{$_l_Row}>0)
							SC_al_ProductItemID{$_l_Row}:=-(SC_al_ProductItemID{$_l_Row})
						End if 
						//AL_UpdateArrays (SC_PowerviewPROD;-2)
					Else 
						SC_ExitCalled:=0
					End if 
				: ($_l_Column=2)  //Product name
					SC_at_ProductName{$_l_Row}:=Uppers2(SC_at_ProductName{$_l_Row})
					If (SC_al_ProductItemID{$_l_Row}=0)
						
						SC_al_ProductItemID{$_l_Row}:=AA_GetNextIDinMethod(->SC_ServiceCallProdID)
					End if 
					If (SC_al_ProductItemID{$_l_Row}>0)
						SC_al_ProductItemID{$_l_Row}:=-(SC_al_ProductItemID{$_l_Row})
					End if 
					
					//AL_UpdateArrays (SC_PowerviewPROD;-2)
				: ($_l_Column=3)  //System
					//this is a pop-up
				: ($_l_Column=4)  //Serial
					If (SC_al_ProductItemID{$_l_Row}=0)
						SC_al_ProductItemID{$_l_Row}:=AA_GetNextIDinMethod(->SC_ServiceCallProdID)
					End if 
					If (SC_al_ProductItemID{$_l_Row}>0)
						SC_al_ProductItemID{$_l_Row}:=-(SC_al_ProductItemID{$_l_Row})
					End if 
					
				: ($_l_Column=5)  //contract code
					If (Not:C34(SC_ExitCalled=1))
						SC_ExitCalled:=1
						Check_MinorNC(->SC_at_ProductContract{$_l_Row}; "Contract"; ->[CONTRACTS:17]; ->[CONTRACTS:17]Contract_Code:3; ->[CONTRACTS:17]Company_Code:1)
						QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Contract_Code:3=SC_at_ProductContract{$_l_Row})
						SC_at_ContractTypeCode{$_l_Row}:=[CONTRACTS:17]Contract_Type_Code:4
						SC_at_ContractDatesStrings{$_l_Row}:=String:C10([CONTRACTS:17]Start_Date:5; "Short")+" - "+String:C10([CONTRACTS:17]End_Date:6; "Short")
						RELATE ONE:C42([CONTRACTS:17]Contract_Type_Code:4)
						SC_at_ContractTypeName{$_l_Row}:=[CONTRACT_TYPES:19]Contract_Type_Name:2
						If (SC_al_ProductItemID{$_l_Row}=0)
							SC_al_ProductItemID{$_l_Row}:=AA_GetNextIDinMethod(->SC_ServiceCallProdID)
						End if 
						If (SC_al_ProductItemID{$_l_Row}>0)
							SC_al_ProductItemID{$_l_Row}:=-(SC_al_ProductItemID{$_l_Row})
						End if 
						
						//AL_UpdateArrays (SC_PowerviewPROD;-2)
					Else 
						SC_ExitCalled:=0
					End if 
					
			End case 
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ:Calls_In,SC_lb_PROD"; $_t_oldMethodName)

If (False:C215)
	//Table Form Method Name: Object Name:      [USER].SVS_EditProductInvolved
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SC_abo_ProductisForRepair;0)
	//ARRAY LONGINT(SC_al_LocationID;0)
	//ARRAY LONGINT(SC_al_OrderitemNumber;0)
	//ARRAY LONGINT(SC_al_PartsrequiredStatus;0)
	//ARRAY LONGINT(SC_al_ProductItemID;0)
	//ARRAY LONGINT(SC_al_RepairStatus;0)
	//ARRAY LONGINT(SC_al_SeverityID;0)
	//ARRAY LONGINT(SC_al_SymptomID;0)
	//ARRAY LONGINT(SC_al_WarrantyStatus;0)
	//ARRAY TEXT(SC_at_ContractTypeCode;0)
	//ARRAY TEXT(SC_at_FaultNotes;0)
	//ARRAY TEXT(SC_at_LocationName;0)
	//ARRAY TEXT(SC_at_OrderCode;0)
	//ARRAY TEXT(SC_at_PartsrequiredName;0)
	//ARRAY TEXT(SC_at_ProductCode;0)
	//ARRAY TEXT(SC_at_ProductContract;0)
	//ARRAY TEXT(SC_at_ProductName;0)
	//ARRAY TEXT(SC_at_ProductSerial;0)
	//ARRAY TEXT(SC_at_RepairStatusName;0)
	//ARRAY TEXT(SC_at_severityName;0)
	//ARRAY TEXT(SC_at_SymptomName;0)
	//ARRAY TEXT(SC_at_Systems;0)
	//ARRAY TEXT(SC_at_Warranty;0)
	//ARRAY TEXT(SVS_at_CallLocations;0)
	//ARRAY TEXT(SVS_at_RepairStatus;0)
	//ARRAY TEXT(SVS_at_ServiceSeverity;0)
	//ARRAY TEXT(SVS_at_ServiceSymptoms;0)
	//ARRAY TEXT(SVS_at_SIStatus;0)
	//ARRAY TEXT(SVS_at_WarrantyStatus;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; SVS_bo_EditContract; CON_bo_Sheduled; DB_bo_NoLoad; SVS_bo_EditContract)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ProductRow; $_l_TableNumber; $_l_WindowBottom; $_l_WindowLeft; $_l_windowTop)
	C_LONGINT:C283(SVS_l_ItemForRepair; SVS_l_Itemlocation; SVS_l_PartsStatus; SVS_l_RepairStatus; SVS_l_SelectedItem; SVS_l_Severity; SVS_l_SOitem; SVS_l_Symptom; SVS_l_Warranty; WIN_l_CurrentWinRefOLD; $_l_CurrentWinRefOLD)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ProductRow; $_l_TableNumber; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_windowTop; SVS_l_ItemForRepair; SVS_l_Itemlocation; SVS_l_PartsStatus; SVS_l_RepairStatus; SVS_l_SelectedItem; SVS_l_SelectedLineItem; SVS_l_Severity; SVS_l_SOitem; SVS_l_Symptom; SVS_l_Warranty)
	C_LONGINT:C283(WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_FocusObject)
	C_TEXT:C284($_t_VariableName; SVS_t_ContractCode; SVS_t_ContractType; SVS_t_FaultNote; SVS_t_ItemLocation; SVS_t_PartsStatus; SVS_t_ProductCode; SVS_t_ProductName; SVS_t_RepairStatus; SVS_t_SerialNumber; SVS_t_SOCode)
	C_TEXT:C284(SVS_t_Symptom; SVS_t_SystemName; SVS_t_Warranty; $_t_oldMethodName; $_t_VariableName; SVS_t_ContractCode; SVS_t_ContractType; SVS_t_FaultNote; SVS_t_ItemLocation; SVS_t_PartsStatus; SVS_t_ProductCode)
	C_TEXT:C284(SVS_t_ProductName; SVS_t_RepairStatus; SVS_t_SerialNumber; SVS_t_Severity; SVS_t_SOCode; SVS_t_Symptom; SVS_t_SystemName; SVS_t_Warranty)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SVS_EditProductInvolved"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If (SVS_l_SelectedItem=0)
			SVS_t_ContractCode:=""
			SVS_t_ContractType:=""
			SVS_t_SOCode:=""
			SVS_l_SOitem:=0
			SVS_t_ProductCode:=""
			SVS_t_ProductName:=""
			SVS_t_SerialNumber:=""
			SVS_t_SystemName:=""
			SVS_t_Warranty:=""
			SVS_l_Warranty:=0
			SVS_t_ItemLocation:=""
			SVS_l_Itemlocation:=0
			SVS_l_ItemForRepair:=0
			SVS_t_Symptom:=""
			SVS_l_Symptom:=0
			SVS_t_Severity:=""
			SVS_l_Severity:=0
			SVS_t_PartsStatus:=""
			SVS_l_PartsStatus:=0
			SVS_t_RepairStatus:=""
			SVS_l_RepairStatus:=0
			SVS_t_FaultNote:=""
		Else 
			$_l_ProductRow:=Find in array:C230(SC_al_ProductItemID; SVS_l_SelectedItem)
			If ($_l_ProductRow>0)
				SVS_t_ProductCode:=SC_at_ProductCode{$_l_ProductRow}
				SVS_t_SerialNumber:=SC_at_ProductSerial{$_l_ProductRow}
				SVS_t_ContractCode:=SC_at_ProductContract{$_l_ProductRow}
				SVS_t_SystemName:=SC_at_Systems{$_l_ProductRow}
				SVS_t_ProductName:=SC_at_ProductName{$_l_ProductRow}
				SVS_t_SOCode:=SC_at_OrderCode{$_l_ProductRow}
				SVS_t_ContractType:=SC_at_ContractTypeCode{$_l_ProductRow}
				SVS_l_RepairStatus:=SC_al_RepairStatus{$_l_ProductRow}
				SVS_t_RepairStatus:=SC_at_RepairStatusName{$_l_ProductRow}
				SVS_l_Symptom:=SC_al_SymptomID{$_l_ProductRow}
				SVS_t_Symptom:=SC_at_SymptomName{$_l_ProductRow}
				SVS_l_PartsStatus:=SC_al_PartsrequiredStatus{$_l_ProductRow}
				SVS_t_PartsStatus:=SC_at_PartsrequiredName{$_l_ProductRow}
				SVS_l_Warranty:=SC_al_WarrantyStatus{$_l_ProductRow}
				SVS_t_Warranty:=SC_at_Warranty{$_l_ProductRow}
				SVS_l_SOitem:=SC_al_OrderitemNumber{$_l_ProductRow}
				SVS_t_Severity:=SC_at_severityName{$_l_ProductRow}
				SVS_l_Severity:=SC_al_SeverityID{$_l_ProductRow}
				SVS_l_Itemlocation:=SC_al_LocationID{$_l_ProductRow}
				SVS_t_ItemLocation:=SC_at_LocationName{$_l_ProductRow}
				SVS_t_FaultNote:=SC_at_FaultNotes{$_l_ProductRow}
				SVS_l_ItemForRepair:=Num:C11(SC_abo_ProductisForRepair{$_l_ProductRow})
				SVS_t_RepairStatus:=SC_at_RepairStatusName{$_l_ProductRow}
				SVS_l_RepairStatus:=SC_al_RepairStatus{$_l_ProductRow}
				
				
				
				//``
				
			End if 
		End if 
		If (SVS_l_ItemForRepair=0) | ([SERVICE_CALLS:20]Resolved:9)
			OBJECT SET ENTERABLE:C238(SVS_t_Symptom; False:C215)
			OBJECT SET ENTERABLE:C238(SVS_t_Severity; False:C215)
			OBJECT SET ENTERABLE:C238(SVS_t_PartsStatus; False:C215)
			OBJECT SET ENTERABLE:C238(SVS_t_RepairStatus; False:C215)
			OBJECT SET ENTERABLE:C238(SVS_t_FaultNote; False:C215)
			OBJECT SET VISIBLE:C603(SVS_at_WarrantyStatus; False:C215)
			OBJECT SET VISIBLE:C603(SVS_at_CallLocations; False:C215)
			OBJECT SET VISIBLE:C603(SVS_at_ServiceSymptoms; False:C215)
			OBJECT SET VISIBLE:C603(SVS_at_ServiceSeverity; False:C215)
			OBJECT SET VISIBLE:C603(SVS_at_SIStatus; False:C215)
			OBJECT SET VISIBLE:C603(SVS_at_RepairStatus; False:C215)
			If ([SERVICE_CALLS:20]Resolved:9)
				OBJECT SET ENABLED:C1123(SVS_l_ItemForRepair; False:C215)
			End if 
			
			
			
		End if 
	: ($_l_event=On Data Change:K2:15)
		$_ptr_FocusObject:=Focus object:C278
		RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		Case of 
			: ($_t_VariableName="SVS_t_ContractCode")
				//NG Temp disable 2019
				//Check_MinorNC (->SVS_t_ContractCode;"Contract";->[CONTRACTS];->[CONTRACTS]Contract_Code;->[CONTRACTS]Company_Code;"Contract";"-1";True;0;[SERVICE_CALLS]Company_Code)
				If (SVS_t_ContractCode#"")
					QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Contract_Code:3=SVS_t_ContractCode)
					//Here show a list of the products on that contract...
					
					RELATE ONE:C42([CONTRACTS:17]Contract_Type_Code:4)
					SVS_t_ContractType:=[CONTRACT_TYPES:19]Contract_Type_Name:2
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Contract_Code:29=[CONTRACTS:17]Contract_Code:3)
					SVS_ContractLoadRules
					If (CON_bo_Sheduled)
					End if 
					//here get the user to select the contract item.
					
				End if 
			: ($_t_VariableName="SVS_t_SOCode")
				Check_SalesOrder(->SVS_t_SOCode; ->[SERVICE_CALLS:20]Company_Code:1)
				If (SVS_t_SOCode#"")
					OBJECT GET COORDINATES:C663(SVS_t_SOCode; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
					
					//Display the order items from that order for seleciton.
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=SVS_t_SOCode)
					If (Records in selection:C76([ORDER_ITEMS:25])>0)
						//QUERY([ORDER ITEMS]; & ;[ORDER ITEMS]Delivered>0)
						
						$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
						WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom; 1)
						SVS_bo_EditContract:=False:C215
						SVS_l_SelectedLineItem:=0
						DIALOG:C40([USER:15]; "SVS_SelectSupportedItem")
						If (SVS_l_SelectedLineItem>0)
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=SVS_l_SelectedLineItem)
							SVS_l_SOitem:=SVS_l_SelectedLineItem
							If ([ORDER_ITEMS:25]Serial_Number:24#"")
								SVS_t_SerialNumber:=[ORDER_ITEMS:25]Serial_Number:24
							End if 
							SVS_t_ProductCode:=[ORDER_ITEMS:25]Product_Code:2
							SVS_t_ProductName:=[ORDER_ITEMS:25]Product_Name:13
							
						End if 
						CLOSE WINDOW:C154
						WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
					End if 
				End if 
			: ($_t_VariableName="SVS_t_ProductCode")
				Check_Product(->SVS_t_ProductCode; "Product")
				
				
				If (SVS_t_ProductCode#"")
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=SVS_t_ProductCode)
					SVS_t_ProductName:=[PRODUCTS:9]Product_Name:2
				End if 
				
			: ($_t_VariableName="SVS_t_SerialNumber")
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Serial_Number:24=SVS_t_SerialNumber)
				If (Records in selection:C76([ORDER_ITEMS:25])>0)
					SVS_l_SOitem:=[ORDER_ITEMS:25]Item_Number:27
					SVS_t_SOCode:=[ORDER_ITEMS:25]Order_Code:1
					SVS_t_ProductCode:=[ORDER_ITEMS:25]Product_Code:2
					SVS_t_ProductName:=[ORDER_ITEMS:25]Product_Name:13
					
				End if 
		End case 
		
End case 
ERR_MethodTrackerReturn("FM [USER].SVS_EditProductInvolved"; $_t_oldMethodName)

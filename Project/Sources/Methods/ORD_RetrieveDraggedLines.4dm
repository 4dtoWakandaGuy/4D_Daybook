//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_RetrieveDraggedLines
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/08/2012 22:49
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_DataArrayBooleans; 0; 0)
	ARRAY BOOLEAN:C223($_abo_DataArrayUsed; 0)
	ARRAY DATE:C224($_ad_DataArrayDates; 0; 0)
	ARRAY INTEGER:C220($_ai_DataArrayIntegers; 0; 0)
	ARRAY LONGINT:C221($_al_DataArrayLongints; 0; 0)
	ARRAY REAL:C219($_ar_DataArrayReals; 0; 0)
	ARRAY TEXT:C222($_at_AlphaFieldData; 0; 0)
	ARRAY TEXT:C222($_at_DataArrayText; 0; 0)
	C_BLOB:C604(<>ORD_BL_DataBlob)
	C_BOOLEAN:C305(<>ResetNumber; $_bo_Continue)
	C_DATE:C307($_d_DeliveryDate; $_d_PurchaseOrderDate; $_d_ReceivedDate)
	C_LONGINT:C283(<>OINo; $_l_Add; $_l_Clash; $_l_FIeldCount; $_l_FIeldNumber; $_l_Index; $_l_Index2; $_l_ItemID; $_l_KeyPosition; $_l_LineIndex; $_l_NextOrderItemSEQ)
	C_LONGINT:C283($_l_offset; $_l_OrderItemNumber; $_l_ProcessID; $_l_ProductCodeRow; $_l_RecordNumber; $_l_RecordsCount; $_l_SigFieldNumber; $_l_StartRow; $_l_TableNumber; ORD_l_DataPointer)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_ptr_Field; $_Ptr_KeyField; $_ptr_LBTable; $_Ptr_ThisColumnArray; $1)
	C_REAL:C285($_r_AllocatedQuantity)
	C_TEXT:C284($_t_ContractCode; $_t_CopyToOrderCode; $_t_DeliveryNumber; $_t_InvoiceNumber; $_t_JobCode; $_t_JobStage; $_t_oldMethodName; $_t_OrderCode; $_t_PurchaseOrderNumber; $_t_SerialNumber; $_t_SupplierDeliveryNumber)
	C_TEXT:C284($_t_SupplierInvoice; ORD_t_DataTransfer)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_RetrieveDraggedLines")
//dragged records selection
While (Semaphore:C143("$DataBlobinUse"))  //about to write-stop everyone
	DelayTicks(6)
End while 
$_l_NextOrderItemSEQ:=1

ARRAY TEXT:C222($_at_AlphaFieldData; 0; 0)
ARRAY TEXT:C222($_at_DataArrayText; 0; 0)
ARRAY REAL:C219($_ar_DataArrayReals; 0; 0)
ARRAY LONGINT:C221($_al_DataArrayLongints; 0; 0)
ARRAY INTEGER:C220($_ai_DataArrayIntegers; 0; 0)
ARRAY DATE:C224($_ad_DataArrayDates; 0; 0)
ARRAY BOOLEAN:C223($_abo_DataArrayBooleans; 0; 0)
//```
$_l_FIeldCount:=Get last field number:C255(->[ORDER_ITEMS:25])

ARRAY TEXT:C222($_at_AlphaFieldData; $_l_FIeldCount; 0)
ARRAY TEXT:C222($_at_DataArrayText; $_l_FIeldCount; 0)
ARRAY REAL:C219($_ar_DataArrayReals; $_l_FIeldCount; 0)
ARRAY LONGINT:C221($_al_DataArrayLongints; $_l_FIeldCount; 0)
ARRAY INTEGER:C220($_ai_DataArrayIntegers; $_l_FIeldCount; 0)
ARRAY DATE:C224($_ad_DataArrayDates; $_l_FIeldCount; 0)
ARRAY BOOLEAN:C223($_abo_DataArrayBooleans; $_l_FIeldCount; 0)
$_l_offset:=0
$_l_RecordsCount:=0
$_t_CopyToOrderCode:=[ORDERS:24]Order_Code:3
COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
Repeat 
	If (BLOB size:C605(<>ORD_BL_DataBlob)>$_l_offset)
		$_l_RecordsCount:=$_l_RecordsCount+1
		ARRAY TEXT:C222($_at_AlphaFieldData; $_l_FIeldCount; $_l_RecordsCount)
		ARRAY TEXT:C222($_at_DataArrayText; $_l_FIeldCount; $_l_RecordsCount)
		ARRAY REAL:C219($_ar_DataArrayReals; $_l_FIeldCount; $_l_RecordsCount)
		ARRAY LONGINT:C221($_al_DataArrayLongints; $_l_FIeldCount; $_l_RecordsCount)
		ARRAY INTEGER:C220($_ai_DataArrayIntegers; $_l_FIeldCount; $_l_RecordsCount)
		ARRAY DATE:C224($_ad_DataArrayDates; $_l_FIeldCount; $_l_RecordsCount)
		ARRAY BOOLEAN:C223($_abo_DataArrayBooleans; $_l_FIeldCount; $_l_RecordsCount)
		
		ORD_l_DataPointer:=0
		$_l_offset:=DB_Blob_to_Data(->ORD_l_DataPointer; -><>ORD_BL_DataBlob; $_l_offset; True:C214)
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ID:58=ORD_l_DataPointer)
		For ($_l_Index; 1; Get last field number:C255(->[ORDER_ITEMS:25]))
			
			
			$_ptr_Field:=Field:C253(Table:C252(->[ORDER_ITEMS:25]); $_l_Index)
			//``
			Case of 
				: (Type:C295($_ptr_Field->)=Is alpha field:K8:1)
					//C_TEXT(ORD_t_DataTransfer)
					//ORD_t_DataTransfer:=""
					//$_l_offset:=DB_Blob_to_Data (->ORD_t_DataTransfer;-><>ORD_BL_DataBlob;$_l_offset;True)
					$_at_AlphaFieldData{$_l_Index}{$_l_RecordsCount}:=$_ptr_Field->  //ORD_t_DataTransfer
					
				: (Type:C295($_ptr_Field->)=Is boolean:K8:9)
					//C_BOOLEAN(ORD_bo_DataValue)
					//ORD_bo_DataValue:=False
					//$_l_offset:=DB_Blob_to_Data (->ORD_bo_DataValue;-><>ORD_BL_DataBlob;$_l_offset;True)
					$_abo_DataArrayBooleans{$_l_Index}{$_l_RecordsCount}:=$_ptr_Field->  //ORD_bo_DataValue
					
					
				: (Type:C295($_ptr_Field->)=Is date:K8:7)
					//C_DATE(ORD_D_DataPointer)
					//ORD_D_DataPointer:=!00/00/0000!
					//$_l_offset:=DB_Blob_to_Data (->ORD_D_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True)
					$_ad_DataArrayDates{$_l_Index}{$_l_RecordsCount}:=$_ptr_Field->  //ORD_D_DataPointer
					
				: (Type:C295($_ptr_Field->)=Is integer:K8:5)
					$_ai_DataArrayIntegers{$_l_Index}{$_l_RecordsCount}:=$_ptr_Field->  //ORD_l_DATAPOINTER
				: (Type:C295($_ptr_Field->)=Is longint:K8:6)
					//C_LONGINT(ORD_l_DataPointer)
					//ORD_l_DataPointer:=0
					//$_l_offset:=DB_Blob_to_Data (->ORD_l_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True)
					$_al_DataArrayLongints{$_l_Index}{$_l_RecordsCount}:=$_ptr_Field->  //ORD_l_DataPointer
					
				: (Type:C295($_ptr_Field->)=Is picture:K8:10)
				: (Type:C295($_ptr_Field->)=Is real:K8:4)
					//C_REAL(ORD_R_DataPointer)
					//ORD_R_DataPointer:=0
					//$_l_offset:=DB_Blob_to_Data (->ORD_R_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True)
					$_ar_DataArrayReals{$_l_Index}{$_l_RecordsCount}:=$_ptr_Field->  //ORD_R_DataPointer
					
				: (Type:C295($_ptr_Field->)=Is subtable:K8:11)
				: (Type:C295($_ptr_Field->)=Is text:K8:3)
					//C_TEXT(ORD_T_DataPointer)
					//ORD_T_DataPointer:=""
					//$_l_offset:=DB_Blob_to_Data (->ORD_T_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True)
					$_at_DataArrayText{$_l_Index}{$_l_RecordsCount}:=$_ptr_Field->  //ORD_T_DataPointer
				: (Type:C295($_ptr_Field->)=Is time:K8:8)
					//C_TIME(ORD_ti_DataPointer)
					//ORD_ti_DataPointer:=?00:00:00?
					//$_l_offset:=DB_Blob_to_Data (->ORD_ti_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True)
					$_al_DataArrayLongints{$_l_Index}{$_l_RecordsCount}:=$_ptr_Field->  //(ORD_ti_DataPointer*1)
				Else 
			End case 
			//End if
		End for 
		
	End if 
	// Delayticks(6)
Until (BLOB size:C605(<>ORD_BL_DataBlob)<=$_l_offset)

CLEAR SEMAPHORE:C144("$DataBlobinUse")
//now the copied records are in a 2D array
//we need the PRODUCT CODE Records displayed on the form
$_l_SigFieldNumber:=Field:C253(->[ORDER_ITEMS:25]Product_Code:2)
ARRAY BOOLEAN:C223($_abo_DataArrayUsed; $_l_RecordsCount)
If (Size of array:C274($1->)>0)
	//$Area:=$1->{1}
	//$_ptr_ArrayFieldPointers:=$1->{2}
	//$_ptr_LBTable:=$1->{7}
	//$_Ptr_KeyField:=$1->{8}
	//$_ptr_ArrayReferences:=$1->{9}
	//$Area:=$1->{1}
	//$_ptr_ArrayFieldPointers:=$1->{2}
	//$_ptr_LBTable:=$1->{7}
	//$_Ptr_KeyField:=$1->{8}
	//$_ptr_ArrayReferences:=$1->{9}
	//$_ptr_ArrayofArrayPointers:=$1->{3}
	//$_l_KeyPosition:=Find in array($_ptr_ArrayFieldPointers->;$_Ptr_KeyField)
	//`$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
	USE NAMED SELECTION:C332("$Temp")
	FIRST RECORD:C50([ORDER_ITEMS:25])
	
	For ($_l_LineIndex; 1; Records in selection:C76([ORDER_ITEMS:25]))
		//For ($_l_LineIndex;1;Size of array($_Ptr_ThisColumnArray->))
		//If ($_l_KeyPosition>0)
		//$_ptr_ArrayofArrayPointers:=$1->{3}
		//$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
		//QUERY($_ptr_LBTable->;$_Ptr_KeyField->=$_Ptr_ThisColumnArray->{$_l_LineIndex})
		$_l_StartRow:=1
		If ([ORDER_ITEMS:25]Product_Code:2#"") & ([ORDER_ITEMS:25]Item_Locked:16=False:C215) & ([ORDER_ITEMS:25]Invoice_Number:17="")
			Repeat 
				IDLE:C311
				
				// Delayticks(60)
				$_l_ProductCodeRow:=Find in array:C230($_at_AlphaFieldData{$_l_SigFieldNumber}; [ORDER_ITEMS:25]Product_Code:2; $_l_StartRow)
				If ($_l_ProductCodeRow>0)  //replace
					If (Gen_Option)
						Gen_Confirm(" The product code "+[ORDER_ITEMS:25]Product_Code:2+" is on this order do you wish to replace"; "Replace"; "Add")
						If (OK=0)
							$_l_Add:=1
						Else 
							$_l_Add:=0
						End if 
					Else 
						$_l_Add:=0
					End if 
					If ($_l_Add=0)
						$_l_StartRow:=$_l_ProductCodeRow+1
						If ($_abo_DataArrayUsed{$_l_ProductCodeRow}=False:C215)  //just in case 2 records with same product
							$_abo_DataArrayUsed{$_l_ProductCodeRow}:=True:C214
							$_t_InvoiceNumber:=[ORDER_ITEMS:25]Invoice_Number:17
							$_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
							$_l_OrderItemNumber:=[ORDER_ITEMS:25]Item_Number:27
							$_l_ItemID:=[ORDER_ITEMS:25]x_ID:58
							$_r_AllocatedQuantity:=[ORDER_ITEMS:25]Allocated:28
							$_t_DeliveryNumber:=[ORDER_ITEMS:25]Delivery_Number:49
							$_d_DeliveryDate:=[ORDER_ITEMS:25]Delivery_Date:11
							$_t_PurchaseOrderNumber:=[ORDER_ITEMS:25]Purchase_Order_Number:18
							$_d_PurchaseOrderDate:=[ORDER_ITEMS:25]Purchase_Order_Date:19
							$_d_ReceivedDate:=[ORDER_ITEMS:25]Received_Date:21
							$_t_SupplierInvoice:=[ORDER_ITEMS:25]Supplier_Invoice_Number:22
							$_t_SupplierDeliveryNumber:=[ORDER_ITEMS:25]Supplier_Delivery_Number:23
							$_t_SerialNumber:=[ORDER_ITEMS:25]Serial_Number:24
							$_t_ContractCode:=[ORDER_ITEMS:25]Contract_Code:29
							$_t_JobCode:=[ORDER_ITEMS:25]Job_Code:34
							$_t_JobStage:=[ORDER_ITEMS:25]Job_Stage:35
							For ($_l_Index; 1; Get last field number:C255(->[ORDER_ITEMS:25]))
								$_ptr_Field:=Field:C253(Table:C252(->[ORDER_ITEMS:25]); $_l_Index)
								//``
								Case of 
									: (Type:C295($_ptr_Field->)=Is alpha field:K8:1)
										$_ptr_Field->:=$_at_AlphaFieldData{$_l_Index}{$_l_ProductCodeRow}
									: (Type:C295($_ptr_Field->)=Is boolean:K8:9)
										$_ptr_Field->:=$_abo_DataArrayBooleans{$_l_Index}{$_l_ProductCodeRow}
										
									: (Type:C295($_ptr_Field->)=Is date:K8:7)
										$_ptr_Field->:=$_ad_DataArrayDates{$_l_Index}{$_l_ProductCodeRow}
										
									: (Type:C295($_ptr_Field->)=Is integer:K8:5)
										$_ptr_Field->:=$_ai_DataArrayIntegers{$_l_Index}{$_l_ProductCodeRow}
									: (Type:C295($_ptr_Field->)=Is longint:K8:6)
										$_ptr_Field->:=$_al_DataArrayLongints{$_l_Index}{$_l_ProductCodeRow}
									: (Type:C295($_ptr_Field->)=Is picture:K8:10)
									: (Type:C295($_ptr_Field->)=Is real:K8:4)
										$_ptr_Field->:=$_ar_DataArrayReals{$_l_Index}{$_l_ProductCodeRow}
										
									: (Type:C295($_ptr_Field->)=Is subtable:K8:11)
									: (Type:C295($_ptr_Field->)=Is text:K8:3)
										$_ptr_Field->:=$_at_DataArrayText{$_l_Index}{$_l_ProductCodeRow}
									: (Type:C295($_ptr_Field->)=Is time:K8:8)
										$_ptr_Field->:=Time:C179(Time string:C180($_al_DataArrayLongints{$_l_Index}{$_l_ProductCodeRow}))
									Else 
										
								End case 
							End for 
							[ORDER_ITEMS:25]Order_Code:1:=$_t_CopyToOrderCode
							[ORDER_ITEMS:25]x_ID:58:=$_l_ItemID
							[ORDER_ITEMS:25]Allocated:28:=$_r_AllocatedQuantity
							[ORDER_ITEMS:25]Delivery_Number:49:=$_t_DeliveryNumber
							[ORDER_ITEMS:25]Delivery_Date:11:=$_d_DeliveryDate
							[ORDER_ITEMS:25]Purchase_Order_Number:18:=$_t_PurchaseOrderNumber
							[ORDER_ITEMS:25]Purchase_Order_Date:19:=$_d_PurchaseOrderDate
							[ORDER_ITEMS:25]Received_Date:21:=$_d_ReceivedDate
							[ORDER_ITEMS:25]Supplier_Invoice_Number:22:=$_t_SupplierInvoice
							[ORDER_ITEMS:25]Supplier_Delivery_Number:23:=$_t_SupplierDeliveryNumber
							[ORDER_ITEMS:25]Serial_Number:24:=$_t_SerialNumber
							[ORDER_ITEMS:25]Contract_Code:29:=$_t_ContractCode
							[ORDER_ITEMS:25]Job_Code:34:=$_t_JobCode
							[ORDER_ITEMS:25]Job_Stage:35:=$_t_JobStage
							[ORDER_ITEMS:25]Item_Number:27:=$_l_OrderItemNumber
							[ORDER_ITEMS:25]Invoice_Number:17:=$_t_InvoiceNumber
							DB_SaveRecord(->[ORDER_ITEMS:25])
							AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
						End if 
					End if 
				Else 
					$_bo_Continue:=True:C214
				End if 
				DelayTicks(60)
				
			Until ($_l_ProductCodeRow<0)
		End if 
		NEXT RECORD:C51([ORDER_ITEMS:25])
	End for 
	//End if
	//End for
	
	$_bo_Continue:=True:C214
	
Else 
	
	$_bo_Continue:=True:C214
	//there are no lines on here so no complex complications
End if 
If ($_bo_Continue)
	If (Size of array:C274($_ai_DataArrayIntegers)>0)
		For ($_l_Index2; 1; Size of array:C274($_ai_DataArrayIntegers{1}))
			If ($_abo_DataArrayUsed{$_l_Index2}=False:C215)
				CREATE RECORD:C68([ORDER_ITEMS:25])
				For ($_l_Index; 1; Get last field number:C255(->[ORDER_ITEMS:25]))
					$_ptr_Field:=Field:C253(Table:C252(->[ORDER_ITEMS:25]); $_l_Index)
					//``
					Case of 
						: (Type:C295($_ptr_Field->)=Is alpha field:K8:1)
							$_ptr_Field->:=$_at_AlphaFieldData{$_l_Index}{$_l_Index2}
						: (Type:C295($_ptr_Field->)=Is boolean:K8:9)
							$_ptr_Field->:=$_abo_DataArrayBooleans{$_l_Index}{$_l_Index2}
							
						: (Type:C295($_ptr_Field->)=Is date:K8:7)
							$_ptr_Field->:=$_ad_DataArrayDates{$_l_Index}{$_l_Index2}
							
						: (Type:C295($_ptr_Field->)=Is integer:K8:5)
							$_ptr_Field->:=$_ai_DataArrayIntegers{$_l_Index}{$_l_Index2}
						: (Type:C295($_ptr_Field->)=Is longint:K8:6)
							$_ptr_Field->:=$_al_DataArrayLongints{$_l_Index}{$_l_Index2}
						: (Type:C295($_ptr_Field->)=Is picture:K8:10)
						: (Type:C295($_ptr_Field->)=Is real:K8:4)
							$_ptr_Field->:=$_ar_DataArrayReals{$_l_Index}{$_l_Index2}
							
						: (Type:C295($_ptr_Field->)=Is subtable:K8:11)
						: (Type:C295($_ptr_Field->)=Is text:K8:3)
							$_ptr_Field->:=$_at_DataArrayText{$_l_Index}{$_l_Index2}
						: (Type:C295($_ptr_Field->)=Is time:K8:8)
							$_ptr_Field->:=Time:C179(Time string:C180($_al_DataArrayLongints{$_l_Index}{$_l_Index2}))
						Else 
							
					End case 
				End for 
				[ORDER_ITEMS:25]Order_Code:1:=$_t_CopyToOrderCode
				//OrderI_No
				[ORDER_ITEMS:25]x_ID:58:=0
				[ORDER_ITEMS:25]x_ID:58:=AA_GetNextIDinMethod(->[ORDER_ITEMS:25]x_ID:58)
				[ORDER_ITEMS:25]Item_Locked:16:=False:C215
				[ORDER_ITEMS:25]Invoice_Number:17:=""
				[ORDER_ITEMS:25]Allocated:28:=0
				[ORDER_ITEMS:25]Delivered:51:=0
				[ORDER_ITEMS:25]x_ServiceCallCODE:61:=""
				[ORDER_ITEMS:25]x_AssemblyReference:62:=0
				[ORDER_ITEMS:25]x_ReturnedDate:65:=!00-00-00!
				[ORDER_ITEMS:25]x_ReturnQuantity:63:=0
				[ORDER_ITEMS:25]x_ReturnsNumber:64:=""
				
				[ORDER_ITEMS:25]Delivery_Number:49:=""
				[ORDER_ITEMS:25]Delivery_Date:11:=!00-00-00!
				[ORDER_ITEMS:25]Purchase_Order_Number:18:=""
				[ORDER_ITEMS:25]Purchase_Order_Date:19:=!00-00-00!
				[ORDER_ITEMS:25]Received_Date:21:=!00-00-00!
				[ORDER_ITEMS:25]Supplier_Invoice_Number:22:=""
				[ORDER_ITEMS:25]Supplier_Delivery_Number:23:=""
				[ORDER_ITEMS:25]Serial_Number:24:=""
				[ORDER_ITEMS:25]Invoice_Date:25:=!00-00-00!
				[ORDER_ITEMS:25]Allocated:28:=0
				[ORDER_ITEMS:25]Contract_Code:29:=""
				[ORDER_ITEMS:25]Job_Code:34:=""
				[ORDER_ITEMS:25]Job_Stage:35:=""
				$_l_NextOrderItemSEQ:=1
				//$_l_NextOrderItemSEQ:=ORDI_GetSortRef ([ORDERS]Order_Code;$_l_NextOrderItemSEQ)
				$_l_NextOrderItemSEQ:=ORDI_GetSortRef([ORDERS:24]Order_Code:3; $_l_NextOrderItemSEQ; Records in selection:C76([ORDER_ITEMS:25]))
				
				[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextOrderItemSEQ
				
				Repeat 
					$_l_OrderItemNumber:=<>OINo+AA_GetNextIDinMethod(->[ORDER_ITEMS:25]Item_Number:27; Sequence number:C244([ORDER_ITEMS:25]))
					SET QUERY DESTINATION:C396(3; $_l_Clash)
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_l_OrderItemNumber)
					SET QUERY DESTINATION:C396(0)
					If ($_l_Clash>0)
						$_l_TableNumber:=Table:C252(->[ORDER_ITEMS:25])
						$_l_FIeldNumber:=Field:C253(->[ORDER_ITEMS:25]Item_Number:27)
						<>ResetNumber:=False:C215
						$_l_ProcessID:=New process:C317("AA_SetNextID"; 64000; "FIxingNumber"; $_l_TableNumber; $_l_FIeldNumber; $_l_OrderItemNumber; <>OINo)
						Repeat 
							DelayTicks(60)
						Until (<>ResetNumber)
						<>ResetNumber:=False:C215
					End if 
					
				Until ($_l_Clash=0)
				
				//Copied to OrderI_SubLPB
				[ORDER_ITEMS:25]Item_Number:27:=$_l_OrderItemNumber
				
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
				
			End if 
			
		End for 
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
		Orders_InLPTot
		Orders_InLPB
		Orders_InLPß("S1")
		
	End if 
Else 
	USE NAMED SELECTION:C332("$Temp")
	
End if 
ERR_MethodTrackerReturn("ORD_RetrieveDraggedLines"; $_t_oldMethodName)

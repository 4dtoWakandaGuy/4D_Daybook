//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_RetrieveDraggedLines
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/12/2009 12:20`Method: STK_RetrieveDraggedLines
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_Booleans; 0; 0)
	ARRAY BOOLEAN:C223($_abo_RecordUsed; 0)
	//ARRAY BOOLEAN(STK_LB_StockItems;0)
	ARRAY DATE:C224($_ad_Dates; 0; 0)
	ARRAY INTEGER:C220($_ai_Integers; 0; 0)
	ARRAY LONGINT:C221($_al_ForceRecalculation; 0)
	ARRAY LONGINT:C221($_al_LongintData; 0; 0)
	ARRAY LONGINT:C221($_al_LongIntegers; 0; 0)
	ARRAY LONGINT:C221($_al_PreviousMovementCSID; 0)
	ARRAY LONGINT:C221($_al_PreviousMovementIDS; 0)
	ARRAY LONGINT:C221($_al_SplitChildrenFromCSID; 0)
	ARRAY LONGINT:C221($_al_SplitChildrenParentID; 0)
	//ARRAY LONGINT(AL_al_ModeStock;0)
	//ARRAY LONGINT(STK_AL_AUTOALLOCATEOI;0)
	//ARRAY LONGINT(STK_al_DeleteItems;0)
	//ARRAY LONGINT(STK_al_LineIndex;0)
	//ARRAY LONGINT(STK_al_LineItemIDS;0)
	//ARRAY LONGINT(STK_al_LineItemIndexID;0)
	//ARRAY LONGINT(STK_al_LineSalesOrderItem;0)
	//ARRAY LONGINT(STK_al_ModifiedLineIDS;0)
	//ARRAY LONGINT(STK_al_PreviousMovementCSID;0)
	//ARRAY LONGINT(STK_al_PreviousMovementIDS;0)
	//ARRAY LONGINT(STK_al_RemoveFromItemID;0)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	ARRAY REAL:C219($_ar_PreviousMovementQTY; 0)
	ARRAY REAL:C219($_ar_Reals; 0; 0)
	ARRAY REAL:C219($_ar_SplitChildrenQuantity; 0)
	//ARRAY REAL(STK_ar_AUTOALLOCATEQTY;0)
	//ARRAY REAL(STK_ar_AverageCostPrice;0)
	//ARRAY REAL(STK_ar_CalledOffQTY;0)
	//ARRAY REAL(STK_ar_ComponentQTY;0)
	//ARRAY REAL(STK_ar_CostPrice;0)
	//ARRAY REAL(STK_ar_osAssembly;0)
	//ARRAY REAL(STK_ar_osTotalCalledoff;0)
	//ARRAY REAL(STK_ar_PreviousMovementQTY;0)
	//ARRAY REAL(STK_ar_TotalComponentQTY;0)
	//ARRAY REAL(STK_ar_TotalCost;0)
	//ARRAY REAL(STK_ar_TotalMoved;0)
	//ARRAY REAL(STK_ar_TotalQuantity;0)
	//ARRAY REAL(STK_ar_XResidualStockQuantity;0)
	ARRAY TEXT:C222($_at_AlphaFieldData; 0; 0)
	ARRAY TEXT:C222($_at_OtherDeliveryReferences; 0)
	ARRAY TEXT:C222($_at_OthersNotMovement; 0)
	ARRAY TEXT:C222($_at_PreviousMovementAnalysis; 0)
	ARRAY TEXT:C222($_at_PreviousMovementCurrency; 0)
	ARRAY TEXT:C222($_at_PreviousMovementLayer; 0)
	ARRAY TEXT:C222($_at_PreviousMovementLocation; 0)
	ARRAY TEXT:C222($_at_Texts; 0; 0)
	//ARRAY TEXT(SM_at_ModeStockMov;0)
	//ARRAY TEXT(STK_at_CompaniesTo;0)
	//ARRAY TEXT(STK_at_DateReceived;0)
	//ARRAY TEXT(STK_at_DateShipped;0)
	//ARRAY TEXT(STK_at_LinePurchaseOrder;0)
	//ARRAY TEXT(STK_at_Location;0)
	//ARRAY TEXT(STK_at_MovementCode;0)
	//ARRAY TEXT(STK_at_poItemExpectedDelDate;0)
	//ARRAY TEXT(STK_at_PreviousMovementAnalysis;0)
	//ARRAY TEXT(STK_at_PreviousMovementCurrency;0)
	//ARRAY TEXT(STK_at_PreviousMovementLayer;0)
	//ARRAY TEXT(STK_at_PreviousMovementLocation;0)
	//ARRAY TEXT(STK_at_ProductCode;0)
	//ARRAY TEXT(STK_at_PurchaseorderCode;0)
	//ARRAY TEXT(STK_at_PurchaseOrderitemNumber;0)
	//ARRAY TEXT(STK_at_SerialNum;0)
	//ARRAY TEXT(STK_at_SOcode;0)
	//ARRAY TEXT(STK_at_SOItemNumber;0)
	//ARRAY TEXT(STK_at_stockItemThread;0)
	//ARRAY TEXT(STK_at_StockNo;0)
	//ARRAY TEXT(STK_at_X_CopiedFromID;0)
	//ARRAY TEXT(STK_at_xPoItemDeliveryReference;0)
	//ARRAY TEXT(STK_at_xSoItemDeliveryReference;0)
	C_BLOB:C604(<>ORD_BL_DataBlob)
	C_BOOLEAN:C305(<>FilterInAllocated; <>STOCK_bo_NoSplit; <>STOCK_bo_NoSuperSplit; $_bo_Continue; $_bo_CSIDMatch; $_bo_DateMatch; $_bo_DeleteOption; $_bo_DeleteQuestionAsked; $_bo_Edit; $_bo_Edits; $_bo_Exit)
	C_BOOLEAN:C305($_bo_IncludeOthers; $_bo_IsAllocation; $_bo_isCancellation; $_bo_IsSourceStockType; $_bo_IsUnAllocation; $_bo_ItemNumberMatch; $_bo_NoExit; $_bo_noSplit; $_bo_noSuperSplit; $_bo_POAlertFlag; $_bo_PreTry)
	C_BOOLEAN:C305($_bo_PriceMatch; $_bo_Reverse; $_bo_SetCopiedFromNow; $_bo_SplitChildren; $_bo_SplitItem; $_bo_STKp_UseOnlyFree; $_bo_StockReceipt; $_bo_Switch; $_bo_TurnOnConsoilidated; $_bo_UniqueSerialNos; $_bo_UseOnlyallocated)
	C_BOOLEAN:C305(dView; PS_ab_INITED; STK_bo_ConsolidatedView; STK_bo_DataPointer; STK_bo_isHDeletedInited; STK_bo_MoveOnOrderAllocation; STK_bo_PreviousCAllback; STK_bo_PreviousItemNumberTested; STK_bo_PreviousSet; STK_bo_ReceivebyReference)
	C_DATE:C307($_d_HeaderDate; STK_D_DataPointer)
	C_LONGINT:C283(<>STK_l_PreviousProcess; <>STK_l_PSProcessID; $_l_AddRows; $_l_AddtoItemID; $_l_ArraySize; $_l_CharacterPosition; $_l_CopiedFromID; $_l_CopiedFromMovementID; $_l_CouldBeCopiedfrom; $_l_CountFields; $_l_CurrentMovementItemRecord)
	C_LONGINT:C283($_l_Currenttime; $_l_DeliveryIndex; $_l_DeliveryItemsIndex; $_l_DeliveryReferenceRow; $_l_FieldNumber; $_l_FindIndex; $_l_FromAddToCSID; $_l_GetCompanyProcess; $_l_GetItemNumberProcess; $_l_Index; $_l_Index2)
	C_LONGINT:C283($_l_Index3; $_l_IPMessage; $_l_ItemNumber; $_l_KeyFieldNumber; $_l_KeyPosition; $_l_LasttextArray; $_l_LineItemRow; $_l_MovementItemsRecords; $_l_offset; $_l_PreferItemNumber; $_l_ProcessState)
	C_LONGINT:C283($_l_ProcessTime; $_l_ProductCodeRow; $_l_RecordCount; $_l_RecordNumber; $_l_RecordsinSelection; $_l_Repeats; $_l_Retries; $_l_SelectedRecordNumber; $_l_SplitChildrenOf; $_l_Subtract; $_l_TableNumber)
	C_LONGINT:C283($_l_TakeFromCSID; $_l_TakeFromItemID; DB_l_ButtonClickedFunction; ORD_l_DataPointer; STK_but_consolidate; STK_l_CompanyID; STK_l_DataPointer; STK_l_PreviousItemNumber; STK_l_PreviousMovementID; STK_l_PreviousStockItemNumber; STK_l_PSProcessID)
	C_LONGINT:C283(STOCK_l_Context; STOCK_l_CopyProcess)
	C_PICTURE:C286(STK_pic_ModeStock)
	C_POINTER:C301($_ptr_ArrayColumnColours; $_ptr_ArrayColumnFontSizes; $_ptr_ArrayColumnFooters; $_ptr_ArrayColumnLocks; $_ptr_ArrayEnterables; $_ptr_ArrayFieldPointers; $_ptr_ArrayFormats; $_ptr_ArrayFormulas; $_ptr_arrayNamesArray; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences)
	C_POINTER:C301($_ptr_ArrayTitles; $_ptr_ArrayWidths; $_ptr_ColumnArray; $_Ptr_KeyField; $_ptr_LastTextArray; $_ptr_LBTable; $_ptr_StockMovementItemField; $_Ptr_ThisColumnArray; $1)
	C_REAL:C285($_l_ZeroLongint; $_r_AverageCostPrice; $_r_CalledOffQuantity; $_r_CostPrice; $_r_FreeStock; $_r_OriginalQuantity; $_r_Quantity; $_r_QuantityStillRequired; $_r_TotalCostPrice; $_r_ZeroReal; STK_R_DataPointer)
	C_REAL:C285(STK_R_PreviousCostPrice)
	C_TEXT:C284($_t_AnalysisCode; $_t_BaseString; $_t_CurrencyCode; $_t_CurrentMovementType; $_t_DragString; $_t_FormName; $_t_FromAddToType; $_t_FromMovementCode; $_t_FromProductCode; $_t_FromType; $_t_LayerCode)
	C_TEXT:C284($_t_LocationCode; $_t_MovementTypeStockSubtract; $_t_NumberString; $_t_oldMethodName; $_t_OrderCode; $_t_PODeliveryReference; $_t_ProcessName; $_t_ProductCode; $_t_SerialNumber; $_t_ThisMovementType; IP_t_MessageReplySTR)
	C_TEXT:C284(STK_S255_DataPointer; STK_T_DataPointer; STK_t_fromCompany; STK_t_FromContact; STK_T_PreviousStockItemAnal; STK_T_PreviousStockItemCurrency; STK_T_PreviousStockItemLayer; STK_t_PreviousStockLocation; STK_t_PreviousStockSerial)
	C_TIME:C306(STK_ti_DataPointer)
End if 
//Code Starts Here

//TRACE
$_t_oldMethodName:=ERR_MethodTracker("STK_RetrieveDraggedLines")
//dragged records selection
$_bo_TurnOnConsoilidated:=False:C215
If (STK_bo_ConsolidatedView)
	ARRAY POINTER:C280(STK_aptr_ItemPreferences; 0)
	STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)  //New Call NG May 2004
	
	STK_bo_ConsolidatedView:=False:C215
	$_bo_TurnOnConsoilidated:=True:C214
End if 

While (Semaphore:C143("$DataBlobinUse"))  //about to write-stop everyone
	
	DelayTicks(6)
End while 
ARRAY LONGINT:C221($_al_LongintData; 0; 0)
ARRAY TEXT:C222($_at_AlphaFieldData; 0; 0)
ARRAY TEXT:C222($_at_Texts; 0; 0)
ARRAY REAL:C219($_ar_Reals; 0; 0)
ARRAY LONGINT:C221($_al_LongIntegers; 0; 0)
ARRAY INTEGER:C220($_ai_Integers; 0; 0)
ARRAY DATE:C224($_ad_Dates; 0; 0)
ARRAY BOOLEAN:C223($_abo_Booleans; 0; 0)
//```
$_l_CountFields:=Get last field number:C255(->[STOCK_MOVEMENT_ITEMS:27])
ARRAY LONGINT:C221($_al_LongintData; $_l_CountFields; 0)
ARRAY TEXT:C222($_at_AlphaFieldData; $_l_CountFields; 0)
ARRAY TEXT:C222($_at_Texts; $_l_CountFields; 0)
ARRAY REAL:C219($_ar_Reals; $_l_CountFields; 0)
ARRAY LONGINT:C221($_al_LongIntegers; $_l_CountFields; 0)
ARRAY INTEGER:C220($_ai_Integers; $_l_CountFields; 0)
ARRAY DATE:C224($_ad_Dates; $_l_CountFields; 0)
ARRAY BOOLEAN:C223($_abo_Booleans; $_l_CountFields; 0)
$_l_offset:=0
$_l_RecordCount:=0
Open window:C153((Screen width:C187/2)-200; (Screen height:C188/2)-100; (Screen width:C187/2)+200; (Screen height:C188/2)+100; Palette window:K34:3)


Repeat 
	GOTO XY:C161(0; 0)
	
	MESSAGE:C88("Reading Stock items sent")
	If (BLOB size:C605(<>ORD_BL_DataBlob)>$_l_offset)  //the blob is named this way because
		
		//it was originally used for orders
		$_l_RecordCount:=$_l_RecordCount+1
		GOTO XY:C161(2; 1)
		MESSAGE:C88("Record number "+String:C10($_l_RecordCount))
		
		ARRAY LONGINT:C221($_al_LongintData; $_l_CountFields; $_l_RecordCount)
		ARRAY TEXT:C222($_at_AlphaFieldData; $_l_CountFields; $_l_RecordCount)
		ARRAY TEXT:C222($_at_Texts; $_l_CountFields; $_l_RecordCount)
		ARRAY REAL:C219($_ar_Reals; $_l_CountFields; $_l_RecordCount)
		ARRAY LONGINT:C221($_al_LongIntegers; $_l_CountFields; $_l_RecordCount)
		ARRAY INTEGER:C220($_ai_Integers; $_l_CountFields; $_l_RecordCount)
		ARRAY DATE:C224($_ad_Dates; $_l_CountFields; $_l_RecordCount)
		ARRAY BOOLEAN:C223($_abo_Booleans; $_l_CountFields; $_l_RecordCount)
		STK_l_DataPointer:=0
		$_l_offset:=DB_Blob_to_Data(->STK_l_DataPointer; -><>ORD_BL_DataBlob; $_l_offset; True:C214)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=ORD_l_DataPointer)
		For ($_l_Index; 1; Get last field number:C255(->[STOCK_MOVEMENT_ITEMS:27]))
			If (BLOB size:C605(<>ORD_BL_DataBlob)>$_l_offset)
				$_ptr_StockMovementItemField:=Field:C253(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); $_l_Index)
				
				
				Case of 
					: (Type:C295($_ptr_StockMovementItemField->)=Is alpha field:K8:1)
						
						//STK_S255_DataPointer:=""
						//$_l_offset:=DB_Blob_to_Data (->STK_S255_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True)
						$_at_AlphaFieldData{$_l_Index}{$_l_RecordCount}:=$_ptr_StockMovementItemField->  //STK_S255_DataPointer
						
					: (Type:C295($_ptr_StockMovementItemField->)=Is boolean:K8:9)
						
						//STK_bo_DataPointer:=False
						//$_l_offset:=DB_Blob_to_Data (->STK_bo_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True)
						$_abo_Booleans{$_l_Index}{$_l_RecordCount}:=$_ptr_StockMovementItemField->  //STK_bo_DataPointer
						
					: (Type:C295($_ptr_StockMovementItemField->)=Is date:K8:7)
						
						//STK_D_DataPointer:=!00/00/0000!
						//$_l_offset:=DB_Blob_to_Data (->STK_D_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True)
						$_ad_Dates{$_l_Index}{$_l_RecordCount}:=$_ptr_StockMovementItemField->  //STK_D_DataPointer
						
					: (Type:C295($_ptr_StockMovementItemField->)=Is integer:K8:5)
						
						//STK_l_DataPointer:=0
						//$_l_offset:=DB_Blob_to_Data (->STK_l_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True;Is Integer)
						
						$_ai_Integers{$_l_Index}{$_l_RecordCount}:=$_ptr_StockMovementItemField->  //STK_l_DataPointer
					: (Type:C295($_ptr_StockMovementItemField->)=Is longint:K8:6)
						
						//STK_l_DataPointer:=0
						//$_l_offset:=DB_Blob_to_Data (->STK_l_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True)
						$_al_LongIntegers{$_l_Index}{$_l_RecordCount}:=$_ptr_StockMovementItemField->  //STK_l_DataPointer
						
					: (Type:C295($_ptr_StockMovementItemField->)=Is picture:K8:10)
					: (Type:C295($_ptr_StockMovementItemField->)=Is real:K8:4)
						
						
						//STK_R_DataPointer:=0
						//$_l_offset:=DB_Blob_to_Data (->STK_R_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True)
						$_ar_Reals{$_l_Index}{$_l_RecordCount}:=$_ptr_StockMovementItemField->  //STK_R_DataPointer
						
					: (Type:C295($_ptr_StockMovementItemField->)=Is subtable:K8:11)
					: (Type:C295($_ptr_StockMovementItemField->)=Is text:K8:3)
						
						
						//STK_T_DataPointer:=""
						//$_l_offset:=DB_Blob_to_Data (->STK_T_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True)
						$_at_Texts{$_l_Index}{$_l_RecordCount}:=$_ptr_StockMovementItemField->  //STK_T_DataPointer
					: (Type:C295($_ptr_StockMovementItemField->)=Is time:K8:8)
						
						//STK_ti_DataPointer:=?00:00:00?
						//$_l_offset:=DB_Blob_to_Data (->STK_ti_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True)
						$_al_LongIntegers{$_l_Index}{$_l_RecordCount}:=$_ptr_StockMovementItemField->  //(STK_ti_DataPointer*1)
					Else 
				End case 
			End if 
		End for 
	End if 
	
Until (BLOB size:C605(<>ORD_BL_DataBlob)<=($_l_offset+5))

CLEAR SEMAPHORE:C144("$DataBlobinUse")
//``
$_l_IPMessage:=DB_GetButtonFunction("Get Company Code")

If (STOCK_l_CopyProcess>0)
	PROCESS PROPERTIES:C336(STOCK_l_CopyProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
	If ($_l_ProcessState>=0)  // 29/05/02
		
		
		SET PROCESS VARIABLE:C370(STOCK_l_CopyProcess; IP_t_MessageReplySTR; IP_t_MessageReplySTR)
		
		SET PROCESS VARIABLE:C370(STOCK_l_CopyProcess; DB_l_ButtonClickedFunction; $_l_IPMessage)
		RESUME PROCESS:C320(STOCK_l_CopyProcess)
		//     Delayticks(30)  `bsw 25/05/04 SO not being copied to dia
		POST OUTSIDE CALL:C329(STOCK_l_CopyProcess)
	End if 
	$_l_Repeats:=0
	$_l_Retries:=0
	Repeat 
		GET PROCESS VARIABLE:C371(STOCK_l_CopyProcess; IP_t_MessageReplySTR; IP_t_MessageReplySTR)
		$_l_Repeats:=$_l_Repeats+1
		If (IP_t_MessageReplySTR="")
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*$_l_Retries)
		End if 
	Until ($_l_Repeats>100) | (IP_t_MessageReplySTR#"")
	//the IP_l_MessageReply will now be set to the table number
	If (IP_t_MessageReplySTR#"")
		If (IP_t_MessageReplySTR#"NONE")
			[STOCK_MOVEMENTS:40]Company_From:2:=IP_t_MessageReplySTR
		End if 
	End if 
	IP_t_MessageReplySTR:=""
End if 


//```
//now the copied records are in a 2D array
//we need the PRODUCT CODE Records displayed on the form
$_l_KeyFieldNumber:=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
ARRAY BOOLEAN:C223($_abo_RecordUsed; $_l_RecordCount)
$_bo_Continue:=True:C214
If ($_bo_Continue)
	//```
	$_bo_Reverse:=False:C215
	//Gen_Confirm ("Do you want to reverse the amounts"+Char(13)+"(ie negate a previous Item) ?";"Same";"Reverse")
	//If (OK=1)
	//$_bo_Reverse:=False
	//Else
	//$_bo_Reverse:=True
	//End if
	If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
	End if 
	$_bo_UniqueSerialNos:=[MOVEMENT_TYPES:60]Serial_Unique:19
	ARRAY TEXT:C222($_at_OtherDeliveryReferences; 0)
	ARRAY TEXT:C222($_at_OthersNotMovement; 0)
	$_bo_DeleteQuestionAsked:=False:C215
	$_bo_DeleteOption:=False:C215
	
	If (Size of array:C274($_ai_Integers)>0)
		For ($_l_DeliveryIndex; 1; Size of array:C274($_ai_Integers{1}))
			GOTO XY:C161(2; 1)
			MESSAGE:C88("Creating Stock item "+String:C10($_l_DeliveryIndex))
			
			If ($_abo_RecordUsed{$_l_DeliveryIndex}=False:C215)
				CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
				For ($_l_Index; 1; Get last field number:C255(->[STOCK_MOVEMENT_ITEMS:27]))
					$_ptr_StockMovementItemField:=Field:C253(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); $_l_Index)
					//``
					Case of 
						: (Type:C295($_ptr_StockMovementItemField->)=Is alpha field:K8:1)
							
							$_ptr_StockMovementItemField->:=$_at_AlphaFieldData{$_l_Index}{$_l_DeliveryIndex}
						: (Type:C295($_ptr_StockMovementItemField->)=Is boolean:K8:9)
							
							$_ptr_StockMovementItemField->:=$_abo_Booleans{$_l_Index}{$_l_DeliveryIndex}
							
						: (Type:C295($_ptr_StockMovementItemField->)=Is date:K8:7)
							
							$_ptr_StockMovementItemField->:=$_ad_Dates{$_l_Index}{$_l_DeliveryIndex}
							
						: (Type:C295($_ptr_StockMovementItemField->)=Is integer:K8:5)
							
							$_ptr_StockMovementItemField->:=$_ai_Integers{$_l_Index}{$_l_DeliveryIndex}
						: (Type:C295($_ptr_StockMovementItemField->)=Is longint:K8:6)
							
							$_ptr_StockMovementItemField->:=$_al_LongIntegers{$_l_Index}{$_l_DeliveryIndex}
						: (Type:C295($_ptr_StockMovementItemField->)=Is picture:K8:10)
						: (Type:C295($_ptr_StockMovementItemField->)=Is real:K8:4)
							
							
							$_ptr_StockMovementItemField->:=$_ar_Reals{$_l_Index}{$_l_DeliveryIndex}
							
						: (Type:C295($_ptr_StockMovementItemField->)=Is subtable:K8:11)
						: (Type:C295($_ptr_StockMovementItemField->)=Is text:K8:3)
							
							
							$_ptr_StockMovementItemField->:=$_at_Texts{$_l_Index}{$_l_DeliveryIndex}
						: (Type:C295($_ptr_StockMovementItemField->)=Is time:K8:8)
							
							$_ptr_StockMovementItemField->:=Time:C179(Time string:C180($_al_LongIntegers{$_l_Index}{$_l_DeliveryIndex}))
						Else 
							
					End case 
				End for 
				If (([STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)>0)
					$_t_FromMovementCode:=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11
					
					$_r_CalledOffQuantity:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
					$_t_FromAddToType:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
					$_l_FromAddToCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
					$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
					$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
					$_t_LayerCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
					$_t_LocationCode:=[STOCK_MOVEMENT_ITEMS:27]Location:7
					$_l_ItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8  //This will only be filled in if its allocated-we will move the allocation from the on order item to the instock item.
					
					$_t_OrderCode:=[STOCK_MOVEMENT_ITEMS:27]Order_Code:3
					//`ont forget to take the purchase order code and purchase order item number off or the PO will still think this is expected stock
					//if the serial number is filled in take it off the old record
					$_t_SerialNumber:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
					$_l_CouldBeCopiedfrom:=[STOCK_MOVEMENT_ITEMS:27]xnonlinkedCopiedFromID:47
					[STOCK_MOVEMENT_ITEMS:27]xnonlinkedCopiedFromID:47:=0
					[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=""
					
					If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
					End if 
					$_t_PODeliveryReference:=[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43
					[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=""
					[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=!00-00-00!
					
					$_t_CurrentMovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
					$_bo_StockReceipt:=[MOVEMENT_TYPES:60]UseForStockReceipt:33
					$_bo_isCancellation:=False:C215
					If ([MOVEMENT_TYPES:60]UseForpurchaseCancellation:34=True:C214)
						$_bo_isCancellation:=True:C214
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31="")
						//The item we are copying from will not match this moevement type -we might want to delete it after
						If ($_bo_DeleteQuestionAsked=False:C215)
							Gen_Confirm("The stock item you are copying from is of movement type "+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+" do you want to delete these stock items after copying so they cannot be copied from again, note these will delete regardless of the quantity you receive here?"; "YES"; "NO")
							
							$_bo_DeleteOption:=(OK=1)
							$_bo_DeleteQuestionAsked:=True:C214
							
						End if 
						If ($_bo_DeleteOption)
							If (Not:C34(STK_bo_isHDeletedInited))
								ARRAY LONGINT:C221(STK_al_DeleteItems; 0)
							End if 
							APPEND TO ARRAY:C911(STK_al_DeleteItems; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
							
						End if 
					End if 
					$_bo_POAlertFlag:=False:C215
					$_l_PreferItemNumber:=0
					If ($_l_ItemNumber>0) & ([MOVEMENT_TYPES:60]UseForStockReceipt:33)
						$_t_ThisMovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
						//TRACE
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_ThisMovementType)
						Case of 
							: ([MOVEMENT_TYPES:60]Purch_Ord_Type:11)
								$_bo_POAlertFlag:=True:C214
								[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
								[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
								If (STK_bo_ReceivebyReference)
									
									If ($_t_PODeliveryReference#"")
										$_l_DeliveryReferenceRow:=Find in array:C230($_at_OtherDeliveryReferences; $_t_PODeliveryReference)
										If ($_l_DeliveryReferenceRow<0)
											APPEND TO ARRAY:C911($_at_OtherDeliveryReferences; $_t_PODeliveryReference)
											APPEND TO ARRAY:C911($_at_OthersNotMovement; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
										End if 
									End if 
									
								End if 
								//Gen_Alert ("This is copied from a PO movement so after posting the this movement the stock should be re-allocated")
								APPEND TO ARRAY:C911(STK_AL_AUTOALLOCATEOI; $_l_ItemNumber)
								APPEND TO ARRAY:C911(STK_ar_AUTOALLOCATEQTY; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
								APPEND TO ARRAY:C911(STK_al_RemoveFromItemID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								If ($_bo_isCancellation)
									STK_bo_MoveOnOrderAllocation:=True:C214
								End if 
								
								If ([STOCK_MOVEMENTS:40]Company_From:2="") & ($_t_FromMovementCode#"")
									$_l_GetCompanyProcess:=New process:C317("STK_GetMovementCompany"; 128000; "Get movement Company"; $_t_FromMovementCode; Current process:C322)
									$_l_Retries:=0
									While (Process state:C330($_l_GetCompanyProcess)>=0) & (Process_Name($_l_GetCompanyProcess)="Get movement Company")
										DelayTicks(2*$_l_Retries)
									End while 
									[STOCK_MOVEMENTS:40]Company_From:2:=STK_t_fromCompany
									[STOCK_MOVEMENTS:40]Contact_Code:3:=STK_t_FromContact
									[STOCK_MOVEMENTS:40]xCompanyFromID:25:=STK_l_CompanyID
									[STOCK_MOVEMENTS:40]MovementSourceTable:16:=Table:C252(->[PURCHASE_ORDERS:57])
								End if 
							: ([MOVEMENT_TYPES:60]Delivery_Type:12)
								[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$_l_ItemNumber
								[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
							Else 
								$_l_PreferItemNumber:=$_l_ItemNumber
								$_l_ItemNumber:=0  // SO IF COPY FROM AN ALLOCATION WE DONT KEEP THE ALLOCATION ON THE COPIED ITEM
								
						End case 
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_CurrentMovementType)
					Else 
						//TRACE
						If ([MOVEMENT_TYPES:60]UseForStockReceipt:33)
							$_t_ThisMovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_ThisMovementType)
							If ([MOVEMENT_TYPES:60]Purch_Ord_Type:11)
								$_bo_POAlertFlag:=True:C214
								If (STK_bo_ReceivebyReference)
									If ($_t_PODeliveryReference#"")
										$_l_DeliveryReferenceRow:=Find in array:C230($_at_OtherDeliveryReferences; $_t_PODeliveryReference)
										If ($_l_DeliveryReferenceRow<0)
											APPEND TO ARRAY:C911($_at_OtherDeliveryReferences; $_t_PODeliveryReference)
											APPEND TO ARRAY:C911($_at_OthersNotMovement; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
										End if 
									End if 
									
								End if 
							End if 
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_CurrentMovementType)
						End if 
					End if 
					
					[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
					If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
					End if 
					If ([MOVEMENT_TYPES:60]Stock_Minus:4=$_t_FromAddToType)  //the one we copied from we will minus from-this is true even if we are reversing
						
						[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
						If ($_bo_POAlertFlag)
							If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0)
								Gen_Alert("The copied from had an Id of 0")
							End if 
						End if 
					Else 
						If ($_bo_POAlertFlag)
							Gen_Alert("the movement type is different so copied from will be recalculated")
						End if 
						[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
						[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
					End if 
					
					
					[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_CalledOffQuantity  //you can only copy the remaining
					[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
					[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
					[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
					[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
					[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
					[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					
					If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26#[STOCK_MOVEMENTS:40]Movement_Date:5)
						[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=[STOCK_MOVEMENTS:40]Movement_Date:5
					End if 
					[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=$_t_LayerCode
					[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=$_t_LocationCode
					[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=$_t_AnalysisCode
					[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=$_t_CurrencyCode
					[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
					
					If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27#[STOCK_MOVEMENTS:40]Layer_Code:11)
						[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:=[STOCK_MOVEMENTS:40]Layer_Code:11
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28#[STOCK_MOVEMENTS:40]Analysis_Code:9)
						[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=[STOCK_MOVEMENTS:40]Analysis_Code:9
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29#[STOCK_MOVEMENTS:40]Currency_Code:10)
						[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=[STOCK_MOVEMENTS:40]Currency_Code:10
					End if 
					
					If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#[STOCK_MOVEMENTS:40]Movement_Type:6)
						[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:=[STOCK_MOVEMENTS:40]Movement_Type:6
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
						[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
						[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=True:C214
					End if 
					If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
					End if 
					$_bo_SetCopiedFromNow:=False:C215
					If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39) | ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40<0) | ($_bo_Reverse)
						If ([MOVEMENT_TYPES:60]Stock_Minus:4#[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32)
							//the movement type we are copying from does not directly relate to this movement type
							//the type we are going to add to(xaddtostocktype) does not correspond to the type we were taking from
							//therefore this item will NOT copy from (x_copiedfrom) the item dragged..it will copy from some other item.
							//this only actually matters is the item it does get copied from ahs important infor like a sales order item id which needs to be used to facilitate an allocation
							If ([MOVEMENT_TYPES:60]UseForStockReceipt:33)
								$_t_MovementTypeStockSubtract:=[MOVEMENT_TYPES:60]Stock_Minus:4
								$_bo_SetCopiedFromNow:=True:C214
								//we are receiving stock(actually as this is an inverse we are unreceiving stock!!
							End if 
							
						End if 
						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
						[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Minus:4
					Else 
						If ([MOVEMENT_TYPES:60]Stock_Minus:4#[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31)
							//the movement type we are copying from does not directly relate to this movement type
							//the type we are going to add to(xaddtostocktype) does not correspond to the type we were taking from
							//therefore this item will NOT copy from (x_copiedfrom) the item dragged..it will copy from some other item.
							//this only actually matters is the item it does get copied from ahs important infor like a sales order item id which needs to be used to facilitate an allocation
							If ([MOVEMENT_TYPES:60]UseForStockReceipt:33)
								//we are receiving stock(actually as this is an inverse we are unreceiving stock!!
								$_t_MovementTypeStockSubtract:=[MOVEMENT_TYPES:60]Stock_Plus:3
								$_t_ProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
								//do not re-invent the wheel here-we already have the code for this  this is copied from the pseudo trigger
								//``
								$_bo_SetCopiedFromNow:=True:C214
							End if 
							
							
						End if 
						[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
						[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Minus:4
					End if 
					//[ORDER ITEMS]Item_Locked:=False
					If ($_bo_UniqueSerialNos)
						[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=""
					End if 
					$_bo_Edits:=STK_SetHeaderInfo
					[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
					[STOCK_MOVEMENT_ITEMS:27]StockItemThread:19:=0
					[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=0
					[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
					//note that the trigger will update the called off on the previous stock..that is the trigger on the stock movement
					
					
					
					//this is so if we cancell the stock movement we dont make the amount wrong preventing a call off(make sure is we cancel that the items here get deleted)
					Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
					
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
					
					APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					
					If ($_bo_SetCopiedFromNow) & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0)
						//GOTO XY(4;1)
						If ($_l_CouldBeCopiedfrom#0)
							If ($_l_CouldBeCopiedfrom>0)
								$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
								SET QUERY DESTINATION:C396(Into variable:K19:4; $_r_FreeStock)
								
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CouldBeCopiedfrom; *)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>=$_r_Quantity)
								If ($_r_FreeStock>0)
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_l_CouldBeCopiedfrom
								End if 
								SET QUERY DESTINATION:C396(Into current selection:K19:1)
								
							End if 
							If ($_l_CouldBeCopiedfrom<0)
								$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
								$_t_FromType:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32
								$_t_FromProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
								SET QUERY DESTINATION:C396(Into variable:K19:4; $_r_FreeStock)
								
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_FromProductCode; *)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>=$_r_Quantity; *)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$_t_FromType)
								If ($_r_FreeStock>0)
									$_l_CouldBeCopiedfrom:=0
								End if 
								SET QUERY DESTINATION:C396(Into current selection:K19:1)
								
							End if 
							
						End if 
						//MESSAGE("Finding Preceding Stock item")
						
						$_bo_IsAllocation:=[MOVEMENT_TYPES:60]Alloc_Type:10
						$_bo_IsUnAllocation:=[MOVEMENT_TYPES:60]Unalloc_Type:13
						$_bo_UseOnlyallocated:=[MOVEMENT_TYPES:60]Delivery_Type:12 | [MOVEMENT_TYPES:60]UseAllocatedStock:27
						$_bo_STKp_UseOnlyFree:=[MOVEMENT_TYPES:60]DoNotUseAllocatedStock:36
						
						$_l_FromAddToCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
						$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
						If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=0)
							
							If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#"")
								COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "$TempCS")
								$_l_SelectedRecordNumber:=Selected record number:C246([CURRENT_STOCK:62])
								Case of 
									: ($_bo_IsAllocation)
										
										$_l_AddtoItemID:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
										If ($_l_AddtoItemID=0)
											//TRACE
											STK_l_PreviousItemNumber:=0
											STK_bo_PreviousItemNumberTested:=False:C215
											$_l_GetItemNumberProcess:=New process:C317("STK_GetAllocationItemNumber"; 128000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
											$_l_Retries:=0
											Repeat 
												//Message("Waiting for STK_GetAllocationItemNumber")
												$_l_Retries:=$_l_Retries+1
												DelayTicks(6*$_l_Retries)
											Until (STK_bo_PreviousItemNumberTested)
											SET PROCESS VARIABLE:C370($_l_GetItemNumberProcess; STK_bo_PreviousCAllback; True:C214)
											$_l_AddtoItemID:=STK_l_PreviousItemNumber
											[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_l_TakeFromItemID
											$_bo_Edit:=True:C214
										End if 
									: ($_bo_IsUnAllocation)
										$_l_AddtoItemID:=0
									Else 
										$_l_AddtoItemID:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
								End case 
								[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=STK_GetAddtoCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_l_AddtoItemID; [STOCK_MOVEMENT_ITEMS:27]Location:7; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
								$_bo_Edit:=True:C214
								USE NAMED SELECTION:C332("$TempCS")
								GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_SelectedRecordNumber)
							End if 
							
							
						End if 
						If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0) & ($_l_CouldBeCopiedfrom>=0)
							$_bo_Continue:=False:C215
							$_bo_noSplit:=True:C214
							$_bo_noSuperSplit:=True:C214
							$_bo_PriceMatch:=True:C214
							$_bo_DateMatch:=True:C214
							$_bo_CSIDMatch:=True:C214
							$_bo_Exit:=False:C215
							$_bo_SplitItem:=False:C215
							$_bo_IsSourceStockType:=STK_isSourceStockType([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32)
							If (Not:C34($_bo_IsSourceStockType))  //if this is a source stock type dont waste time looking for a previous movement item!
								
								$_bo_PreTry:=True:C214
								Repeat 
									Repeat 
										STK_l_PreviousStockItemNumber:=0
										STK_l_PreviousMovementID:=0
										STK_t_PreviousStockLocation:=""
										STK_T_PreviousStockItemAnal:=""
										STK_T_PreviousStockItemLayer:=""
										STK_T_PreviousStockItemCurrency:=""
										STK_t_PreviousStockSerial:=""
										STK_R_PreviousCostPrice:=0
										Case of 
											: ($_bo_IsUnAllocation)
												$_l_TakeFromItemID:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
												If ($_l_TakeFromItemID=0)
													//TRACE
													STK_l_PreviousItemNumber:=0
													STK_bo_PreviousItemNumberTested:=False:C215
													$_l_GetItemNumberProcess:=New process:C317("STK_GetAllocationItemNumber"; 128000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
													$_l_Retries:=0
													Repeat 
														//Message("Waiting for Get allocation Item number")
														$_l_Retries:=$_l_Retries+1
														DelayTicks(6*$_l_Retries)
													Until (STK_bo_PreviousItemNumberTested)
													SET PROCESS VARIABLE:C370($_l_GetItemNumberProcess; STK_bo_PreviousCAllback; True:C214)
													$_l_TakeFromItemID:=STK_l_PreviousItemNumber
													[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$_l_TakeFromItemID
													$_bo_Edit:=True:C214
												End if 
											: ($_bo_IsAllocation)
												$_l_TakeFromItemID:=0
											Else 
												$_l_TakeFromItemID:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
										End case 
										ARRAY LONGINT:C221(STK_al_PreviousMovementIDS; 0)
										ARRAY REAL:C219(STK_ar_PreviousMovementQTY; 0)
										ARRAY LONGINT:C221(STK_al_PreviousMovementCSID; 0)
										ARRAY TEXT:C222(STK_at_PreviousMovementLocation; 0)
										ARRAY TEXT:C222(STK_at_PreviousMovementCurrency; 0)
										ARRAY TEXT:C222(STK_at_PreviousMovementAnalysis; 0)
										ARRAY TEXT:C222(STK_at_PreviousMovementLayer; 0)
										STK_bo_PreviousSet:=False:C215
										$_l_Retries:=0
										$_t_ProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
										While (Semaphore:C143("PSC"+$_t_ProductCode))
											//Message("Waiting for semaphore PSC"+[STOCK ITEMS]Product Code)
											$_l_Retries:=$_l_Retries+1
											DelayTicks(10*$_l_Retries)
										End while 
										<>FilterInAllocated:=False:C215
										If ([MOVEMENT_TYPES:60]UseForStockReceipt:33)
											<>FilterInAllocated:=True:C214  //This will make the system include pre-allocated by prefernce-but not any specific item number
											
											//$_l_PreferItemNumber is that is set then we will try that item number
										End if 
										<>STOCK_bo_NoSplit:=$_bo_noSplit
										<>STOCK_bo_NoSuperSplit:=$_bo_noSuperSplit
										If (<>STOCK_bo_NoSuperSplit=False:C215)
											<>STOCK_bo_NoSplit:=False:C215
										End if 
										If ($_l_PreferItemNumber>0) & ($_l_TakeFromItemID=0)
											$_l_TakeFromItemID:=$_l_PreferItemNumber
											$_bo_ItemNumberMatch:=True:C214
										End if 
										Repeat 
											Case of 
													
												: ($_bo_PreTry)
													//GOTO XY(4;1)`
													//MESSAGE("Finding Preceding Stock item"+" using Pre-try")
													
													$_r_CostPrice:=$_r_ZeroReal
													$_d_HeaderDate:=!00-00-00!
													$_l_TakeFromCSID:=$_l_ZeroLongint
													$_bo_noSuperSplit:=False:C215
													$_bo_noSplit:=False:C215
												: ($_bo_PriceMatch)  //is date match or CSID Match on
													
													//GOTO XY(4;1)
													//("Finding Preceding Stock item"+" using Prce Match")
													
													$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
													Case of 
														: ($_bo_DateMatch)
															$_d_HeaderDate:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
															If ($_bo_CSIDMatch)
																If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																	$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
																	//GOTO XY(4;1)
																	//MESSAGE("Finding Preceding Stock item"+" using Prce Match and date match andcurrent stock id")
																	
																Else 
																	$_l_TakeFromCSID:=$_l_ZeroLongint
																	//GOTO XY(4;1)
																	//MESSAGE("Finding Preceding Stock item"+" using Prce Match and date match")
																	
																End if 
																
																
															Else 
																$_l_TakeFromCSID:=$_l_ZeroLongint
																//GOTO XY(4;1)
																//MESSAGE("Finding Preceding Stock item"+" using Prce Match and date match")
																
															End if 
														Else 
															$_d_HeaderDate:=!00-00-00!
															If ($_bo_CSIDMatch)
																If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																	$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
																	//GOTO XY(4;1)
																	//MESSAGE("Finding Preceding Stock item"+" using Prce Match and current stock id")
																	
																Else 
																	$_l_TakeFromCSID:=$_l_ZeroLongint
																	//GOTO XY(4;1)
																	//MESSAGE("Finding Preceding Stock item"+" using Prce Match")
																	
																End if 
																
																
															Else 
																$_l_TakeFromCSID:=$_l_ZeroLongint
																//GOTO XY(4;1)
																//MESSAGE("Finding Preceding Stock item"+" using Prce Match")
																
															End if 
													End case 
												: ($_bo_DateMatch)  //price match is off is CS ID match on
													
													$_r_CostPrice:=$_r_ZeroReal
													$_d_HeaderDate:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
													If ($_bo_CSIDMatch)
														If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
															$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
															//GOTO XY(4;1)
															//MESSAGE("Finding Preceding Stock item"+" using Prce Match current stock match and date match(no price match)")
															
														Else 
															$_l_TakeFromCSID:=$_l_ZeroLongint
															//GOTO XY(4;1)
															//MESSAGE("Finding Preceding Stock item"+" using Prce Match and date match(no price match)")
															
														End if 
														
														
													Else 
														$_l_TakeFromCSID:=$_l_ZeroLongint
														//GOTO XY(4;1)
														//MESSAGE("Finding Preceding Stock item"+" using Prce Match and date match(no price match)")
														
													End if 
												: ($_bo_CSIDMatch)  //Price match and  Date match are off
													
													$_r_CostPrice:=$_r_ZeroReal
													$_d_HeaderDate:=!00-00-00!
													If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
														$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
														//GOTO XY(4;1)
														//MESSAGE("Finding Preceding Stock item"+" using current stock id Match (no date match,no price match)")
														
													Else 
														$_l_TakeFromCSID:=$_l_ZeroLongint
														//GOTO XY(4;1)
														//MESSAGE("Finding Preceding Stock item"+" No  current stock id Match (no date match,no price match)")
														
													End if 
													
												: ($_bo_ItemNumberMatch)  //This only comes into play when we are copying from an ISH ISHC that has an item number on if we have reached this point and not found a record
													
													//switxh the option off
													$_bo_ItemNumberMatch:=False:C215
													$_l_TakeFromItemID:=0
													$_l_PreferItemNumber:=0
													//Switch everything esle back on
													//but mark this so it does not get used again else we get stuck
													$_bo_PriceMatch:=True:C214
													$_bo_noSplit:=True:C214
													$_bo_noSuperSplit:=True:C214
													$_bo_PriceMatch:=True:C214
													$_bo_DateMatch:=True:C214
													$_bo_CSIDMatch:=True:C214
													$_bo_Exit:=False:C215
													$_bo_SplitItem:=False:C215
													
													//Note that we dont change the value of ◊FilterInAllocated its either on or off
													
												Else 
													$_r_CostPrice:=$_r_ZeroReal
													$_d_HeaderDate:=!00-00-00!
													$_l_TakeFromCSID:=$_l_ZeroLongint
													//GOTO XY(4;1)
													//MESSAGE("Finding Preceding Stock item"+" No  current stock id Match (no date match,no price match)")
													
													
											End case 
											$_l_Retries:=0
											While (Test semaphore:C652("GetPrevious"))
												//GOTO XY(4;1)
												//MESSAGE("Waiting for semaphore GetPrevious")
												$_l_Retries:=$_l_Retries+1
												DelayTicks(10*$_l_Retries)
											End while 
											If (<>STK_l_PreviousProcess=0)
												//TRACE
												<>STK_l_PreviousProcess:=New process:C317("STK_GetPreviousStockMovementPro"; 128000; "Get Previous Movement ID"; Current process:C322; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_l_TakeFromCSID; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; $_d_HeaderDate; $_r_CostPrice; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_bo_IsAllocation; $_bo_IsUnAllocation; $_l_TakeFromItemID; $_bo_UseOnlyallocated; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_bo_PreTry; $_bo_STKp_UseOnlyFree; *)
												//GOTO XY(4;1)
												
												//MESSAGE("Pausing process"+String(Current process)+"Waiting for resume from(3)"+String(◊STK_l_PreviousProcess))
												DelayTicks(30*60)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
											Else 
												$_l_Retries:=0
												While (Semaphore:C143("STK_GetPrevious"))
													//GOTO XY(4;1)
													//MESSAGE("Waiting for semaphore STK_GetPrevious")
													$_l_Retries:=$_l_Retries+1
													DelayTicks(10*$_l_Retries)
												End while 
												$_l_Retries:=0
												While (Test semaphore:C652("GetPrevious"))
													//GOTO XY(4;1)
													//MESSAGE("Waiting for semaphore GetPrevious")
													$_l_Retries:=$_l_Retries+1
													DelayTicks(10*$_l_Retries)
												End while 
												//TRACE
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pCopiedFromID; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pTakeFromCSID; $_l_TakeFromCSID)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pProductCode; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromStockType; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromCurrency; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromAnalysis; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromLayer; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_d_pTakeFrommaxHeaderDate; $_d_HeaderDate)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_r_pTakeFromCostPrice; $_r_CostPrice)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_r_pTakeQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pNotFromSIID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_isAllocation; $_bo_IsAllocation)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_isUnallocation; $_bo_IsUnAllocation)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pTakeFromItemID; $_l_TakeFromItemID)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_UseOnlyAllocated; $_bo_UseOnlyallocated)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_UseOnlyAllocated; $_bo_STKp_UseOnlyFree)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_TakePONumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_TakeFromPOItemNumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pCallBackProcess; Current process:C322)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CallisPreTry; $_bo_PreTry)
												RESUME PROCESS:C320(<>STK_l_PreviousProcess)
												//GOTO XY(4;1)
												//MESSAGE("Pausing process"+String(Current process)+"Waiting for resume from(4)"+String(◊STK_l_PreviousProcess))
												DelayTicks(30*60)
												SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
												//While (Not(Test semaphore("GetPrevious"))) & (Not(STK_bo_PreviousSet))
												//`Message("Waiting for semaphore GetPrevious to be true")
												//DelayTicks (10)
												//RESUME PROCESS(◊STK_l_PreviousProcess)
												//End while
												
												CLEAR SEMAPHORE:C144("STK_GetPrevious")
												$_l_Retries:=0
												While (Test semaphore:C652("GetPrevious")) & (Process state:C330(<>STK_l_PreviousProcess)#5)
													SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
													//GOTO XY(4;1)
													//MESSAGE("Waiting for semaphore GetPrevious(3)")
													$_l_Retries:=$_l_Retries+1
													DelayTicks(10*$_l_Retries)
												End while 
												
												
											End if 
											
											$_l_Currenttime:=Current time:C178*1
											$_bo_NoExit:=False:C215
											$_l_Retries:=0
											While (STK_bo_PreviousSet=False:C215) & ($_l_Retries<100)
												//Message("Waiting for Boolean STK_bo_PreviousSet")
												$_l_Retries:=$_l_Retries+1
												DelayTicks(60*$_l_Retries)
												
											End while 
										Until (STK_bo_PreviousSet)
										<>FilterInAllocated:=False:C215
										CLEAR SEMAPHORE:C144("PSC"+$_t_ProductCode)
										<>STOCK_bo_NoSplit:=False:C215
										If ($_bo_NoExit=False:C215)
											$_bo_Continue:=True:C214
										End if 
										If (STK_l_PreviousMovementID=0)  //| ($_bo_PreTry=True)
											
											Case of 
												: ($_bo_PreTry=True:C214)
													//TRACE
													//GOTO XY(4;1)
													//MESSAGE("Pre-try found no item id;exit")
													
													
													$_bo_PreTry:=False:C215
													$_bo_Exit:=True:C214
													$_bo_noSplit:=True:C214
													$_bo_noSuperSplit:=True:C214
												: ($_bo_PriceMatch=True:C214) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
													$_bo_PriceMatch:=False:C215
													//GOTO XY(5;1)
													//MESSAGE("not price match found")
													
												: ($_bo_DateMatch) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
													$_bo_DateMatch:=False:C215
													$_bo_PriceMatch:=True:C214
													//GOTO XY(5;1)
													//MESSAGE("not date  match found")
													
												: ($_bo_CSIDMatch=True:C214) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
													$_bo_CSIDMatch:=False:C215
													$_bo_DateMatch:=True:C214
													$_bo_PriceMatch:=True:C214
													//GOTO XY(5;1)
													//MESSAGE("not ID match found")
													
												: ($_bo_noSplit=True:C214) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
													$_bo_noSplit:=False:C215
													$_bo_PriceMatch:=True:C214
													$_bo_DateMatch:=True:C214
													$_bo_CSIDMatch:=True:C214
													//GOTO XY(5;1)
													//MESSAGE("going to test split m")
													
												: ($_bo_noSuperSplit) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
													
													
													//If (($Filtertomovementtype="ALO") & ($AllocationFirstTry)) | (($OscFIrstTry) & ($Filtertomovementtype="OSC"))
													//actually this should never get here... but dont try super split on these`
													//2nd pass-data match break out
													//Else
													$_bo_noSuperSplit:=False:C215
													$_bo_noSplit:=False:C215
													$_bo_PriceMatch:=True:C214
													$_bo_DateMatch:=True:C214
													$_bo_CSIDMatch:=True:C214
													//GOTO XY(5;1)
													//MESSAGE("going to test super split")
													
												Else 
													//all are false and we tried spliting
													If (Size of array:C274(STK_al_PreviousMovementIDS)=0)
														//TRACE
														//GOTO XY(5;1)
														//MESSAGE("no match exit")
														
														$_bo_Exit:=True:C214
													Else 
														//GOTO XY(5;1)
														//MESSAGE("no match exit")
														
														$_bo_Exit:=True:C214
													End if 
											End case 
										Else 
											If ($_bo_PreTry)
												//GOTO XY(5;1)
												//MESSAGE("Pre try success")
												
												If (STK_l_PreviousMovementID=-9999)
													//TRACE
													STK_l_PreviousMovementID:=0
													$_bo_Exit:=True:C214
												End if 
												$_bo_PreTry:=False:C215
												$_bo_noSplit:=True:C214
												$_bo_noSuperSplit:=True:C214
											Else 
												If (STK_l_PreviousMovementID=-9999)
													STK_l_PreviousMovementID:=0
													//GOTO XY(5;1)
													//MESSAGE("no records exit")
													
												End if 
												$_bo_Exit:=True:C214
											End if 
										End if 
									Until ($_bo_Continue)
									
								Until ($_bo_Exit)
								[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=STK_l_PreviousMovementID
								[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=STK_l_PreviousStockItemNumber
								[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=STK_t_PreviousStockLocation
								If ([STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42#STK_T_PreviousStockItemAnal) & (STK_T_PreviousStockItemAnal#"") & (STK_T_PreviousStockItemAnal#[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
									[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=STK_T_PreviousStockItemAnal
								End if 
								If ([STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41#STK_T_PreviousStockItemLayer) & (STK_T_PreviousStockItemLayer#"") & (STK_T_PreviousStockItemLayer#[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
									[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=STK_T_PreviousStockItemLayer
								End if 
								If ([STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36#STK_T_PreviousStockItemCurrency) & (STK_T_PreviousStockItemCurrency#"") & (STK_T_PreviousStockItemCurrency#[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
									[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=STK_T_PreviousStockItemCurrency
								End if 
								[STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33:=(STK_t_PreviousStockSerial#"")
								If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=0)
									[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=STK_R_PreviousCostPrice
								Else 
									If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10#STK_R_PreviousCostPrice)
										[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=STK_R_PreviousCostPrice
									End if 
								End if 
								Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
								
								ARRAY LONGINT:C221($_al_SplitChildrenParentID; 0)
								ARRAY REAL:C219($_ar_SplitChildrenQuantity; 0)
								ARRAY LONGINT:C221($_al_SplitChildrenFromCSID; 0)
								$_bo_SplitChildren:=False:C215
								$_l_SplitChildrenOf:=0
								$_r_OriginalQuantity:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
								ARRAY TEXT:C222($_at_PreviousMovementLocation; 0)
								ARRAY TEXT:C222($_at_PreviousMovementCurrency; 0)
								ARRAY TEXT:C222($_at_PreviousMovementAnalysis; 0)
								ARRAY TEXT:C222($_at_PreviousMovementLayer; 0)
								COPY ARRAY:C226(STK_al_PreviousMovementIDS; $_al_PreviousMovementIDS)
								COPY ARRAY:C226(STK_ar_PreviousMovementQTY; $_ar_PreviousMovementQTY)
								COPY ARRAY:C226(STK_al_PreviousMovementCSID; $_al_PreviousMovementCSID)
								
								COPY ARRAY:C226(STK_at_PreviousMovementLocation; $_at_PreviousMovementLocation)
								COPY ARRAY:C226(STK_at_PreviousMovementCurrency; $_at_PreviousMovementCurrency)
								COPY ARRAY:C226(STK_at_PreviousMovementAnalysis; $_at_PreviousMovementAnalysis)
								COPY ARRAY:C226(STK_at_PreviousMovementLayer; $_at_PreviousMovementLayer)
								
								If (Size of array:C274($_al_PreviousMovementIDS)>0)
									If ([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18>0)
										$_bo_SplitChildren:=True:C214
										$_l_SplitChildrenOf:=([STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										APPEND TO ARRAY:C911($_al_SplitChildrenParentID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										APPEND TO ARRAY:C911($_ar_SplitChildrenQuantity; $_ar_PreviousMovementQTY{1})
										APPEND TO ARRAY:C911($_al_SplitChildrenFromCSID; $_al_PreviousMovementCSID{1})
									End if 
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_PreviousMovementQTY{1}
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_PreviousMovementIDS{1}
									[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_al_PreviousMovementCSID{1}
									//TRACE
									[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
									If ([STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34#$_at_PreviousMovementLocation{1}) & ($_at_PreviousMovementLocation{1}#"") & ($_at_PreviousMovementLocation{1}#[STOCK_MOVEMENT_ITEMS:27]Location:7)
										[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=$_at_PreviousMovementLocation{1}
									End if 
									If ([STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42#$_at_PreviousMovementAnalysis{1}) & ($_at_PreviousMovementAnalysis{1}#"") & ($_at_PreviousMovementAnalysis{1}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
										[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=$_at_PreviousMovementAnalysis{1}
									End if 
									If ([STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41#$_at_PreviousMovementLayer{1}) & ($_at_PreviousMovementLayer{1}#"") & ($_at_PreviousMovementLayer{1}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
										$_bo_Edit:=True:C214
										[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=$_at_PreviousMovementLayer{1}
									End if 
									If ([STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36#$_at_PreviousMovementCurrency{1}) & ($_at_PreviousMovementCurrency{1}#"") & ($_at_PreviousMovementCurrency{1}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
										$_bo_Edit:=True:C214
										[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=$_at_PreviousMovementCurrency{1}
									End if 
									Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									
									//this item needs to be split
									$_bo_SplitItem:=True:C214
									$_bo_Edit:=True:C214
									$_r_QuantityStillRequired:=$_r_OriginalQuantity-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									$_bo_SplitItem:=True:C214
								End if 
							End if 
							[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
							$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
							APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
							
							$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
							
							ARRAY LONGINT:C221($_al_ForceRecalculation; 0)
							If ($_bo_SplitItem)
								[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
								APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								
								$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
								COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$CS")
								$_l_MovementItemsRecords:=Selected record number:C246([STOCK_MOVEMENT_ITEMS:27])
								$_l_CurrentMovementItemRecord:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
								ARRAY LONGINT:C221($_al_ForceRecalculation; 0)
								
								For ($_l_Index3; 2; Size of array:C274($_ar_PreviousMovementQTY))
									GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_CurrentMovementItemRecord)
									STK_ItemDuplicate
									//APPEND TO ARRAY($_al_ForceRecalculation;[STOCK_MOVEMENT_ITEMS]x_ID)
									[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
									[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_al_PreviousMovementCSID{$_l_Index3}
									If ([STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34#$_at_PreviousMovementLocation{$_l_Index3}) & ($_at_PreviousMovementLocation{$_l_Index3}#"") & ($_at_PreviousMovementLocation{$_l_Index3}#[STOCK_MOVEMENT_ITEMS:27]Location:7)
										[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=$_at_PreviousMovementLocation{$_l_Index3}
									End if 
									If ([STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42#$_at_PreviousMovementAnalysis{$_l_Index3}) & ($_at_PreviousMovementAnalysis{$_l_Index3}#"") & ($_at_PreviousMovementAnalysis{$_l_Index3}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
										[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=$_at_PreviousMovementAnalysis{$_l_Index3}
									End if 
									If ([STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41#$_at_PreviousMovementLayer{$_l_Index3}) & ($_at_PreviousMovementLayer{$_l_Index3}#"") & ($_at_PreviousMovementLayer{$_l_Index3}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
										[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=$_at_PreviousMovementLayer{$_l_Index3}
									End if 
									If ([STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36#$_at_PreviousMovementCurrency{$_l_Index3}) & ($_at_PreviousMovementCurrency{$_l_Index3}#"") & ($_at_PreviousMovementCurrency{$_l_Index3}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
										[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=$_at_PreviousMovementCurrency{$_l_Index3}
									End if 
									STK_SetCreatedStockItem(0; ($_ar_PreviousMovementQTY{$_l_Index3}); $_al_PreviousMovementIDS{$_l_Index3})
									$_r_QuantityStillRequired:=$_r_QuantityStillRequired-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
									
									$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
									If ($_bo_SplitChildren)
										APPEND TO ARRAY:C911($_al_SplitChildrenParentID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										APPEND TO ARRAY:C911($_ar_SplitChildrenQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
										APPEND TO ARRAY:C911($_al_SplitChildrenFromCSID; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
									End if 
									If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
										APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
									End if 
									If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0) | ((Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22))#[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
										If ((Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22))#[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
											
										End if 
										
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
										APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										
										$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
									End if 
									If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0) | (Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)#[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
										If ((Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23))#[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
											
										End if 
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
										APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										
										$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
									End if 
									
									
								End for 
								If ($_r_QuantityStillRequired>0)
									GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_CurrentMovementItemRecord)
									
									[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
									APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
									
									$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
									STK_ItemDuplicate
									//APPEND TO ARRAY($_al_ForceRecalculation;[STOCK_MOVEMENT_ITEMS]x_ID)
									[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
									[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_QuantityStillRequired
									[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
									[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
									
									$_r_QuantityStillRequired:=$_r_QuantityStillRequired-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
									DB_PseudoTrigger(Record number:C243([STOCK_MOVEMENT_ITEMS:27]); Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
									[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
									Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
									APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
									
									$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
									If ($_bo_SplitChildren)
										APPEND TO ARRAY:C911($_al_SplitChildrenParentID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										APPEND TO ARRAY:C911($_ar_SplitChildrenQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
										APPEND TO ARRAY:C911($_al_SplitChildrenFromCSID; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
									End if 
								End if 
								If (False:C215)
									If (Size of array:C274($_al_ForceRecalculation)>0)
										For ($_l_Index; 1; Size of array:C274($_al_ForceRecalculation))
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ForceRecalculation{$_l_Index})
											STK_UpdateCalledOffQuantity
											DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
											APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
											
										End for 
									End if 
								End if 
								USE NAMED SELECTION:C332("$CS")
								GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_MovementItemsRecords)
								If ($_bo_SplitChildren)
									STK_SplitChildren($_l_SplitChildrenOf; ->$_ar_SplitChildrenQuantity; ->$_al_SplitChildrenParentID; ->$_al_SplitChildrenFromCSID)
								End if 
							End if 
						End if 
						Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
						
						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
						APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
						
						If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
							COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$TEST")
							$_l_SelectedRecordNumber:=Selected record number:C246([STOCK_MOVEMENT_ITEMS:27])
							$_l_CopiedFromMovementID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CopiedFromMovementID)
							If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8>0) & ([MOVEMENT_TYPES:60]UseForStockReceipt:33)
								$_t_ThisMovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
								$_t_CurrentMovementType:=[MOVEMENT_TYPES:60]Type_Code:1
								QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_ThisMovementType)
								If ([MOVEMENT_TYPES:60]Purch_Ord_Type:11)
									//[STOCK ITEMS]Item Number:=0
									//[STOCK ITEMS]xSalesOrderItemifAllocate:=0
									APPEND TO ARRAY:C911(STK_AL_AUTOALLOCATEOI; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
									APPEND TO ARRAY:C911(STK_ar_AUTOALLOCATEQTY; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									APPEND TO ARRAY:C911(STK_al_RemoveFromItemID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								Else 
									$_l_ItemNumber:=0  // SO IF COPY FROM AN ALLOCATION WE DONT KEEP THE ALLOCATION ON THE COPIED ITEM
									
								End if 
							End if 
							QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_CurrentMovementType)
							USE NAMED SELECTION:C332("$TEST")
							GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SelectedRecordNumber)
							//TRACE
							If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
								//While (Test semaphore("$SettingCalledOff"))
								//DelayTicks (3)
								//End while
								//$_l_NewProcessess:=New process("STK_SetCalledOffInProcess";128000;"Set Called Off";[STOCK_MOVEMENT_ITEMS]X_CopiedFromID;[STOCK_MOVEMENT_ITEMS]Quantity;Current process)
								//While (Test semaphore("$SettingCalledOff"))
								//DelayTicks (3)
								//End while
							End if 
						End if 
					Else 
						If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
							//While (Test semaphore("$SettingCalledOff"))
							//DelayTicks (3)
							//End while
							//$_l_NewProcessess:=New process("STK_SetCalledOffInProcess";128000;"Set Called Off";[STOCK_MOVEMENT_ITEMS]X_CopiedFromID;[STOCK_MOVEMENT_ITEMS]Quantity;Current process)
							//While (Test semaphore("$SettingCalledOff"))
							//DelayTicks (3)
							//End while
						End if 
						
					End if 
					
					If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
					End if 
					If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
					End if 
					If ($_bo_POAlertFlag)
						If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0)
							Gen_Alert("The stock items has a copied from id of zero")
						End if 
					End if 
					
					//AA_CheckFileUnlocked (->[STOCK ITEMS]x_ID)
					//ADD TO SET([STOCK ITEMS];"IMaster")
					
				End if 
			End if 
		End for 
		If (Size of array:C274($_at_OtherDeliveryReferences)>0)
			For ($_l_DeliveryIndex; 1; Size of array:C274($_at_OtherDeliveryReferences))
				//TRACE
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43=$_at_OtherDeliveryReferences{$_l_DeliveryIndex}; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#$_at_OthersNotMovement{$_l_DeliveryIndex}; *)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#[STOCK_MOVEMENTS:40]Movement_Code:1)
				If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
					QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
				End if 
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=[MOVEMENT_TYPES:60]Stock_Minus:4)
				
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					Gen_Confirm("Do you want to include the delivery reference from other purchase movements? "+$_at_OtherDeliveryReferences{$_l_DeliveryIndex}; "Yes"; "No")
					If (OK=1)
						COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$Copy")
						$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
						For ($_l_DeliveryItemsIndex; 1; $_l_RecordsinSelection)
							
							USE NAMED SELECTION:C332("$Copy")
							GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_DeliveryItemsIndex)
							If (([STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)>0)
								//````````````````````````````````
								STK_ItemDuplicate
								GOTO XY:C161(0; 0)
								MESSAGE:C88("Copying record "+String:C10($_l_DeliveryItemsIndex)+" of "+String:C10($_l_RecordsinSelection))
								
								$_t_FromMovementCode:=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11
								
								$_r_CalledOffQuantity:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
								$_t_FromAddToType:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
								$_l_FromAddToCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
								$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
								$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
								$_t_LayerCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
								$_t_LocationCode:=[STOCK_MOVEMENT_ITEMS:27]Location:7
								$_l_ItemNumber:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8  //This will only be filled in if its allocated-we will move the allocation from the on order item to the instock item.
								
								$_t_OrderCode:=[STOCK_MOVEMENT_ITEMS:27]Order_Code:3
								//`ont forget to take the purchase order code and purchase order item number off or the PO will still think this is expected stock
								//if the serial number is filled in take it off the old record
								$_t_SerialNumber:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
								[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=""
								[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=""
								[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=!00-00-00!
								
								If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
									QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
								End if 
								$_t_CurrentMovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
								
								$_bo_isCancellation:=False:C215
								If ([MOVEMENT_TYPES:60]UseForpurchaseCancellation:34=True:C214)
									$_bo_isCancellation:=True:C214
								End if 
								
								
								If ($_l_ItemNumber>0) & ([MOVEMENT_TYPES:60]UseForStockReceipt:33)
									$_t_ThisMovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
									
									QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_ThisMovementType)
									If ([MOVEMENT_TYPES:60]Purch_Ord_Type:11)
										[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
										[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
										APPEND TO ARRAY:C911(STK_AL_AUTOALLOCATEOI; $_l_ItemNumber)
										APPEND TO ARRAY:C911(STK_ar_AUTOALLOCATEQTY; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
										APPEND TO ARRAY:C911(STK_al_RemoveFromItemID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										If ($_bo_isCancellation)
											STK_bo_MoveOnOrderAllocation:=True:C214
										End if 
										
										If ([STOCK_MOVEMENTS:40]Company_From:2="") & ($_t_FromMovementCode#"")
											$_l_GetCompanyProcess:=New process:C317("STK_GetMovementCompany"; 128000; "Get movement Company"; $_t_FromMovementCode; Current process:C322)
											$_l_Retries:=0
											While (Process state:C330($_l_GetCompanyProcess)>=0) & (Process_Name($_l_GetCompanyProcess)="Get movement Company")
												
												DelayTicks(2*$_l_Retries)
											End while 
											[STOCK_MOVEMENTS:40]Company_From:2:=STK_t_fromCompany
											[STOCK_MOVEMENTS:40]Contact_Code:3:=STK_t_FromContact
											[STOCK_MOVEMENTS:40]xCompanyFromID:25:=STK_l_CompanyID
											[STOCK_MOVEMENTS:40]MovementSourceTable:16:=Table:C252(->[PURCHASE_ORDERS:57])
										End if 
									Else 
										$_l_ItemNumber:=0  // SO IF COPY FROM AN ALLOCATION WE DONT KEEP THE ALLOCATION ON THE COPIED ITEM
										
									End if 
									QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_CurrentMovementType)
								End if 
								
								[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
								If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
									QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
								End if 
								If ([MOVEMENT_TYPES:60]Stock_Minus:4=$_t_FromAddToType)  //the one we copied from we will minus from-this is true even if we are reversing
									
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
								Else 
									[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
									[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
								End if 
								
								
								[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-$_r_CalledOffQuantity  //you can only copy the remaining
								//TRACE
								[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
								[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
								[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
								[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
								[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
								[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26#[STOCK_MOVEMENTS:40]Movement_Date:5)
									[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=[STOCK_MOVEMENTS:40]Movement_Date:5
								End if 
								[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=$_t_LayerCode
								[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=$_t_LocationCode
								[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=$_t_AnalysisCode
								[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=$_t_CurrencyCode
								[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
								
								If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27#[STOCK_MOVEMENTS:40]Layer_Code:11)
									[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:=[STOCK_MOVEMENTS:40]Layer_Code:11
								End if 
								If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28#[STOCK_MOVEMENTS:40]Analysis_Code:9)
									[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=[STOCK_MOVEMENTS:40]Analysis_Code:9
								End if 
								If ([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29#[STOCK_MOVEMENTS:40]Currency_Code:10)
									[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=[STOCK_MOVEMENTS:40]Currency_Code:10
								End if 
								
								If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#[STOCK_MOVEMENTS:40]Movement_Type:6)
									[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:=[STOCK_MOVEMENTS:40]Movement_Type:6
								End if 
								If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
									[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=True:C214
								End if 
								If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
									QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
								End if 
								$_bo_SetCopiedFromNow:=False:C215
								If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39) | ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40<0) | ($_bo_Reverse)
									If ([MOVEMENT_TYPES:60]Stock_Minus:4#[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32)
										//the movement type we are copying from does not directly relate to this movement type
										//the type we are going to add to(xaddtostocktype) does not correspond to the type we were taking from
										//therefore this item will NOT copy from (x_copiedfrom) the item dragged..it will copy from some other item.
										//this only actually matters is the item it does get copied from ahs important infor like a sales order item id which needs to be used to facilitate an allocation
										If ([MOVEMENT_TYPES:60]UseForStockReceipt:33)
											$_t_MovementTypeStockSubtract:=[MOVEMENT_TYPES:60]Stock_Minus:4
											$_bo_SetCopiedFromNow:=True:C214
											//we are receiving stock(actually as this is an inverse we are unreceiving stock!!
										End if 
										
									End if 
									[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
									[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Minus:4
								Else 
									If ([MOVEMENT_TYPES:60]Stock_Minus:4#[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31)
										//the movement type we are copying from does not directly relate to this movement type
										//the type we are going to add to(xaddtostocktype) does not correspond to the type we were taking from
										//therefore this item will NOT copy from (x_copiedfrom) the item dragged..it will copy from some other item.
										//this only actually matters is the item it does get copied from ahs important infor like a sales order item id which needs to be used to facilitate an allocation
										If ([MOVEMENT_TYPES:60]UseForStockReceipt:33)
											//we are receiving stock(actually as this is an inverse we are unreceiving stock!!
											$_t_MovementTypeStockSubtract:=[MOVEMENT_TYPES:60]Stock_Plus:3
											$_t_ProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
											//do not re-invent the wheel here-we already have the code for this  this is copied from the pseudo trigger
											//``
											$_bo_SetCopiedFromNow:=True:C214
										End if 
										
										
									End if 
									[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
									[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Minus:4
								End if 
								//[ORDER ITEMS]Item_Locked:=False
								If ($_bo_UniqueSerialNos)
									[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=""
								End if 
								$_bo_Edits:=STK_SetHeaderInfo
								[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
								[STOCK_MOVEMENT_ITEMS:27]StockItemThread:19:=0
								[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=0
								[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
								Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
								
								//note that the trigger will update the called off on the previous stock..that is the trigger on the stock movement
								//this is so if we cancell the stock movement we dont make the amount wrong preventing a call off(make sure is we cancel that the items here get deleted)
								Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
								
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
								
								APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								
								If ($_bo_SetCopiedFromNow) & ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0)
									$_bo_IsAllocation:=[MOVEMENT_TYPES:60]Alloc_Type:10
									$_bo_IsUnAllocation:=[MOVEMENT_TYPES:60]Unalloc_Type:13
									$_bo_UseOnlyallocated:=[MOVEMENT_TYPES:60]Delivery_Type:12 | [MOVEMENT_TYPES:60]UseAllocatedStock:27
									$_bo_STKp_UseOnlyFree:=[MOVEMENT_TYPES:60]DoNotUseAllocatedStock:36
									$_l_FromAddToCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
									$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
									If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=0)
										
										If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#"")
											COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "$TempCS")
											$_l_SelectedRecordNumber:=Selected record number:C246([CURRENT_STOCK:62])
											Case of 
												: ($_bo_IsAllocation)
													
													$_l_AddtoItemID:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
													If ($_l_AddtoItemID=0)
														//TRACE
														STK_l_PreviousItemNumber:=0
														STK_bo_PreviousItemNumberTested:=False:C215
														$_l_GetItemNumberProcess:=New process:C317("STK_GetAllocationItemNumber"; 128000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
														$_l_Retries:=0
														Repeat 
															//Message("Waiting for STK_GetAllocationItemNumber")
															$_l_Retries:=$_l_Retries+1
															DelayTicks(6*$_l_Retries)
														Until (STK_bo_PreviousItemNumberTested)
														SET PROCESS VARIABLE:C370($_l_GetItemNumberProcess; STK_bo_PreviousCAllback; True:C214)
														$_l_AddtoItemID:=STK_l_PreviousItemNumber
														[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=$_l_TakeFromItemID
														$_bo_Edit:=True:C214
													End if 
												: ($_bo_IsUnAllocation)
													$_l_AddtoItemID:=0
												Else 
													$_l_AddtoItemID:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
											End case 
											[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=STK_GetAddtoCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; $_l_AddtoItemID; [STOCK_MOVEMENT_ITEMS:27]Location:7; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
											$_bo_Edit:=True:C214
											USE NAMED SELECTION:C332("$TempCS")
											GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_SelectedRecordNumber)
										End if 
										
										
									End if 
									If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0)
										$_bo_Continue:=False:C215
										$_bo_noSplit:=True:C214
										$_bo_noSuperSplit:=True:C214
										$_bo_PriceMatch:=True:C214
										$_bo_DateMatch:=True:C214
										$_bo_CSIDMatch:=True:C214
										$_bo_Exit:=False:C215
										$_bo_SplitItem:=False:C215
										$_bo_IsSourceStockType:=STK_isSourceStockType([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32)
										If (Not:C34($_bo_IsSourceStockType))  //if this is a source stock type dont waste time looking for a previous movement item!
											
											$_bo_PreTry:=True:C214
											Repeat 
												Repeat 
													STK_l_PreviousStockItemNumber:=0
													STK_l_PreviousMovementID:=0
													STK_t_PreviousStockLocation:=""
													STK_T_PreviousStockItemAnal:=""
													STK_T_PreviousStockItemLayer:=""
													STK_T_PreviousStockItemCurrency:=""
													STK_t_PreviousStockSerial:=""
													STK_R_PreviousCostPrice:=0
													Case of 
														: ($_bo_IsUnAllocation)
															$_l_TakeFromItemID:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
															If ($_l_TakeFromItemID=0)
																//TRACE
																STK_l_PreviousItemNumber:=0
																STK_bo_PreviousItemNumberTested:=False:C215
																$_l_GetItemNumberProcess:=New process:C317("STK_GetAllocationItemNumber"; 128000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
																$_l_Retries:=0
																Repeat 
																	//Message("Waiting for Get allocation Item number")
																	$_l_Retries:=$_l_Retries+1
																	DelayTicks(6*$_l_Retries)
																Until (STK_bo_PreviousItemNumberTested)
																SET PROCESS VARIABLE:C370($_l_GetItemNumberProcess; STK_bo_PreviousCAllback; True:C214)
																$_l_TakeFromItemID:=STK_l_PreviousItemNumber
																[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=$_l_TakeFromItemID
																$_bo_Edit:=True:C214
															End if 
														: ($_bo_IsAllocation)
															$_l_TakeFromItemID:=0
														Else 
															$_l_TakeFromItemID:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
													End case 
													ARRAY LONGINT:C221(STK_al_PreviousMovementIDS; 0)
													ARRAY REAL:C219(STK_ar_PreviousMovementQTY; 0)
													ARRAY LONGINT:C221(STK_al_PreviousMovementCSID; 0)
													ARRAY TEXT:C222(STK_at_PreviousMovementLocation; 0)
													ARRAY TEXT:C222(STK_at_PreviousMovementCurrency; 0)
													ARRAY TEXT:C222(STK_at_PreviousMovementAnalysis; 0)
													ARRAY TEXT:C222(STK_at_PreviousMovementLayer; 0)
													STK_bo_PreviousSet:=False:C215
													$_l_Retries:=0
													$_t_ProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
													While (Semaphore:C143("PSC"+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1))
														//Message("Waiting for semaphore PSC"+[STOCK ITEMS]Product Code)
														$_l_Retries:=$_l_Retries+1
														DelayTicks(10*$_l_Retries)
													End while 
													<>STOCK_bo_NoSplit:=$_bo_noSplit
													<>STOCK_bo_NoSuperSplit:=$_bo_noSuperSplit
													If (<>STOCK_bo_NoSuperSplit=False:C215)
														<>STOCK_bo_NoSplit:=False:C215
													End if 
													Repeat 
														Case of 
															: ($_bo_PreTry)
																$_r_CostPrice:=$_r_ZeroReal
																$_d_HeaderDate:=!00-00-00!
																$_l_TakeFromCSID:=$_l_ZeroLongint
																$_bo_noSuperSplit:=False:C215
																$_bo_noSplit:=False:C215
															: ($_bo_PriceMatch)  //is date match or CSID Match on
																
																$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
																Case of 
																	: ($_bo_DateMatch)
																		$_d_HeaderDate:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
																		If ($_bo_CSIDMatch)
																			If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																				$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
																			Else 
																				$_l_TakeFromCSID:=$_l_ZeroLongint
																			End if 
																			
																			
																		Else 
																			$_l_TakeFromCSID:=$_l_ZeroLongint
																			
																		End if 
																	Else 
																		$_d_HeaderDate:=!00-00-00!
																		If ($_bo_CSIDMatch)
																			If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																				$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
																			Else 
																				$_l_TakeFromCSID:=$_l_ZeroLongint
																			End if 
																			
																			
																		Else 
																			$_l_TakeFromCSID:=$_l_ZeroLongint
																			
																		End if 
																End case 
															: ($_bo_DateMatch)  //price match is off is CS ID match on
																
																$_r_CostPrice:=$_r_ZeroReal
																$_d_HeaderDate:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26
																If ($_bo_CSIDMatch)
																	If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																		$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
																	Else 
																		$_l_TakeFromCSID:=$_l_ZeroLongint
																	End if 
																	
																	
																Else 
																	$_l_TakeFromCSID:=$_l_ZeroLongint
																	
																End if 
															: ($_bo_CSIDMatch)  //Price match and  Date match are off
																
																$_r_CostPrice:=$_r_ZeroReal
																$_d_HeaderDate:=!00-00-00!
																If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
																	$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
																Else 
																	$_l_TakeFromCSID:=$_l_ZeroLongint
																End if 
																
																
																
															Else 
																$_r_CostPrice:=$_r_ZeroReal
																$_d_HeaderDate:=!00-00-00!
																$_l_TakeFromCSID:=$_l_ZeroLongint
																
																
														End case 
														$_l_Retries:=0
														While (Test semaphore:C652("GetPrevious"))
															//Message("Waiting for semaphore GetPrevious")
															$_l_Retries:=$_l_Retries+1
															DelayTicks(10*$_l_Retries)
														End while 
														If (<>STK_l_PreviousProcess=0)
															<>STK_l_PreviousProcess:=New process:C317("STK_GetPreviousStockMovementPro"; 128000; "Get Previous Movement ID"; Current process:C322; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_l_TakeFromCSID; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; $_d_HeaderDate; $_r_CostPrice; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_bo_IsAllocation; $_bo_IsUnAllocation; $_l_TakeFromItemID; $_bo_UseOnlyallocated; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21; $_bo_PreTry; $_bo_STKp_UseOnlyFree; *)
															//Message("Pausing process"+String(Current process)+"Waiting for resume from(3)"+String(◊STK_l_PreviousProcess))
															DelayTicks(10*60)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
														Else 
															$_l_Retries:=0
															While (Semaphore:C143("STK_GetPrevious"))
																//Message("Waiting for semaphore STK_GetPrevious")
																$_l_Retries:=$_l_Retries+1
																DelayTicks(10*$_l_Retries)
															End while 
															$_l_Retries:=0
															While (Test semaphore:C652("GetPrevious"))
																//Message("Waiting for semaphore GetPrevious")
																$_l_Retries:=$_l_Retries+1
																DelayTicks(10*$_l_Retries)
															End while 
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pCopiedFromID; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pTakeFromCSID; $_l_TakeFromCSID)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pProductCode; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromStockType; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromCurrency; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromAnalysis; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_pTakeFromLayer; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_d_pTakeFrommaxHeaderDate; $_d_HeaderDate)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_r_pTakeFromCostPrice; $_r_CostPrice)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_r_pTakeQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pNotFromSIID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_isAllocation; $_bo_IsAllocation)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_isUnallocation; $_bo_IsUnAllocation)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pTakeFromItemID; $_l_TakeFromItemID)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_UseOnlyAllocated; $_bo_UseOnlyallocated)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_UseOnlyAllocated; $_bo_STKp_UseOnlyFree)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_t_TakePONumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_TakeFromPOItemNumber; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_l_pCallBackProcess; Current process:C322)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CallisPreTry; $_bo_PreTry)
															RESUME PROCESS:C320(<>STK_l_PreviousProcess)
															//Message("Pausing process"+String(Current process)+"Waiting for resume from(4)"+String(◊STK_l_PreviousProcess))
															DelayTicks(3*6)
															SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
															//While (Not(Test semaphore("GetPrevious"))) & (Not(STK_bo_PreviousSet))
															//`Message("Waiting for semaphore GetPrevious to be true")
															//DelayTicks (10)
															//RESUME PROCESS(◊STK_l_PreviousProcess)
															//End while
															
															CLEAR SEMAPHORE:C144("STK_GetPrevious")
															$_l_Retries:=0
															While (Test semaphore:C652("GetPrevious")) & (Process state:C330(<>STK_l_PreviousProcess)#5)
																SET PROCESS VARIABLE:C370(<>STK_l_PreviousProcess; STK_bo_CalledBACK; True:C214)
																//Message("Waiting for semaphore GetPrevious(3)")
																$_l_Retries:=$_l_Retries+1
																DelayTicks(10*$_l_Retries)
															End while 
															
															
														End if 
														
														$_l_Currenttime:=Current time:C178*1
														$_bo_NoExit:=False:C215
														$_l_Retries:=0
														While (STK_bo_PreviousSet=False:C215) & ($_l_Retries<100)
															//Message("Waiting for Boolean STK_bo_PreviousSet")
															$_l_Retries:=$_l_Retries+1
															DelayTicks(6*$_l_Retries)
															
														End while 
													Until (STK_bo_PreviousSet)
													
													CLEAR SEMAPHORE:C144("PSC"+$_t_ProductCode)
													<>STOCK_bo_NoSplit:=False:C215
													If ($_bo_NoExit=False:C215)
														$_bo_Continue:=True:C214
													End if 
													If (STK_l_PreviousMovementID=0)
														Case of 
															: ($_bo_PreTry=True:C214)  //there are no stock items to copy from anyway!
																
																//TRACE
																$_bo_PreTry:=False:C215
																$_bo_Exit:=True:C214
																$_bo_noSuperSplit:=True:C214
																$_bo_noSplit:=True:C214
															: ($_bo_PriceMatch=True:C214) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
																$_bo_PriceMatch:=False:C215
															: ($_bo_DateMatch) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
																$_bo_DateMatch:=False:C215
																$_bo_PriceMatch:=True:C214
															: ($_bo_CSIDMatch=True:C214) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
																$_bo_CSIDMatch:=False:C215
																$_bo_DateMatch:=True:C214
																$_bo_PriceMatch:=True:C214
																
															: ($_bo_noSplit=True:C214) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
																$_bo_noSplit:=False:C215
																$_bo_PriceMatch:=True:C214
																$_bo_DateMatch:=True:C214
																$_bo_CSIDMatch:=True:C214
															: ($_bo_noSuperSplit) & (Size of array:C274(STK_al_PreviousMovementIDS)=0)
																
																
																//If (($Filtertomovementtype="ALO") & ($AllocationFirstTry)) | (($OscFIrstTry) & ($Filtertomovementtype="OSC"))
																//actually this should never get here... but dont try super split on these`
																//2nd pass-data match break out
																//Else
																$_bo_noSuperSplit:=False:C215
																$_bo_noSplit:=False:C215
																$_bo_PriceMatch:=True:C214
																$_bo_DateMatch:=True:C214
																$_bo_CSIDMatch:=True:C214
															Else 
																//all are false and we tried spliting
																If (Size of array:C274(STK_al_PreviousMovementIDS)=0)
																	//TRACE
																	$_bo_Exit:=True:C214
																Else 
																	$_bo_Exit:=True:C214
																End if 
														End case 
													Else 
														//either we are in pre-ty and the item is found or there are no items and the id is set to -9999
														If ($_bo_PreTry)
															
															If (STK_l_PreviousMovementID=-9999)
																//TRACE
																STK_l_PreviousMovementID:=0
																$_bo_Exit:=True:C214
															End if 
															$_bo_PreTry:=False:C215
															$_bo_noSuperSplit:=True:C214
															$_bo_noSplit:=True:C214
														Else 
															If (STK_l_PreviousMovementID=-9999)
																STK_l_PreviousMovementID:=0
															End if 
															$_bo_Exit:=True:C214
															
														End if 
													End if 
												Until ($_bo_Continue)
												
											Until ($_bo_Exit)
											[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=STK_l_PreviousMovementID
											[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=STK_l_PreviousStockItemNumber
											[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=STK_t_PreviousStockLocation
											If ([STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42#STK_T_PreviousStockItemAnal) & (STK_T_PreviousStockItemAnal#"") & (STK_T_PreviousStockItemAnal#[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
												[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=STK_T_PreviousStockItemAnal
											End if 
											If ([STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41#STK_T_PreviousStockItemLayer) & (STK_T_PreviousStockItemLayer#"") & (STK_T_PreviousStockItemLayer#[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
												[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=STK_T_PreviousStockItemLayer
											End if 
											If ([STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36#STK_T_PreviousStockItemCurrency) & (STK_T_PreviousStockItemCurrency#"") & (STK_T_PreviousStockItemCurrency#[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
												[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=STK_T_PreviousStockItemCurrency
											End if 
											[STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33:=(STK_t_PreviousStockSerial#"")
											If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=0)
												[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=STK_R_PreviousCostPrice
											Else 
												If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10#STK_R_PreviousCostPrice)
													[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=STK_R_PreviousCostPrice
												End if 
											End if 
											ARRAY LONGINT:C221($_al_SplitChildrenParentID; 0)
											ARRAY REAL:C219($_ar_SplitChildrenQuantity; 0)
											ARRAY LONGINT:C221($_al_SplitChildrenFromCSID; 0)
											$_bo_SplitChildren:=False:C215
											$_l_SplitChildrenOf:=0
											$_r_OriginalQuantity:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
											ARRAY TEXT:C222($_at_PreviousMovementLocation; 0)
											ARRAY TEXT:C222($_at_PreviousMovementCurrency; 0)
											ARRAY TEXT:C222($_at_PreviousMovementAnalysis; 0)
											ARRAY TEXT:C222($_at_PreviousMovementLayer; 0)
											COPY ARRAY:C226(STK_al_PreviousMovementIDS; $_al_PreviousMovementIDS)
											COPY ARRAY:C226(STK_ar_PreviousMovementQTY; $_ar_PreviousMovementQTY)
											COPY ARRAY:C226(STK_al_PreviousMovementCSID; $_al_PreviousMovementCSID)
											
											COPY ARRAY:C226(STK_at_PreviousMovementLocation; $_at_PreviousMovementLocation)
											COPY ARRAY:C226(STK_at_PreviousMovementCurrency; $_at_PreviousMovementCurrency)
											COPY ARRAY:C226(STK_at_PreviousMovementAnalysis; $_at_PreviousMovementAnalysis)
											COPY ARRAY:C226(STK_at_PreviousMovementLayer; $_at_PreviousMovementLayer)
											
											If (Size of array:C274($_al_PreviousMovementIDS)>0)
												If ([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18>0)
													$_bo_SplitChildren:=True:C214
													$_l_SplitChildrenOf:=([STOCK_MOVEMENT_ITEMS:27]x_ID:16)
													APPEND TO ARRAY:C911($_al_SplitChildrenParentID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
													APPEND TO ARRAY:C911($_ar_SplitChildrenQuantity; $_ar_PreviousMovementQTY{1})
													APPEND TO ARRAY:C911($_al_SplitChildrenFromCSID; $_al_PreviousMovementCSID{1})
												End if 
												[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_ar_PreviousMovementQTY{1}
												[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=$_al_PreviousMovementIDS{1}
												[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_al_PreviousMovementCSID{1}
												
												[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
												If ([STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34#$_at_PreviousMovementLocation{1}) & ($_at_PreviousMovementLocation{1}#"") & ($_at_PreviousMovementLocation{1}#[STOCK_MOVEMENT_ITEMS:27]Location:7)
													[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=$_at_PreviousMovementLocation{1}
												End if 
												If ([STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42#$_at_PreviousMovementAnalysis{1}) & ($_at_PreviousMovementAnalysis{1}#"") & ($_at_PreviousMovementAnalysis{1}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
													[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=$_at_PreviousMovementAnalysis{1}
												End if 
												If ([STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41#$_at_PreviousMovementLayer{1}) & ($_at_PreviousMovementLayer{1}#"") & ($_at_PreviousMovementLayer{1}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
													$_bo_Edit:=True:C214
													[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=$_at_PreviousMovementLayer{1}
												End if 
												If ([STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36#$_at_PreviousMovementCurrency{1}) & ($_at_PreviousMovementCurrency{1}#"") & ($_at_PreviousMovementCurrency{1}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
													$_bo_Edit:=True:C214
													[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=$_at_PreviousMovementCurrency{1}
												End if 
												//this item needs to be split
												$_bo_SplitItem:=True:C214
												$_bo_Edit:=True:C214
												$_r_QuantityStillRequired:=$_r_OriginalQuantity-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
												$_bo_SplitItem:=True:C214
											End if 
										End if 
										$_l_CopiedFromID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
										[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
										Stk_AddToONHold([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
										
										DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
										APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										
										$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
										
										ARRAY LONGINT:C221($_al_ForceRecalculation; 0)
										If ($_bo_SplitItem)
											[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
											DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
											APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
											
											$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
											COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$CS")
											$_l_MovementItemsRecords:=Selected record number:C246([STOCK_MOVEMENT_ITEMS:27])
											$_l_CurrentMovementItemRecord:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
											ARRAY LONGINT:C221($_al_ForceRecalculation; 0)
											
											For ($_l_Index3; 2; Size of array:C274($_ar_PreviousMovementQTY))
												GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_CurrentMovementItemRecord)
												STK_ItemDuplicate
												APPEND TO ARRAY:C911($_al_ForceRecalculation; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
												
												[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
												[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=$_al_PreviousMovementCSID{$_l_Index3}
												If ([STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34#$_at_PreviousMovementLocation{$_l_Index3}) & ($_at_PreviousMovementLocation{$_l_Index3}#"") & ($_at_PreviousMovementLocation{$_l_Index3}#[STOCK_MOVEMENT_ITEMS:27]Location:7)
													[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=$_at_PreviousMovementLocation{$_l_Index3}
												End if 
												If ([STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42#$_at_PreviousMovementAnalysis{$_l_Index3}) & ($_at_PreviousMovementAnalysis{$_l_Index3}#"") & ($_at_PreviousMovementAnalysis{$_l_Index3}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28)
													[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=$_at_PreviousMovementAnalysis{$_l_Index3}
												End if 
												If ([STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41#$_at_PreviousMovementLayer{$_l_Index3}) & ($_at_PreviousMovementLayer{$_l_Index3}#"") & ($_at_PreviousMovementLayer{$_l_Index3}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27)
													
													[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=$_at_PreviousMovementLayer{$_l_Index3}
												End if 
												If ([STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36#$_at_PreviousMovementCurrency{$_l_Index3}) & ($_at_PreviousMovementCurrency{$_l_Index3}#"") & ($_at_PreviousMovementCurrency{$_l_Index3}#[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29)
													[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=$_at_PreviousMovementCurrency{$_l_Index3}
												End if 
												STK_SetCreatedStockItem(0; ($_ar_PreviousMovementQTY{$_l_Index3}); $_al_PreviousMovementIDS{$_l_Index3})
												$_r_QuantityStillRequired:=$_r_QuantityStillRequired-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
												APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
												
												$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
												If ($_bo_SplitChildren)
													APPEND TO ARRAY:C911($_al_SplitChildrenParentID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
													APPEND TO ARRAY:C911($_ar_SplitChildrenQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
													APPEND TO ARRAY:C911($_al_SplitChildrenFromCSID; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
												End if 
												If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
													DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
													APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
													$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
												End if 
												If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0) | ((Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22))#[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
													If ((Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22))#[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
														If (Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)#0)
														End if 
													End if 
													
													DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
													APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
													
													$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
												End if 
												If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0) | (Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)#[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
													If ((Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23))#[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
														If ((Old:C35([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23))#0)
														End if 
													End if 
													DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
													APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
													
													$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
												End if 
												
												
											End for 
											If ($_r_QuantityStillRequired>0)
												GOTO RECORD:C242([STOCK_MOVEMENT_ITEMS:27]; $_l_CurrentMovementItemRecord)
												[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
												DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
												APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
												
												$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
												STK_ItemDuplicate
												APPEND TO ARRAY:C911($_al_ForceRecalculation; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
												[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=0
												[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextID(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
												
												[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_r_QuantityStillRequired
												[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
												[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
												
												$_r_QuantityStillRequired:=$_r_QuantityStillRequired-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
												[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17:=0
												DB_PseudoTrigger(Record number:C243([STOCK_MOVEMENT_ITEMS:27]); Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
												[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
												
												DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
												APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
												
												$_l_RecordNumber:=Record number:C243([STOCK_MOVEMENT_ITEMS:27])
												If ($_bo_SplitChildren)
													APPEND TO ARRAY:C911($_al_SplitChildrenParentID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
													APPEND TO ARRAY:C911($_ar_SplitChildrenQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
													APPEND TO ARRAY:C911($_al_SplitChildrenFromCSID; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
												End if 
											End if 
											If (False:C215)
												If (Size of array:C274($_al_ForceRecalculation)>0)
													For ($_l_Index; 1; Size of array:C274($_al_ForceRecalculation))
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_ForceRecalculation{$_l_Index})
														STK_UpdateCalledOffQuantity
														DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
														APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
														
													End for 
												End if 
											End if 
											USE NAMED SELECTION:C332("$CS")
											GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_MovementItemsRecords)
											If ($_bo_SplitChildren)
												STK_SplitChildren($_l_SplitChildrenOf; ->$_ar_SplitChildrenQuantity; ->$_al_SplitChildrenParentID; ->$_al_SplitChildrenFromCSID)
											End if 
										End if 
									End if 
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
									APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
									
									If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
										COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$TEST")
										$_l_SelectedRecordNumber:=Selected record number:C246([STOCK_MOVEMENT_ITEMS:27])
										$_l_CopiedFromMovementID:=[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_l_CopiedFromMovementID)
										If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8>0) & ([MOVEMENT_TYPES:60]UseForStockReceipt:33)
											$_t_ThisMovementType:=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30
											$_t_CurrentMovementType:=[MOVEMENT_TYPES:60]Type_Code:1
											QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_ThisMovementType)
											If ([MOVEMENT_TYPES:60]Purch_Ord_Type:11)
												//[STOCK ITEMS]Item Number:=0
												//[STOCK ITEMS]xSalesOrderItemifAllocate:=0
												APPEND TO ARRAY:C911(STK_AL_AUTOALLOCATEOI; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
												APPEND TO ARRAY:C911(STK_ar_AUTOALLOCATEQTY; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
												APPEND TO ARRAY:C911(STK_al_RemoveFromItemID; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
											Else 
												$_l_ItemNumber:=0  // SO IF COPY FROM AN ALLOCATION WE DONT KEEP THE ALLOCATION ON THE COPIED ITEM
												
											End if 
										End if 
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_CurrentMovementType)
										USE NAMED SELECTION:C332("$TEST")
										GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_SelectedRecordNumber)
										//TRACE
										If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
											//While (Test semaphore("$SettingCalledOff"))
											//DelayTicks (3)
											// /End while
											//$_l_NewProcessess:=New process("STK_SetCalledOffInProcess";128000;"Set Called Off";[STOCK_MOVEMENT_ITEMS]X_CopiedFromID;[STOCK_MOVEMENT_ITEMS]Quantity;Current process)
											//While (Test semaphore("$SettingCalledOff"))
											//DelayTicks (3)
											//End while
										End if 
									End if 
								Else 
									If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
										//While (Test semaphore("$SettingCalledOff"))
										//DelayTicks (3)
										//End while
										//$_l_NewProcessess:=New process("STK_SetCalledOffInProcess";128000;"Set Called Off";[STOCK_MOVEMENT_ITEMS]X_CopiedFromID;[STOCK_MOVEMENT_ITEMS]Quantity;Current process)
										//While (Test semaphore("$SettingCalledOff"))
										//DelayTicks (3)
										//End while
										
									End if 
								End if 
								If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
								End if 
								If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
								End if 
								
								APPEND TO ARRAY:C911(STK_al_ModifiedLineIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
								
								
								//AA_CheckFileUnlocked (->[STOCK ITEMS]x_ID)
							End if 
							//`````````````````````````````````
						End for 
					End if 
				End if 
			End for 
		End if 
		
		
		
		STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
		If (STOCK_l_Context<0)
			//AL_SetEnterable (STK_PowerviewITEMS;0;0)
			LB_SetEnterable(->STK_LB_StockItems; False:C215; 0; "")
			SM_at_ModeStockMov:=1
			AL_al_ModeStock:=1
			If (AL_al_ModeStock{1}=-1)  //Stock items are currently in edit mode need to set them to selectable mode
				
				$_bo_Switch:=True:C214
				LBi_EditListLay($1; ->SM_at_ModeStockMov; ->STK_pic_ModeStock; ->AL_al_ModeStock; $_bo_Switch)
				
			End if 
			OBJECT SET VISIBLE:C603(SM_at_ModeStockMov; False:C215)
			
			$_t_DragString:="STKItems"  // todo: fix this drag and drpo stuff
			
			LBI_SetDRGPair(2; ->STK_LB_StockItems; $_t_DragString)
			
			//AL_SetDrgSrc (STK_PowerviewITEMS;1;$_t_DragString)
			//AL_SetDrgOpts (STK_PowerviewITEMS;0;30;1;1)NG TODO
			//
		Else 
			SM_at_ModeStockMov:=1
			AL_al_ModeStock:=1
			If (AL_al_ModeStock{1}=-1)  //Stock items are currently in edit mode need to set them to selectable mode
				
				LBi_EditListLay($1; ->SM_at_ModeStockMov; ->STK_pic_ModeStock; ->AL_al_ModeStock; True:C214)
				
			End if 
		End if 
		OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Movement_Type:6; False:C215)
		
		
		
	End if 
	
End if 

If ($_bo_TurnOnConsoilidated)
	ARRAY LONGINT:C221(STK_al_LineIndex; 0)  //this array stays with the on screen sort as index of the line numbers
	ARRAY LONGINT:C221(STK_al_LineItemIDS; 0)  //This array does not get displayed and contains the Actual data item numbers
	ARRAY LONGINT:C221(STK_al_LineItemIndexID; 0)  //This array does not get displayed and contains the Line number index from the STK_al_LineIndex representing the row of the on screen selection
	
	
	
	ARRAY LONGINT:C221(STK_al_LineSalesOrderItem; 0)
	ARRAY TEXT:C222(STK_at_LinePurchaseOrder; 0)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; STK_al_LineItemIDS; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; STK_al_LineSalesOrderItem; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20; STK_at_LinePurchaseOrder; [STOCK_MOVEMENT_ITEMS:27]Company_To:2; STK_at_CompaniesTo; [STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18; STK_ar_CalledOffQTY; [STOCK_MOVEMENT_ITEMS:27]Component_Qty:15; STK_ar_ComponentQTY; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; STK_ar_CostPrice)
	
	
	ARRAY LONGINT:C221(STK_al_LineItemIndexID; Size of array:C274(STK_al_LineItemIDS))
	//we are now going to create arrays containing data from all fields on the stock items-one line per product code
	ARRAY REAL:C219(STK_ar_osAssembly; 0)
	ARRAY REAL:C219(STK_ar_osTotalCalledoff; 0)
	ARRAY TEXT:C222(STK_at_CompaniesTo; 0)
	ARRAY REAL:C219(STK_ar_TotalComponentQTY; 0)
	ARRAY REAL:C219(STK_ar_AverageCostPrice; 0)
	ARRAY TEXT:C222(STK_at_DateReceived; 0)  //note displayed as text
	
	ARRAY TEXT:C222(STK_at_DateShipped; 0)
	ARRAY TEXT:C222(STK_at_SOItemNumber; 0)  //note displayed as text
	
	ARRAY TEXT:C222(STK_at_Location; 0)
	ARRAY REAL:C219(STK_ar_TotalMoved; 0)
	ARRAY TEXT:C222(STK_at_MovementCode; 0)
	ARRAY TEXT:C222(STK_at_SOcode; 0)
	ARRAY TEXT:C222(STK_at_ProductCode; 0)
	ARRAY TEXT:C222(STK_at_PurchaseorderCode; 0)
	ARRAY TEXT:C222(STK_at_PurchaseOrderitemNumber; 0)  //note TEXT
	
	ARRAY REAL:C219(STK_ar_TotalQuantity; 0)
	ARRAY TEXT:C222(STK_at_SerialNum; 0)
	ARRAY TEXT:C222(STK_at_StockNo; 0)
	ARRAY TEXT:C222(STK_at_stockItemThread; 0)
	ARRAY REAL:C219(STK_ar_TotalCost; 0)
	ARRAY TEXT:C222(STK_at_X_CopiedFromID; 0)  //note displayed as text(if displayed)
	
	//Array[STOCK ITEMS]x_ID
	ARRAY TEXT:C222(STK_at_xPoItemDeliveryReference; 0)
	ARRAY TEXT:C222(STK_at_poItemExpectedDelDate; 0)
	ARRAY REAL:C219(STK_ar_XResidualStockQuantity; 0)
	ARRAY TEXT:C222(STK_at_xSoItemDeliveryReference; 0)
	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$CurrentSelection")
	
	FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
	
	For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
		$_l_ProductCodeRow:=Find in array:C230(STK_at_ProductCode; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
		If ($_l_ProductCodeRow<0)
			APPEND TO ARRAY:C911(STK_ar_osAssembly; [STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14)
			APPEND TO ARRAY:C911(STK_ar_osTotalCalledoff; [STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
			APPEND TO ARRAY:C911(STK_at_CompaniesTo; [STOCK_MOVEMENT_ITEMS:27]Company_To:2)
			APPEND TO ARRAY:C911(STK_ar_TotalComponentQTY; [STOCK_MOVEMENT_ITEMS:27]Component_Qty:15)
			APPEND TO ARRAY:C911(STK_ar_AverageCostPrice; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10)
			
			APPEND TO ARRAY:C911(STK_at_DateReceived; String:C10([STOCK_MOVEMENT_ITEMS:27]Date_Received:5; Internal date short:K1:7))
			
			//note displayed as text
			APPEND TO ARRAY:C911(STK_at_DateShipped; String:C10([STOCK_MOVEMENT_ITEMS:27]Date_Shipped:6; Internal date short:K1:7))
			
			If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8>0)
				APPEND TO ARRAY:C911(STK_at_SOItemNumber; String:C10([STOCK_MOVEMENT_ITEMS:27]Item_Number:8))  //note displayed as text
				
			Else 
				APPEND TO ARRAY:C911(STK_at_SOItemNumber; "")
			End if 
			APPEND TO ARRAY:C911(STK_at_Location; [STOCK_MOVEMENT_ITEMS:27]Location:7)
			APPEND TO ARRAY:C911(STK_ar_TotalMoved; [STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
			APPEND TO ARRAY:C911(STK_at_MovementCode; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
			APPEND TO ARRAY:C911(STK_at_SOcode; [STOCK_MOVEMENT_ITEMS:27]Order_Code:3)
			APPEND TO ARRAY:C911(STK_at_ProductCode; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
			APPEND TO ARRAY:C911(STK_at_PurchaseorderCode; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20)
			APPEND TO ARRAY:C911(STK_at_PurchaseOrderitemNumber; String:C10([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21))  //note TEXT
			
			APPEND TO ARRAY:C911(STK_ar_TotalQuantity; [STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			APPEND TO ARRAY:C911(STK_at_SerialNum; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4)
			
			APPEND TO ARRAY:C911(STK_ar_TotalCost; [STOCK_MOVEMENT_ITEMS:27]Total_Cost:13)
			APPEND TO ARRAY:C911(STK_at_xPoItemDeliveryReference; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43)
			APPEND TO ARRAY:C911(STK_at_poItemExpectedDelDate; String:C10([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44; Internal date short:K1:7))
			
			APPEND TO ARRAY:C911(STK_ar_XResidualStockQuantity; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
			APPEND TO ARRAY:C911(STK_at_xSoItemDeliveryReference; [STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45)
			$_l_ProductCodeRow:=Size of array:C274(STK_at_ProductCode)
			APPEND TO ARRAY:C911(STK_al_LineIndex; $_l_ProductCodeRow)
		Else 
			STK_ar_osAssembly{$_l_ProductCodeRow}:=STK_ar_osAssembly{$_l_ProductCodeRow}+[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14
			STK_ar_osTotalCalledoff{$_l_ProductCodeRow}:=STK_ar_osTotalCalledoff{$_l_ProductCodeRow}+[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
			
			If (STK_at_CompaniesTo{$_l_ProductCodeRow}#[STOCK_MOVEMENT_ITEMS:27]Company_To:2)
				STK_at_CompaniesTo{$_l_ProductCodeRow}:="Multiple"
			End if 
			STK_ar_TotalComponentQTY{$_l_ProductCodeRow}:=STK_ar_TotalComponentQTY{$_l_ProductCodeRow}+[STOCK_MOVEMENT_ITEMS:27]Component_Qty:15
			$_r_TotalCostPrice:=(STK_ar_AverageCostPrice{$_l_ProductCodeRow}*STK_ar_TotalQuantity{$_l_ProductCodeRow})+([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12)
			$_r_AverageCostPrice:=$_r_TotalCostPrice/(STK_ar_TotalQuantity{$_l_ProductCodeRow})+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
			STK_ar_AverageCostPrice{$_l_ProductCodeRow}:=$_r_AverageCostPrice
			If ([STOCK_MOVEMENT_ITEMS:27]Date_Received:5#Date:C102(STK_at_DateReceived{$_l_ProductCodeRow}))
				STK_at_DateReceived{$_l_ProductCodeRow}:="Multiple"
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]Date_Shipped:6#Date:C102(STK_at_DateShipped{$_l_ProductCodeRow}))
				STK_at_DateShipped{$_l_ProductCodeRow}:="Multiple"
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#Num:C11(STK_at_SOItemNumber{$_l_ProductCodeRow}))
				STK_at_SOItemNumber{$_l_ProductCodeRow}:="Multiple"
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]Location:7#STK_at_Location{$_l_ProductCodeRow})
				STK_at_Location{$_l_ProductCodeRow}:="Multiple"
			End if 
			STK_ar_TotalMoved{$_l_ProductCodeRow}:=STK_ar_TotalMoved{$_l_ProductCodeRow}+[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40
			If (STK_at_MovementCode{$_l_ProductCodeRow}#[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)  //might enable items from multiple movements
				
				STK_at_MovementCode{$_l_ProductCodeRow}:="Multiple"
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]Order_Code:3#STK_at_SOcode{$_l_ProductCodeRow})
				STK_at_SOcode{$_l_ProductCodeRow}:="Multiple"
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20#STK_at_PurchaseorderCode{$_l_ProductCodeRow})
				STK_at_PurchaseorderCode{$_l_ProductCodeRow}:="Multiple"
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21#Num:C11(STK_at_PurchaseOrderitemNumber{$_l_ProductCodeRow}))
				STK_at_PurchaseOrderitemNumber{$_l_ProductCodeRow}:="Multiple"
			End if 
			STK_ar_TotalQuantity{$_l_ProductCodeRow}:=STK_ar_TotalQuantity{$_l_ProductCodeRow}+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
			If (STK_at_SerialNum{$_l_ProductCodeRow}#[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4)
				STK_at_SerialNum{$_l_ProductCodeRow}:="Multiple"
			End if 
			STK_ar_TotalCost{$_l_ProductCodeRow}:=STK_ar_TotalCost{$_l_ProductCodeRow}+[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
			If ([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43#STK_at_xPoItemDeliveryReference{$_l_ProductCodeRow})
				STK_at_xPoItemDeliveryReference{$_l_ProductCodeRow}:="Multiple"
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44#Date:C102(STK_at_poItemExpectedDelDate{$_l_ProductCodeRow}))
				STK_at_poItemExpectedDelDate{$_l_ProductCodeRow}:="Multiple"
			End if 
			STK_ar_XResidualStockQuantity{$_l_ProductCodeRow}:=STK_ar_XResidualStockQuantity{$_l_ProductCodeRow}+[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
			If ([STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45#STK_at_xSoItemDeliveryReference{$_l_ProductCodeRow})
				STK_at_xSoItemDeliveryReference{$_l_ProductCodeRow}:="Multiple"
			End if 
			
		End if 
		$_l_LineItemRow:=Find in array:C230(STK_al_LineItemIDS; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
		STK_al_LineItemIndexID{$_l_LineItemRow}:=$_l_ProductCodeRow
		NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
	End for 
	//Now get the fields for the current definition. and build an array based format for the same
	//STK_aptr_ItemPreferences
	If (Size of array:C274(STK_at_xSoItemDeliveryReference)#Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
		
		$_ptr_ArrayFieldPointers:=STK_aptr_ItemPreferences{2}
		$_ptr_ArrayofArrayPointers:=STK_aptr_ItemPreferences{3}
		$_ptr_arrayNamesArray:=STK_aptr_ItemPreferences{4}
		$_ptr_ArrayFormats:=STK_aptr_ItemPreferences{5}
		$_ptr_ArrayFormulas:=STK_aptr_ItemPreferences{6}
		$_ptr_ArrayTitles:=STK_aptr_ItemPreferences{12}
		$_ptr_ArrayWidths:=STK_aptr_ItemPreferences{13}
		$_ptr_ArrayEnterables:=STK_aptr_ItemPreferences{14}
		$_ptr_ArrayColumnLocks:=STK_aptr_ItemPreferences{15}
		$_ptr_ArrayColumnFontSizes:=STK_aptr_ItemPreferences{16}
		$_ptr_ArrayColumnColours:=STK_aptr_ItemPreferences{17}
		$_ptr_ArrayColumnFooters:=STK_aptr_ItemPreferences{18}
		For ($_l_Index; 1; Size of array:C274($_ptr_ArrayofArrayPointers->))
			$_ptr_ColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
			$_l_ArraySize:=Size of array:C274($_ptr_ColumnArray->)
			If ($_l_ArraySize<Size of array:C274(STK_al_LineIndex))
				$_l_AddRows:=Size of array:C274(STK_al_LineIndex)-$_l_AddRows
				INSERT IN ARRAY:C227($_ptr_ColumnArray->; Size of array:C274($_ptr_ColumnArray->)+1; $_l_AddRows)
			Else 
				$_l_Subtract:=$_l_ArraySize-Size of array:C274(STK_al_LineIndex)
				DELETE FROM ARRAY:C228($_ptr_ColumnArray->; $_l_ArraySize-$_l_Subtract; $_l_Subtract)
			End if 
		End for 
		//Modify the current pointers
		
		For ($_l_Index; 1; Size of array:C274($_ptr_ArrayFieldPointers->))
			If ($_ptr_ArrayFormulas->{$_l_Index}="")
				$_l_TableNumber:=Table:C252($_ptr_ArrayFieldPointers->{$_l_Index})
				$_l_FieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{$_l_Index})
				If ($_l_TableNumber=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
					Case of 
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_ar_osAssembly
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_ar_osAssembly"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_ar_osTotalCalledoff
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_ar_osTotalCalledoff"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Company_To:2))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_at_CompaniesTo
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_at_CompaniesTo"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Component_Qty:15))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_ar_TotalComponentQTY
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_ar_TotalComponentQTY"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_ar_AverageCostPrice
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_ar_AverageCostPrice"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Date_Received:5))
							//here we are setting the pointer to point at a text array instead of a data array
							If (False:C215)
								$_l_LasttextArray:=0
								$_t_BaseString:=""
								$_ptr_ColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
								$_l_ArraySize:=Size of array:C274($_ptr_ColumnArray->)
								For ($_l_FindIndex; 1; Size of array:C274($_ptr_arrayNamesArray->))
									$_l_CharacterPosition:=Position:C15("text"; $_ptr_arrayNamesArray->{$_l_FindIndex})
									If ($_l_CharacterPosition>0)
										$_t_BaseString:=Substring:C12($_ptr_arrayNamesArray->{$_l_FindIndex}; 1; $_l_CharacterPosition-1)
										$_t_NumberString:=Substring:C12($_ptr_arrayNamesArray->{$_l_FindIndex}; $_l_CharacterPosition+Length:C16("text"))
										If ($_l_LasttextArray<Num:C11($_t_NumberString))
											$_l_LasttextArray:=Num:C11($_t_NumberString)
										End if 
									End if 
									$_l_LasttextArray:=$_l_LasttextArray+1
									If ($_t_BaseString="")
										$_t_BaseString:=Substring:C12($_ptr_arrayNamesArray->{1}; 1; 3)
									End if 
									$_ptr_LastTextArray:=Get pointer:C304($_t_BaseString+"text"+String:C10($_l_LasttextArray))
									ARRAY TEXT:C222($_ptr_LastTextArray->; $_l_ArraySize)
								End for 
							End if 
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_at_DateReceived
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_at_DateReceived"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Date_Shipped:6))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_at_DateShipped
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_at_DateShipped"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_at_SOItemNumber
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_at_SOItemNumber"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Location:7))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_at_Location
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_at_Location"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_ar_TotalMoved
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_ar_TotalMoved"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_at_MovementCode
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_at_MovementCode"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Order_Code:3))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_at_SOcode
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_at_SOcode"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_at_ProductCode
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_at_ProductCode"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_at_PurchaseorderCode
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_at_PurchaseorderCode"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_at_PurchaseOrderitemNumber
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_at_PurchaseOrderitemNumber"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Quantity:12))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_ar_TotalQuantity
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_ar_TotalQuantity"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_at_SerialNum
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_at_SerialNum"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_at_SerialNum
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_at_SerialNum"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_ar_TotalCost
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_ar_TotalCost"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_at_xPoItemDeliveryReference
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_at_xPoItemDeliveryReference"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_at_poItemExpectedDelDate
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_at_poItemExpectedDelDate"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_ar_XResidualStockQuantity
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_ar_XResidualStockQuantity"
						: ($_l_FieldNumber=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45))
							$_ptr_ArrayofArrayPointers->{$_l_Index}:=->STK_at_xSoItemDeliveryReference
							$_ptr_arrayNamesArray->{$_l_Index}:="STK_at_xSoItemDeliveryReference"
						Else 
							
							
							
					End case 
					//$_ptr_ArrayFieldPointers:=STK_aptr_ItemPreferences{2}
					//$_ptr_ArrayFormats:=STK_aptr_ItemPreferences{5}
					//$_ptr_ArrayFormulas:=STK_aptr_ItemPreferences{6}
					//$_ptr_ArrayTitles:=STK_aptr_ItemPreferences{12}
					//$_ptr_ArrayWidths:=STK_aptr_ItemPreferences{13}
					//$_ptr_ArrayEnterables:=STK_aptr_ItemPreferences{14}
					//$_ptr_ArrayofArrayPointers:=STK_aptr_ItemPreferences{3}
					//$_ptr_arrayNamesArray:=STK_aptr_ItemPreferences{4}
					
				End if 
				
			End if 
		End for 
		APPEND TO ARRAY:C911($_ptr_ArrayFieldPointers->; ->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
		APPEND TO ARRAY:C911($_ptr_ArrayFormats->; "")
		APPEND TO ARRAY:C911($_ptr_ArrayTitles->; "Index")
		APPEND TO ARRAY:C911($_ptr_ArrayWidths->; 0)
		APPEND TO ARRAY:C911($_ptr_ArrayEnterables->; False:C215)
		APPEND TO ARRAY:C911($_ptr_ArrayofArrayPointers->; ->STK_al_LineIndex)
		APPEND TO ARRAY:C911($_ptr_arrayNamesArray->; "STK_al_LineIndex")
		APPEND TO ARRAY:C911($_ptr_ArrayColumnLocks->; False:C215)
		APPEND TO ARRAY:C911($_ptr_ArrayColumnFontSizes->; 9)
		APPEND TO ARRAY:C911($_ptr_ArrayColumnFooters->; 1)
		APPEND TO ARRAY:C911($_ptr_ArrayColumnColours->; "Black")
		APPEND TO ARRAY:C911($_ptr_ArrayFormulas->; "")
		
		
		//note displayed as text
		//have to add the index column
		
		STK_bo_ConsolidatedView:=True:C214
		OBJECT SET TITLE:C194(STK_but_consolidate; "Full View")
		$_ptr_ArrayFieldPointers:=STK_aptr_ItemPreferences{2}
		$_ptr_ArrayFormats:=STK_aptr_ItemPreferences{5}
		$_ptr_ArrayFormulas:=STK_aptr_ItemPreferences{6}
		$_ptr_ArrayTitles:=STK_aptr_ItemPreferences{12}
		$_ptr_ArrayWidths:=STK_aptr_ItemPreferences{13}
		$_ptr_ArrayEnterables:=STK_aptr_ItemPreferences{14}
		$_ptr_ArrayofArrayPointers:=STK_aptr_ItemPreferences{3}
		$_ptr_arrayNamesArray:=STK_aptr_ItemPreferences{4}
		//modify the data held in the pointers
		For ($_l_Index; 1; Size of array:C274(STK_at_xSoItemDeliveryReference))
			For ($_l_Index2; 1; Size of array:C274($_ptr_arrayNamesArray->))
				//if the array it is point at is named STK dont need to do anything..else we need to poplate or clear the array
				$_l_CharacterPosition:=Position:C15("STK_"; $_ptr_arrayNamesArray->{$_l_Index2})
				If ($_l_CharacterPosition=0)
					USE NAMED SELECTION:C332("$CurrentSelection")
					QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=STK_at_ProductCode{$_l_Index})
					
					LBi_ArrUpdate(->STK_aptr_ItemPreferences; $_l_Index; True:C214; $_l_Index2; $_l_Index2)  //return the values to the arrays
					
					
					
					
				End if 
				
			End for 
			
		End for 
		LBi_inclSetup(->STK_aptr_ItemPreferences)
		LB_SetEnterable(->STK_LB_StockItems; False:C215; 0)  // for the moment
		
		
	Else 
		//there is no consolidation taking place dont fiddle with the display
	End if 
	
End if 
CLOSE WINDOW:C154
ERR_MethodTrackerReturn("STK_RetrieveDraggedLines"; $_t_oldMethodName)

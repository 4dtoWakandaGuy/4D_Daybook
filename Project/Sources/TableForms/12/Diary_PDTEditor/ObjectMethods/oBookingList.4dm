If (False:C215)
	//object Name: [DIARY]Diary_PDTEditor.oBookingList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_OrderItems;0)
	//ARRAY LONGINT(SD2_al_OpenChoice;0)
	//ARRAY POINTER(SD2_aptr_LBOrderItemsSetup;0)
	//ARRAY TEXT(SD2_at_OpenChoice;0)
	//ARRAY TEXT(SD3_at_EditMode;0)
	C_LONGINT:C283($_l_Column; $_l_EditRecordProcess; $_l_event; $_l_FieldNumber; $_l_Process; $_l_RecordNumber; $_l_Row; $_l_TableNumber; LB_l_ColumnNumber; LB_l_RowNumber; SD_l_OpenChoice)
	C_POINTER:C301($_ptr_ArrayofArrayPointers; $_ptr_LBTable; $_Ptr_ThisColumnArray)
	C_TEXT:C284($_t_FormName; $_t_oldMethodName; $_t_ParentRecordCode; $_t_RecordCode; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_PDTEditor.oBookingList"; Form event code:C388)
$_l_event:=Form event code:C388
ARRAY TEXT:C222(SD3_at_EditMode; 3)
$_t_VariableName:=""

//Note that the records open an another process
Case of 
	: ($_l_event=On Header Click:K2:40)
		
	: ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		LISTBOX GET CELL POSITION:C971(SD2_lb_OrderItems; $_l_Column; $_l_Row)
		$_l_TableNumber:=0
		Case of 
			: (SD2_al_OpenChoice{SD2_at_OpenChoice}=Table:C252(->[INVOICES:39]))
				$_l_Column:=LB_GetColumnNumFromField(->[ORDER_ITEMS:25]Invoice_Number:17; ->SD2_aptr_LBOrderItemsSetup)
				If ($_l_Column>0)
					$_ptr_ArrayofArrayPointers:=SD2_aptr_LBOrderItemsSetup{3}
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Column}
					$_ptr_LBTable:=->[INVOICES:39]
					SD_l_OpenChoice:=Table:C252(->[INVOICES:39])
					$_l_TableNumber:=Table:C252(->[INVOICES:39])
					$_l_FieldNumber:=Field:C253(->[INVOICES:39]Invoice_Number:1)
					$_t_FormName:="Invoice_In"
					$_t_RecordCode:=$_Ptr_ThisColumnArray->{$_l_Row}
					If ($_t_RecordCode#"")
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_RecordCode)
						$_l_RecordNumber:=Record number:C243([INVOICES:39])
					Else 
						$_l_TableNumber:=0
					End if 
				End if 
			Else 
				$_l_Column:=LB_GetColumnNumFromField(->[ORDER_ITEMS:25]Order_Code:1; ->SD2_aptr_LBOrderItemsSetup)
				If ($_l_Column>0)
					$_ptr_ArrayofArrayPointers:=SD2_aptr_LBOrderItemsSetup{3}
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Column}
					
					$_ptr_LBTable:=->[ORDERS:24]
					SD_l_OpenChoice:=Table:C252(->[ORDERS:24])
					$_l_TableNumber:=Table:C252(->[ORDERS:24])
					$_l_FieldNumber:=Field:C253(->[ORDERS:24]Order_Code:3)
					$_t_FormName:="Order_In"
					$_t_FormName:="Invoice_In"
					$_t_RecordCode:=$_Ptr_ThisColumnArray->{$_l_Row}
					QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_RecordCode)
					$_l_RecordNumber:=Record number:C243([ORDERS:24])
				End if 
				
		End case 
		If ($_l_TableNumber>0)
			$_l_Process:=Current process:C322
			$_t_ParentRecordCode:=""
			//dont launch a second instance of the same record
			$_l_EditRecordProcess:=New process:C317("LBi_InclEdit_InProcess"; 64000; "Edit "+(Table name:C256($_ptr_LBTable))+" "+$_t_RecordCode; $_l_TableNumber; $_l_FieldNumber; $_t_FormName; $_l_RecordNumber; $_l_Process; $_t_ParentRecordCode; *)
			SHOW PROCESS:C325($_l_EditRecordProcess)
			BRING TO FRONT:C326($_l_EditRecordProcess)
		End if 
		//open the invoice
		//LBi_AreaScript (->SD2_aptr_LBOrderItemsSetup;1;[DIARY]Diary_Code;->SD3_at_EditMode;$_l_Row;$_t_VariableName;"SD3_LBI_ITEMS"(
		//("COM_LBI_Items")
		
	Else 
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		LISTBOX GET CELL POSITION:C971(SD2_lb_OrderItems; $_l_Column; $_l_Row)
		LB_l_ColumnNumber:=$_l_Column
		LB_l_RowNumber:=$_l_Row
		//$_t_VariableName:=
		//open the order-note the ORDER not the order item
		LBi_AreaScript(->SD2_aptr_LBOrderItemsSetup; 1; [DIARY:12]Diary_Code:3; ->SD3_at_EditMode; $_l_Row; $_t_VariableName; "SD3_LBI_ITEMS")
		//
		
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_PDTEditor.oBookingList"; $_t_oldMethodName)

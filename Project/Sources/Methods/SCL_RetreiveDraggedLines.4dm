//%attributes = {}
If (False:C215)
	//Project Method Name:      SCL_RetreiveDraggedLines
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
	ARRAY BOOLEAN:C223($_abo_ArrayUsed; 0)
	ARRAY BOOLEAN:C223($_abo_Booleans; 0; 0)
	ARRAY DATE:C224($_ad_Dates; 0; 0)
	ARRAY INTEGER:C220($_ai_Integer; 0; 0)
	ARRAY LONGINT:C221($_al_Longint; 0; 0)
	ARRAY LONGINT:C221($_al_LongintData; 0; 0)
	ARRAY REAL:C219($_ar_RealData; 0; 0)
	ARRAY TEXT:C222($_at_AlphaFieldData; 0; 0)
	ARRAY TEXT:C222($_at_TextData; 0; 0)
	C_BLOB:C604(<>ORD_BL_DataBlob)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($_l_FieldNumber; $_l_Index; $_l_KeyOrderItemFieldNumber; $_l_KeyPosition; $_l_LineIndex; $_l_NumberofFields; $_l_offset; $_l_OrderItemRow; $_l_RecordCount; $_l_RecordNumber; $_l_StartFind)
	C_LONGINT:C283($_l_TableNumber; ORD_l_DataPointer)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_Ptr_KeyField; $_ptr_LBTable; $_Ptr_ListBox; $_Ptr_ThisColumnArray; $_Ptr_ThisField; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCL_RetreiveDraggedLines")
//NG March 2004
//this method will take the order line
//copied and drop it into a contract.
//this is SIMILAR to ORD_ReteieveDraggedLines
//expect the destination arrays are
//dragged records selection
While (Semaphore:C143("$DataBlobinUse"))  //about to write-stop everyone
	DelayTicks(6)
End while 
ARRAY LONGINT:C221($_al_LongintData; 0; 0)
ARRAY TEXT:C222($_at_AlphaFieldData; 0; 0)
ARRAY TEXT:C222($_at_TextData; 0; 0)
ARRAY REAL:C219($_ar_RealData; 0; 0)
ARRAY LONGINT:C221($_al_Longint; 0; 0)
ARRAY INTEGER:C220($_ai_Integer; 0; 0)
ARRAY DATE:C224($_ad_Dates; 0; 0)
ARRAY BOOLEAN:C223($_abo_Booleans; 0; 0)
//```
$_l_NumberofFields:=Get last field number:C255(->[ORDER_ITEMS:25])
ARRAY LONGINT:C221($_al_LongintData; $_l_NumberofFields; 0)
ARRAY TEXT:C222($_at_AlphaFieldData; $_l_NumberofFields; 0)
ARRAY TEXT:C222($_at_TextData; $_l_NumberofFields; 0)
ARRAY REAL:C219($_ar_RealData; $_l_NumberofFields; 0)
ARRAY LONGINT:C221($_al_Longint; $_l_NumberofFields; 0)
ARRAY INTEGER:C220($_ai_Integer; $_l_NumberofFields; 0)
ARRAY DATE:C224($_ad_Dates; $_l_NumberofFields; 0)
ARRAY BOOLEAN:C223($_abo_Booleans; $_l_NumberofFields; 0)
$_l_offset:=0
$_l_RecordCount:=0
COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
Repeat 
	If (BLOB size:C605(<>ORD_BL_DataBlob)>$_l_offset)
		$_l_RecordCount:=$_l_RecordCount+1
		ARRAY LONGINT:C221($_al_LongintData; $_l_NumberofFields; $_l_RecordCount)
		ARRAY TEXT:C222($_at_AlphaFieldData; $_l_NumberofFields; $_l_RecordCount)
		ARRAY TEXT:C222($_at_TextData; $_l_NumberofFields; $_l_RecordCount)
		ARRAY REAL:C219($_ar_RealData; $_l_NumberofFields; $_l_RecordCount)
		ARRAY LONGINT:C221($_al_Longint; $_l_NumberofFields; $_l_RecordCount)
		ARRAY INTEGER:C220($_ai_Integer; $_l_NumberofFields; $_l_RecordCount)
		ARRAY DATE:C224($_ad_Dates; $_l_NumberofFields; $_l_RecordCount)
		ARRAY BOOLEAN:C223($_abo_Booleans; $_l_NumberofFields; $_l_RecordCount)
		ORD_l_DataPointer:=0
		$_l_offset:=DB_Blob_to_Data(->ORD_l_DataPointer; -><>ORD_BL_DataBlob; $_l_offset; True:C214)
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ID:58=ORD_l_DataPointer)
		For ($_l_Index; 1; Get last field number:C255(->[ORDER_ITEMS:25]))
			
			
			$_Ptr_ThisField:=Field:C253(Table:C252(->[ORDER_ITEMS:25]); $_l_Index)
			//``
			Case of 
				: (Type:C295($_Ptr_ThisField->)=Is alpha field:K8:1)
					//C_TEXT(ORD_t_DataTransfer)
					//ORD_t_DataTransfer:=""
					//$_l_offset:=DB_Blob_to_Data (->ORD_t_DataTransfer;-><>ORD_BL_DataBlob;$_l_offset;True)
					$_at_AlphaFieldData{$_l_Index}{$_l_RecordCount}:=$_Ptr_ThisField->  //ORD_t_DataTransfer
					
				: (Type:C295($_Ptr_ThisField->)=Is boolean:K8:9)
					//C_BOOLEAN(ORD_bo_DataValue)
					//ORD_bo_DataValue:=False
					//$_l_offset:=DB_Blob_to_Data (->ORD_bo_DataValue;-><>ORD_BL_DataBlob;$_l_offset;True)
					$_abo_Booleans{$_l_Index}{$_l_RecordCount}:=$_Ptr_ThisField->  //ORD_bo_DataValue
					
					
				: (Type:C295($_Ptr_ThisField->)=Is date:K8:7)
					//C_DATE(ORD_D_DataPointer)
					//ORD_D_DataPointer:=!00/00/0000!
					//$_l_offset:=DB_Blob_to_Data (->ORD_D_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True)
					$_ad_Dates{$_l_Index}{$_l_RecordCount}:=$_Ptr_ThisField->  //ORD_D_DataPointer
					
				: (Type:C295($_Ptr_ThisField->)=Is integer:K8:5)
					$_ai_Integer{$_l_Index}{$_l_RecordCount}:=$_Ptr_ThisField->  //ORD_ai_DATAPOINTER
				: (Type:C295($_Ptr_ThisField->)=Is longint:K8:6)
					//C_LONGINT(ORD_l_DataPointer)
					//ORD_l_DataPointer:=0
					//$_l_offset:=DB_Blob_to_Data (->ORD_l_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True)
					$_al_Longint{$_l_Index}{$_l_RecordCount}:=$_Ptr_ThisField->  //ORD_l_DataPointer
					
				: (Type:C295($_Ptr_ThisField->)=Is picture:K8:10)
				: (Type:C295($_Ptr_ThisField->)=Is real:K8:4)
					//C_REAL(ORD_R_DataPointer)
					//ORD_R_DataPointer:=0
					//$_l_offset:=DB_Blob_to_Data (->ORD_R_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True)
					$_ar_RealData{$_l_Index}{$_l_RecordCount}:=$_Ptr_ThisField->  //ORD_R_DataPointer
					
				: (Type:C295($_Ptr_ThisField->)=Is subtable:K8:11)
				: (Type:C295($_Ptr_ThisField->)=Is text:K8:3)
					//C_TEXT(ORD_T_DataPointer)
					//ORD_T_DataPointer:=""
					//$_l_offset:=DB_Blob_to_Data (->ORD_T_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True)
					$_at_TextData{$_l_Index}{$_l_RecordCount}:=$_Ptr_ThisField->  //ORD_T_DataPointer
				: (Type:C295($_Ptr_ThisField->)=Is time:K8:8)
					//C_TIME(ORD_ti_DataPointer)
					//ORD_ti_DataPointer:=?00:00:00?
					//$_l_offset:=DB_Blob_to_Data (->ORD_ti_DataPointer;-><>ORD_BL_DataBlob;$_l_offset;True)
					$_al_Longint{$_l_Index}{$_l_RecordCount}:=$_Ptr_ThisField->  //(ORD_ti_DataPointer*1)
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
$_l_KeyOrderItemFieldNumber:=Field:C253(->[ORDER_ITEMS:25]Item_Number:27)
ARRAY BOOLEAN:C223($_abo_ArrayUsed; $_l_RecordCount)
If (Size of array:C274($1->)>0)
	$_Ptr_ListBox:=$1->{1}
	$_ptr_ArrayFieldPointers:=$1->{2}
	$_ptr_LBTable:=$1->{7}
	$_Ptr_KeyField:=$1->{8}
	$_ptr_ArrayReferences:=$1->{9}
	$_Ptr_ListBox:=$1->{1}
	$_ptr_ArrayFieldPointers:=$1->{2}
	$_ptr_LBTable:=$1->{7}
	$_Ptr_KeyField:=$1->{8}
	$_ptr_ArrayReferences:=$1->{9}
	$_ptr_ArrayofArrayPointers:=$1->{3}
	$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
	$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
	
	For ($_l_LineIndex; 1; Size of array:C274($_Ptr_ThisColumnArray->))
		If ($_l_KeyPosition>0)
			$_ptr_ArrayofArrayPointers:=$1->{3}
			$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
			QUERY:C277($_ptr_LBTable->; $_Ptr_KeyField->=$_Ptr_ThisColumnArray->{$_l_LineIndex})
			$_l_StartFind:=1
			If ([ORDER_ITEMS:25]Product_Code:2#"") & ([ORDER_ITEMS:25]Contract_Code:29="")
				Repeat 
					IDLE:C311
					$_l_OrderItemRow:=Find in array:C230($_al_Longint{$_l_KeyOrderItemFieldNumber}; [ORDER_ITEMS:25]Item_Number:27; $_l_StartFind)
					If ($_l_OrderItemRow>0)  //replace
						$_l_StartFind:=$_l_OrderItemRow+1
						//here we could do something
					Else 
						READ WRITE:C146([ORDER_ITEMS:25])
						UNLOAD RECORD:C212([ORDER_ITEMS:25])
						LOAD RECORD:C52([ORDER_ITEMS:25])
						[ORDER_ITEMS:25]Contract_Code:29:=[CONTRACTS:17]Contract_Code:3
						//``
						Calc_Item
						
						ContrI_PrGr
						
						//``
						SAVE RECORD:C53([ORDER_ITEMS:25])
						
					End if 
					IDLE:C311
					
					
				Until ($_l_OrderItemRow<0)
				
				
			End if 
			
		End if 
	End for 
	
	$_bo_Continue:=True:C214
	If (Size of array:C274($_ai_Integer)>0)
		For ($_l_Index; 1; Size of array:C274($_ai_Integer{1}))
			If ($_abo_ArrayUsed{$_l_Index}=False:C215)
				
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_Longint{$_l_KeyOrderItemFieldNumber}{$_l_Index})
				
				If ([ORDER_ITEMS:25]Contract_Code:29="")
					QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
					If ([ORDERS:24]Company_Code:1=[CONTRACTS:17]Company_Code:1)
						//this is fine
						READ WRITE:C146([ORDER_ITEMS:25])
						UNLOAD RECORD:C212([ORDER_ITEMS:25])
						LOAD RECORD:C52([ORDER_ITEMS:25])
						[ORDER_ITEMS:25]Contract_Code:29:=[CONTRACTS:17]Contract_Code:3
						ContrI_PrGr
						
						SAVE RECORD:C53([ORDER_ITEMS:25])
					End if 
					
				End if 
			End if 
			
		End for 
		//reload the contract items:)
		CON_LoadCharges
	End if 
	
	
End if 
ERR_MethodTrackerReturn("SCL_RetreiveDraggedLines"; $_t_oldMethodName)
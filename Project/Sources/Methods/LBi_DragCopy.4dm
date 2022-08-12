//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_DragCopy
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY INTEGER:C220($_ai_DraggedRows; 0)
	C_BLOB:C604(<>ORD_BL_DataBlob)
	C_BOOLEAN:C305(STK_bo_ReceivebyReference; STK_bo_UseDeliveryReference)
	C_LONGINT:C283($_l_DraggedRow; $_l_Index; $_l_KeyPosition; DB_l_ButtonClickedFunction; SD_l_ParentProcess)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_ptr_Field; $_Ptr_KeyField; $_ptr_LBTable; $_Ptr_ListBoxArea; $_Ptr_ThisColumnArray; $1; $2)
	C_TEXT:C284($_t_oldMethodName; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_DragCopy")

//NG 20/7/06 THis method is a replacement for ALDragCopy
//This will probably need further reworking as the drag and drop will work in a different way

//TRACE
// - key field method/subfile no
//$1 - Ptr to array of ptrs
ARRAY INTEGER:C220($_ai_DraggedRows; 0)
$_Ptr_ListBoxArea:=$1->{1}

LB_GetSelect($_Ptr_ListBoxArea; ->$_ai_DraggedRows)
$_ptr_ArrayFieldPointers:=$1->{2}
$_ptr_LBTable:=$1->{7}
$_Ptr_KeyField:=$1->{8}
$_ptr_ArrayReferences:=$1->{9}
$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
$_ptr_ArrayofArrayPointers:=$1->{3}
$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
While (Semaphore:C143("$DataBlobinUse"))  //about to write-stop everyone
	DelayTicks(60)
End while 


SET BLOB SIZE:C606(<>ORD_BL_DataBlob; 0)
If (Count parameters:C259<4)
	For ($_l_Index; 1; Size of array:C274($_Ptr_ThisColumnArray->))
		$_l_DraggedRow:=Find in array:C230($_ai_DraggedRows; $_l_Index)
		If ($_l_DraggedRow>0)
			If ($_l_KeyPosition>0)
				$_ptr_ArrayofArrayPointers:=$1->{3}
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
				QUERY:C277($_ptr_LBTable->; $_Ptr_KeyField->=$_Ptr_ThisColumnArray->{$_l_Index})
				If (Count parameters:C259>=3)
					QUERY SELECTION:C341($_ptr_LBTable->; $2->=$3)
				End if 
				
				Case of 
					: ($_ptr_LBTable->=->[ORDER_ITEMS:25])
						$_ptr_Field:=->[ORDER_ITEMS:25]x_ID:58
					: ($_ptr_LBTable->=->[ORDER_ITEMS:25])
						$_ptr_Field:=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16
				End case 
				DB_Data_to_Blob($_ptr_Field; -><>ORD_BL_DataBlob; -1)
				
				
				UNLOAD RECORD:C212($_ptr_LBTable->)
				
			End if 
		End if 
		
	End for 
Else 
	COPY NAMED SELECTION:C331($_ptr_LBTable->; "$TEMP")
	USE SET:C118($4)
	FIRST RECORD:C50($_ptr_LBTable->)
	
	If (Records in selection:C76($_ptr_LBTable->)>0)
		For ($_l_Index; 1; Records in selection:C76($_ptr_LBTable->))
			
			
			Case of 
				: ($_ptr_LBTable=->[ORDER_ITEMS:25])
					$_ptr_Field:=->[ORDER_ITEMS:25]x_ID:58
				: ($_ptr_LBTable=->[ORDER_ITEMS:25])
					$_ptr_Field:=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16
			End case 
			DB_Data_to_Blob($_ptr_Field; -><>ORD_BL_DataBlob; -1)
			
			
			NEXT RECORD:C51($_ptr_LBTable->)
		End for 
		UNLOAD RECORD:C212($_ptr_LBTable->)
	End if 
	USE NAMED SELECTION:C332("$TEMP")
	
End if 

//DB_Data_to_Blob (->[STOCK MOVEMENTS]Company From;->◊ORD_BL_DataBlob;-1)
CLEAR SEMAPHORE:C144("$DataBlobinUse")  //release everyone


//the copied lines are now in a BLOB
If (SD_l_ParentProcess>0)
	SET PROCESS VARIABLE:C370(SD_l_ParentProcess; STK_bo_ReceivebyReference; STK_bo_UseDeliveryReference)
	SET PROCESS VARIABLE:C370(SD_l_ParentProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("ReceiveDragged"))
	
	POST OUTSIDE CALL:C329(SD_l_ParentProcess)
End if 
ERR_MethodTrackerReturn("LBi_DragCopy"; $_t_oldMethodName)
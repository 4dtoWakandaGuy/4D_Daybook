If (False:C215)
	//object Name: [ORDERS]Orders_In.Variable32
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2012 08:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY INTEGER:C220($_ai_DraggedRows; 0)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY POINTER(DB_aptr_ContextPointersGen Confirm;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	C_BLOB:C604(<>ORD_BL_DataBlob; <>ORD_BL_ordDataBlob)
	C_BOOLEAN:C305($_bo_All; $_bo_Reselect)
	C_LONGINT:C283($_l_FieldsIndex; $_l_KeyPosition; $_l_OrderItemsIndex; $_l_OrderItemsRow; $_l_Retries; DB_l_ButtonClickedFunction; SD_l_ParentProcess)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_ptr_Field; $_ptr_HighlightSet; $_Ptr_KeyField; $_ptr_LBTable; $_ptr_ListBoxSetup; $_Ptr_ThisColumnArray)
	C_TEXT:C284($_t_HighlightSetName; $_t_NamedSet; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_In.Variable32"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		//Pack the order header
		$_l_Retries:=0
		While (Semaphore:C143("$DataBlobinUse"))  //about to write-stop everyone
			$_l_Retries:=$_l_Retries+1
			DelayTicks($_l_Retries*2)
		End while 
		
		$_ptr_LBTable:=->[ORDERS:24]
		SET BLOB SIZE:C606(<>ORD_BL_DataBlob; 0)
		SET BLOB SIZE:C606(<>ORD_BL_ordDataBlob; 0)
		For ($_l_FieldsIndex; 1; Get last field number:C255($_ptr_LBTable))
			$_ptr_Field:=Field:C253(Table:C252($_ptr_LBTable); $_l_FieldsIndex)
			DB_Data_to_Blob($_ptr_Field; -><>ORD_BL_ordDataBlob; -1)
		End for 
		If (Gen_Option)
			COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
			$_t_NamedSet:=""
			$_bo_Reselect:=False:C215
			$_ptr_LBTable:=->[ORDER_ITEMS:25]
			ARRAY INTEGER:C220($_ai_DraggedRows; 0)
			$_l_OrderItemsRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
			If ($_l_OrderItemsRow>0)
				$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_OrderItemsRow}
				$_ptr_HighlightSet:=$_ptr_ListBoxSetup->{20}
				$_t_HighlightSetName:=$_ptr_HighlightSet->
				$_bo_Reselect:=False:C215
				If ($_t_HighlightSetName#"")
					If (Records in set:C195($_t_HighlightSetName)>0)
						USE SET:C118($_t_HighlightSetName)
						CREATE SET:C116([ORDER_ITEMS:25]; "$Reselection")
						$_bo_Reselect:=True:C214
					End if 
				End if 
				
			End if 
			$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
			$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
			$_ptr_LBTable:=$_ptr_ListBoxSetup->{7}
			$_Ptr_KeyField:=$_ptr_ListBoxSetup->{8}
			$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
			$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
			
			$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
			Case of 
				: (Records in selection:C76([ORDER_ITEMS:25])=0)
					Gen_Confirm("Copy all lines?"; "Yes"; "No")
					$_bo_All:=True:C214
					USE NAMED SELECTION:C332("$Temp")
				: (Records in selection:C76([ORDER_ITEMS:25])>0)
					Gen_Confirm("Copy highlighted lines?"; "Highlighted"; "All")
					$_bo_All:=(OK=0)
			End case 
			For ($_l_OrderItemsIndex; 1; Records in selection:C76([ORDER_ITEMS:25]))
				
				
				For ($_l_FieldsIndex; 1; Get last field number:C255($_ptr_LBTable))
					$_ptr_Field:=Field:C253(Table:C252($_ptr_LBTable); $_l_FieldsIndex)
					DB_Data_to_Blob($_ptr_Field; -><>ORD_BL_DataBlob; -1)
				End for 
				NEXT RECORD:C51([ORDER_ITEMS:25])
				
				
				
			End for 
			
		End if 
		CLEAR SEMAPHORE:C144("$DataBlobinUse")  //release everyone
		If (SD_l_ParentProcess>0)
			SET PROCESS VARIABLE:C370(SD_l_ParentProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("RetreiveDraggedOrderLines"))
			
			
			POST OUTSIDE CALL:C329(SD_l_ParentProcess)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ:Orders_In,ORD_l_BDragOrd"; $_t_oldMethodName)

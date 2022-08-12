//%attributes = {}

If (False:C215)
	//Project Method Name:      CONT_LBI_OrderItems
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
	//ARRAY POINTER(ORD_aPtr_OrderItemsSetup;0)
	C_BOOLEAN:C305($_bo_NoEdit; $_bo_Null; $_bo_OK)
	C_LONGINT:C283($_l_Column; $_l_Field1Column; $_l_FieldNumber; $_l_Index; $_l_Row; $_l_Rows)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_Field; $_Ptr_FirstColumnArray; $_Ptr_FirstColumnField; $_ptr_LastColumnArray; $_ptr_ListboxArea; $_ptr_ListboxSetup; $_Ptr_ThisColumnArray; $_Ptr_ThisColumnField; $_Ptr_TotalColumnArray)
	C_REAL:C285($_r_Total)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CONT_LBI_OrderItems")

//This method is a replacement for the Area list call back ALModOrdICONTRACT
//NG March 2004
//this is the 'during' phase for order items displayed on the contract
//NOTE on a contract a user can only enter an order number, order item or product code
//ALModCont
$_ptr_ListboxSetup:=->ORD_aPtr_OrderItemsSetup
$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_Column; $_l_Row)
If ($_l_Column>0) & ($_l_Row>0)
	$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
	$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
	$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
	$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Column}
	$_ptr_LastColumnArray:=$_ptr_ArrayofArrayPointers->{Size of array:C274($_ptr_ArrayofArrayPointers->)}
	$_bo_NoEdit:=False:C215
	If (Field:C253($_Ptr_ThisColumnField)=Field:C253(->[ORDER_ITEMS:25]Order_Code:1))
		//check if the line already had a code in
		$_Ptr_FirstColumnField:=$_ptr_ArrayFieldPointers->{1}  //Because we know we inserted this here.
		If ($_ptr_LastColumnArray->{$_l_Row}#"")  //There was already an order code in.
			If ($_Ptr_ThisColumnArray->{$_l_Row}#$_ptr_LastColumnArray->{$_l_Row})
				Gen_Alert("Sorry you can not modify the order code of a line")
				$_Ptr_ThisColumnArray->{$_l_Row}:=$_ptr_LastColumnArray->{$_l_Row}
				$_bo_NoEdit:=True:C214
			End if 
		End if 
	End if 
	If (Not:C34($_bo_NoEdit))
		$_bo_OK:=LBi_ModIncl($_ptr_ListboxSetup; $_l_Column; $_l_Row)
		
		If (($_bo_OK) & (OK=1))
			$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
			$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
			If (Field:C253($_Ptr_ThisColumnField)=Field:C253(->[ORDER_ITEMS:25]Order_Code:1))
				//check if the line already had a code in
				$_Ptr_FirstColumnField:=$_ptr_ArrayFieldPointers->{1}  //Because we know we inserted this here.
				
			End if 
			$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
			OrderI_InLPX($_Ptr_ThisColumnField; ->[CONTRACTS:17])  //the during phase procedure
			LBi_ModUpdate($_ptr_ListboxSetup->; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
			$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
			$_ptr_Field:=->[ORDER_ITEMS:25]Contract_Cost:30
			$_l_Field1Column:=0
			
			//Find those fields in the arrays
			For ($_l_Index; 1; Size of array:C274($_ptr_ArrayFieldPointers->))
				$_l_FieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{$_l_Index})
				If ($_l_Field1Column=0)
					If ($_l_FieldNumber=Field:C253($_ptr_Field))
						$_l_Field1Column:=$_l_Index
					End if 
				End if 
				If ($_l_Field1Column>0)
					$_l_Index:=Size of array:C274($_ptr_ArrayFieldPointers->)
				End if 
				
			End for 
			If ($_l_Field1Column>0)
				//Now extract the 'SUM' from those fields
				$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
				If (Size of array:C274($_ptr_ArrayofArrayPointers->)>0)
					$_Ptr_FirstColumnArray:=$_ptr_ArrayofArrayPointers->{1}
					$_l_Rows:=Size of array:C274($_Ptr_FirstColumnArray->)
					$_r_Total:=0
					
					$_Ptr_TotalColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Field1Column}
					
					For ($_l_Row; 1; $_l_Rows)
						$_r_Total:=$_r_Total+($_Ptr_TotalColumnArray->{$_l_Row})
					End for 
					[CONTRACTS:17]Contract_Cost:7:=$_r_Total
					
				End if 
			End if 
			
			
		End if 
	End if 
Else 
	
End if 
ERR_MethodTrackerReturn("CONT_LBI_OrderItems"; $_t_oldMethodName)
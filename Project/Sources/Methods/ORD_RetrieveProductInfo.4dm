//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_RetrieveProductInfo
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
	ARRAY LONGINT:C221($_al_DataTypes; 0)
	ARRAY POINTER:C280($_aptr_FieldPointers; 0)
	C_BLOB:C604(<>PROD_BL_DataBlob)
	C_BOOLEAN:C305($_bo_NewItem; $_bo_OK; DB_bo_RecordModified; ORD_bo_ItemsModified)
	C_LONGINT:C283($_l_FieldCount; $_l_FieldNumber; $_l_Index; $_l_KeyFieldNumber; $_l_KeyPosition; $_l_LineIndex; $_l_offset; $_l_RecordCount; $_l_TableNumber)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_Ptr_KeyField; $_ptr_LBTable; $_Ptr_ListBox; $_Ptr_ThisColumnArray; $1)
	C_REAL:C285($_r_Quantity; $_r_SalesPrice)
	C_TEXT:C284($_t_oldMethodName; $_t_ProductCode; vProduct)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_RetrieveProductInfo")
//this method will put the data from the product selection pallette onto the order
//the products have either been dragged or the copy to order button clicked.
While (Semaphore:C143("$DataBlobinUse"))  //about to write-stop everyone
	DelayTicks(60)
End while 
$_l_offset:=0
$_l_RecordCount:=0
$_l_FieldCount:=3  // the number of fields passed
ARRAY LONGINT:C221($_al_DataTypes; 3)
ARRAY POINTER:C280($_aptr_FieldPointers; 3)
$_al_DataTypes{1}:=Is alpha field:K8:1
$_aptr_FieldPointers{1}:=->[ORDER_ITEMS:25]Product_Code:2
$_al_DataTypes{2}:=Is real:K8:4
$_aptr_FieldPointers{2}:=->[ORDER_ITEMS:25]Quantity:3
$_al_DataTypes{3}:=Is real:K8:4
$_aptr_FieldPointers{3}:=->[ORDER_ITEMS:25]Sales_Price:4

Repeat   //1
	If (BLOB size:C605(<>PROD_BL_DataBlob)>$_l_offset)  //2
		
		
		//the data in ◊PROD_BL_Datablob is
		//ProductCode,Quantity,Price
		//we have to find out if this product is already on this order
		//if it is we have to ask the user  whether to change qty
		//, change price , or  leave it
		$_l_RecordCount:=$_l_RecordCount+1
		For ($_l_Index; 1; $_l_FieldCount)  //13
			Case of   //14
				: (Field:C253($_aptr_FieldPointers{$_l_Index})=Field:C253(->[ORDER_ITEMS:25]Product_Code:2))
					
					BLOB TO VARIABLE:C533(<>PROD_BL_DataBlob; $_t_ProductCode; $_l_offset)
					
				: (Field:C253($_aptr_FieldPointers{$_l_Index})=Field:C253(->[ORDER_ITEMS:25]Quantity:3))
					
					BLOB TO VARIABLE:C533(<>PROD_BL_DataBlob; $_r_Quantity; $_l_offset)
				: (Field:C253($_aptr_FieldPointers{$_l_Index})=Field:C253(->[ORDER_ITEMS:25]Sales_Price:4))
					
					BLOB TO VARIABLE:C533(<>PROD_BL_DataBlob; $_r_SalesPrice; $_l_offset)
			End case   //14
		End for   //13
		//now need to find if this product is already on this order
		$_l_KeyFieldNumber:=Field:C253(->[ORDER_ITEMS:25]Product_Code:2)
		
		If (Size of array:C274($1->)>0)  //8
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
			$_bo_NewItem:=True:C214
			For ($_l_LineIndex; 1; Size of array:C274($_Ptr_ThisColumnArray->))  //9
				If ($_l_KeyPosition>0)  //10
					$_ptr_ArrayofArrayPointers:=$1->{3}
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
					QUERY:C277($_ptr_LBTable->; $_Ptr_KeyField->=$_Ptr_ThisColumnArray->{$_l_LineIndex})
					//$Start:=1
					If ([ORDER_ITEMS:25]Product_Code:2#"") & ([ORDER_ITEMS:25]Item_Locked:16=False:C215) & ([ORDER_ITEMS:25]Invoice_Number:17="")  //11
						If ([ORDER_ITEMS:25]Product_Code:2=$_t_ProductCode)  //12
							//this item exists
						End if   //12
					End if   //11
				End if   //10
			End for   //9
		Else   //8
			$_bo_NewItem:=True:C214
		End if   //8
		
		If ($_bo_NewItem)  //3
			CREATE RECORD:C68([ORDER_ITEMS:25])
			[ORDER_ITEMS:25]Order_Code:1:=[ORDERS:24]Order_Code:3
			OrderI_No
			[ORDER_ITEMS:25]x_ID:58:=AA_GetNextIDinMethod(->[ORDER_ITEMS:25]x_ID:58)
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_ProductCode)
			[ORDER_ITEMS:25]Product_Code:2:=$_t_ProductCode
			OrderI_SubLPPC
			[ORDER_ITEMS:25]Quantity:3:=$_r_Quantity
			If ([ORDER_ITEMS:25]Quantity:3=0)  //7
				[ORDER_ITEMS:25]Quantity:3:=1
			End if   //7
			vProduct:="Product:  "+Substring:C12([ORDER_ITEMS:25]Product_Code:2+": "+[PRODUCTS:9]Product_Name:2; 1; 40)
			OrderI_SubLPQty
			[ORDER_ITEMS:25]Sales_Price:4:=$_r_SalesPrice
			If ([ORDER_ITEMS:25]Retail_Price:38=0)  //6
				[ORDER_ITEMS:25]Retail_Price:38:=[ORDER_ITEMS:25]Sales_Price:4
			End if   //6
			Calc_Item
			
			If ([ORDER_ITEMS:25]Supplier_Code:20#"") & ([ORDER_ITEMS:25]Product_Code:2#"")  //4
				$_bo_OK:=OrderI_SubLPSup
				If (Not:C34($_bo_OK))  //5
					[ORDER_ITEMS:25]Supplier_Code:20:=""
				End if   //5
			End if   //4
			DB_SaveRecord(->[ORDER_ITEMS:25])
			DB_bo_RecordModified:=True:C214
			ORD_bo_ItemsModified:=True:C214
			
		Else 
			//edit item
			
		End if   //3
		
	End if 
	
Until ((BLOB size:C605(<>PROD_BL_DataBlob))<=$_l_offset)  //1
CLEAR SEMAPHORE:C144("$DataBlobinUse")
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
Orders_InLPTot
Orders_InLPB
Orders_InLPß("S1")
ERR_MethodTrackerReturn("ORD_RetrieveProductInfo"; $_t_oldMethodName)

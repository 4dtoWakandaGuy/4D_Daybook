//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_OrderRetrieveRevision
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/06/2011 16:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CountFields; $_l_Index; $_l_offset; $2)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_OrderRetrieveRevision")
//this method will retreive the data from the blob of the [XOrder_revisions]
//TO THE CURRENT RECORD NOTE THAT
// AND THE ORDER VIEWING WILL NEED TO BE IN A TRANSACTION!!!!!!!
If (Count parameters:C259>=2)
	If ($1#"")  //the order code
		QUERY:C277([XOrder_revisions:127]; [XOrder_revisions:127]X_OrderCode:4=$1; *)
		QUERY:C277([XOrder_revisions:127];  & ; [XOrder_revisions:127]X_RevisionNumber:2=$2)
		If (Records in selection:C76([XOrder_revisions:127])>0)
			$_l_offset:=0
			REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
			If ([XOrder_revisions:127]x_OrderFieldCount:7=0)
				$_l_CountFields:=Get last field number:C255(->[ORDERS:24])
			Else 
				$_l_CountFields:=[XOrder_revisions:127]x_OrderFieldCount:7
			End if 
			For ($_l_Index; 1; $_l_CountFields)
				$_ptr_Field:=Field:C253(Table:C252(->[ORDERS:24]); $_l_Index)
				If ($_l_offset<BLOB size:C605([XOrder_revisions:127]X_OrderData:6))
					$_l_offset:=DB_Blob_to_Data($_ptr_Field; ->[XOrder_revisions:127]X_OrderData:6; $_l_offset)
				Else 
					$_l_Index:=Get last field number:C255(->[ORDERS:24])
				End if 
			End for 
			If (Length:C16([ORDERS:24]Order_Code:3)<8)
				[ORDERS:24]Order_Code:3:="REV"+[ORDERS:24]Order_Code:3
			Else 
				[ORDERS:24]Order_Code:3:="REV"+Substring:C12([ORDERS:24]Order_Code:3; 1; 8)
			End if 
			[ORDERS:24]x_ID:58:=AA_GetNextIDinMethod(->[ORDERS:24]x_ID:58)
			DB_SaveRecord(->[ORDERS:24])
			AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
			Repeat 
				If (BLOB size:C605([XOrder_revisions:127]X_OrderData:6)>$_l_offset)
					CREATE RECORD:C68([ORDER_ITEMS:25])
					If ([XOrder_revisions:127]x_OrderItemFieldCount:8=0)
						$_l_CountFields:=Get last field number:C255(->[ORDER_ITEMS:25])
					Else 
						$_l_CountFields:=[XOrder_revisions:127]x_OrderItemFieldCount:8
					End if 
					For ($_l_Index; 1; $_l_CountFields)
						$_ptr_Field:=Field:C253(Table:C252(->[ORDER_ITEMS:25]); $_l_Index)
						If ($_l_offset<BLOB size:C605([XOrder_revisions:127]X_OrderData:6))
							$_l_offset:=DB_Blob_to_Data($_ptr_Field; ->[XOrder_revisions:127]X_OrderData:6; $_l_offset)
						Else 
							$_l_Index:=Get last field number:C255(->[ORDER_ITEMS:25])
						End if 
						
					End for 
					[ORDER_ITEMS:25]Order_Code:1:=[ORDERS:24]Order_Code:3
					[ORDER_ITEMS:25]Item_Number:27:=AA_GetNextIDinMethod(->[ORDER_ITEMS:25]Item_Number:27; Sequence number:C244([ORDER_ITEMS:25]))
					[ORDER_ITEMS:25]x_ID:58:=AA_GetNextIDinMethod(->[ORDER_ITEMS:25]x_ID:58)
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
					//any UNIQUE fields need to be 'fixed'
				End if 
			Until (BLOB size:C605([XOrder_revisions:127]X_OrderData:6)<=$_l_offset)
		Else 
			//nothing to retreive
		End if 
	End if   //no order code
End if   //invalid call
ERR_MethodTrackerReturn("ORD_OrderRetrieveRevision"; $_t_oldMethodName)

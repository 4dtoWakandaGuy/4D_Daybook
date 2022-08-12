//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_FIxUnallocations
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    09/09/2011 23:49 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(m_Type)
	//C_UNKNOWN(MCSID)
	//C_UNKNOWN(MFromItemNUmber)
	//C_UNKNOWN(mSum)
	//C_UNKNOWN(msum2)
	//ARRAY LONGINT(STK_al_MAOINumbers;0)
	//ARRAY REAL(STK_ar_MAOIAllocatedQuantity;0)
	//ARRAY REAL(STK_ar_MAOIQuantities;0)
	//ARRAY TEXT(ORD_at_OrderCodes;0)
	//ARRAY TEXT(STK_at_AllocationAds;0)
	//ARRAY TEXT(STK_at_allocationMovement;0)
	//ARRAY TEXT(STK_at_StockMovementTypes;0)
	//ARRAY TEXT(STK_at_unAllocationAds;0)
	//ARRAY TEXT(STK_at_unallocationMovement;0)
	C_BOOLEAN:C305(STK_bo_AllocTypesKnown)
	C_REAL:C285(Mi; MMAX; mRef)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(MDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_FIxUnallocations")
READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="UNA"; *)
QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>=0)
COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "TOFIX")
MMAX:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])

For (Mi; 1; MMAX)
	USE NAMED SELECTION:C332("TOFIX")
	GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; Mi)
	MFromItemNUmber:=[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25
	If (MFromItemNUmber>0)
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23)
		If ([CURRENT_STOCK:62]Item_Number:5#0)
			If ([CURRENT_STOCK:62]Item_Number:5#MFromItemNUmber)
				MCSID:=[CURRENT_STOCK:62]X_ID:13
				[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
				DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
				If ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23=MCSID)
				End if 
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=MCSID)
				DB_SaveRecord(->[CURRENT_STOCK:62])
				
			End if 
		End if 
	End if 
	
End for 
//````````````````
QUERY:C277([ORDERS:24]; [ORDERS:24]State:15="02430"; *)
QUERY:C277([ORDERS:24];  | ; [ORDERS:24]State:15="02420")
//QUERY SELECTION([ORDERS];[ORDERS]Order Date>!01/05/2011!)
SELECTION TO ARRAY:C260([ORDERS:24]Order_Code:3; ORD_at_OrderCodes)
QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Order_Code:1; ORD_at_OrderCodes)
SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; STK_al_MAOINumbers; [ORDER_ITEMS:25]Quantity:3; STK_ar_MAOIQuantities; [ORDER_ITEMS:25]Allocated:28; STK_ar_MAOIAllocatedQuantity)
MDoc:=Create document:C266(""; "TEXT")
For (Mi; 1; Size of array:C274(STK_al_MAOINumbers))
	If (Not:C34(STK_bo_AllocTypesKnown))
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Plus:3; STK_at_AllocationAds; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_allocationMovement)
		
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Unalloc_Type:13=True:C214)
		SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Stock_Minus:4; STK_at_unAllocationAds; [MOVEMENT_TYPES:60]Type_Code:1; STK_at_unallocationMovement)
		
		STK_bo_AllocTypesKnown:=True:C214
	End if 
	//here need to take care in case there is ISO creating P and and ALO creating P.
	//we cant assume there is an ALO(PITA) and cant assume that if there is an ISO there is no ALO
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=STK_al_MAOINumbers{Mi})
	If (Size of array:C274(STK_at_AllocationAds)>1)
		QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; STK_at_AllocationAds)
	Else 
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=STK_at_AllocationAds{1})
	End if 
	DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; STK_at_StockMovementTypes)
	If (Size of array:C274(STK_at_StockMovementTypes)>1)
		mRef:=Find in array:C230(STK_at_allocationMovement; STK_at_StockMovementTypes{1})
		If (mRef<0)
			m_Type:=STK_at_allocationMovement{1}
		Else 
			M_type:=STK_at_allocationMovement{mRef}
		End if 
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=M_type)
	End if 
	
	
	mSum:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25=STK_al_MAOINumbers{Mi})
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23>0)
	If (Size of array:C274(STK_at_unallocationMovement)=1)
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30=STK_at_unallocationMovement{1})
	Else 
		QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; STK_at_unallocationMovement)
	End if 
	If (Size of array:C274(STK_at_AllocationAds)>1)
		QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32; STK_at_unAllocationAds)
	Else 
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32=STK_at_unAllocationAds{1})
	End if 
	msum2:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
	mSum:=mSum-mSum2
	If (Msum>STK_ar_MAOIQuantities{Mi})
		SEND PACKET:C103(Mdoc; "Sales order item "+String:C10(STK_al_MAOINumbers{Mi})+"Quantity"+String:C10(STK_ar_MAOIQuantities{Mi})+" has an allocated quantity of"+String:C10(Msum))
	End if 
	If (Msum>STK_ar_MAOIAllocatedQuantity{Mi})
		SEND PACKET:C103(Mdoc; "Sales order item "+String:C10(STK_al_MAOINumbers{Mi})+"Allocated Record="+String:C10(STK_ar_MAOIAllocatedQuantity{Mi})+" has an allocated Calculated Quantity of"+String:C10(Msum))
		If (Msum#STK_ar_MAOIAllocatedQuantity{Mi})
			SEND PACKET:C103(Mdoc; "Sales order item "+String:C10(STK_al_MAOINumbers{Mi})+"Allocated Record="+String:C10(STK_ar_MAOIAllocatedQuantity{Mi})+" has an allocated Calculated Quantity of"+String:C10(Msum))
			READ WRITE:C146([ORDER_ITEMS:25])
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=STK_al_MAOINumbers{Mi})
			[ORDER_ITEMS:25]Allocated:28:=Msum
			SAVE RECORD:C53([ORDER_ITEMS:25])
		End if 
		
	End if 
End for 
CLOSE DOCUMENT:C267(Mdoc)
ERR_MethodTrackerReturn("STK_FIxUnallocations"; $_t_oldMethodName)

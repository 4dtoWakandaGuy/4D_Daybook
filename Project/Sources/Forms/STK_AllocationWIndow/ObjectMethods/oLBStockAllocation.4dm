If (False:C215)
	//object Name: Object Name:      STK_AllocationWIndow.oLBStockAllocation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/10/2013 17:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(STK_lb_Allocate;0)
	//ARRAY LONGINT(ORDI_al_AllocStockRecordIDS;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(STK_at_FilterTypes;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Process; $_l_Retries; $_l_Row)
	C_TEXT:C284($_t_oldMethodName; STK_t_Company)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ STK_AllocationWIndow.oLBStockAllocation"; Form event code:C388)
$_l_event:=Form event code:C388
ARRAY TEXT:C222($_at_ColumnNames; 0)
ARRAY TEXT:C222($_at_HeaderNames; 0)
ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
Case of 
	: ($_l_event=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(STK_lb_Allocate; $_l_Column; $_l_Row)
		LISTBOX GET ARRAYS:C832(STK_lb_Allocate; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		STK_t_Company:=""
		Case of 
			: (STK_at_FilterTypes{STK_at_FilterTypes}="Allocated Stock")
				If (Size of array:C274(ORDI_al_AllocStockRecordIDS)>=$_l_Row)
					If (Size of array:C274(ORDI_al_AllocStockRecordIDS{$_l_Row})>=1)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=ORDI_al_AllocStockRecordIDS{$_l_Row}{1})
						STK_t_Company:=[STOCK_MOVEMENT_ITEMS:27]Company_To:2
						$_l_Process:=New process:C317("STK_GetCompany"; 128000; "Get Company Info"; Current process:C322; "SO Item Number"; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8)
						$_l_Retries:=0
						While (Process state:C330($_l_Process)>=0) & (Process_Name($_l_Process)="SO Item Number")
							
							$_l_Retries:=$_l_Retries+1
							DelayTicks((1*$_l_Retries)*2)
						End while 
					End if 
				End if 
			: (STK_at_FilterTypes{STK_at_FilterTypes}="On Order Stock")
				If (Size of array:C274(ORDI_al_AllocStockRecordIDS)>=$_l_Row)
					If (Size of array:C274(ORDI_al_AllocStockRecordIDS{$_l_Row})>=1)
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=ORDI_al_AllocStockRecordIDS{$_l_Row}{1})
						STK_t_Company:=[STOCK_MOVEMENT_ITEMS:27]Company_To:2
						$_l_Process:=New process:C317("STK_GetCompany"; 128000; "Get Company Info"; Current process:C322; "PO Item Number"; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
						$_l_Retries:=0
						While (Process state:C330($_l_Process)>=0) & (Process_Name($_l_Process)="PO Item Number")
							
							$_l_Retries:=$_l_Retries+1
							DelayTicks((1*$_l_Retries)*2)
							
						End while 
					End if 
				End if 
				
				
		End case 
End case 
ERR_MethodTrackerReturn("OBJ STK_AllocationWIndow.oLBStockAllocation"; $_t_oldMethodName)

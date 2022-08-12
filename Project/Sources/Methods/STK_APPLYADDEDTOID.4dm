//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_APPLYADDEDTOID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  21/07/2011 16:42 v8.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_AllocatedStockTypes; 0)
	ARRAY TEXT:C222($_at_StockMovementCodes; 0)
	ARRAY TEXT:C222($_at_StockMovementTypes; 0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_Edits; $_bo_IsAllocation; $_bo_isUnallocation; $_bo_TakeOffItemNumber; $_bo_UseOnlyAllocated; $0; STK_bo_NOProcess; STK_bo_PreviousCAllback; STK_bo_PreviousItemNumberTested)
	C_LONGINT:C283($_l_ApplicationType; $_l_GetItemNumber; $_l_Max2; $_l_MaxRecords; $_l_Record; $_l_RecordsIndex; $_l_RecordsIndex2; $_l_RecordsinSelection; $_l_Retries; $_l_StockMovementItemID; $_l_StockTypeRow)
	C_LONGINT:C283(STK_l_PreviousItemNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_productCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_APPLYADDEDTOID")
QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
DISTINCT VALUES:C339([MOVEMENT_TYPES:60]Stock_Plus:3; $_at_AllocatedStockTypes)
READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
$_l_ApplicationType:=Application type:C494
If ($_l_ApplicationType=4D Local mode:K5:1)
	$_l_ApplicationType:=4D Server:K5:6
End if 

If ($_l_ApplicationType=4D Server:K5:6)
	//Open window(90;260;Screen width-80;600;-720)
End if 
QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Stock_Plus:3#"")
SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_StockMovementTypes)
QUERY WITH ARRAY:C644([STOCK_MOVEMENTS:40]Movement_Type:6; $_at_StockMovementTypes)
SELECTION TO ARRAY:C260([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_StockMovementCodes)
QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_StockMovementCodes)
QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=0)
QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"")

//QUERY([STOCK ITEMS]; & ;[STOCK ITEMS]xstockMovementType="")
//CREATE SET([STOCK ITEMS];"$Set1")
//QUERY([STOCK ITEMS];[STOCK ITEMS]xAddtoCurrentStockID=0;*)
//QUERY([STOCK ITEMS]; & ;[STOCK ITEMS]xstockMovementType#"";*)
//QUERY([STOCK ITEMS]; & ;[STOCK ITEMS]xAddToStockType#"")
//CREATE SET([STOCK ITEMS];"$Set2")
//UNION("$set1";"$set2";"$set1")
//USE SET("$Set1")
ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; <)
$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "ALL")
$_l_Record:=0


$_l_MaxRecords:=$_l_RecordsinSelection
For ($_l_RecordsIndex; 1; $_l_RecordsinSelection)
	If ($_l_ApplicationType=4D Server:K5:6)
		//GOTO XY(0;0)
		//MESSAGE(" CHECKING PRODUCT"+[STOCK ITEMS]Product Code+", marking added to current stock id on "+String($_l_Record)+" of "+String($_l_MaxRecords))
	End if 
	$_bo_Edits:=False:C215
	USE NAMED SELECTION:C332("ALL")
	GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_RecordsIndex)
	$_t_productCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
	USE NAMED SELECTION:C332("ALL")
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_productCode; *)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=0)
	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "ALL2")
	$_l_Max2:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
	
	For ($_l_RecordsIndex2; 1; $_l_Max2)
		USE NAMED SELECTION:C332("ALL2")
		GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_RecordsIndex2)
		If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22=0)
			$_l_Retries:=0
			While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(60*$_l_Retries)
			End while 
			If (Not:C34(<>SYS_bo_QuitCalled))
				
				If ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
					If ([STOCK_MOVEMENTS:40]Movement_Code:1#[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
						QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
					End if 
					$_bo_Edits:=STK_SetHeaderInfo
					
					
					$_bo_TakeOffItemNumber:=False:C215
					If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
						QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
					End if 
					If ([MOVEMENT_TYPES:60]Alloc_Type:10=False:C215)
						$_l_StockTypeRow:=Find in array:C230($_at_AllocatedStockTypes; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31)
						If ($_l_StockTypeRow>0)
							//This stock movement item is adding the the stock type that can be allocated. if it is not an allocation it should not have an item number on it
							$_bo_TakeOffItemNumber:=True:C214
						End if 
					End if 
					$_bo_isUnallocation:=[MOVEMENT_TYPES:60]Unalloc_Type:13
					$_bo_IsAllocation:=[MOVEMENT_TYPES:60]Alloc_Type:10
					$_bo_UseOnlyAllocated:=[MOVEMENT_TYPES:60]Delivery_Type:12 | [MOVEMENT_TYPES:60]UseAllocatedStock:27
					//if this is an unallocation type and the [stock items]item number is filled it should be moved to the correct field
					If ($_bo_isUnallocation)
						If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
							[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
							[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
							If ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25=0)
								//TRACE
								STK_l_PreviousItemNumber:=0
								STK_bo_PreviousItemNumberTested:=False:C215
								$_l_GetItemNumber:=New process:C317("STK_GetAllocationItemNumber"; 128000; "Get Allocation Itemnumber"; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
								$_l_Retries:=0
								While (Not:C34(STK_bo_PreviousItemNumberTested))
									$_l_Retries:=$_l_Retries+1
									DelayTicks(60*($_l_Retries+3))
								End while 
								SET PROCESS VARIABLE:C370($_l_GetItemNumber; STK_bo_PreviousCAllback; True:C214)
								[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25:=STK_l_PreviousItemNumber
							End if 
							DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
							$_bo_Edits:=True:C214
							
						End if 
					End if 
					If ($_bo_IsAllocation)
						If ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
							If ([STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24=0)
								[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
								DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
								$_bo_Edits:=True:C214
							End if 
						End if 
					End if 
					If ($_bo_TakeOffItemNumber=True:C214) & ([STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
						$_bo_Edits:=True:C214  //else there is confusion. because it would add to the current stock of the with the item number on AND you cant allocated it because an allocation looks for items with no item number.
						//there will need to be an updated handling for automated allocation of 0 Stock. so 0 stock can be allocated but when received 1) we can find the order numbers. 2) we add to unallocated current stock and then allocated
					End if 
				End if 
				If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"")
					If ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31#"")
						$_l_Record:=$_l_Record+1
						If ($_l_ApplicationType=4D Server:K5:6)
							//GOTO XY(0;0)
							//MESSAGE(" CHECKING PRODUCT"+[STOCK ITEMS]Product Code+", marking added to current stock id on "+String($_l_Record)+" of "+String($_l_MaxRecords))
						End if 
						$_l_StockMovementItemID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
						STK_bo_NOProcess:=True:C214
						[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=STK_GetAddtoCurrentStockID([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8; [STOCK_MOVEMENT_ITEMS:27]Location:7; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; [STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
						
						STK_bo_NOProcess:=False:C215
						If ($_l_StockMovementItemID#[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
							If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=0)
								//TRACE
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22)
								[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[CURRENT_STOCK:62]Cost_Price:6
							End if 
							$_bo_Edits:=True:C214
						End if 
					Else 
						$_l_MaxRecords:=$_l_MaxRecords-1
						If ($_l_ApplicationType=4D Server:K5:6)
							//GOTO XY(0;0)
							//MESSAGE(" CHECKING PRODUCT"+[STOCK ITEMS]Product Code+", marking added to current stock id on "+String($_l_Record)+" of "+String($_l_MaxRecords))
						End if 
						
					End if 
					
					
					If ($_bo_Edits)
						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
						
						
					End if 
				End if 
			Else 
				$_l_RecordsIndex2:=$_l_Max2
				$_l_RecordsIndex:=$_l_RecordsinSelection
			End if 
		End if 
		DelayTicks(30)
	End for 
	DelayTicks(30)
End for 
ERR_MethodTrackerReturn("STK_APPLYADDEDTOID"; $_t_oldMethodName)

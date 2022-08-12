//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockI_CopyPrevProcess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/05/2012 09:30
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(STK_at_NoCopyFrom;0)
	C_BOOLEAN:C305($_bo_NoMessage; $_bo_StockReceipt; $_bo_UniqueSerialNos; STK_bo_NoCopyFromSet; STK_bo_UseDeliveryReference)
	C_LONGINT:C283($_l_AddMode; $_l_RecordsInSelection; $_l_Removed; $_l_TableNumber; SD_l_ParentProcess; STOCK_l_Context; Vadd; vNo; xNext)
	C_TEXT:C284($_t_CompanyFromCode; $_t_oldMethodName; $_t_Search; $_t_StockMovementCode; $1; $2; $3; $4; $5; $6; DB_t_CurrentFormUsage)
	C_TEXT:C284(DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockI_CopyPrevProcess")
//``NG May 2004
//this new method opens the stock movement in a seperate process for copying from
//Note that it is largly based on StockI_CopyPrev
Start_Process
$_bo_StockReceipt:=False:C215

QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]PreventCopyFrom:35=True:C214)
SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; STK_at_NoCopyFrom)
STK_bo_NoCopyFromSet:=True:C214

If ($4#"")
	If ([MOVEMENT_TYPES:60]Type_Code:1#$4)
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$4)
		$_bo_StockReceipt:=[MOVEMENT_TYPES:60]UseForStockReceipt:33
	End if 
End if 
Movements_File
STK_bo_UseDeliveryReference:=False:C215  // if search by delivery reference then when opening the movement only show items with the reference

If ($_bo_StockReceipt)
	$_t_Search:=Gen_Search("Movt Code, Type/(Type No)"+Char:C90(13)+"Expected Delivery or reference to find"; ""; "Find Copy from Movement")
	
Else 
	$_t_Search:=Gen_Search("Movt Code, Type/(Type No) or Source record to find:"; ""; "Find Copy from Movement")
End if 
If (OK=1)
	SD_l_ParentProcess:=Num:C11($1)
	$_t_CompanyFromCode:=$2
	$_t_StockMovementCode:=$3
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$4)
	$_bo_UniqueSerialNos:=[MOVEMENT_TYPES:60]Serial_Unique:19
	$_l_AddMode:=Vadd
	vAdd:=0
	STOCK_l_Context:=-1
	If (xNext=0)
		
		Movements_Sel2($_t_Search)
	Else 
		Movements_SelP
	End if 
	
	$_bo_NoMessage:=False:C215
	If (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
		COPY NAMED SELECTION:C331([STOCK_MOVEMENTS:40]; "SMa1")
		$_l_RecordsInSelection:=Records in selection:C76([STOCK_MOVEMENTS:40])
		RELATE MANY SELECTION:C340([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
		
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
		RELATE ONE SELECTION:C349([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENTS:40])
		QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1#$_t_StockMovementCode)
		If (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
			If (Records in selection:C76([STOCK_MOVEMENTS:40])<$_l_RecordsInSelection)
				$_l_Removed:=$_l_RecordsInSelection-Records in selection:C76([STOCK_MOVEMENTS:40])
				Gen_Alert(String:C10($_l_Removed)+" Records found have been removed because  they have no remaining available items in them")
				
			End if 
		Else 
			Gen_Alert("Stock movements found have already been there are no remaining available items on them")
			$_bo_NoMessage:=True:C214
		End if 
	End if 
	If (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
		OK:=1
		
		If ($_t_CompanyFromCode#"")
			CREATE SET:C116([STOCK_MOVEMENTS:40]; "Extra")
			QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Company_From:2=$_t_CompanyFromCode)
			If (Records in selection:C76([STOCK_MOVEMENTS:40])=0)
				USE SET:C118("Extra")
			End if 
			CLEAR SET:C117("Extra")
		End if 
		If (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
			$_l_TableNumber:=Table:C252(->[STOCK_MOVEMENTS:40])
			COPY NAMED SELECTION:C331([STOCK_MOVEMENTS:40]; "movPreselection")
			DBI_DisplayRecords($_l_TableNumber; "movPreselection"; "Show Linked Record"; 1)
		End if 
	Else 
		If (Not:C34($_bo_NoMessage))
			Gen_Alert("No Stock Movements found"; "Cancel")
		End if 
		
	End if 
	
	vNo:=Records in selection:C76([STOCK_MOVEMENTS:40])
	[STOCK_MOVEMENTS:40]Total_Cost:8:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13)
End if 
ERR_MethodTrackerReturn("StockI_CopyPrevProcess"; $_t_oldMethodName)
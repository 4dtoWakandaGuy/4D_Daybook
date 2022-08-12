//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderItem_AllocationUpdate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2010 06:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_POINTER:C301($1; $10; $2; $3; $4; $8; $9)
	C_REAL:C285($_r_Allocated; $_r_CostAmount; $_r_CostPrice; $6; $7)
	C_TEXT:C284($_t_oldMethodName; $_t_PurchaseOrderNumber; $_t_Serial; $5)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OrderItem_AllocationUpdate")
//OrderI Allocations OI Update
$_t_PurchaseOrderNumber:=$1->
$0:=False:C215
If (($1->="") & ($3->=$6))
	$0:=True:C214
	$1->:="STOCK"
	$2->:=<>DB_d_CurrentDate
	If ($4->#"") & ($4->#"*@")
		If ($5#"")
			If ([PRODUCTS:9]Product_Code:1#$5)
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$5)
			End if 
			If ([PRODUCTS:9]Product_Code:1=$5)
				QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1; *)
				QUERY:C277([PRODUCTS_SUPPLIERS:148];  & ; [PRODUCTS_SUPPLIERS:148]Company_Code:1=$4->)
				If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])=0)
					CONFIRM:C162("This product is not identified as supplied by this supplier, do you which to"+"Remove "+[ORDER_ITEMS:25]Supplier_Code:20+" ) from this item?"; "Yes"; "No")
					If (OK=1)
						$4->:=""
						$0:=True:C214
					End if 
				End if 
				
				
				
			End if 
			
		End if 
		
	End if 
	
End if 
//DB_SaveRecord (->[ORDER ITEMS])
//AA_CheckFileUnlocked (->[ORDER ITEMS]x_ID)

$_r_Allocated:=0
$_r_CostPrice:=0
$_r_CostAmount:=0
$_t_Serial:=""
$_r_Allocated:=$3->
$_r_CostPrice:=$10->
$_r_CostAmount:=$8->
$_t_Serial:=$9->
OrderI_AllOIUp2(""; 0; $7; ->$_r_Allocated; ->$_r_CostAmount; ->$_t_Serial; ->$_r_CostPrice; $5)
If ($_r_Allocated#$3->) | ($_r_CostAmount#$8->) | ($_t_Serial#$9->) | ($_r_CostPrice#$10->)
	$3->:=$_r_Allocated
	$10->:=$_r_CostPrice
	$8->:=$_r_CostAmount
	$9->:=$_t_Serial
	$0:=True:C214
	
End if 
ERR_MethodTrackerReturn("OrderItem_AllocationUpdate"; $_t_oldMethodName)

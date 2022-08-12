//%attributes = {}
If (False:C215)
	//Project Method Name:      Move_PostLevArr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/04/2010 09:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(STKL_ar_StockAllocatedCost;0)
	//ARRAY REAL(STKL_ar_StockAllocatedQuantity;0)
	//ARRAY REAL(STKL_ar_StockFreeCost;0)
	//ARRAY REAL(STKL_ar_StockFreeQuantity;0)
	//ARRAY TEXT(STKL_at_StockLevelident;0)
	C_LONGINT:C283($_l_NumberofStockLevels; $2)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_ConstructedCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Move_PostLevArr")
//Move_PostLevArr



$_t_ConstructedCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+(" "*(25-Length:C16([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)))+$1->+(" "*(5-Length:C16($1->)))+[CURRENT_STOCK:62]Analysis_Code:10+(" "*(5-Length:C16([CURRENT_STOCK:62]Analysis_Code:10)))+[CURRENT_STOCK:62]Currency_Code:11+(" "*(5-Length:C16([CURRENT_STOCK:62]Currency_Code:11)))+[CURRENT_STOCK:62]Layer_Code:12+(" "*(3-Length:C16([CURRENT_STOCK:62]Layer_Code:12)))
If (Size of array:C274(STKL_at_StockLevelident)=0)
	$_l_NumberofStockLevels:=0
Else 
	$_l_NumberofStockLevels:=Find in array:C230(STKL_at_StockLevelident; $_t_ConstructedCode)
End if 
If ($_l_NumberofStockLevels<1)
	INSERT IN ARRAY:C227(STKL_at_StockLevelident; 9999; 1)
	INSERT IN ARRAY:C227(STKL_ar_StockFreeQuantity; 9999; 1)
	INSERT IN ARRAY:C227(STKL_ar_StockFreeCost; 9999; 1)
	INSERT IN ARRAY:C227(STKL_ar_StockAllocatedQuantity; 9999; 1)
	INSERT IN ARRAY:C227(STKL_ar_StockAllocatedCost; 9999; 1)
	$_l_NumberofStockLevels:=Size of array:C274(STKL_at_StockLevelident)
	STKL_at_StockLevelident{$_l_NumberofStockLevels}:=$_t_ConstructedCode
End if 
If ([CURRENT_STOCK:62]Item_Number:5=0)
	STKL_ar_StockFreeQuantity{$_l_NumberofStockLevels}:=Round:C94((STKL_ar_StockFreeQuantity{$_l_NumberofStockLevels}+(Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)*$2)); 2)
	If ($2=1)
		STKL_ar_StockFreeCost{$_l_NumberofStockLevels}:=Round:C94((STKL_ar_StockFreeCost{$_l_NumberofStockLevels}+[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2)
	Else 
		STKL_ar_StockFreeCost{$_l_NumberofStockLevels}:=Round:C94((STKL_ar_StockFreeCost{$_l_NumberofStockLevels}-[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2)
	End if 
Else 
	STKL_ar_StockAllocatedQuantity{$_l_NumberofStockLevels}:=Round:C94((STKL_ar_StockAllocatedQuantity{$_l_NumberofStockLevels}+(Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)*$2)); 2)
	If ($2=1)
		STKL_ar_StockAllocatedCost{$_l_NumberofStockLevels}:=Round:C94((STKL_ar_StockAllocatedCost{$_l_NumberofStockLevels}+[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2)
	Else 
		STKL_ar_StockAllocatedCost{$_l_NumberofStockLevels}:=Round:C94((STKL_ar_StockAllocatedCost{$_l_NumberofStockLevels}-[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2)
	End if 
End if 
ERR_MethodTrackerReturn("Move_PostLevArr"; $_t_oldMethodName)
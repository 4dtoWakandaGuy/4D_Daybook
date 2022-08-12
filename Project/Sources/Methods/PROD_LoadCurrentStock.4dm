//%attributes = {}
If (False:C215)
	//Project Method Name:      PROD_LoadCurrentStock
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ALLStockFilterOut; 0)
	//ARRAY BOOLEAN(Prod_LB_Stock;0)
	ARRAY REAL:C219($_ar_SLAllocatedCost; 0)
	ARRAY REAL:C219($_ar_SLAllocatedLevel; 0)
	ARRAY REAL:C219($_ar_SLFreeCost; 0)
	ARRAY REAL:C219($_ar_SLFreeLevel; 0)
	//ARRAY REAL(PROD_ar_ProductStockALLOCQTY;0)
	//ARRAY REAL(PROD_ar_ProductStockALLOCValue;0)
	//ARRAY REAL(PROD_ar_ProductStockFREEQTY;0)
	//ARRAY REAL(PROD_ar_ProductStockFREEValue;0)
	ARRAY TEXT:C222($_at_ALLStockTypeCodes; 0)
	ARRAY TEXT:C222($_at_ALLStockTypeNames; 0)
	ARRAY TEXT:C222($_at_SLAnalysisCode; 0)
	ARRAY TEXT:C222($_at_StockTypeRange; 0)
	//ARRAY TEXT(PROD_at_ProductStockType;0)
	//ARRAY TEXT(PROD_S5_ProdStockType;0)
	C_BOOLEAN:C305($_bo_SetVariables; $3)
	C_LONGINT:C283($_l_CurrentRow; $_l_StockTypeIndex; $_l_StockTypeRow; Stock_l_BUT1; Stock_l_BUT2; Stock_l_BUT3; Stock_l_BUT4; Stock_l_BUT5)
	C_REAL:C285($1; PROD_r_ProdStockALLOCQTY_Total; PROD_r_ProdStockFREEQTY_Total)
	C_TEXT:C284($_t_oldMethodName; $2; oStock_COL1; oStock_COL2; oStock_COL3; oStock_COL4; oStock_COL5; oStock_HED1; oStock_HED2; oStock_HED3; oStock_HED4)
	C_TEXT:C284(oStock_HED5)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROD_LoadCurrentStock")
//this method will load the current stock of a product to an area list area
//pass this method a Product ID and Prod Code
//(we will eventually link the stock by ID)
//Stock Levels and Current stock Match each other Current stock however does inclu
If (Count parameters:C259<=3)
	$_bo_SetVariables:=True:C214
Else 
	$_bo_SetVariables:=$3
End if 
If ($_bo_SetVariables)
	
	ARRAY TEXT:C222(PROD_at_ProductStockType; 0)
	ARRAY REAL:C219(PROD_ar_ProductStockFREEQTY; 0)
	ARRAY REAL:C219(PROD_ar_ProductStockFREEValue; 0)
	ARRAY REAL:C219(PROD_ar_ProductStockALLOCQTY; 0)
	ARRAY REAL:C219(PROD_ar_ProductStockALLOCValue; 0)
End if 

PROD_r_ProdStockFREEQTY_Total:=0
PROD_r_ProdStockALLOCQTY_Total:=0

If ($1>0)
	ALL RECORDS:C47([STOCK_TYPES:59])
	ARRAY TEXT:C222($_at_ALLStockTypeCodes; 0)
	ARRAY TEXT:C222($_at_ALLStockTypeNames; 0)
	ARRAY BOOLEAN:C223($_abo_ALLStockFilterOut; 0)
	SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; $_at_ALLStockTypeCodes; [STOCK_TYPES:59]Type_Name:2; $_at_ALLStockTypeNames; [STOCK_TYPES:59]FilterOut:9; $_abo_ALLStockFilterOut)
	QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$2)
	ARRAY TEXT:C222($_at_StockTypeRange; 0)
	SELECTION TO ARRAY:C260([STOCK_LEVELS:58]Stock_Type:2; $_at_StockTypeRange)
	SORT ARRAY:C229($_at_StockTypeRange; >)
	For ($_l_StockTypeIndex; Size of array:C274($_at_StockTypeRange); 2; -1)
		If ($_at_StockTypeRange{$_l_StockTypeIndex}=$_at_StockTypeRange{$_l_StockTypeIndex-1})
			DELETE FROM ARRAY:C228($_at_StockTypeRange; $_l_StockTypeIndex)
		End if 
	End for 
	
	
	ARRAY TEXT:C222(PROD_at_ProductStockType; Size of array:C274($_at_StockTypeRange))
	ARRAY REAL:C219(PROD_ar_ProductStockFREEQTY; Size of array:C274($_at_StockTypeRange))
	ARRAY REAL:C219(PROD_ar_ProductStockFREEValue; Size of array:C274($_at_StockTypeRange))
	ARRAY REAL:C219(PROD_ar_ProductStockALLOCQTY; Size of array:C274($_at_StockTypeRange))
	ARRAY REAL:C219(PROD_ar_ProductStockALLOCValue; Size of array:C274($_at_StockTypeRange))
	$_l_CurrentRow:=0
	For ($_l_StockTypeIndex; 1; Size of array:C274($_at_StockTypeRange))
		$_l_StockTypeRow:=Find in array:C230($_at_ALLStockTypeCodes; $_at_StockTypeRange{$_l_StockTypeIndex})
		If ($_l_StockTypeRow>0)
			If ($_abo_ALLStockFilterOut{$_l_StockTypeRow}=False:C215)  //dont filter out
				$_l_CurrentRow:=$_l_CurrentRow+1
				QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$2; *)
				QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$_at_StockTypeRange{$_l_StockTypeIndex})
				PROD_at_ProductStockType{$_l_CurrentRow}:=$_at_ALLStockTypeNames{$_l_StockTypeRow}
				SELECTION TO ARRAY:C260([STOCK_LEVELS:58]Free_Level:3; $_ar_SLFreeLevel; [STOCK_LEVELS:58]Allocated_Level:4; $_ar_SLAllocatedLevel; [STOCK_LEVELS:58]Free_Cost:5; $_ar_SLFreeCost; [STOCK_LEVELS:58]Allocated_Cost:6; $_ar_SLAllocatedCost; [STOCK_LEVELS:58]Analysis_Code:7; $_at_SLAnalysisCode)
				PROD_ar_ProductStockFREEQTY{$_l_CurrentRow}:=0
				PROD_ar_ProductStockALLOCQTY{$_l_CurrentRow}:=0
				PROD_ar_ProductStockFREEValue{$_l_CurrentRow}:=0
				PROD_ar_ProductStockALLOCValue{$_l_CurrentRow}:=0
				PROD_ar_ProductStockFREEQTY{$_l_CurrentRow}:=Sum:C1($_ar_SLFreeLevel)
				PROD_ar_ProductStockALLOCQTY{$_l_CurrentRow}:=Sum:C1($_ar_SLAllocatedLevel)
				PROD_ar_ProductStockFREEValue{$_l_CurrentRow}:=Sum:C1($_ar_SLFreeCost)
				PROD_ar_ProductStockALLOCValue{$_l_CurrentRow}:=Sum:C1($_ar_SLAllocatedCost)
				PROD_r_ProdStockFREEQTY_Total:=PROD_r_ProdStockFREEQTY_Total+PROD_ar_ProductStockFREEQTY{$_l_CurrentRow}
				PROD_r_ProdStockALLOCQTY_Total:=PROD_r_ProdStockALLOCQTY_Total+PROD_ar_ProductStockALLOCQTY{$_l_CurrentRow}
			End if 
		End if 
		
	End for 
	
	ARRAY TEXT:C222(PROD_at_ProductStockType; $_l_CurrentRow)
	ARRAY REAL:C219(PROD_ar_ProductStockFREEQTY; $_l_CurrentRow)
	ARRAY REAL:C219(PROD_ar_ProductStockFREEValue; $_l_CurrentRow)
	ARRAY REAL:C219(PROD_ar_ProductStockALLOCQTY; $_l_CurrentRow)
	ARRAY REAL:C219(PROD_ar_ProductStockALLOCValue; $_l_CurrentRow)
	
Else 
	//its a  new product!
End if 
If ($_bo_SetVariables)
	LB_SetupListbox(->Prod_LB_Stock; "oStock"; "Stock_L"; 1; ->PROD_at_ProductStockType; ->PROD_ar_ProductStockFREEQTY; ->PROD_ar_ProductStockFREEValue; ->PROD_ar_ProductStockALLOCQTY; ->PROD_ar_ProductStockALLOCValue)
	LB_SetColumnHeaders(->Prod_LB_Stock; "Stock_L"; 1; "Stock Type"; "Free QTY"; "Value"; "Allocated QTY"; "Value")
	LB_SetColumnWidths(->Prod_LB_Stock; "oStock"; 1; 188; 50; 60; 50; 60)  // dont need to worry about the invisible ones
	LB_SetScroll(->Prod_LB_Stock; -2; -2)
	OBJECT SET FORMAT:C236(PROD_ar_ProductStockFREEQTY; "######0")
	OBJECT SET FORMAT:C236(PROD_ar_ProductStockFREEValue; "######0")
	OBJECT SET FORMAT:C236(PROD_ar_ProductStockALLOCValue; "######0")
	OBJECT SET FORMAT:C236(PROD_ar_ProductStockALLOCQTY; "######0")
	LB_StyleSettings(->Prod_LB_Stock; "Black"; 9; "stock"; ->[PRODUCTS:9])
	
End if 
ERR_MethodTrackerReturn("PROD_LoadCurrentStock"; $_t_oldMethodName)

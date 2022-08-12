//%attributes = {}
If (False:C215)
	//Project Method Name:      CAT_LoadProdStock
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_Filter; 0)
	ARRAY REAL:C219($_ar_AllocatedCosts; 0)
	ARRAY REAL:C219($_ar_AllocatedLevels; 0)
	ARRAY REAL:C219($_ar_FreeCosts; 0)
	ARRAY REAL:C219($_ar_FreeLevels; 0)
	//ARRAY REAL(CAT_ar_ProdStockALLOCQTY;0)
	//ARRAY REAL(CAT_ar_ProdStockALLOCValue;0)
	//ARRAY REAL(CAT_ar_ProdStockFREEQTY;0)
	//ARRAY REAL(CAT_ar_ProdStockFREEValue;0)
	ARRAY TEXT:C222($_at_AllStockTypeCodes; 0)
	ARRAY TEXT:C222($_at_AllStockTypeNames; 0)
	ARRAY TEXT:C222($_at_AnalysisCodes; 0)
	ARRAY TEXT:C222($_at_StockTypeRange; 0)
	//ARRAY TEXT(CAT_at_ProdStockTypeCodes;0)
	//ARRAY TEXT(CAT_at_ProductStockTypeNames;0)
	C_LONGINT:C283($_l_Element; $_l_Index; $_l_index2; $_l_StockTypeRow)
	C_REAL:C285($1; CAT_r_ProdStockALLOCQTY_Total; CAT_r_ProdStockFREEQTY_Total)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAT_LoadProdStock")
//pass this method a Product ID and Prod Code
//(we will eventually link the stock by ID)
ARRAY TEXT:C222(CAT_at_ProdStockTypeCodes; 0)
ARRAY TEXT:C222(CAT_at_ProductStockTypeNames; 0)
ARRAY REAL:C219(CAT_ar_ProdStockFREEQTY; 0)
ARRAY REAL:C219(CAT_ar_ProdStockFREEValue; 0)
ARRAY REAL:C219(CAT_ar_ProdStockALLOCQTY; 0)
ARRAY REAL:C219(CAT_ar_ProdStockALLOCValue; 0)
CAT_r_ProdStockFREEQTY_Total:=0
CAT_r_ProdStockALLOCQTY_Total:=0
If ($1>0)
	ALL RECORDS:C47([STOCK_TYPES:59])
	ARRAY TEXT:C222($_at_AllStockTypeCodes; 0)
	ARRAY TEXT:C222($_at_AllStockTypeNames; 0)
	ARRAY BOOLEAN:C223($_abo_Filter; 0)
	SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; $_at_AllStockTypeCodes; [STOCK_TYPES:59]Type_Name:2; $_at_AllStockTypeNames; [STOCK_TYPES:59]FilterOut:9; $_abo_Filter)
	QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$2)
	ARRAY TEXT:C222($_at_StockTypeRange; 0)
	DISTINCT VALUES:C339([STOCK_LEVELS:58]Stock_Type:2; $_at_StockTypeRange)
	ARRAY TEXT:C222(CAT_at_ProdStockTypeCodes; Size of array:C274($_at_StockTypeRange))
	ARRAY TEXT:C222(CAT_at_ProductStockTypeNames; Size of array:C274($_at_StockTypeRange))
	ARRAY REAL:C219(CAT_ar_ProdStockFREEQTY; Size of array:C274($_at_StockTypeRange))
	ARRAY REAL:C219(CAT_ar_ProdStockFREEValue; Size of array:C274($_at_StockTypeRange))
	ARRAY REAL:C219(CAT_ar_ProdStockALLOCQTY; Size of array:C274($_at_StockTypeRange))
	ARRAY REAL:C219(CAT_ar_ProdStockALLOCValue; Size of array:C274($_at_StockTypeRange))
	$_l_Element:=0
	For ($_l_Index; 1; Size of array:C274($_at_StockTypeRange))
		$_l_StockTypeRow:=Find in array:C230($_at_AllStockTypeCodes; $_at_StockTypeRange{$_l_Index})
		If ($_l_StockTypeRow>0)
			If ($_abo_Filter{$_l_StockTypeRow}=False:C215)  //dont filter out
				$_l_Element:=$_l_Element+1
				QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$2; *)
				QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$_at_StockTypeRange{$_l_Index})
				CAT_at_ProdStockTypeCodes{$_l_Element}:=$_at_StockTypeRange{$_l_Index}
				CAT_at_ProductStockTypeNames{$_l_Element}:=$_at_AllStockTypeNames{$_l_StockTypeRow}
				SELECTION TO ARRAY:C260([STOCK_LEVELS:58]Free_Level:3; $_ar_FreeLevels; [STOCK_LEVELS:58]Allocated_Level:4; $_ar_AllocatedLevels; [STOCK_LEVELS:58]Free_Cost:5; $_ar_FreeCosts; [STOCK_LEVELS:58]Allocated_Cost:6; $_ar_AllocatedCosts; [STOCK_LEVELS:58]Analysis_Code:7; $_at_AnalysisCodes)
				CAT_ar_ProdStockFREEQTY{$_l_Element}:=0
				CAT_ar_ProdStockALLOCQTY{$_l_Element}:=0
				CAT_ar_ProdStockFREEValue{$_l_Element}:=0
				CAT_ar_ProdStockALLOCValue{$_l_Element}:=0
				For ($_l_index2; 1; Size of array:C274($_ar_FreeLevels))
					CAT_ar_ProdStockFREEQTY{$_l_Element}:=CAT_ar_ProdStockFREEQTY{$_l_Element}+$_ar_FreeLevels{$_l_index2}
					CAT_ar_ProdStockALLOCQTY{$_l_Element}:=CAT_ar_ProdStockALLOCQTY{$_l_Element}+$_ar_AllocatedLevels{$_l_index2}
					CAT_ar_ProdStockFREEValue{$_l_Element}:=CAT_ar_ProdStockFREEValue{$_l_Element}+$_ar_FreeCosts{$_l_index2}
					CAT_ar_ProdStockALLOCValue{$_l_Element}:=CAT_ar_ProdStockALLOCValue{$_l_Element}+$_ar_FreeCosts{$_l_index2}
					
				End for 
				CAT_r_ProdStockFREEQTY_Total:=CAT_r_ProdStockFREEQTY_Total+CAT_ar_ProdStockFREEQTY{$_l_Element}
				CAT_r_ProdStockALLOCQTY_Total:=CAT_r_ProdStockALLOCQTY_Total+CAT_ar_ProdStockALLOCQTY{$_l_Element}
			End if 
		End if 
		
	End for 
	ARRAY TEXT:C222(CAT_at_ProdStockTypeCodes; $_l_Element)
	ARRAY TEXT:C222(CAT_at_ProductStockTypeNames; $_l_Element)
	ARRAY REAL:C219(CAT_ar_ProdStockFREEQTY; $_l_Element)
	ARRAY REAL:C219(CAT_ar_ProdStockFREEValue; $_l_Element)
	ARRAY REAL:C219(CAT_ar_ProdStockALLOCQTY; $_l_Element)
	ARRAY REAL:C219(CAT_ar_ProdStockALLOCValue; $_l_Element)
	
Else 
	//its a  new product!
End if 
ERR_MethodTrackerReturn("CAT_LoadProdStock"; $_t_oldMethodName)
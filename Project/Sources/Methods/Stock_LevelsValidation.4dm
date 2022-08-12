//%attributes = {}
If (False:C215)
	//Project Method Name:      Stock_LevelsValidation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ValueUsed; 0)
	ARRAY REAL:C219($_ar_2DCurrentStockAnal; 0; 0)
	//ARRAY REAL(STK_ar_AnalysisQuantity;0)
	ARRAY TEXT:C222($_at_AllAnalysisCodes; 0)
	ARRAY TEXT:C222($_at_AllCurrencies; 0)
	ARRAY TEXT:C222($_at_AllCurrencyCodes; 0)
	ARRAY TEXT:C222($_at_AllLayers; 0)
	ARRAY TEXT:C222($_at_AllLocations; 0)
	ARRAY TEXT:C222($_at_AllStockTypes; 0)
	ARRAY TEXT:C222($_at_ASlevProdCodes; 0)
	ARRAY TEXT:C222($_at_CSProductCodes; 0)
	ARRAY TEXT:C222($_at_SIProductCodes; 0)
	C_LONGINT:C283($_l_AnalysisCodeIndex; $_l_ConstructRow; $_l_CurrentElement; $_l_Index; $_l_Index2; $_l_Index3; $_l_LayersIndex; $_l_LocationRow; $_l_ProductIndex; $_l_StocktypesIndex)
	C_REAL:C285($_l_ProductCount)
	C_TEXT:C284($_t_AnalysisCode; $_t_ConstructUniqueValue; $_t_CurrencyCode; $_t_LayerCode; $_t_MovementTypeStockAdd; $_t_MovementTypeStockSubtract; $_t_oldMethodName; $_t_ProductCode; $_t_StockType; $_t_TypeADD; $_t_TypeSubtract)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Stock_LevelsValidation")
$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT")
ALL RECORDS:C47([PRODUCTS:9])
FIRST RECORD:C50([PRODUCTS:9])
READ WRITE:C146([CURRENT_STOCK:62])
READ WRITE:C146([STOCK_LEVELS:58])
CONFIRM:C162("Rebuild Constructs")
If (OK=1)
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]UniqueConstruct:14#"")
	If (Not:C34(In transaction:C397))
		DB_lockFile(->[CURRENT_STOCK:62])
		APPLY TO SELECTION:C70([CURRENT_STOCK:62]; [CURRENT_STOCK:62]UniqueConstruct:14:="")
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[CURRENT_STOCK:62]))
	Else 
		
		FIRST RECORD:C50([CURRENT_STOCK:62])
		For ($_l_Index; 1; Records in selection:C76([CURRENT_STOCK:62]))
			[CURRENT_STOCK:62]UniqueConstruct:14:=""
			DB_SaveRecord(->[CURRENT_STOCK:62])
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[CURRENT_STOCK:62]))
			NEXT RECORD:C51([CURRENT_STOCK:62])
		End for 
	End if 
	
	
	QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]UniqueConstruct:11#"")
	If (Not:C34(In transaction:C397))
		DB_lockFile(->[STOCK_LEVELS:58])
		APPLY TO SELECTION:C70([STOCK_LEVELS:58]; [STOCK_LEVELS:58]UniqueConstruct:11:="")
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[STOCK_LEVELS:58]))
	Else 
		
		FIRST RECORD:C50([STOCK_LEVELS:58])
		For ($_l_Index; 1; Records in selection:C76([STOCK_LEVELS:58]))
			
			[STOCK_LEVELS:58]UniqueConstruct:11:=""
			DB_SaveRecord(->[STOCK_LEVELS:58])
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[STOCK_LEVELS:58]))
			NEXT RECORD:C51([STOCK_LEVELS:58])
		End for 
	End if 
	
End if 
//`````
SEND PACKET:C103($_ti_DocumentRef; "Stock Analysis"+Char:C90(13))
SEND PACKET:C103($_ti_DocumentRef; "Product Code"+Char:C90(9)+"Stock Movement Number"+Char:C90(9)+"Add to stock type"+Char:C90(9))
SEND PACKET:C103($_ti_DocumentRef; "Subtract from stock type"+Char:C90(9)+"QTY"+Char:C90(9)+Char:C90(9)+"Calculated Stock level"+Char:C90(9)+"Current Stored Record Level"+Char:C90(9))
SEND PACKET:C103($_ti_DocumentRef; "Calculated Current Stock"+Char:C90(9)+"Stored Current Stock"+Char:C90(13))


CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "$SiTested")
ARRAY TEXT:C222($_at_AllStockTypes; 0)
ARRAY TEXT:C222($_at_AllAnalysisCodes; 0)
ARRAY TEXT:C222($_at_AllCurrencyCodes; 0)
ARRAY TEXT:C222($_at_AllLayers; 0)
ALL RECORDS:C47([STOCK_TYPES:59])
ALL RECORDS:C47([CURRENT_STOCK:62])
DISTINCT VALUES:C339([CURRENT_STOCK:62]Product_Code:1; $_at_CSProductCodes)
ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_SIProductCodes)
ALL RECORDS:C47([STOCK_LEVELS:58])
DISTINCT VALUES:C339([STOCK_LEVELS:58]Product_Code:1; $_at_ASlevProdCodes)
CREATE EMPTY SET:C140([PRODUCTS:9]; "$ProdToTest")
For ($_l_ProductIndex; 1; Size of array:C274($_at_CSProductCodes))
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_at_CSProductCodes{$_l_ProductIndex})
	ADD TO SET:C119([PRODUCTS:9]; "$ProdToTest")
End for 

For ($_l_ProductIndex; 1; Size of array:C274($_at_SIProductCodes))
	$_l_ConstructRow:=Find in array:C230($_at_CSProductCodes; $_at_SIProductCodes{$_l_ProductIndex})
	If ($_l_ConstructRow<0)
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_at_SIProductCodes{$_l_ProductIndex})
		ADD TO SET:C119([PRODUCTS:9]; "$ProdToTest")
	End if 
End for 
USE SET:C118("$ProdToTest")
CREATE SET:C116([PRODUCTS:9]; "$pALL")

For ($_l_ProductIndex; 1; Size of array:C274($_at_ASlevProdCodes))
	$_l_ConstructRow:=Find in array:C230($_at_CSProductCodes; $_at_ASlevProdCodes{$_l_ProductIndex})
	If ($_l_ConstructRow<0)
		$_l_ConstructRow:=Find in array:C230($_at_SIProductCodes; $_at_ASlevProdCodes{$_l_ProductIndex})
		If ($_l_ConstructRow<0)
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_at_ASlevProdCodes{$_l_ProductIndex})
			ADD TO SET:C119([PRODUCTS:9]; "$ProdToTest")
		End if 
	End if 
	
	
End for 
USE SET:C118("$ProdToTest")
CREATE SET:C116([PRODUCTS:9]; "$pALL")
SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; $_at_AllStockTypes)
ALL RECORDS:C47([ANALYSES:36])
ALL RECORDS:C47([CURRENCIES:71])
QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Analysis_Code:9#"")

DISTINCT VALUES:C339([STOCK_MOVEMENTS:40]Analysis_Code:9; $_at_AllAnalysisCodes)

QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Analysis_Code:9#"")
DISTINCT VALUES:C339([STOCK_MOVEMENTS:40]Analysis_Code:9; $_at_AllAnalysisCodes)
INSERT IN ARRAY:C227($_at_AllAnalysisCodes; Size of array:C274($_at_AllAnalysisCodes)+1; 1)  // blank one
QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Layer_Code:11#"")
DISTINCT VALUES:C339([STOCK_MOVEMENTS:40]Layer_Code:11; $_at_AllLayers)
INSERT IN ARRAY:C227($_at_AllLayers; Size of array:C274($_at_AllLayers)+1; 1)  // blank one
QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Currency_Code:10#"")
DISTINCT VALUES:C339([STOCK_MOVEMENTS:40]Currency_Code:10; $_at_AllCurrencies)
INSERT IN ARRAY:C227($_at_AllCurrencies; Size of array:C274($_at_AllCurrencies)+1; 1)  // blank one
ARRAY TEXT:C222($_at_AllAnalysisCodes; Size of array:C274($_at_AllCurrencies)*Size of array:C274($_at_AllLayers)*Size of array:C274($_at_AllStockTypes)*Size of array:C274($_at_AllAnalysisCodes))
$_l_CurrentElement:=0
For ($_l_ProductIndex; 1; Size of array:C274($_at_AllCurrencies))
	$_t_CurrencyCode:=" "*(6-Length:C16($_at_AllCurrencies{$_l_ProductIndex}))+$_at_AllCurrencies{$_l_ProductIndex}
	For ($_l_LayersIndex; 1; Size of array:C274($_at_AllLayers))
		$_t_LayerCode:=" "*(6-Length:C16($_at_AllLayers{$_l_LayersIndex}))+$_at_AllLayers{$_l_LayersIndex}
		For ($_l_StocktypesIndex; 1; Size of array:C274($_at_AllStockTypes))
			$_t_StockType:=" "*(6-Length:C16($_at_AllStockTypes{$_l_StocktypesIndex}))+$_at_AllStockTypes{$_l_StocktypesIndex}
			For ($_l_AnalysisCodeIndex; 1; Size of array:C274($_at_AllAnalysisCodes))
				$_t_AnalysisCode:=" "*(6-Length:C16($_at_AllAnalysisCodes{$_l_AnalysisCodeIndex}))+$_at_AllAnalysisCodes{$_l_AnalysisCodeIndex}
				$_l_CurrentElement:=$_l_CurrentElement+1
				$_at_AllAnalysisCodes{$_l_CurrentElement}:=$_t_CurrencyCode+$_t_LayerCode+$_t_StockType+$_t_AnalysisCode
			End for 
		End for 
	End for 
End for 
SORT ARRAY:C229($_at_AllAnalysisCodes)

ARRAY REAL:C219(STK_ar_AnalysisQuantity; 0)
ARRAY REAL:C219($_ar_2DCurrentStockAnal; 0; 0)
//current stock is 2 d for locations
ALL RECORDS:C47([LOCATIONS:61])
ARRAY TEXT:C222($_at_AllLocations; 0)
SELECTION TO ARRAY:C260([LOCATIONS:61]Location_Code:1; $_at_AllLocations)
SORT ARRAY:C229($_at_AllLocations)

INSERT IN ARRAY:C227($_at_AllLocations; 9999; 1)  //blANK ONE
USE SET:C118("$pALL")
$_l_ProductCount:=Records in selection:C76([PRODUCTS:9])
//TRACE
Open window:C153(20; 60; 400; 600; -1984)
For ($_l_ProductIndex; 1; $_l_ProductCount)
	
	ARRAY REAL:C219(STK_ar_AnalysisQuantity; 0)
	ARRAY REAL:C219($_ar_2DCurrentStockAnal; 0; 0)
	ARRAY REAL:C219(STK_ar_AnalysisQuantity; Size of array:C274($_at_AllAnalysisCodes))
	ARRAY REAL:C219($_ar_2DCurrentStockAnal; Size of array:C274($_at_AllAnalysisCodes); Size of array:C274($_at_AllLocations))
	ARRAY LONGINT:C221($_al_ValueUsed; 0)
	ARRAY LONGINT:C221($_al_ValueUsed; Size of array:C274($_at_AllAnalysisCodes))
	//THIS IS TO TRACK WHAT IS USED-FOR OUTPUT
	
	
	
	
	USE SET:C118("$pALL")
	GOTO SELECTED RECORD:C245([PRODUCTS:9]; $_l_ProductIndex)
	$_t_ProductCode:=[PRODUCTS:9]Product_Code:1
	SEND PACKET:C103($_ti_DocumentRef; Char:C90(13)+$_t_ProductCode+Char:C90(13))
	ERASE WINDOW:C160
	MESSAGE:C88("Product"+String:C10($_l_ProductIndex)+" of "+String:C10($_l_ProductCount)+":"+[PRODUCTS:9]Product_Name:2)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=[PRODUCTS:9]Product_Code:1)
	
	If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
		CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$Related")
		RELATE ONE SELECTION:C349([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENTS:40])
		ORDER BY:C49([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Date:5)
		FIRST RECORD:C50([STOCK_MOVEMENTS:40])
		For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENTS:40]))
			GOTO XY:C161(0; 2)
			MESSAGE:C88([STOCK_MOVEMENTS:40]Movement_Code:1+":"+[STOCK_MOVEMENTS:40]Movement_Type:6)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
			CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$ThisMovement")
			INTERSECTION:C121("$Related"; "$ThisMovement"; "$ThisMovement")
			DIFFERENCE:C122("$ThisMovement"; "$SiTested"; "$ThisMovement")
			//above line is just to make ceratin never test twice
			UNION:C120("$SiTested"; "$ThisMovement"; "$SiTested")
			USE SET:C118("$ThisMovement")
			//this is probably only one record
			ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Date_Received:5)
			FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
			SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+"("+[STOCK_MOVEMENTS:40]Movement_Type:6+")")
			If ([STOCK_MOVEMENTS:40]Movement_Code:1#[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
				QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
			End if 
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
			$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Plus:3
			$_t_MovementTypeStockSubtract:=[MOVEMENT_TYPES:60]Stock_Minus:4
			
			//now we are going to work out what the stock level would have been after that mov
			//and work out what the current stock would have bben
			For ($_l_Index2; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
				//$_l_Process:=New process("STK_getstockitemthread";DB_ProcessMemoryinit(1);"Find Stock Movement Thread";[STOCK ITEMS]Product Code;[STOCK MOVEMENTS]Currency Code;[STOCK MOVEMENTS]Layer Code
				
				If ($_l_Index2>1)
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9))
				End if 
				GOTO XY:C161(0; 3)
				MESSAGE:C88([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+" "+String:C10($_l_Index2))
				
				
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+$_t_MovementTypeStockAdd+Char:C90(9)+$_t_MovementTypeStockSubtract+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(13))
				//what will the current stock record for this be
				$_t_CurrencyCode:=" "*(6-Length:C16([STOCK_MOVEMENTS:40]Currency_Code:10))+[STOCK_MOVEMENTS:40]Currency_Code:10
				$_t_LayerCode:=" "*(6-Length:C16([STOCK_MOVEMENTS:40]Layer_Code:11))+[STOCK_MOVEMENTS:40]Layer_Code:11
				$_t_TypeADD:=" "*(6-Length:C16($_t_MovementTypeStockAdd))+$_t_MovementTypeStockAdd
				$_t_TypeSubtract:=" "*(6-Length:C16($_t_MovementTypeStockSubtract))+$_t_MovementTypeStockSubtract
				$_t_AnalysisCode:=" "*(6-Length:C16([STOCK_MOVEMENTS:40]Analysis_Code:9))+[STOCK_MOVEMENTS:40]Analysis_Code:9
				$_t_ConstructUniqueValue:=$_t_CurrencyCode+$_t_LayerCode+$_t_TypeADD+$_t_AnalysisCode
				
				
				If ($_t_MovementTypeStockAdd#"")
					
					$_l_ConstructRow:=Find in array:C230($_at_AllAnalysisCodes; $_t_ConstructUniqueValue)
					
					If ($_l_ConstructRow<0)
						//TRACE
					Else 
						If ($_al_ValueUsed{$_l_ConstructRow}=0)
							READ WRITE:C146([STOCK_LEVELS:58])
							QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_t_ProductCode; *)
							QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$_t_MovementTypeStockAdd; *)
							QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=[STOCK_MOVEMENTS:40]Analysis_Code:9; *)
							QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Currency_Code:8=[STOCK_MOVEMENTS:40]Currency_Code:10; *)
							QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Layer_Code:9=[STOCK_MOVEMENTS:40]Layer_Code:11)
							If (Records in selection:C76([STOCK_LEVELS:58])>=1)
								[STOCK_LEVELS:58]UniqueConstruct:11:=$_t_ProductCode+$_t_ConstructUniqueValue
								DB_SaveRecord(->[STOCK_LEVELS:58])
								AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
								
							End if 
						End if 
						
						STK_ar_AnalysisQuantity{$_l_ConstructRow}:=STK_ar_AnalysisQuantity{$_l_ConstructRow}+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
						$_l_LocationRow:=Find in array:C230($_at_AllLocations; [STOCK_MOVEMENT_ITEMS:27]Location:7)
						If ($_l_LocationRow<0)
						Else 
							$_ar_2DCurrentStockAnal{$_l_ConstructRow}{$_l_LocationRow}:=$_ar_2DCurrentStockAnal{$_l_ConstructRow}{$_l_LocationRow}+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
							If ($_al_ValueUsed{$_l_ConstructRow}=0)
								
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_ProductCode; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_t_MovementTypeStockAdd; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=[STOCK_MOVEMENTS:40]Analysis_Code:9; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=[STOCK_MOVEMENTS:40]Currency_Code:10; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=[STOCK_MOVEMENTS:40]Layer_Code:11; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Location:8=[STOCK_MOVEMENT_ITEMS:27]Location:7)
								If (Records in selection:C76([CURRENT_STOCK:62])>0)
									DB_lockFile(->[CURRENT_STOCK:62])
									APPLY TO SELECTION:C70([CURRENT_STOCK:62]; [CURRENT_STOCK:62]UniqueConstruct:14:=$_t_ProductCode+$_t_ConstructUniqueValue+(" "*(6-Length:C16([STOCK_MOVEMENT_ITEMS:27]Location:7)))+[STOCK_MOVEMENT_ITEMS:27]Location:7)
									
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[CURRENT_STOCK:62]))
									//   DB_SaveRecord(->[CURRENT STOCK])
									AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
								End if 
							End if 
							$_al_ValueUsed{$_l_ConstructRow}:=1
						End if 
						
					End if 
				End if 
				If ($_t_MovementTypeStockSubtract#"")
					$_t_ConstructUniqueValue:=$_t_CurrencyCode+$_t_LayerCode+$_t_TypeSubtract+$_t_AnalysisCode
					READ WRITE:C146([STOCK_LEVELS:58])
					
					
					$_l_ConstructRow:=Find in array:C230($_at_AllAnalysisCodes; $_t_ConstructUniqueValue)
					If ($_l_ConstructRow<0)
						//TRACE
					Else 
						STK_ar_AnalysisQuantity{$_l_ConstructRow}:=STK_ar_AnalysisQuantity{$_l_ConstructRow}-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
						If ($_al_ValueUsed{$_l_ConstructRow}=0)
							QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_t_ProductCode; *)
							QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$_t_MovementTypeStockSubtract; *)
							QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=[STOCK_MOVEMENTS:40]Analysis_Code:9; *)
							QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Currency_Code:8=[STOCK_MOVEMENTS:40]Currency_Code:10; *)
							QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Layer_Code:9=[STOCK_MOVEMENTS:40]Layer_Code:11)
							If (Records in selection:C76([STOCK_LEVELS:58])>=1)
								[STOCK_LEVELS:58]UniqueConstruct:11:=$_t_ProductCode+$_t_ConstructUniqueValue
								DB_SaveRecord(->[STOCK_LEVELS:58])
								AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
							End if 
						End if 
						
						$_l_LocationRow:=Find in array:C230($_at_AllLocations; [STOCK_MOVEMENT_ITEMS:27]Location:7)
						If ($_l_LocationRow<0)
						Else 
							$_ar_2DCurrentStockAnal{$_l_ConstructRow}{$_l_LocationRow}:=$_ar_2DCurrentStockAnal{$_l_ConstructRow}{$_l_LocationRow}-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
							If ($_al_ValueUsed{$_l_ConstructRow}=0)
								QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_ProductCode; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_t_MovementTypeStockSubtract; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=[STOCK_MOVEMENTS:40]Analysis_Code:9; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=[STOCK_MOVEMENTS:40]Currency_Code:10; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=[STOCK_MOVEMENTS:40]Layer_Code:11; *)
								QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Location:8=[STOCK_MOVEMENT_ITEMS:27]Location:7)
								If (Records in selection:C76([CURRENT_STOCK:62])>0)
									DB_lockFile(->[CURRENT_STOCK:62])
									APPLY TO SELECTION:C70([CURRENT_STOCK:62]; [CURRENT_STOCK:62]UniqueConstruct:14:=$_t_ProductCode+$_t_ConstructUniqueValue+[STOCK_MOVEMENT_ITEMS:27]Location:7)
									
									AA_CheckFileUnlockedByTableNUM(Table:C252(->[CURRENT_STOCK:62]))
									//   DB_SaveRecord(->[CURRENT STOCK])
									AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
								End if 
							End if 
							$_al_ValueUsed{$_l_ConstructRow}:=1
						End if 
						
					End if 
				End if 
				
				//what will the stock level record for this be
				NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
			End for 
			
			NEXT RECORD:C51([STOCK_MOVEMENTS:40])
			
		End for 
		
	Else 
		MESSAGE:C88("No MOVEMENTS")
		QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_t_ProductCode)
		For ($_l_Index2; 1; Records in selection:C76([STOCK_LEVELS:58]))
			SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+Char:C90(9)+Char:C90(9)+Char:C90(9)+Char:C90(9)+String:C10(0)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Level:3)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Level:4)+Char:C90(13))
			NEXT RECORD:C51([STOCK_LEVELS:58])
		End for 
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=[PRODUCTS:9]Product_Code:1)
		For ($_l_Index2; 1; Records in selection:C76([CURRENT_STOCK:62]))
			SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+Char:C90(9)+Char:C90(9)+Char:C90(9)+""+" "+[CURRENT_STOCK:62]Currency_Code:11+Char:C90(9)+Char:C90(9)+Char:C90(9)+Char:C90(9)+String:C10(0)+Char:C90(9)+String:C10([CURRENT_STOCK:62]Quantity:4)+Char:C90(13))
			NEXT RECORD:C51([STOCK_LEVELS:58])
		End for 
	End if 
	For ($_l_Index2; 1; Size of array:C274($_al_ValueUsed))
		If ($_al_ValueUsed{$_l_Index2}>=1)
			QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]UniqueConstruct:11=$_t_ProductCode+$_at_AllAnalysisCodes{$_l_Index2})
			SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+Char:C90(9)+Char:C90(9)+Char:C90(9)+$_at_AllAnalysisCodes{$_l_Index2}+Char:C90(9)+String:C10(STK_ar_AnalysisQuantity{$_l_Index2})+Char:C90(9)+String:C10([STOCK_LEVELS:58]Free_Level:3)+Char:C90(9)+String:C10([STOCK_LEVELS:58]Allocated_Level:4)+Char:C90(13))
			
		End if 
	End for 
	For ($_l_Index2; 1; Size of array:C274($_al_ValueUsed))
		For ($_l_Index3; 1; Size of array:C274($_at_AllLocations))
			If ($_al_ValueUsed{$_l_Index2}>=1)
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]UniqueConstruct:14=$_t_ProductCode+$_at_AllAnalysisCodes{$_l_Index2}+(" "*(6-Length:C16($_at_AllLocations{$_l_Index3})))+$_at_AllLocations{$_l_Index3})
				//   DB_SaveRecord(->[CURRENT STOCK])
				AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)  //+$_at_AllLocations{$_l_Index3})
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+Char:C90(9)+Char:C90(9)+Char:C90(9)+Char:C90(9)+$_at_AllAnalysisCodes{$_l_Index2}+" "+$_at_AllLocations{$_l_Index3}+Char:C90(9)+Char:C90(9)+Char:C90(9)+Char:C90(9)+String:C10($_ar_2DCurrentStockAnal{$_l_Index2}{$_l_Index3})+Char:C90(9)+String:C10(Sum:C1([CURRENT_STOCK:62]Quantity:4))+Char:C90(13))
				
			End if 
		End for 
		
	End for 
	
	
	
End for 
ERR_MethodTrackerReturn("Stock_LevelsValidation"; $_t_oldMethodName)

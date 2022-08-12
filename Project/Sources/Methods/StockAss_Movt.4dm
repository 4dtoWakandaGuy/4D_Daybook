//%attributes = {}
If (False:C215)
	//Project Method Name:      StockAss_Movt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  21/10/2010 13:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(StockAllocationUA)
	//C_UNKNOWN(vStockLevel)
	//C_UNKNOWN(vStockUA)
	ARRAY REAL:C219($_ar_Quantities; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_DATE:C307($_d_Date; $9; vDate)
	C_LONGINT:C283($_l_ComponentIndex; $_l_CountComponentsRecords; $_l_CountProductRecords; $_l_StockAllocationLevel; $_r_Allocate; $_r_Number; $_r_QuantityIndex; $_r_Required; $1; $3; $l)
	C_REAL:C285($_r_CanBuildQuantity; $_r_Quantity; $_r_StockAllocationTotalCost; $0; $4)
	C_TEXT:C284($_t_AnalysisCode; $_t_CallCode; $_t_CurrencyCode; $_t_LayerCode; $_t_oldMethodName; $_t_StockMovementType; $10; $2; $5; $6; $7)
	C_TEXT:C284($8; ACC_t_CurrencyCode; STK_t_AssTypeFrom; vAnalysis; vCallCode; vLayer; vType_)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss_Movt")
If (Count parameters:C259>=3)
	$_l_StockAllocationLevel:=$3
Else 
	$_l_StockAllocationLevel:=vStockLevel
End if 
If (Count parameters:C259>=4)
	$_r_StockAllocationTotalCost:=$4
Else 
	$_r_StockAllocationTotalCost:=vStockUA
End if 
If (Count parameters:C259>=5)
	$_t_StockMovementType:=$5
Else 
	$_t_StockMovementType:=vType_
End if 
If (Count parameters:C259>=6)
	$_t_AnalysisCode:=$6
Else 
	$_t_AnalysisCode:=vAnalysis
End if 
If (Count parameters:C259>=7)
	$_t_CurrencyCode:=$7
Else 
	$_t_CurrencyCode:=ACC_t_CurrencyCode
End if 
If (Count parameters:C259>=8)
	$_t_LayerCode:=$8
Else 
	$_t_LayerCode:=vLayer
End if 
If (Count parameters:C259>=9)
	$_d_Date:=$9
Else 
	$_d_Date:=vDate
End if 
If (Count parameters:C259>=10)
	$_t_CallCode:=$10
Else 
	$_t_CallCode:=vCallCode
End if 
$0:=0
If (Count parameters:C259>=2)
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$2)
	If (Records in selection:C76([PRODUCTS:9])=0)
		Gen_Alert("Product "+$2+" not found - the Assembly will be Cancelled"; "")
		OK:=0
	Else 
		
		$_l_CountProductRecords:=Record number:C243([PRODUCTS:9])
		$_r_Allocate:=0
		$0:=0
		$_l_CountComponentsRecords:=Records in selection:C76([COMPONENTS:86])
		ARRAY TEXT:C222($_at_ProductCodes; $_l_CountComponentsRecords)
		ARRAY REAL:C219($_ar_Quantities; 0)
		SELECTION TO ARRAY:C260([COMPONENTS:86]Component_Code:2; $_at_ProductCodes)
		SELECTION TO ARRAY:C260([COMPONENTS:86]Quantity:3; $_ar_Quantities)
		$_l_ComponentIndex:=1
		$_r_Quantity:=1
		$_r_CanBuildQuantity:=$1
		While (($_l_ComponentIndex<=$_l_CountComponentsRecords) & ($_r_Quantity>0) & (OK=1))
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_at_ProductCodes{$_l_ComponentIndex}; *)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=STK_t_AssTypeFrom; *)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0; *)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
			If (Vanalysis#"")
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=Vanalysis)
			End if 
			If (ACC_t_CurrencyCode#"")
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=ACC_t_CurrencyCode)
			End if 
			If (Vlayer#"")
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=Vlayer)
			End if 
			
			$_r_Quantity:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)
			If (False:C215)
				QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_at_ProductCodes{$_l_ComponentIndex}; *)
				QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=[MOVEMENT_TYPES:60]Stock_Minus:4; *)
				StockLev_ACLSr
			End if 
			//$l:=Sum([STOCK_LEVELS]Free Level)
			$_r_Required:=$1*$_ar_Quantities{$_l_ComponentIndex}
			
			If ($_r_Quantity>$_r_Required)
				$_r_Quantity:=$_r_Required
			Else 
				If ($_r_Quantity<$_r_Required)  //If not all available at this level
					If (vStockUA=0)
						StockAllocationUA:=999999999
					End if 
					//NOT convince this next line makes sence vStockUA was the total cost why would the level and the cost relate
					If (($_l_StockAllocationLevel<$_r_StockAllocationTotalCost) & ($_l_StockAllocationLevel<10))
						QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=$_at_ProductCodes{$_l_ComponentIndex})
						If (Records in selection:C76([COMPONENTS:86])>0)
							$_r_Number:=StockAss_Movt($_r_Required-$l; $_at_ProductCodes{$_l_ComponentIndex}; $_l_StockAllocationLevel+1; $_r_StockAllocationTotalCost; $_t_StockMovementType; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_d_Date; $_t_CallCode)
							
						End if 
					End if 
					
				End if 
			End if 
			If ($_r_Quantity<$_r_CanBuildQuantity)
				$_r_CanBuildQuantity:=$_r_Quantity
			End if 
			$_l_ComponentIndex:=$_l_ComponentIndex+1
		End while 
		If ($_r_CanBuildQuantity<$1) & (VstockLevel=1)
			Gen_Alert("Only a quantity of "+String:C10($_r_CanBuildQuantity)+" can be created from current stock holdings")
		End if 
		//Process the Movement
		If (OK=1)
			QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=$2)
			GOTO RECORD:C242([PRODUCTS:9]; $_l_CountProductRecords)
			If ([PRODUCTS:9]Serial_Numbered:17)
				$_r_QuantityIndex:=1
				While (($_r_QuantityIndex<$_r_CanBuildQuantity) & (OK=1))
					IDLE:C311  // 7/04/03 pb
					StockAss_Movt2("SN"; $_r_CanBuildQuantity; $1; $2; $_r_QuantityIndex; $_t_StockMovementType; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_d_Date; $_t_CallCode; $_l_StockAllocationLevel)
					
					
					$_r_QuantityIndex:=$_r_QuantityIndex+1
				End while 
			Else 
				StockAss_Movt2(""; $_r_CanBuildQuantity; 1; $2; 1; $_t_StockMovementType; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_d_Date; $_t_CallCode; $_l_StockAllocationLevel)
				
			End if 
			
			If (OK=1)
				$0:=$_r_CanBuildQuantity
			Else 
				$0:=0
			End if 
			
		End if 
	End if 
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("StockAss_Movt"; $_t_oldMethodName)

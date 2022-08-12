//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockAss_Movt2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/04/2010 11:49
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY REAL:C219($_ar_ComponentCosts; 0)
	ARRAY REAL:C219($_ar_ComponentQuantities; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_BOOLEAN:C305($_bo_Cancel; $_bo_Edits)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_Date; $10; vDate)
	C_LONGINT:C283($_l_AddMode; $_l_AddToCurrentStockID; $_l_BuildIndex; $_l_Clash; $_l_ComponentsIndex; $_l_CurrentStockIndex; $_l_ItemNumber; $_l_no2; $_l_RecordsinSelection; $_l_StockAllocationLevel; $_l_StockMOovementItemID)
	C_LONGINT:C283($_r_Number; $12; $2; $3; $5; ch1; r1; s1; Vadd; vNo; vStockLevel)
	C_REAL:C285($_r_CalledOffQuantity; $_r_QuantityRequired; $_r_Remaining; $_r_Sum; $_r_TotalComponentCost; $_r_TotalItemCost; $_r_TotalPurchaseCost)
	C_TEXT:C284($_l_SN; $_t_AddToStockType; $_t_AnalysisCode; $_t_CallCOde; $_t_ComponentName; $_t_CurrencyCode; $_t_CurrentOutputform; $_t_LayerCode; $_t_Location; $_t_MovementCode; $_t_oldMethodName)
	C_TEXT:C284($_t_SerialNumber; $_t_SN; $_t_StockAllocationLevel; $_t_StockLevel; $_t_StockMovementType; $1; $11; $4; $6; $7; $8)
	C_TEXT:C284($9; ACC_t_CurrencyCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; STK_t_AssTypeFrom; vAnalysis; vCallCode; vLayer; vStatus; vType_)
	C_TEXT:C284(WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss_Movt2")
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
$_t_ComponentName:=String:C10(vStockLevel)
If ($3>1)
	$_t_ComponentName:=$_t_ComponentName+" #"+String:C10($5)+" of "+String:C10($3)
End if 
If (Count parameters:C259>=6)
	$_t_StockMovementType:=$6
Else 
	$_t_StockMovementType:=vType_
End if 
If (Count parameters:C259>=7)
	$_t_AnalysisCode:=$7
Else 
	$_t_AnalysisCode:=vAnalysis
End if 
If (Count parameters:C259>=8)
	$_t_CurrencyCode:=$8
Else 
	$_t_CurrencyCode:=ACC_t_CurrencyCode
End if 
If (Count parameters:C259>=9)
	$_t_LayerCode:=$9
Else 
	$_t_LayerCode:=vLayer
End if 
If (Count parameters:C259>=10)
	$_d_Date:=$10
Else 
	$_d_Date:=vDate
End if 
If (Count parameters:C259>=11)
	$_t_CallCOde:=$11
Else 
	$_t_CallCOde:=vCallCode
End if 
If (Count parameters:C259>=12)
	$_l_StockAllocationLevel:=$12
Else 
	$_l_StockAllocationLevel:=vStockLevel
End if 
CREATE RECORD:C68([STOCK_MOVEMENTS:40])
Movement_CodeT
[STOCK_MOVEMENTS:40]Movement_Type:6:=$_t_StockMovementType
[STOCK_MOVEMENTS:40]Analysis_Code:9:=$_t_AnalysisCode
[STOCK_MOVEMENTS:40]Currency_Code:10:=$_t_CurrencyCode
[STOCK_MOVEMENTS:40]Layer_Code:11:=$_t_LayerCode
[STOCK_MOVEMENTS:40]Movement_Date:5:=$_d_Date
[STOCK_MOVEMENTS:40]Type_Number:4:="TBA"

If ($_t_CallCOde="")
	Repeat 
		$_t_MovementCode:=Substring:C12(String:C10(AA_GetNextIDinMethod(->[STOCK_MOVEMENTS:40]Movement_Code:1; Sequence number:C244([STOCK_MOVEMENTS:40]))); 1; 8)
		SET QUERY DESTINATION:C396(3; $_l_Clash)
		QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=$_t_MovementCode)
		SET QUERY DESTINATION:C396(0)
	Until ($_l_Clash=0)
	$_t_SN:=$_t_MovementCode
	$_t_CallCOde:=("0"*(8-Length:C16($_t_SN)))+$_t_SN+"/"
End if 
$_t_StockLevel:=Substring:C12(String:C10($_t_StockAllocationLevel); 1; 2)
[STOCK_MOVEMENTS:40]Assembly_Reference:12:=$_t_CallCOde+("0"*(2-Length:C16($_t_StockLevel)))+$_t_StockLevel
[STOCK_MOVEMENTS:40]Assembly_Qty:13:=$2

//The Assembled Item
SELECTION TO ARRAY:C260([COMPONENTS:86]Component_Code:2; $_at_ProductCodes)
SELECTION TO ARRAY:C260([COMPONENTS:86]Quantity:3; $_ar_ComponentQuantities)
ARRAY REAL:C219($_ar_ComponentCosts; 0)  //this is the cost for the component per $2
ARRAY REAL:C219($_ar_ComponentCosts; Size of array:C274($_at_ProductCodes))
For ($_l_ComponentsIndex; 1; Size of array:C274($_at_ProductCodes))
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_at_ProductCodes{$_l_ComponentsIndex}; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=STK_t_AssTypeFrom; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
	If ($_t_AnalysisCode#"")
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$_t_AnalysisCode)
	End if 
	If ($_t_CurrencyCode#"")
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$_t_CurrencyCode)
	End if 
	If ($_t_LayerCode#"")
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=$_t_LayerCode)
	End if 
	$_r_QuantityRequired:=$2*$_ar_ComponentQuantities{$_l_ComponentsIndex}
	ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26; >)
	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$BuildFrom")
	$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
	$_r_TotalComponentCost:=0
	For ($_l_BuildIndex; 1; $_l_RecordsinSelection)
		If ($_r_QuantityRequired>0)
			USE NAMED SELECTION:C332("$BuildFrom")
			GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_BuildIndex)
			If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>=$_r_QuantityRequired)
				$_r_CalledOffQuantity:=$_r_QuantityRequired
				$_r_QuantityRequired:=0
			Else 
				$_r_CalledOffQuantity:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
				$_r_QuantityRequired:=$_r_QuantityRequired-$_r_CalledOffQuantity
			End if 
			$_l_StockMOovementItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
			$_t_AddToStockType:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
			$_l_AddToCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
			$_t_CurrencyCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29
			$_t_AnalysisCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28
			$_t_LayerCode:=[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27
			$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]Location:7
			$_t_SerialNumber:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
			//[STOCK ITEMS]Serial No:=""
			STK_ItemDuplicate
			[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=False:C215
			[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30:=[STOCK_MOVEMENTS:40]Movement_Type:6
			[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
			[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=$_t_SerialNumber
			If ($_t_SerialNumber#"")
				[STOCK_MOVEMENT_ITEMS:27]xSerialNumberWasOnPrevious:33:=True:C214
			End if 
			//if copied trom an on order types then the
			[STOCK_MOVEMENT_ITEMS:27]Date_Shipped:6:=[STOCK_MOVEMENTS:40]Movement_Date:5
			If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
			End if 
			
			[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23:=0
			[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31
			[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
			[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:="N"  //This stock its being moved out of stock.
			[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43:=""
			[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=!00-00-00!
			[STOCK_MOVEMENT_ITEMS:27]x_SO_Item_Delivery_Reference:45:=""
			[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34:=$_t_Location
			[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41:=$_t_LayerCode
			[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:=[STOCK_MOVEMENTS:40]Layer_Code:11
			[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36:=$_t_CurrencyCode
			[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=[STOCK_MOVEMENTS:40]Currency_Code:10
			[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42:=$_t_AnalysisCode
			[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=[STOCK_MOVEMENTS:40]Analysis_Code:9
			[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
			[STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26:=[STOCK_MOVEMENTS:40]Movement_Date:5
			[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12  //Int($_r_Number/[COMPONENTS]Quantity)
			[STOCK_MOVEMENT_ITEMS:27]Component_Qty:15:=$_ar_ComponentQuantities{$_l_ComponentsIndex}
			[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
			STK_SetCreatedStockItem(0; $_r_CalledOffQuantity; $_l_StockMOovementItemID; 0)
			$_r_Remaining:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
			$_r_TotalItemCost:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12*[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
			$_r_TotalComponentCost:=$_r_TotalComponentCost+$_r_TotalItemCost
			
		Else 
			$_l_BuildIndex:=$_l_RecordsinSelection
		End if 
	End for 
	$_ar_ComponentCosts{$_l_ComponentsIndex}:=($_r_TotalComponentCost/$2)  //gives an average per assembly
End for 
$_r_TotalPurchaseCost:=Sum:C1($_ar_ComponentCosts{$_l_ComponentsIndex})



CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=$4
[STOCK_MOVEMENT_ITEMS:27]Date_Received:5:=[STOCK_MOVEMENTS:40]Movement_Date:5
//[STOCK ITEMS]Serial No:=`Auto-Serialiser
[STOCK_MOVEMENT_ITEMS:27]Company_To:2:="*PLUS"
[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$2
[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14:=$2
[STOCK_MOVEMENT_ITEMS:27]Component_Qty:15:=$3
$_bo_Edits:=STK_SetHeaderInfo
[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Plus:3
[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:="N"
[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=$_r_TotalPurchaseCost
[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*[STOCK_MOVEMENT_ITEMS:27]Quantity:12
[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)

If (OK=1)
	//The Components
	If (False:C215)
		FIRST RECORD:C50([COMPONENTS:86])
		While ((Not:C34(End selection:C36([COMPONENTS:86]))) & (OK=1))
			RELATE ONE:C42([COMPONENTS:86]Component_Code:2)
			$_r_Number:=($2*[COMPONENTS:86]Quantity:3)
			QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=[COMPONENTS:86]Component_Code:2; *)
			QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=[MOVEMENT_TYPES:60]Stock_Minus:4; *)
			QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=0; *)
			StockCurr_ACLSr(True:C214; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode)
			
			QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Quantity:4>0)
			
			If (r1=1)
				$_r_Sum:=0
				$_bo_Cancel:=False:C215
				While (($_r_Sum<$_r_Number) & ((OK=1) | ($_bo_Cancel=False:C215)))
					vStatus:=[MOVEMENT_TYPES:60]Stock_Minus:4
					If ([PRODUCTS:9]Serial_Numbered:17)
						Gen_Confirm("Components Selection Level "+$_t_ComponentName+Char:C90(13)+Char:C90(13)+"Please select "+String:C10($_r_Number)+" "+[COMPONENTS:86]Component_Code:2+" Items from "+Term_StoWT("Current Stock"))
					Else 
						Gen_Confirm("Components Selection Level "+$_t_ComponentName+Char:C90(13)+Char:C90(13)+"Please select "+[COMPONENTS:86]Component_Code:2+" "+Term_StoWT("Current Stock")+" Items with a total Quantity of at least "+String:C10($_r_Number))
					End if 
					If (OK=1)
						//Userset_Empty (->[CURRENT STOCK])
						$_t_CurrentOutputform:=WIN_t_CurrentOutputform
						If (False:C215)
							
							FORM SET OUTPUT:C54([CURRENT_STOCK:62]; "StockCurr Out")
							WIN_t_CurrentOutputform:="StockCurr Out"
							vNo:=Records in selection:C76([CURRENT_STOCK:62])
							Open_Pro_Window(Term_StoWT("Components Selection Level "+$_t_ComponentName); 0; 1; ->[CURRENT_STOCK:62]; WIN_t_CurrentOutputform)
							WIn_SetFormSize(1; ->[CURRENT_STOCK:62]; WIN_t_CurrentOutputform)
							//D`ISPLAY SELECTION([CURRENT STOCK];*)
							WIN_t_CurrentOutputform:=$_t_CurrentOutputform
							Close_ProWin(Table name:C256(->[CURRENT_STOCK:62])+"_"+WIN_t_CurrentOutputform)
							
							If (OK=1)
								CREATE SET:C116([CURRENT_STOCK:62]; "Master")
								Userset
								$_r_Sum:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
								If ($_r_Sum<$_r_Number)
									Gen_Alert("You have selected less than the required number of Current Stock Items"; "Try again")
									USE SET:C118("Master")
								End if 
								CLEAR SET:C117("Master")
							End if 
						Else 
							CREATE SET:C116([CURRENT_STOCK:62]; "$Master")
							$_bo_Cancel:=False:C215
							Repeat 
								USE SET:C118("$Master")
								DBI_MenuSelectRecords(Table name:C256(Table:C252(->[CURRENT_STOCK:62])); True:C214)
								
								
								$_r_Sum:=Sum:C1([CURRENT_STOCK:62]Quantity:4)
								If ($_r_Sum<$_r_Number)
									Gen_Confirm("You have selected less than the required number of Current Stock Items"; "Try again"; "Cancel")
									If (OK=0)
										REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
										$_bo_Cancel:=True:C214
									End if 
								End if 
							Until ($_r_Sum>=$_r_Number) | ($_bo_Cancel)
							
						End if 
					End if 
				End while 
			End if 
			If (OK=1)
				$_l_CurrentStockIndex:=1
				$_l_no2:=$_r_Number
				FIRST RECORD:C50([CURRENT_STOCK:62])
				While (($_l_CurrentStockIndex<=$_r_Number) & ($_l_no2>0) & (Not:C34(End selection:C36([CURRENT_STOCK:62]))))
					
					CREATE RECORD:C68([STOCK_MOVEMENT_ITEMS:27])
					[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11:=[STOCK_MOVEMENTS:40]Movement_Code:1
					
					[STOCK_MOVEMENT_ITEMS:27]Date_Received:5:=<>DB_d_CurrentDate
					[STOCK_MOVEMENT_ITEMS:27]Company_To:2:="*MINUS"
					[STOCK_MOVEMENT_ITEMS:27]Product_Code:1:=[COMPONENTS:86]Component_Code:2
					If ([PRODUCTS:9]Serial_Numbered:17)
						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=1
						$_l_CurrentStockIndex:=$_l_CurrentStockIndex+1
					Else 
						[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=[CURRENT_STOCK:62]Quantity:4
						If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12>$_l_no2)
							[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=$_l_no2
						End if 
						$_l_no2:=$_l_no2-[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					End if 
					[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9:=[CURRENT_STOCK:62]Stock_Number:7
					[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[CURRENT_STOCK:62]Cost_Price:6
					[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Round:C94(([CURRENT_STOCK:62]Cost_Price:6*[STOCK_MOVEMENT_ITEMS:27]Quantity:12); 2)
					[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4:=[CURRENT_STOCK:62]Serial_Number:2
					[STOCK_MOVEMENT_ITEMS:27]Location:7:=[CURRENT_STOCK:62]Location:8
					[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12  //Int($_r_Number/[COMPONENTS]Quantity)
					[STOCK_MOVEMENT_ITEMS:27]Component_Qty:15:=[COMPONENTS:86]Quantity:3
					[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					$_bo_Edits:=STK_SetHeaderInfo
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
					AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
					NEXT RECORD:C51([CURRENT_STOCK:62])
				End while 
			End if 
			
			NEXT RECORD:C51([COMPONENTS:86])
		End while 
	End if 
	
	If (OK=1)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Company_To:2="*MINUS")
		[STOCK_MOVEMENTS:40]Total_Cost:8:=Round:C94(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2)
		//QUERY([STOCK ITEMS];[STOCK ITEMS]Movement Code=[STOCK MOVEMENTS]Movement Code;*)
		//QUERY([STOCK ITEMS]; & ;[STOCK ITEMS]Company To="*PLUS")
		//[STOCK ITEMS]Total Cost:=[STOCK MOVEMENTS]Total Cost
		//If ([STOCK ITEMS]Quantity#0)
		//[STOCK ITEMS]Cost Price:=Round(([STOCK ITEMS]Total Cost/[STOCK ITEMS]Quantity);2)
	End if 
	//If ([STOCK ITEMS]x_ID=0)
	//[STOCK ITEMS]x_ID:=AA_GetNextIDinMethod (->[STOCK ITEMS]x_ID)
	//End if
	//DB_SaveRecord (->[STOCK ITEMS])
	//AA_CheckFileUnlocked (->[STOCK ITEMS]x_ID)
	DB_SaveRecord(->[STOCK_MOVEMENTS:40])
	
	If (OK=1)
		$_t_AnalysisCode:=vAnalysis
		$_t_CurrencyCode:=ACC_t_CurrencyCode
		$_t_LayerCode:=vLayer
		If ((s1=1) | ($1="SN")) & (False:C215)
			
			$_l_AddMode:=Vadd
			vAdd:=1
			DB_t_CurrentFormUsage:="NoACL"
			DBI_DisplayRecord(Current process:C322; Table:C252(->[STOCK_MOVEMENTS:40]); "Assembly Movement Level "+$_t_ComponentName; [STOCK_MOVEMENTS:40]Movement_Code:1)
			If (OK=1)
				If (ch1=1)
					Gen_Confirm("Level "+$_t_ComponentName+Char:C90(13)+Char:C90(13)+"Would you like to Print the Stock Movement?"; "Yes"; "No")
					If (OK=1)
						Movements_Prin2
					End if 
					OK:=1
				End if 
			Else 
				DELETE RECORD:C58([STOCK_MOVEMENTS:40])
			End if 
			Vadd:=$_l_AddMode
		Else 
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
			Movement_CodeUp
			If (OK=1)
				Move_InLPAPost
				If (OK=1)
					
					DB_SaveRecord(->[STOCK_MOVEMENTS:40])
					If (ch1=1)
						Gen_Confirm("Level "+$_t_ComponentName+Char:C90(13)+Char:C90(13)+"Would you like to Print the Stock Movement?"; "Yes"; "No")
						If (OK=1)
							Movements_Prin2
						End if 
						OK:=1
					End if 
				End if 
			Else 
				DELETE RECORD:C58([STOCK_MOVEMENTS:40])
			End if 
		End if 
		vAnalysis:=$_t_AnalysisCode
		ACC_t_CurrencyCode:=$_t_CurrencyCode
		vLayer:=$_t_LayerCode
	Else 
		DELETE RECORD:C58([STOCK_MOVEMENTS:40])
	End if 
	//End if
	
End if 
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("StockAss_Movt2"; $_t_oldMethodName)

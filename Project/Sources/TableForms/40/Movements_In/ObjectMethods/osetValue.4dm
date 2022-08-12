If (False:C215)
	//object Name: [STOCK_MOVEMENTS]Movements_in.osetValue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/02/2012 14:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	//ARRAY TEXT(STK_at_AnalysisCodes;0)
	//ARRAY TEXT(STK_at_CurrencyCodes;0)
	//ARRAY TEXT(STK_at_LayerCodes;0)
	//ARRAY TEXT(STK_at_LocationCodes;0)
	C_BOOLEAN:C305($_bo_Continue; STK_but_WriteDown)
	C_LONGINT:C283($_l_Index)
	C_REAL:C285($_r_AmountNUM; $_r_Percentage; $_r_PercentageNUM; $_r_TakeOff)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AmountSTR; $_t_NewAnalysis; $_t_NewCurrency; $_t_NewLayer; $_t_NewLocation; $_t_oldMethodName; $_t_PercentageSTR)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENTS].Movements_in.osetValue"; Form event code:C388)
If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
End if 
If (LBi_FindLines(->STK_aptr_ItemPreferences))
	Gen_Confirm("Apply to selected Records"; "Yes"; "All")
	If (OK=1)
		
		COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$toapply")
	Else 
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
		COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$toapply")
	End if 
Else 
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
	COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$toapply")
End if 

Case of 
	: ([MOVEMENT_TYPES:60]UseForValueChange:28=True:C214)
		$_r_PercentageNUM:=0
		$_r_AmountNUM:=0
		$_bo_Continue:=False:C215
		Gen_Confirm("This will set the new cost price on all the items, do you wish to set by % or by actual cost"; "Percentage"; "Cost")
		
		If (OK=1)
			$_bo_Continue:=True:C214
			$_t_PercentageSTR:=Gen_Request("Please Enter the Percentage  to write down"; "-100")
			If ($_t_PercentageSTR#"")
				$_r_PercentageNUM:=Num:C11($_t_PercentageSTR)
				If ($_r_PercentageNUM#0)
					If ($_r_PercentageNUM>0)
						Gen_Confirm("Do you wish to increase or decrease the cost by "+$_t_PercentageSTR+"%"; "Increase"; "Decrease")
						If (OK=0)
							$_r_PercentageNUM:=-($_r_PercentageNUM)
						End if 
						OK:=1
					End if 
				Else 
					$_bo_Continue:=False:C215
					
				End if 
			Else 
				$_bo_Continue:=False:C215
				
			End if 
			
		Else 
			$_bo_Continue:=True:C214
			$_t_AmountSTR:=Gen_Request("Please Enter the new cost value for all items on this movement")
			If ($_t_AmountSTR#"")
				$_r_AmountNUM:=Num:C11($_t_AmountSTR)
				If ($_r_AmountNUM<0)
					Gen_Alert("Sorry you cannot set the cost price at less than zero")
					$_r_AmountNUM:=0
					$_bo_Continue:=False:C215
				End if 
			End if 
		End if 
		OK:=1
		If ($_bo_Continue)
			Case of 
				: ($_r_AmountNUM#0)
					USE NAMED SELECTION:C332("$toapply")
					For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
						[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=$_r_AmountNUM
						[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
						AA_SetIDbyTableNum(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
						
						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
						NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
					End for 
					STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
					
					
				: ($_r_PercentageNUM#0)
					USE NAMED SELECTION:C332("$toapply")
					For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
						$_r_Percentage:=Abs:C99($_r_PercentageNUM)
						
						$_r_TakeOff:=Round:C94((([STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35*$_r_Percentage)/100); 2)
						If ($_r_PercentageNUM<0)
							[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35-$_r_TakeOff
						Else 
							[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=[STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35+$_r_TakeOff
						End if 
						[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
						
						AA_SetIDbyTableNum(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
						NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
					End for 
					STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
					
			End case 
			
		End if 
		OBJECT SET TITLE:C194(STK_but_WriteDown; "Set New Value")
		
	: ([MOVEMENT_TYPES:60]UseForCurrencyMove:32=True:C214)
		ALL RECORDS:C47([CURRENCIES:71])
		SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; STK_at_CurrencyCodes)
		$_t_NewCurrency:=Gen_RequestWithList("Select the currency to convert this stock to"; <>SYS_t_BaseCurrency; "Continue"; "Stop"; 0; 0; "Currencies"; 0; ""; "STK_at_CurrencyCodes")
		If ($_t_NewCurrency#"")
			[STOCK_MOVEMENTS:40]Currency_Code:10:=$_t_NewCurrency
			USE NAMED SELECTION:C332("$toapply")
			For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
				If ($_t_NewCurrency#[STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36)
					Cat_ConvertValue([STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35; [STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36; $_t_NewCurrency)
					[STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29:=$_t_NewCurrency
					[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10:=Cat_ConvertValue([STOCK_MOVEMENT_ITEMS:27]xCostOnPrevious:35; [STOCK_MOVEMENT_ITEMS:27]xCurrencyonPrevious:36; $_t_NewCurrency)
					[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
					AA_SetIDbyTableNum(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
					
				End if 
				NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
			End for 
			STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
			
			
		End if 
		OBJECT SET TITLE:C194(STK_but_WriteDown; "Set New Currency")
	: ([MOVEMENT_TYPES:60]UseForAnalysisMove:30=True:C214)
		ALL RECORDS:C47([ANALYSES:36])
		SELECTION TO ARRAY:C260([ANALYSES:36]Analysis_Code:1; STK_at_AnalysisCodes)
		$_t_NewAnalysis:=Gen_RequestWithList("Select the analysis to convert this stock to"; ""; "Continue"; "Stop"; 0; 0; "Analyses"; 0; ""; "STK_at_AnalysisCodes")
		If ($_t_NewAnalysis#"")
			[STOCK_MOVEMENTS:40]Analysis_Code:9:=$_t_NewAnalysis
			USE NAMED SELECTION:C332("$toapply")
			For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
				If ($_t_NewAnalysis#[STOCK_MOVEMENT_ITEMS:27]xAnalysisOnPrevious:42)
					[STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28:=$_t_NewAnalysis
					[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
					AA_SetIDbyTableNum(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
					
				End if 
				NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
			End for 
			STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
			
			
		End if 
		OBJECT SET TITLE:C194(STK_but_WriteDown; "Set New Analysis")
	: ([MOVEMENT_TYPES:60]UseForLayerMove:31=True:C214)
		ALL RECORDS:C47([LAYERS:76])
		SELECTION TO ARRAY:C260([LAYERS:76]Layer_Code:1; STK_at_LayerCodes)
		$_t_NewLayer:=Gen_RequestWithList("Select the layer to convert this stock to"; ""; "Continue"; "Stop"; 0; 0; "Layers"; 0; ""; "STK_at_LayerCodes")
		If ($_t_NewLayer#"")
			[STOCK_MOVEMENTS:40]Layer_Code:11:=$_t_NewLayer
			USE NAMED SELECTION:C332("$toapply")
			For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
				If ($_t_NewLayer#[STOCK_MOVEMENT_ITEMS:27]xLayerOnPrevious:41)
					[STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27:=$_t_NewLayer
					[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
					AA_SetIDbyTableNum(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
				End if 
				NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
			End for 
			STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
			
			
		End if 
		OBJECT SET TITLE:C194(STK_but_WriteDown; "Set New Layer")
	: ([MOVEMENT_TYPES:60]UseForLocationMove:29=True:C214)
		ALL RECORDS:C47([LOCATIONS:61])
		SELECTION TO ARRAY:C260([LOCATIONS:61]Location_Code:1; STK_at_LocationCodes)
		$_t_NewLocation:=Gen_RequestWithList("Select the location to move this stock to"; ""; "Continue"; "Stop"; 0; 0; "Layers"; 0; ""; "STK_at_LocationCodes")
		If ($_t_NewLocation#"")
			
			USE NAMED SELECTION:C332("$toapply")
			For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
				If ($_t_NewLocation#[STOCK_MOVEMENT_ITEMS:27]xLocationOnPrevious:34)
					[STOCK_MOVEMENT_ITEMS:27]Location:7:=$_t_NewLocation
					[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22:=0
					AA_SetIDbyTableNum(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
					DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
				End if 
				NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
			End for 
			STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)
			
			
		End if 
		OBJECT SET TITLE:C194(STK_but_WriteDown; "Set New Location")
End case 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENTS].Movements_in.osetValue"; $_t_oldMethodName)

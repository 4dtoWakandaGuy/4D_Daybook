//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Products Arr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2009`Method: Products Arr`Description
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_CurrencyIDS; 0)
	ARRAY LONGINT:C221($_al_LongintNumber; 0)
	ARRAY LONGINT:C221($_al_ProductIDS; 0)
	//ARRAY REAL(GEN_ar_Value;0)
	//ARRAY TEXT(<>PRD_at_PriceDisplay;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(PRD_at_CurrencyCodes;0)
	C_BOOLEAN:C305($_bo_ReadOnlyState; $_bo_ShowCurrency)
	C_LONGINT:C283($_l_Element; $_l_Index; $_l_RecordsinSelection)
	C_REAL:C285($1)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products Arr")
//Products arr

COPY NAMED SELECTION:C331([PRODUCTS:9]; "$ProductsArraySelection")
$_l_RecordsinSelection:=Records in selection:C76([PRODUCTS:9])
Array_LCx($_l_RecordsinSelection)
ARRAY REAL:C219(GEN_ar_Value; $_l_RecordsinSelection)
ARRAY TEXT:C222(PRD_at_CurrencyCodes; 0)
If (Count parameters:C259>=1)
	$_l_Element:=$1
Else 
	$_l_Element:=<>PRD_at_PriceDisplay
End if 
$_bo_ShowCurrency:=False:C215
If ($_l_Element<5)
	Case of 
		: ($_l_Element=1)
			//SELECTION TO ARRAY([PRODUCTS]Product Code;GEN_at_Identity;[PRODUCTS]Product Name;GEN_at_Name;[PRODUCTS]Short Code;GEN_at_RecordCode;[PRODUCTS]Sales Price;GEN_ar_Value)
			SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; GEN_at_Identity; [PRODUCTS:9]Product_Name:2; GEN_at_Name; [PRODUCTS:9]Short_Code:19; GEN_at_RecordCode; [PRODUCTS:9]Sales_Price:9; GEN_ar_Value; [PRODUCTS:9]Default_Price_Currency_ID:45; $_al_CurrencyIDS)
			$_bo_ShowCurrency:=True:C214
		: ($_l_Element=2)
			//SELECTION TO ARRAY([PRODUCTS]Product Code;GEN_at_Identity;[PRODUCTS]Product Name;GEN_at_Name;[PRODUCTS]Short Code;GEN_at_RecordCode;[PRODUCTS]Standard Price;GEN_ar_Value)
			SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; GEN_at_Identity; [PRODUCTS:9]Product_Name:2; GEN_at_Name; [PRODUCTS:9]Short_Code:19; GEN_at_RecordCode; [PRODUCTS:9]Standard_Price:16; GEN_ar_Value; [PRODUCTS:9]Default_Price_Currency_ID:45; $_al_CurrencyIDS)
			$_bo_ShowCurrency:=True:C214
		: ($_l_Element=3)
			//SELECTION TO ARRAY([PRODUCTS]Product Code;GEN_at_Identity;[PRODUCTS]Product Name;GEN_at_Name;[PRODUCTS]Short Code;GEN_at_RecordCode;[PRODUCTS]Minimum;$_al_LongintNumber)
			SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; GEN_at_Identity; [PRODUCTS:9]Product_Name:2; GEN_at_Name; [PRODUCTS:9]Short_Code:19; GEN_at_RecordCode; [PRODUCTS:9]Minimum:11; $_al_LongintNumber; [PRODUCTS:9]Default_Price_Currency_ID:45; $_al_CurrencyIDS)
			For ($_l_Index; 1; $_l_RecordsinSelection)
				GEN_ar_Value{$_l_Index}:=$_al_LongintNumber{$_l_Index}
			End for 
		: ($_l_Element=4)
			//SELECTION TO ARRAY([PRODUCTS]Product Code;GEN_at_Identity;[PRODUCTS]Product Name;GEN_at_Name;[PRODUCTS]Short Code;GEN_at_RecordCode;[PRODUCTS]Maximum;$_al_LongintNumber)
			SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; GEN_at_Identity; [PRODUCTS:9]Product_Name:2; GEN_at_Name; [PRODUCTS:9]Short_Code:19; GEN_at_RecordCode; [PRODUCTS:9]Maximum:12; $_al_LongintNumber; [PRODUCTS:9]Default_Price_Currency_ID:45; $_al_CurrencyIDS)
			
			For ($_l_Index; 1; $_l_RecordsinSelection)
				GEN_ar_Value{$_l_Index}:=$_al_LongintNumber{$_l_Index}
			End for 
	End case 
Else 
	SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; GEN_at_Identity; [PRODUCTS:9]Product_Name:2; GEN_at_Name; [PRODUCTS:9]Short_Code:19; GEN_at_RecordCode; [PRODUCTS:9]X_ID:43; $_al_ProductIDS; [PRODUCTS:9]Default_Price_Currency_ID:45; $_al_CurrencyIDS)
	
	//SELECTION TO ARRAY([PRODUCTS]Product Code;GEN_at_Identity;[PRODUCTS]Product Name;GEN_at_Name;[PRODUCTS]Short Code;GEN_at_RecordCode)
	// Case of
	//  : ($_l_Element=5)
	If ([MOVEMENT_TYPES:60]Alloc_Type:10=False:C215)
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
	End if 
	
	For ($_l_Index; 1; $_l_RecordsinSelection)
		READ WRITE:C146([STOCK_LEVELS:58])
		$_bo_ReadOnlyState:=Read only state:C362([STOCK_LEVELS:58])
		If (STK_IsProductAnalysed(GEN_at_Identity{$_l_Index}))
			If (False:C215)
				QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=GEN_at_Identity{$_l_Index}; *)
				QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=[MOVEMENT_TYPES:60]Stock_Plus:3)
				If ($_l_RecordsinSelection<10)
					APPLY TO SELECTION:C70([STOCK_LEVELS:58]; STK_ValidateLevel)
				End if 
				
				UNLOAD RECORD:C212([STOCK_LEVELS:58])
			End if 
			If ($_bo_ReadOnlyState)
				READ ONLY:C145([STOCK_LEVELS:58])
			End if 
		End if 
		If (True:C214)
			QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=GEN_at_Identity{$_l_Index}; *)
			QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=[MOVEMENT_TYPES:60]Stock_Plus:3)
			GEN_ar_Value{$_l_Index}:=Sum:C1([STOCK_LEVELS:58]Free_Level:3)
		Else 
			GEN_ar_Value{$_l_Index}:=StockLev_Fmula(GEN_at_Identity{$_l_Index}; "P"; "F")
			
			
		End if 
	End for 
End if 


If ($_bo_ShowCurrency)
	ARRAY TEXT:C222(PRD_at_CurrencyCodes; 0)
	ARRAY TEXT:C222(PRD_at_CurrencyCodes; Size of array:C274($_al_CurrencyIDS))
	For ($_l_Index; 1; Size of array:C274($_al_CurrencyIDS))
		If ($_al_CurrencyIDS{$_l_Index}>0)
			If ([CURRENCIES:71]X_ID:3#$_al_CurrencyIDS{$_l_Index})
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=$_al_CurrencyIDS{$_l_Index})
				PRD_at_CurrencyCodes{$_l_Index}:=[CURRENCIES:71]Currency_Code:1
			End if 
		Else 
			PRD_at_CurrencyCodes{$_l_Index}:=<>SYS_t_BaseCurrency
			
		End if 
	End for 
	SORT ARRAY:C229(GEN_at_Identity; GEN_at_RecordCode; GEN_at_Name; GEN_ar_Value; PRD_at_CurrencyCodes; >)
	Array_LCStart(->GEN_ar_Value; ->PRD_at_CurrencyCodes)
Else 
	SORT ARRAY:C229(GEN_at_Identity; GEN_at_RecordCode; GEN_at_Name; GEN_ar_Value; >)
	Array_LCStart(->GEN_ar_Value)
End if 
USE NAMED SELECTION:C332("$ProductsArraySelection")

GEN_ar_Value:=1
ERR_MethodTrackerReturn("Products Arr"; $_t_oldMethodName)
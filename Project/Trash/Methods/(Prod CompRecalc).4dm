//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Prod CompRecalc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2009`Method: Prod CompRecalc`Description
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_Preferred; 0)
	ARRAY REAL:C219($_ar_SupplierCost; 0)
	ARRAY REAL:C219($_ar_SupplierStdCost; 0)
	ARRAY TEXT:C222($_at_SupplierCode; 0)
	ARRAY TEXT:C222($_at_SupplierCostCurrency; 0)
	C_BOOLEAN:C305(vMod2)
	C_LONGINT:C283($_l_NextPreferred; $_l_SelectedRecordNumber; $_l_SupplierIndex; xNext)
	C_REAL:C285($_r_Cost; $_r_Cost2; $_r_Sales; $_r_Sales2; $_r_Standard; $_r_Standard2; $_r_StandardCost; $_r_StandardCost2; $_r_Weight)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_ComponentCurrencyCode; $_t_CurrencyCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod CompRecalc")
Menu_Record("Prod CompRecalc"; "Calc Prices from Components")
PROD_SaveSubEnitities(1)  //Save the compoents

QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=[PRODUCTS:9]Product_Code:1)
If (Records in selection:C76([COMPONENTS:86])>0)
	If (Modified record:C314([PRODUCTS:9]))
		DB_SaveRecord(->[PRODUCTS:9])
		AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
	End if 
	$_l_SelectedRecordNumber:=Selected record number:C246([PRODUCTS:9])
	COPY NAMED SELECTION:C331([PRODUCTS:9]; "$Sel")
	$_r_Weight:=0
	$_r_Sales:=0
	$_r_Standard:=0
	$_r_Cost:=0
	$_r_StandardCost:=0
	If ([PRODUCTS:9]Default_Price_Currency_ID:45=0) | ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<1)
		
		$_t_CurrencyCode:=<>SYS_t_BaseCurrency
	Else 
		QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
		$_t_CurrencyCode:=[CURRENCIES:71]Currency_Code:1
	End if 
	//NG the folloowing is modified to convert the sales price of components in the calculateion and also to convert the cost price from the suppleir
	//in addition this did not use any method to select the supplier..it now does it the same way as on sales orders(cheapest unless a preferred is set)
	
	FIRST RECORD:C50([COMPONENTS:86])
	While (Not:C34(End selection:C36([COMPONENTS:86])))
		RELATE ONE:C42([COMPONENTS:86]Component_Code:2)
		$_r_Weight:=Gen_Round(($_r_Weight+([PRODUCTS:9]Weight:26*[COMPONENTS:86]Quantity:3)); 2; 1)
		If (xNext=0)
			If ([PRODUCTS:9]Default_Price_Currency_ID:45=0) | ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<1)
				$_t_ComponentCurrencyCode:=<>SYS_t_BaseCurrency
			Else 
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[PRODUCTS:9]Default_Price_Currency_ID:45)
				$_t_ComponentCurrencyCode:=[CURRENCIES:71]Currency_Code:1
			End if 
			If ($_t_ComponentCurrencyCode=$_t_CurrencyCode)
				$_r_Sales:=Gen_Round(($_r_Sales+([PRODUCTS:9]Sales_Price:9*[COMPONENTS:86]Quantity:3)); 2; 1)
				$_r_Standard:=Gen_Round(($_r_Standard+([PRODUCTS:9]Standard_Price:16*[COMPONENTS:86]Quantity:3)); 2; 1)
			Else 
				$_r_Sales2:=Gen_Round((([PRODUCTS:9]Sales_Price:9*[COMPONENTS:86]Quantity:3)); 2; 1)
				$_r_Standard2:=Gen_Round((([PRODUCTS:9]Standard_Price:16*[COMPONENTS:86]Quantity:3)); 2; 1)
				$_r_Sales2:=Cat_ConvertValue($_r_Sales2; $_t_ComponentCurrencyCode; $_t_CurrencyCode; Current date:C33(*))
				$_r_Standard2:=Cat_ConvertValue($_r_Standard2; $_t_ComponentCurrencyCode; $_t_CurrencyCode; Current date:C33(*))
				$_r_Sales:=Gen_Round(($_r_Sales+$_r_Sales2); 2; 1)
				$_r_Standard:=Gen_Round(($_r_Standard+$_r_Standard2); 2; 1)
			End if 
			QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
			
			FIRST RECORD:C50([PRODUCTS_SUPPLIERS:148])
			ARRAY TEXT:C222($_at_SupplierCostCurrency; 0)
			ARRAY REAL:C219($_ar_SupplierStdCost; 0)
			ARRAY REAL:C219($_ar_SupplierCost; 0)
			ARRAY LONGINT:C221($_al_Preferred; 0)
			ARRAY TEXT:C222($_at_SupplierCode; 0)
			$_l_NextPreferred:=Records in selection:C76([PRODUCTS_SUPPLIERS:148])+1
			If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>0)
				For ($_l_SupplierIndex; 1; Records in selection:C76([PRODUCTS_SUPPLIERS:148]))
					APPEND TO ARRAY:C911($_ar_SupplierCost; [PRODUCTS_SUPPLIERS:148]Cost_Price:2)
					If ([PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9="")
						APPEND TO ARRAY:C911($_at_SupplierCostCurrency; <>SYS_t_BaseCurrency)
					Else 
						APPEND TO ARRAY:C911($_at_SupplierCostCurrency; [PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9)
					End if 
					If ([PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10>0)
						APPEND TO ARRAY:C911($_al_Preferred; [PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10)
					Else 
						APPEND TO ARRAY:C911($_al_Preferred; $_l_NextPreferred)
						$_l_NextPreferred:=$_l_NextPreferred+1
					End if 
					APPEND TO ARRAY:C911($_at_SupplierCode; [PRODUCTS_SUPPLIERS:148]Company_Code:1)
					APPEND TO ARRAY:C911($_ar_SupplierStdCost; [PRODUCTS_SUPPLIERS:148]Standard_Cost:5)
					NEXT RECORD:C51([PRODUCTS_SUPPLIERS:148])
				End for 
				SORT ARRAY:C229($_al_Preferred; $_at_SupplierCode; $_at_SupplierCostCurrency; $_ar_SupplierCost; $_ar_SupplierStdCost)
				
				If ($_at_SupplierCostCurrency{1}#$_t_CurrencyCode)
					//HAVE TO CONVERT THE COST PRICE
					
					$_r_Cost2:=Cat_ConvertValue($_ar_SupplierCost{1}; $_at_SupplierCostCurrency{1}; $_t_CurrencyCode; Current date:C33(*))
					$_r_StandardCost2:=Cat_ConvertValue($_ar_SupplierStdCost{1}; $_at_SupplierCostCurrency{1}; $_t_CurrencyCode; Current date:C33(*))
					$_r_Cost:=Round:C94(($_r_Cost+($_r_Cost2*[COMPONENTS:86]Quantity:3)); 2)
					$_r_StandardCost:=Gen_Round(($_r_StandardCost+($_r_StandardCost2*[COMPONENTS:86]Quantity:3)); 2; 1)
				Else 
					$_r_Cost:=Round:C94(($_r_Cost+($_ar_SupplierCost{1}*[COMPONENTS:86]Quantity:3)); 2)
					$_r_StandardCost:=Gen_Round(($_r_StandardCost+($_ar_SupplierCost{1}*[COMPONENTS:86]Quantity:3)); 2; 1)
				End if 
				
			End if 
		End if 
		NEXT RECORD:C51([COMPONENTS:86])
	End while 
	USE NAMED SELECTION:C332("$Sel")
	GOTO SELECTED RECORD:C245([PRODUCTS:9]; $_l_SelectedRecordNumber)
	If ($_r_Weight#0)
		[PRODUCTS:9]Weight:26:=$_r_Weight
	End if 
	If (xNext=0)
		If ($_r_Sales#0)
			[PRODUCTS:9]Sales_Price:9:=$_r_Sales
		End if 
		If ($_r_Standard#0)
			[PRODUCTS:9]Standard_Price:16:=$_r_Standard
		End if 
		If (($_r_Cost#0) | ($_r_StandardCost#0))
			QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
			
			QUERY SELECTION:C341([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1="COMPONENTS")
			If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])=0)
				CREATE RECORD:C68([PRODUCTS_SUPPLIERS:148])
				[PRODUCTS_SUPPLIERS:148]Product_Code:8:=[PRODUCTS:9]Product_Code:1
				[PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7)
				[PRODUCTS_SUPPLIERS:148]Company_Code:1:="COMPONENTS"
			End if 
			If ($_r_Cost#0)
				[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=$_r_Cost
				[PRODUCTS_SUPPLIERS:148]Margin:3:=Gen_Round((DivideBy(([PRODUCTS:9]Sales_Price:9-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); [PRODUCTS:9]Sales_Price:9)*100); 2; 1)  // 17/02/04 pb
			End if 
			
			If ($_r_StandardCost#0)
				[PRODUCTS_SUPPLIERS:148]Standard_Cost:5:=$_r_StandardCost
			End if 
			DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
			
			QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
			
		End if 
	End if 
	vMod2:=True:C214
	CLEAR NAMED SELECTION:C333("$Sel")
	PRD_inonloadrelated("S1")
Else 
	Gen_Alert("No Components have yet been specified for this Product"; "Try again")
End if 
ERR_MethodTrackerReturn("Prod CompRecalc"; $_t_oldMethodName)

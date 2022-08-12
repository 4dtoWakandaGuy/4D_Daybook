//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI_SubCostI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2010 09:09
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
	C_LONGINT:C283($_l_NextPreferred; $_l_SupplierIndex)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_SalesCurrency)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_SubCostI")
QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1; *)
QUERY:C277([PRODUCTS_SUPPLIERS:148];  & [PRODUCTS_SUPPLIERS:148]Company_Code:1#"")

//THIS MAKES NO ALLOWANCE FOR CURRENCY CHANGE
ARRAY TEXT:C222($_at_SupplierCostCurrency; 0)
ARRAY REAL:C219($_ar_SupplierStdCost; 0)

ARRAY REAL:C219($_ar_SupplierCost; 0)
ARRAY LONGINT:C221($_al_Preferred; 0)
ARRAY TEXT:C222($_at_SupplierCode; 0)
$_t_SalesCurrency:=[ORDERS:24]Currency_Code:32
$_l_NextPreferred:=Records in selection:C76([PRODUCTS_SUPPLIERS:148])+1
SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Company_Code:1; $_at_SupplierCode; [PRODUCTS_SUPPLIERS:148]Cost_Price:2; $_ar_SupplierCost; [PRODUCTS_SUPPLIERS:148]Standard_Cost:5; $_ar_SupplierStdCost; [PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9; $_at_SupplierCostCurrency; [PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10; $_al_Preferred)


For ($_l_SupplierIndex; 1; Size of array:C274($_at_SupplierCode))
	If ($_at_SupplierCostCurrency{$_l_SupplierIndex}="")
		$_at_SupplierCostCurrency{$_l_SupplierIndex}:=<>SYS_t_BaseCurrency
	End if 
	If ($_al_Preferred{$_l_SupplierIndex}=0)
		$_al_Preferred{$_l_SupplierIndex}:=$_l_NextPreferred
	End if 
End for 
SORT ARRAY:C229($_al_Preferred; $_at_SupplierCode; $_at_SupplierCostCurrency; $_ar_SupplierCost)
If ($_t_SalesCurrency="")
	If ([ORDER_ITEMS:25]Order_Code:1#"")
		If ([ORDERS:24]Order_Code:3#[ORDER_ITEMS:25]Order_Code:1)
			
			QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
		End if 
		If ([ORDERS:24]Currency_Code:32#"")
			$_t_SalesCurrency:=<>SYS_t_BaseCurrency
		End if 
	Else 
		$_t_SalesCurrency:=<>SYS_t_BaseCurrency
	End if 
End if 
If (Size of array:C274($_at_SupplierCode)>0)
	If ($_at_SupplierCostCurrency{1}#$_t_SalesCurrency)
		//HAVE TO CONVERT THE COST PRICE
		[ORDER_ITEMS:25]Supplier_Code:20:=$_at_SupplierCode{1}
		[ORDER_ITEMS:25]Cost_Price:5:=Cat_ConvertValue($_ar_SupplierCost{1}; $_at_SupplierCostCurrency{1}; $_t_SalesCurrency; Current date:C33(*))
		[ORDER_ITEMS:25]Standard_Cost:41:=Cat_ConvertValue($_ar_SupplierStdCost{1}; $_at_SupplierCostCurrency{1}; $_t_SalesCurrency; Current date:C33(*))
	Else 
		[ORDER_ITEMS:25]Cost_Price:5:=$_ar_SupplierCost{1}
		[ORDER_ITEMS:25]Standard_Cost:41:=$_ar_SupplierStdCost{1}
		[ORDER_ITEMS:25]Supplier_Code:20:=$_at_SupplierCode{1}
	End if 
End if 
ERR_MethodTrackerReturn("OrderI_SubCostI"; $_t_oldMethodName)

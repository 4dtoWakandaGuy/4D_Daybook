//%attributes = {}
If (False:C215)
	//Project Method Name:      PriceT_Check
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/07/2010 17:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($_r_Quantity; $6; PROD_R_SalesPrice)
	C_TEXT:C284($_t_BrandCode; $_t_CompanyCode; $_t_GroupCode; $_t_oldMethodName; $_t_PriceCode; $_t_productCode; $1; $2; $3; $4; $5)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT_Check")
//PriceT_Check
If (Count parameters:C259>=2)
	$_t_PriceCode:=$2
Else 
	$_t_PriceCode:=[ORDER_ITEMS:25]Price_Code:36
End if 
If (Count parameters:C259>=1)
	$_t_productCode:=$1
Else 
	$_t_productCode:=[PRODUCTS:9]Product_Code:1
End if 
If (Count parameters:C259>=3)
	$_t_CompanyCode:=$3
Else 
	$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
End if 
$_t_BrandCode:=""
$_t_GroupCode:=""
If (Count parameters:C259>=4)
	$_t_BrandCode:=$4
End if 
If (Count parameters:C259>=5)
	$_t_GroupCode:=$5
End if 
If (Count parameters:C259>=6)
	$_r_Quantity:=$6
Else 
	$_r_Quantity:=1
End if 



If ($_t_PriceCode#"")
	If (Count parameters:C259=0)
		If ($_t_productCode#[PRODUCTS:9]Product_Code:1)
			RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
		End if 
		If (DB_t_CurrentFormUsage="Job@")
			If ([JOBS:26]Company_Code:3#[COMPANIES:2]Company_Code:1)
				RELATE ONE:C42([JOBS:26]Company_Code:3)
			End if 
		Else 
			If ($_t_CompanyCode#[COMPANIES:2]Company_Code:1)
				RELATE ONE:C42([ORDERS:24]Company_Code:1)
			End if 
		End if 
	End if 
	
	If ($_t_productCode#"")
		PriceT_SearchCo($_t_PriceCode; $_t_CompanyCode; $_t_productCode; $_t_BrandCode; $_t_GroupCode)
		PriceT_FilterDates
		If (Records in selection:C76([PRICE_TABLE:28])>0)
			PriceT_CheckCo2($_t_CompanyCode)
			If (Count parameters:C259=0)
				PROD_R_SalesPrice:=0
				PriceT_Load
			Else 
				// PROD_R_SalesPrice:=0
				PriceT_Load(->PROD_R_SalesPrice; $_t_CompanyCode; $_r_Quantity)
			End if 
			
		Else 
			If (Count parameters:C259=0)
				Gen_Alert("That Price Group has not been used for this Product or Company"; "Try again")
			End if 
			
			$_t_PriceCode:=""
		End if 
	Else 
		PriceT_CheckGen(->PROD_R_SalesPrice; $_t_CompanyCode)
	End if 
End if 
ERR_MethodTrackerReturn("PriceT_Check"; $_t_oldMethodName)

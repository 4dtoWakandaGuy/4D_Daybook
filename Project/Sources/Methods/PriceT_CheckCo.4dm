//%attributes = {}
If (False:C215)
	//Project Method Name:      PriceT_CheckCo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/12/2010 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

//TRACE
$_t_oldMethodName:=ERR_MethodTracker("PriceT_CheckCo")
//~(PriceT_CheckCo)PriceT_Check_Company & Type
//RELATE ONE([ORDER ITEMS]Product Code)
Case of 
	: (DB_t_CurrentFormUsage="Job@")
		If ([JOBS:26]Company_Code:3#[COMPANIES:2]Company_Code:1)
			RELATE ONE:C42([JOBS:26]Company_Code:3)
		End if 
	: (DB_t_CurrentFormUsage="NAT")
		If ([SERVICE_CALLS:20]Company_Code:1#[COMPANIES:2]Company_Code:1)
			RELATE ONE:C42([SERVICE_CALLS:20]Company_Code:1)
		End if 
	Else 
		If ([ORDERS:24]Company_Code:1#[COMPANIES:2]Company_Code:1)
			RELATE ONE:C42([ORDERS:24]Company_Code:1)
		End if 
End case 
If (([PRODUCTS:9]Product_Code:1#"") & ([COMPANIES:2]Company_Code:1#""))
	If ([COMPANIES:2]SO_Price_Group:44#"")
		PriceT_SearchCo([COMPANIES:2]SO_Price_Group:44; [COMPANIES:2]Company_Code:1)
	End if 
	If (([COMPANIES:2]SO_Price_Group:44="") | (Records in selection:C76([PRICE_TABLE:28])=0))
		RELATE ONE:C42([COMPANIES:2]Company_Type:13)
		If ([TYPES:5]SO_Price_Group:4#"")
			PriceT_SearchCo([TYPES:5]SO_Price_Group:4; [COMPANIES:2]Company_Code:1)
		End if 
	End if 
	PriceT_FilterDates
	If (Records in selection:C76([PRICE_TABLE:28])>0)
		PriceT_CheckCo2([COMPANIES:2]Company_Code:1)
		PriceT_Load
	Else 
		PriceT_CheckGen
	End if 
End if 
ERR_MethodTrackerReturn("PriceT_CheckCo"; $_t_oldMethodName)
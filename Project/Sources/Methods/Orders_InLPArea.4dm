//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InLPArea
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2012 17:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($_r_TaxRate)
	C_TEXT:C284($_t_TaxName; $_t_oldMethodName; $_t_TaxName)
End if 
//Code Starts Here

//TRACE
$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPArea")
$_r_TaxRate:=[ORDERS:24]Tax_Rate:34
$_t_TaxName:=Term_VATWT("VAT")
If ($_t_TaxName#"VAT")
	If ([ORDERS:24]Delivery_Company:29#"")
		RELATE ONE:C42([ORDERS:24]Delivery_Company:29)
		[ORDERS:24]Area_Code:35:=[COMPANIES:2]Area:11
		RELATE ONE:C42([ORDERS:24]Area_Code:35)
		[ORDERS:24]Tax_Rate:34:=[AREAS:3]Tax_Rate:4
	Else 
		RELATE ONE:C42([ORDERS:24]Company_Code:1)
		[ORDERS:24]Area_Code:35:=[COMPANIES:2]Area:11
		RELATE ONE:C42([ORDERS:24]Area_Code:35)
		[ORDERS:24]Tax_Rate:34:=[AREAS:3]Tax_Rate:4
	End if 
End if 
If (($_r_TaxRate#[ORDERS:24]Tax_Rate:34) & (Records in selection:C76([ORDER_ITEMS:25])>0))
	Orders_InLPAr2
End if 
ERR_MethodTrackerReturn("Orders_InLPArea"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      MW_MU_error_LINE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(Macro_ERRORCHK)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MW_MU_error_LINE")
//Macro Code MU Error Line
COMPILER_MACROS
COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "TEMPOI")
CREATE RECORD:C68([ORDER_ITEMS:25])
[ORDER_ITEMS:25]Order_Code:1:=FurthFld_Get("Contracts"; "Equipment List Order No")
[ORDER_ITEMS:25]Quantity:3:=1
[ORDER_ITEMS:25]Product_Code:2:="ADMRESADJUSTMENT"
[ORDER_ITEMS:25]Sales_Price:4:=Macro_ERRORCHK-[CONTRACTS:17]Contract_Cost:7
[ORDER_ITEMS:25]Contract_Cost:30:=[ORDER_ITEMS:25]Sales_Price:4
[ORDER_ITEMS:25]Sales_Amount:7:=[ORDER_ITEMS:25]Sales_Price:4
[ORDER_ITEMS:25]Invoice_Number:17:="CONTRACT"
[ORDER_ITEMS:25]Invoice_Date:25:=Current date:C33
[ORDER_ITEMS:25]Delivery_Date:11:=Current date:C33
[ORDER_ITEMS:25]Person:14:=<>PER_t_CurrentUserInitials
[ORDER_ITEMS:25]Product_Name:13:="Adjustment re missing items"
[ORDER_ITEMS:25]Contract_Code:29:=[CONTRACTS:17]Contract_Code:3
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
USE NAMED SELECTION:C332("TEMPOI")
[CONTRACTS:17]Contract_Cost:7:=Macro_ERRORCHK
DB_SaveRecord(->[CONTRACTS:17])
ERR_MethodTrackerReturn("MW_MU_error_LINE"; $_t_oldMethodName)
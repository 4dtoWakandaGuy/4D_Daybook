//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_InLPAr2
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPAr2")
FIRST RECORD:C50([ORDER_ITEMS:25])
While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
	RELATE ONE:C42([ORDER_ITEMS:25]Tax_Code:12)
	If ([TAX_CODES:35]Use_Areas:4)
		[ORDER_ITEMS:25]TAX_Amount:8:=Gen_Round(([ORDER_ITEMS:25]Sales_Amount:7*([ORDERS:24]Tax_Rate:34/100)); 2; 5)
		//NG following line added 21/11/2006..did not update the total DUH
		[ORDER_ITEMS:25]Total_Amount:9:=Gen_Round(([ORDER_ITEMS:25]Sales_Amount:7+[ORDER_ITEMS:25]TAX_Amount:8); 2; 2)
		DB_SaveRecord(->[ORDER_ITEMS:25])
		AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
	End if 
	NEXT RECORD:C51([ORDER_ITEMS:25])
End while 
FIRST RECORD:C50([ORDER_ITEMS:25])
Orders_InLPTot
ERR_MethodTrackerReturn("Orders_InLPAr2"; $_t_oldMethodName)
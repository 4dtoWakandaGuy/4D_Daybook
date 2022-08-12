//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PriceG_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/07/2010 11:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PG_at_PriceClasses;0)
	C_TEXT:C284($_t_oldMethodName; ACC_t_CurrencyCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceG_InLPB")
RELATE ONE:C42([PRICE_GROUPS:18]Currency_Code:8)
ACC_t_CurrencyCode:=[CURRENCIES:71]Currency_Name:2
ARRAY TEXT:C222(PG_at_PriceClasses; 3)
PG_at_PriceClasses{1}:="Price Based"  //1
PG_at_PriceClasses{2}:="Discount Based"  //3
PG_at_PriceClasses{3}:="Mixed DIscount/Price"  //2"
If ([PRICE_GROUPS:18]Price_Based:3)
	[PRICE_GROUPS:18]PriceGroupClass:9:=1
End if 
Case of 
	: ([PRICE_GROUPS:18]PriceGroupClass:9=1)
		PG_at_PriceClasses:=1
	: ([PRICE_GROUPS:18]PriceGroupClass:9=2)
		PG_at_PriceClasses:=3
	: ([PRICE_GROUPS:18]PriceGroupClass:9=3)
		PG_at_PriceClasses:=2
	Else 
		
		PG_at_PriceClasses:=0
End case 

If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
	OBJECT SET ENTERABLE:C238([PRICE_GROUPS:18]Currency_Code:8; False:C215)
End if 
ERR_MethodTrackerReturn("PriceG_InLPB"; $_t_oldMethodName)
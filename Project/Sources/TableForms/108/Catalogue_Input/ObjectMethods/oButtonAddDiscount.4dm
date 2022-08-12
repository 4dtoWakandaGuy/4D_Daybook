If (False:C215)
	//object Name: [CATALOGUE]Catalogue_Input.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 16:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CAT_at_Currencynames;0)
	//Array BOOLEAN(CAT_lb_Pricing;0)
	//Array INTEGER(CAT_ai_PricePlus;0)
	//Array REAL(CAT_ar_PriceDiscount;0)
	//Array TEXT(CAT_at_PlusMinus;0)
	//Array TEXT(CAT_at_PriceCurrencyCode;0)
	C_LONGINT:C283(CAT_l_CurrentItem)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CATALOGUE].Catalogue_Input.Variable8"; Form event code:C388)
//you can change the discount but not the currency
CAT_l_CurrentItem:=1
LB_SetChoiceList("CurrencyOptions"; ->CAT_at_Currencynames; ->CAT_at_PriceCurrencyCode)
LISTBOX INSERT ROWS:C913(CAT_lb_Pricing; 1)
CAT_ai_PricePlus{1}:=0
CAT_at_PlusMinus{1}:="-"
EDIT ITEM:C870(CAT_ar_PriceDiscount{1})
ERR_MethodTrackerReturn("OBJ [CATALOGUE].Catalogue_Input.Variable8"; $_t_oldMethodName)
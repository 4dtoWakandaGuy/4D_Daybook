//%attributes = {}
If (False:C215)
	//Project Method Name:      Catalogue_Prices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/12/2010 10:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CAT_abo_PriceChange;0)
	//ARRAY INTEGER(CAT_ai_PricePlus;0)
	//ARRAY LONGINT(CAT_al_PriceDiscounts;0)
	//ARRAY REAL(CAT_ar_PriceDiscount;0)
	//ARRAY TEXT(CAT_at_PriceCurrencyCode;0)
	//ARRAY TEXT(CAT_at_PriceText;0)
	C_LONGINT:C283($_l_CurrentRow; $_l_RecordsIndex; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Catalogue_Prices")

If (Count parameters:C259>=1)
	QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]x_ID:15=$1; *)
Else 
	QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]x_ID:15=[CATALOGUE:108]x_ID:1; *)
End if 
QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Product_Code:1="")
QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]x_TableClassID:16=2)  //Catalogue sales Discount
PriceT_FilterDates
FIRST RECORD:C50([PRICE_TABLE:28])
ARRAY TEXT:C222(CAT_at_PriceText; Records in selection:C76([PRICE_TABLE:28]))
ARRAY TEXT:C222(CAT_at_PriceCurrencyCode; Records in selection:C76([PRICE_TABLE:28]))
ARRAY REAL:C219(CAT_ar_PriceDiscount; Records in selection:C76([PRICE_TABLE:28]))
ARRAY INTEGER:C220(CAT_ai_PricePlus; Records in selection:C76([PRICE_TABLE:28]))
ARRAY BOOLEAN:C223(CAT_abo_PriceChange; Records in selection:C76([PRICE_TABLE:28]))
ARRAY LONGINT:C221(CAT_al_PriceDiscounts; Records in selection:C76([PRICE_TABLE:28]))
$_l_CurrentRow:=0
For ($_l_RecordsIndex; 1; Records in selection:C76([PRICE_TABLE:28]))
	$_l_CurrentRow:=$_l_CurrentRow+1
	CAT_at_PriceCurrencyCode{$_l_CurrentRow}:=[PRICE_TABLE:28]Currency_Code:13
	If ([PRICE_TABLE:28]Price_Discount:3>0)
		CAT_ar_PriceDiscount{$_l_CurrentRow}:=[PRICE_TABLE:28]Price_Discount:3
		CAT_ai_PricePlus{$_l_CurrentRow}:=0
	Else 
		//inverse discount
		CAT_ar_PriceDiscount{$_l_CurrentRow}:=Abs:C99([PRICE_TABLE:28]Price_Discount:3)
		CAT_ai_PricePlus{$_l_CurrentRow}:=1
	End if 
	CAT_al_PriceDiscounts{$_l_CurrentRow}:=[PRICE_TABLE:28]x_ID:15
	NEXT RECORD:C51([PRICE_TABLE:28])
End for 
ERR_MethodTrackerReturn("Catalogue_Prices"; $_t_oldMethodName)
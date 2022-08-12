If (False:C215)
	//object Name: [PRICE_TABLE]PriceTable_In.oPricingBasis
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2010 21:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PT_at_PricingBasis;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRICE_TABLE].PriceTable_In.oPricingBasis"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (PT_at_PricingBasis>0)
			If (PT_at_PricingBasis=1)
				[PRICE_TABLE:28]Pricing_Basis:17:=PT_at_PricingBasis
			Else 
				[PRICE_TABLE:28]Pricing_Basis:17:=PT_at_PricingBasis+1
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PRICE_TABLE].PriceTable_In.oPricingBasis"; $_t_oldMethodName)

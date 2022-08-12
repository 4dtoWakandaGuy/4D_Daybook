If (False:C215)
	//object Name: [CATALOGUE]Catalogue_Input.oListBoxPrices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 06:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CAT_abo_PriceChange;0)
	//ARRAY BOOLEAN(CAT_lb_Pricing;0)
	//ARRAY INTEGER(CAT_ai_PricePlus;0)
	//ARRAY LONGINT(CAT_al_PriceDiscounts;0)
	//ARRAY REAL(CAT_ar_PriceDiscount;0)
	//ARRAY TEXT(CAT_at_Currencynames;0)
	//ARRAY TEXT(CAT_at_PlusMinus;0)
	//ARRAY TEXT(CAT_at_PriceCurrencyCode;0)
	//ARRAY TEXT(CAT_at_PriceCurrencyCodeOLD;0)
	C_LONGINT:C283($_l_CurrentSortColumn; $_l_event; $_l_FieldNumber; $_l_SelectedRow; $_l_TableNumber; CAT_l_CurrentItem; CAT_l_PricePlus)
	C_REAL:C285(CAT_R_PriceDiscount)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; CAT_t_PriceCurrencyCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CATALOGUE].Catalogue_Input.oListBoxPrices"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_l_SelectedRow:=Self:C308->
		CAT_l_CurrentItem:=$_l_SelectedRow
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_CurrentSortColumn:=LB_GetColumn(->CAT_lb_Pricing; $_t_VariableName)
		Case of 
			: ($_l_CurrentSortColumn=2)
				
				CAT_ai_PricePlus{$_l_SelectedRow}:=Abs:C99((CAT_ai_PricePlus{$_l_SelectedRow})-1)
				If (CAT_ai_PricePlus{$_l_SelectedRow}=1)
					CAT_at_PlusMinus{$_l_SelectedRow}:="+"
				Else 
					CAT_at_PlusMinus{$_l_SelectedRow}:="-"
				End if 
				CAT_abo_PriceChange{$_l_SelectedRow}:=True:C214
				CAT_t_PriceCurrencyCode:=CAT_at_PriceCurrencyCode{$_l_SelectedRow}
				CAT_R_PriceDiscount:=CAT_ar_PriceDiscount{$_l_SelectedRow}
				CAT_l_PricePlus:=CAT_ai_PricePlus{$_l_SelectedRow}
				EDIT ITEM:C870(CAT_ar_PriceDiscount{$_l_SelectedRow})
				//SELECT LISTBOX ROW(CAT_lb_Pricing;$_l_SelectedRow
				
				//you can change the discount but not the currency
			: ($_l_CurrentSortColumn=1)
				If (CAT_at_PriceCurrencyCode{$_l_SelectedRow}#"")
					If (CAT_at_PriceCurrencyCodeOLD{$_l_SelectedRow}#"")
						CAT_at_PriceCurrencyCode{$_l_SelectedRow}:=CAT_at_PriceCurrencyCodeOLD{$_l_SelectedRow}
						EDIT ITEM:C870(CAT_ar_PriceDiscount{$_l_SelectedRow})
					End if 
					CAT_abo_PriceChange{$_l_SelectedRow}:=True:C214
				End if 
				
		End case 
	: ($_l_event=On Data Change:K2:15)
		$_l_SelectedRow:=Self:C308->
		CAT_l_CurrentItem:=$_l_SelectedRow
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_CurrentSortColumn:=LB_GetColumn(->CAT_lb_Pricing; $_t_VariableName)
		Case of 
			: ($_l_CurrentSortColumn=1)
				If (CAT_at_PriceCurrencyCode{$_l_SelectedRow}#"")
					If (CAT_at_PriceCurrencyCodeOLD{$_l_SelectedRow}#"") & (CAT_al_PriceDiscounts{$_l_SelectedRow}>0)
						CAT_at_PriceCurrencyCode{$_l_SelectedRow}:=CAT_at_PriceCurrencyCodeOLD{$_l_SelectedRow}
						EDIT ITEM:C870(CAT_ar_PriceDiscount{$_l_SelectedRow})
					Else 
						CAT_at_PriceCurrencyCodeOLD{$_l_SelectedRow}:=CAT_at_PriceCurrencyCode{$_l_SelectedRow}
					End if 
					CAT_abo_PriceChange{$_l_SelectedRow}:=True:C214
				End if 
				
		End case 
		If (CAT_at_PriceCurrencyCode{$_l_SelectedRow}#"") & (CAT_ar_PriceDiscount{$_l_SelectedRow}#0)
			LB_SetChoiceList(""; ->CAT_at_Currencynames; ->CAT_at_PriceCurrencyCode)
			
		End if 
	Else 
		
End case 
ERR_MethodTrackerReturn("OBJ [CATALOGUE].Catalogue_Input.oListBoxPrices"; $_t_oldMethodName)

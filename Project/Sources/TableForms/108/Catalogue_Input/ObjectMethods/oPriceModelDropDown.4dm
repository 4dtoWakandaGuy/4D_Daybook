If (False:C215)
	//object Method Name: Object Name:      [CATALOGUE].Catalogue_Input.Variable13
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
	//ARRAY INTEGER(CAT_ai_PricePlus;0)
	//ARRAY LONGINT(CAT_al_CatLinkProdID;0)
	//ARRAY LONGINT(CAT_al_CatProductIDS;0)
	//ARRAY LONGINT(CAT_al_PriceModelID;0)
	//ARRAY REAL(CAT_ar_PriceDiscount;0)
	//ARRAY REAL(CAT_ar_ProductPrice;0)
	//ARRAY TEXT(CAT_at_PriceCurrencyCode;0)
	//ARRAY TEXT(CAT_at_PriceModel;0)
	C_LONGINT:C283($_l_CatalogueCurrencyRow; $_l_Index; $_l_ProductRow)
	C_REAL:C285($_r_Discount)
	C_TEXT:C284($_t_oldMethodName; CAT_t_CatViewCurrency; CAT_t_PriceModel)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CATALOGUE].Catalogue_Input.Variable13"; Form event code:C388)
If (CAT_at_PriceModel>0)
	CAT_t_PriceModel:=CAT_at_PriceModel{CAT_at_PriceModel}
	[CATALOGUE:108]xPriceModel:7:=CAT_al_PriceModelID{CAT_at_PriceModel}
	For ($_l_Index; Size of array:C274(CAT_al_CatLinkProdID); 1; -1)
		$_l_ProductRow:=Find in array:C230(CAT_al_CatProductIDS; CAT_al_CatLinkProdID{$_l_Index})
		$_l_CatalogueCurrencyRow:=Find in array:C230(CAT_at_PriceCurrencyCode; CAT_t_CatViewCurrency)
		If ($_l_CatalogueCurrencyRow>0)
			If (CAT_ai_PricePlus{$_l_CatalogueCurrencyRow}=1)
				//inverse discount
				$_r_Discount:=-(CAT_ar_PriceDiscount{$_l_CatalogueCurrencyRow})
			Else 
				$_r_Discount:=(CAT_ar_PriceDiscount{$_l_CatalogueCurrencyRow})
			End if 
		Else 
			$_r_Discount:=0
		End if 
		CAT_ar_ProductPrice{$_l_ProductRow}:=CAT_GetProductPrice(CAT_t_CatViewCurrency; CAT_al_CatProductIDS{$_l_ProductRow}; [CATALOGUE:108]x_ID:1; $_r_Discount)
		//AL_UpdateArrays (CAT_PowerviewPRODS;-2)
		
		
	End for 
	CAT_at_PriceModel:=0
	
End if 
ERR_MethodTrackerReturn("OBJ [CATALOGUE].Catalogue_Input.Variable13"; $_t_oldMethodName)

If (False:C215)
	//object Name: [CATALOGUE]Catalogue_Input.Pop-up%2FDrop-down List3
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
	//ARRAY TEXT(CAT_at_CurrencyCodes;0)
	//ARRAY TEXT(CAT_at_CurrencyNames2;0)
	C_TEXT:C284($_t_oldMethodName; CAT_t_CatViewCurrency)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CATALOGUE].Catalogue_Input.Pop-up/Drop-down List3"; Form event code:C388)
If (CAT_at_CurrencyNames2>0)
	//here store any special prices set on the current view
	
	CAT_t_CatViewCurrency:=CAT_at_CurrencyCodes{CAT_at_CurrencyNames2}
	//AL_SetFormat (CAT_PowerviewPRODS;5;CAT_t_CatViewCurrency+"#,###,##0.00";2;2;2;0) not needed - done in CAT_LoadProducts 03/07/06 pb
	CAT_LoadProducts([CATALOGUE:108]x_ID:1; CAT_t_CatViewCurrency; True:C214; [CATALOGUE:108]xCatalogueClass:9; [CATALOGUE:108]xMacroName:12)
	
End if 
ERR_MethodTrackerReturn("OBJ [CATALOGUE].Catalogue_Input.Pop-up/Drop-down List3"; $_t_oldMethodName)

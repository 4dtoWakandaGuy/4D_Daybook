If (False:C215)
	//object Name: [PRODUCTS]Products_Out.oProdCurrency
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PROD_at_CurrencyCodes;0)
	//ARRAY TEXT(PROD_at_CurrencyNames;0)
	C_BOOLEAN:C305(PROD_bo_UnfilteredSetKnown)
	C_LONGINT:C283(PROD_l_SetID)
	C_TEXT:C284(Prod_t_DisplayCurrency; $_t_oldMethodName; Prod_t_DisplayCurrency)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_Out.oProdCurrency"; Form event code:C388)
If (PROD_at_CurrencyNames>0)
	Prod_t_DisplayCurrency:=PROD_at_CurrencyCodes{PROD_at_CurrencyNames}
	If (Not:C34(PROD_bo_UnfilteredSetKnown))
		//Remember the current selection
		PROD_l_SetID:=0
		PROD_l_SetID:=AA_GetNextID(->PROD_l_SetID)
		CREATE SET:C116([PRODUCTS:9]; "ProdSelection"+String:C10(PROD_l_SetID))
		PROD_bo_UnfilteredSetKnown:=True:C214
		REDUCE SELECTION:C351([PRODUCTS:9]; 0)
		USE SET:C118("ProdSelection"+String:C10(PROD_l_SetID))
	Else 
		REDUCE SELECTION:C351([PRODUCTS:9]; 0)
		USE SET:C118("ProdSelection"+String:C10(PROD_l_SetID))
	End if 
	
	SRCH_Applyfilterstoselection(->[PRODUCTS:9])
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_Out.oProdCurrency"; $_t_oldMethodName)

If (False:C215)
	//object Name: [PRODUCTS]Products_Out.oClearFilters1
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
	//C_UNKNOWN(cNAA)
	//C_UNKNOWN(cNAL)
	//C_UNKNOWN(vAnalysis)
	//C_UNKNOWN(vBrand)
	//C_UNKNOWN(vGroup)
	//C_UNKNOWN(vSource)
	C_BOOLEAN:C305(PROD_bo_UnfilteredSetKnown)
	C_LONGINT:C283(cNAA; cNAL; $_l_event; PROD_l_SetID)
	C_TEXT:C284(ACC_t_CurrencyCode; vAnalysis; vBrand; vGroup; vSource; $_t_oldMethodName; ACC_t_CurrencyCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_Out.oClearFilters1"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		cNAL:=0
		cNAA:=0
		vAnalysis:=""
		vBrand:=""
		vGroup:=""
		vSource:=""
		ACC_t_CurrencyCode:=""
		
		//PROD_t_SelectedCatalogues:=""
		
		
		If (PROD_bo_UnfilteredSetKnown)
			USE SET:C118("ProdSelection"+String:C10(PROD_l_SetID))
		Else 
			ALL RECORDS:C47([PRODUCTS:9])
			Prod_Sel
			PROD_l_SetID:=0
			PROD_l_SetID:=AA_GetNextID(->PROD_l_SetID)
			CREATE SET:C116([ORDERS:24]; "ProdSelection"+String:C10(PROD_l_SetID))
			PROD_bo_UnfilteredSetKnown:=True:C214
		End if 
		
		
		SRCH_Applyfilterstoselection(->[PRODUCTS:9])
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_Out.oClearFilters1"; $_t_oldMethodName)

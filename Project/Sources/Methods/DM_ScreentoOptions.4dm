//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_ScreentoOptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(DM_ai_DefaultState;0)
	//ARRAY TEXT(DM_at_StateFunction;0)
	//ARRAY TEXT(DM_at_StateNames;0)
	C_LONGINT:C283(DM_cb_ORDERallocate; DM_cb_ORDERInvoice; DM_cb_PrintComments)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; DM_t_ContactAreaCode; DM_t_ContactLayerCode; DM_t_ContactPLTerms; DM_t_ContactPOPriceGroupCode; DM_t_ContactRoleCode; DM_t_ContactSLTerms; DM_t_ContactSOPriceGroupCode; DM_t_ContactSourceCode; DM_t_ContactSPInitials; DM_t_ContactStageCode)
	C_TEXT:C284(DM_t_ContactStatusCode; DM_t_ContactTBinitials; DM_t_ContactTypeCode; DM_t_ContactVatCode; DM_t_OrderAnalysisCode; DM_t_OrderAREACode; DM_t_OrderCurrencyCode; DM_t_OrderDelMethod; DM_t_OrderDelterms; DM_t_OrderIPriceCode; DM_t_OrderlayerCode)
	C_TEXT:C284(DM_t_OrderPersonInitials; DM_t_OrderSourceCode; DM_t_OrderTBinitials; DM_t_OrderTerms; DM_t_OrderTypeCode; DM_t_SettingsName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_ScreentoOptions")
If (Count parameters:C259>=1)
	Case of 
		: ($1=25)
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(DM_t_SettingsName; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_OrderTypeCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_OrderPersonInitials; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_OrderSourceCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_OrderTBinitials; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_OrderAREACode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_OrderCurrencyCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_OrderAnalysisCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_OrderlayerCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_OrderDelMethod; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_OrderDelterms; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_OrderTerms; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_OrderIPriceCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_ai_DefaultState; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_at_StateNames; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_at_StateFunction; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_cb_PrintComments; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_cb_ORDERInvoice; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_cb_ORDERallocate; [PREFERENCES:116]DataBlob:2; *)
		: ($1=2)
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			
			VARIABLE TO BLOB:C532(DM_t_SettingsName; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_ContactRoleCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_ContactTypeCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_ContactSourceCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_ContactTBinitials; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_ContactSPInitials; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_ContactAreaCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_ContactStatusCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_ContactSLTerms; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_ContactPLTerms; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_ContactVatCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_ContactStageCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_ContactSOPriceGroupCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_ContactPOPriceGroupCode; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_ContactLayerCode; [PREFERENCES:116]DataBlob:2; *)
	End case 
	
End if 
ERR_MethodTrackerReturn("DM_ScreentoOptions"; $_t_oldMethodName)
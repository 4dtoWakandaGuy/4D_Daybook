//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_OrderDefBlobtoVariables
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
	C_LONGINT:C283($_l_offset; DM_cb_ORDERallocate; DM_cb_ORDERInvoice; DM_cb_PrintComments)
	C_TEXT:C284($_t_oldMethodName; DM_t_OrderAnalysisCode; DM_t_OrderAREACode; DM_t_OrderCurrencyCode; DM_t_OrderDelMethod; DM_t_OrderDelterms; DM_t_OrderIPriceCode; DM_t_OrderlayerCode; DM_t_OrderPersonInitials; DM_t_OrderSourceCode; DM_t_OrderTBinitials)
	C_TEXT:C284(DM_t_OrderTerms; DM_t_OrderTypeCode; DM_t_SettingsName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_OrderDefBlobtoVariables")
ARRAY INTEGER:C220(DM_ai_DefaultState; 0)
ARRAY TEXT:C222(DM_at_StateNames; 0)
ARRAY TEXT:C222(DM_at_StateFunction; 0)

$_l_offset:=0
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_SettingsName; $_l_offset)
If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_OrderTypeCode; $_l_offset)
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_OrderPersonInitials; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_OrderSourceCode; $_l_offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_OrderTBinitials; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_OrderAREACode; $_l_offset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
						
						
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_OrderCurrencyCode; $_l_offset)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_OrderAnalysisCode; $_l_offset)
							
							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_OrderlayerCode; $_l_offset)
								If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_OrderDelMethod; $_l_offset)
									If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_OrderDelterms; $_l_offset)
										If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
											BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_OrderTerms; $_l_offset)
											If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
												BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_OrderIPriceCode; $_l_offset)
												If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
													
													BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_ai_DefaultState; $_l_offset)
													If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
														BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_at_StateNames; $_l_offset)
														If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
															BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_at_StateFunction; $_l_offset)
															If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																//valid this against the ALL states
																BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_cb_PrintComments; $_l_offset)
																If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																	//valid this against the ALL states
																	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_cb_ORDERInvoice; $_l_offset)
																	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																		//valid this against the ALL states
																		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_cb_ORDERallocate; $_l_offset)
																	End if 
																End if 
															End if 
														End if 
													End if 
												End if 
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DM_OrderDefBlobtoVariables"; $_t_oldMethodName)
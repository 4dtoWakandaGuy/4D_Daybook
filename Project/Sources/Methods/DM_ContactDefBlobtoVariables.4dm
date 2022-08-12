//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_ContactDefBlobtoVariables
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
	C_LONGINT:C283($_l_Offset)
	C_TEXT:C284($_t_oldMethodName; DM_t_ContactAreaCode; DM_t_ContactLayerCode; DM_t_ContactPLTerms; DM_t_ContactPOPriceGroupCode; DM_t_ContactRoleCode; DM_t_ContactSLTerms; DM_t_ContactSOPriceGroupCode; DM_t_ContactSourceCode; DM_t_ContactSPInitials; DM_t_ContactStageCode)
	C_TEXT:C284(DM_t_ContactStatusCode; DM_t_ContactTBinitials; DM_t_ContactTypeCode; DM_t_ContactVatCode; DM_t_SettingsName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_ContactDefBlobtoVariables")
$_l_Offset:=0
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_SettingsName; $_l_Offset)
If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_ContactRoleCode; $_l_Offset)  //contacts
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_ContactTypeCode; $_l_Offset)  //cont and comp
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_ContactSourceCode; $_l_Offset)  //cont and comp
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_ContactTBinitials; $_l_Offset)  //cont and comp
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_ContactSPInitials; $_l_Offset)  //cont and comp
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_ContactAreaCode; $_l_Offset)  //comp
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_ContactStatusCode; $_l_Offset)  //cont and comp
							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_ContactSLTerms; $_l_Offset)  //comp
								If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_ContactPLTerms; $_l_Offset)  //comp
									If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_ContactVatCode; $_l_Offset)  //comp
										If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
											BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_ContactStageCode; $_l_Offset)  //comp
											If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
												BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_ContactSOPriceGroupCode; $_l_Offset)  //comp
												If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
													BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_ContactPOPriceGroupCode; $_l_Offset)  //comp
													If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
														BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_ContactLayerCode; $_l_Offset)  //comp
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
ERR_MethodTrackerReturn("DM_ContactDefBlobtoVariables"; $_t_oldMethodName)
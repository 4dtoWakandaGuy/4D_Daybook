//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_DiaryDefBlobtoVariables
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 20:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_offset)
	C_REAL:C285(DM_R_dAlarmTimeFrame; DM_R_dChargeRate; DM_R_dUnits; DM_R_dValue)
	C_TEXT:C284($_t_oldMethodName; DM_t_dActionCode; DM_t_dCompanyCode; DM_t_dContactCode; DM_t_dDocumentCode; DM_t_dJobCode; DM_t_dMacroCode; DM_t_dOrderCode; DM_t_dOriginator; DM_t_dPersonCode; DM_t_dPersPrior)
	C_TEXT:C284(DM_t_dPictureCode; DM_t_dPriority; DM_t_dProductCode; DM_t_dResultCode; DM_t_dSerCallCode; DM_t_SettingsName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_DiaryDefBlobtoVariables")

//Values that may be driven by the defaults
//ACTION CODE

//(SERVICE) CALL CODE
//CHARGE RATE
//ALARM TIME FRAME
//COMPANY CODE
//CONTACT CODE
//DOCUMENT CODE
//JOB CODE
//MACRO CODE
//ORDER CODE
//PERSON
//ORIGINATOR
//PERSPRIOR
//PICTURE CODE
//PRIORITY
//PRODUCT CODE
//RESULT CODE
//UNITS
//VALUE

$_l_offset:=0

BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_dActionCode; $_l_offset)


If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_dSerCallCode; $_l_offset)
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_R_dChargeRate; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_R_dAlarmTimeFrame; $_l_offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_dCompanyCode; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					
					
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_dContactCode; $_l_offset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
						
						
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_dDocumentCode; $_l_offset)
						
						
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_dJobCode; $_l_offset)
							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_dMacroCode; $_l_offset)
								If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_dOrderCode; $_l_offset)
									If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_dPersonCode; $_l_offset)
										If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
											
											BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_dOriginator; $_l_offset)
											If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
												BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_dPersPrior; $_l_offset)
												If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
													BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_dPictureCode; $_l_offset)
													If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
														//valid this against the ALL states
														BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_dPriority; $_l_offset)
														If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
															//valid this against the ALL states
															BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_dProductCode; $_l_offset)
															If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																//valid this against the ALL states
																BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_dResultCode; $_l_offset)
																If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																	//valid this against the ALL states
																	
																	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_R_dUnits; $_l_offset)
																	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																		//valid this against the ALL states
																		
																		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_R_dValue; $_l_offset)
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
ERR_MethodTrackerReturn("DM_DiaryDefBlobtoVariables"; $_t_oldMethodName)
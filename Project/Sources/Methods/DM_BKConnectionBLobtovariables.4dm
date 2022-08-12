//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_BKConnectionBLobtovariables
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
	C_DATE:C307(DM_D_BkLastUpdateDate)
	C_LONGINT:C283($_l_offset; DM_CB_BkActive; DM_l_BkConnectionID; DM_l_BKDataModelID; DM_l_BkFrequency; DM_l_BKLastTimeStamp; DM_l_BkLastUpdateTime; DM_l_BkMaxTime; DM_l_BKOptions; DM_l_BKPostAction; DM_l_BkRetrieveType)
	C_LONGINT:C283(DM_l_BkserverID; DM_l_BkstoreID; DM_l_BkTimeOut; DM_l_LastRecord; DM_l_RecordCount)
	C_TEXT:C284($_t_oldMethodName; DM_t_BkConnectionName; DM_t_BKFileName; DM_t_BkFrequencyType; DM_T_CustomQuery)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_BKConnectionBLobtovariables")

$_l_offset:=0
BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_BkConnectionID; $_l_offset)
If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_BkConnectionName; $_l_offset)
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_BkserverID; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_BkstoreID; $_l_offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_BkTimeOut; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_BkMaxTime; $_l_offset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_BkFrequency; $_l_offset)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_BkRetrieveType; $_l_offset)
							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_BKFileName; $_l_offset)
								If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_BKDataModelID; $_l_offset)
									If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_BKPostAction; $_l_offset)
										If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
											BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_BKOptions; $_l_offset)
											If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
												BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_CB_BkActive; $_l_offset)
												If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
													BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_D_BkLastUpdateDate; $_l_offset)
													If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
														BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_BkLastUpdateTime; $_l_offset)
														If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
															BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_BKLastTimeStamp; $_l_offset)
															If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_BkFrequencyType; $_l_offset)
																If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_RecordCount; $_l_offset)
																	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_LastRecord; $_l_offset)
																		//DM_T_CustomQuery
																		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_CustomQuery; $_l_offset)
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
End if 
ERR_MethodTrackerReturn("DM_BKConnectionBLobtovariables"; $_t_oldMethodName)
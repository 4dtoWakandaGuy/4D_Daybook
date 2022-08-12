//%attributes = {}
If (False:C215)
	//Project Method Name:      PRT_ManageDymoSettings
	//------------------ Method Notes ------------------
	//this method loads the dymo setting OR saves the dymo settings
	//------------------ Revision Control ----------------
	//Date Created: 29/05/2012 10:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(Prt_al_labelobjectFontsize;0)
	//ARRAY LONGINT(Prt_al_labelobjectFontStyle;0)
	//ARRAY LONGINT(Prt_al_labelobjectFramecolour;0)
	//ARRAY LONGINT(Prt_al_labelobjectFrameOption;0)
	//ARRAY LONGINT(Prt_al_labelobjectFrameWidth;0)
	//ARRAY LONGINT(Prt_al_LabelobjectHeight;0)
	//ARRAY LONGINT(Prt_al_labelobjectLeftPos;0)
	//ARRAY LONGINT(Prt_al_LabelobjectTopPos;0)
	//ARRAY LONGINT(Prt_al_LabelobjectWidth;0)
	//ARRAY TEXT(Prt_at_LabelobjectAlignment;0)
	//ARRAY TEXT(Prt_at_LabelObjectFont;0)
	//ARRAY TEXT(PRT_At_LabelObjects;0)
	//ARRAY TEXT(PRT_at_LabelObjectType;0)
	C_BOOLEAN:C305($_bo_Save; $1; PRT_bo_IncludeCount; PRT_bo_IncludeDateTime; PRT_bo_IncludeTime; PRT_bo_TwentyFour)
	C_LONGINT:C283($_l_offset; PRT_l_CounterIncrementValue; PRT_l_CounterLeadingZeros; PRT_l_CounterobjectLeft; PRT_l_CounterobjectTop; PRT_l_CounterobjectWidth; PRT_l_CounterStartingValue; PRT_l_DateLeft; PRT_l_DateTop; PRT_l_DateWidth; PRT_l_NumberofCopies)
	C_TEXT:C284($_t_oldMethodName; PRT_T_CalcuateNumberofCopies; PRT_T_CounterAfter; PRT_T_CounterBefore; PRT_T_CounterFormula; PRT_T_DateAfter; PRT_T_DateBefore; PRT_T_DateFormat; PRT_t_LabelTemplate; Prt_t_LabelTray; PRT_t_PrintOrientation)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRT_ManageDymoSettings")
If (Count parameters:C259>=1)
	$_bo_Save:=$1
Else 
	$_bo_Save:=False:C215
End if 
//TRACE
If (Not:C34($_bo_Save))
	$_l_offset:=0
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_t_LabelTemplate; $_l_offset)  //
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Prt_t_LabelTray; $_l_offset)  //²
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_t_PrintOrientation; $_l_offset)  //$content:=$content:="set verticalLabel to "+"TRUE"+Char(13)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_l_NumberofCopies; $_l_offset)  //V
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_T_CalcuateNumberofCopies; $_l_offset)  //²
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_bo_IncludeCount; $_l_offset)  //²
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_T_CounterFormula; $_l_offset)  //²= calculate current value
							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_T_CounterBefore; $_l_offset)  //²
								If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_T_CounterAfter; $_l_offset)  //²
									If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_l_CounterLeadingZeros; $_l_offset)  //²
										If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
											BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_l_CounterobjectWidth; $_l_offset)  //²
											If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
												BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_l_CounterobjectLeft; $_l_offset)  //²
												If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)  //²
													BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_l_CounterobjectTop; $_l_offset)  //²
													If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
														BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_l_CounterStartingValue; $_l_offset)  //²
														If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
															BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_l_CounterIncrementValue; $_l_offset)  //²
															If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_bo_IncludeDateTime; $_l_offset)  //²
																If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_bo_IncludeTime; $_l_offset)  //²
																	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_bo_TwentyFour; $_l_offset)  //²
																		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_T_DateBefore; $_l_offset)  //²
																			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_T_DateAfter; $_l_offset)  //²
																				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_T_DateFormat; $_l_offset)  //²
																					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_l_DateLeft; $_l_offset)  //²
																						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_l_DateTop; $_l_offset)  //²
																							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_l_DateWidth; $_l_offset)  //²
																								If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																									
																									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_At_LabelObjects; $_l_offset)
																									If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_at_LabelObjectType; $_l_offset)
																										If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																											BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Prt_at_LabelObjectFont; $_l_offset)
																											
																											If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																												BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Prt_al_labelobjectFontsize; $_l_offset)
																												
																												
																												If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																													BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Prt_al_labelobjectFontStyle; $_l_offset)
																													
																													
																													If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																														BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Prt_al_labelobjectFrameOption; $_l_offset)
																														
																														
																														
																														
																														If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																															BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Prt_al_labelobjectFrameWidth; $_l_offset)
																															
																															
																															If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																																BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Prt_al_labelobjectFramecolour; $_l_offset)
																																
																																
																																If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																																	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Prt_al_labelobjectLeftPos; $_l_offset)
																																	
																																	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																																		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Prt_al_LabelobjectTopPos; $_l_offset)
																																		
																																		
																																		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																																			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Prt_al_LabelobjectWidth; $_l_offset)
																																			
																																			
																																			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																																				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Prt_al_LabelobjectHeight; $_l_offset)
																																				
																																				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
																																					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Prt_at_LabelobjectAlignment; $_l_offset)
																																					
																																				Else 
																																					ARRAY TEXT:C222(Prt_at_LabelobjectAlignment; Size of array:C274(Prt_al_LabelobjectHeight))
																																					
																																					
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
Else 
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	$_l_offset:=0
	VARIABLE TO BLOB:C532(PRT_t_LabelTemplate; [PREFERENCES:116]DataBlob:2; *)  //1
	VARIABLE TO BLOB:C532(Prt_t_LabelTray; [PREFERENCES:116]DataBlob:2; *)  //2
	VARIABLE TO BLOB:C532(Prt_t_PrintOrientation; [PREFERENCES:116]DataBlob:2; *)  //3
	VARIABLE TO BLOB:C532(Prt_l_NumberofCopies; [PREFERENCES:116]DataBlob:2; *)  //4
	VARIABLE TO BLOB:C532(Prt_T_CalcuateNumberofCopies; [PREFERENCES:116]DataBlob:2; *)  //5
	VARIABLE TO BLOB:C532(PRT_bo_IncludeCount; [PREFERENCES:116]DataBlob:2; *)  //6
	VARIABLE TO BLOB:C532(Prt_T_CounterFormula; [PREFERENCES:116]DataBlob:2; *)  //7
	VARIABLE TO BLOB:C532(Prt_T_CounterBefore; [PREFERENCES:116]DataBlob:2; *)  //8
	VARIABLE TO BLOB:C532(Prt_T_CounterAfter; [PREFERENCES:116]DataBlob:2; *)  //9
	VARIABLE TO BLOB:C532(Prt_l_CounterLeadingZeros; [PREFERENCES:116]DataBlob:2; *)  //10
	VARIABLE TO BLOB:C532(Prt_l_CounterobjectWidth; [PREFERENCES:116]DataBlob:2; *)  //11
	VARIABLE TO BLOB:C532(PRT_l_CounterobjectLeft; [PREFERENCES:116]DataBlob:2; *)  //12
	VARIABLE TO BLOB:C532(PRT_l_CounterobjectTop; [PREFERENCES:116]DataBlob:2; *)  //13
	VARIABLE TO BLOB:C532(Prt_l_CounterStartingValue; [PREFERENCES:116]DataBlob:2; *)  //14
	VARIABLE TO BLOB:C532(Prt_l_CounterIncrementValue; [PREFERENCES:116]DataBlob:2; *)  //15
	VARIABLE TO BLOB:C532(PRT_bo_IncludeDateTime; [PREFERENCES:116]DataBlob:2; *)  //16
	VARIABLE TO BLOB:C532(PRT_bo_IncludeTime; [PREFERENCES:116]DataBlob:2; *)  //17
	VARIABLE TO BLOB:C532(PRT_bo_TwentyFour; [PREFERENCES:116]DataBlob:2; *)  //18
	VARIABLE TO BLOB:C532(Prt_T_DateBefore; [PREFERENCES:116]DataBlob:2; *)  //19
	VARIABLE TO BLOB:C532(Prt_T_DateAfter; [PREFERENCES:116]DataBlob:2; *)  //20
	VARIABLE TO BLOB:C532(Prt_T_DateFormat; [PREFERENCES:116]DataBlob:2; *)  //21
	VARIABLE TO BLOB:C532(PRT_l_DateLeft; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(PRT_l_DateTop; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(PRT_l_DateWidth; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(Prt_At_LabelObjects; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(Prt_at_LabelObjectType; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(Prt_at_LabelObjectFont; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(Prt_al_labelobjectFontsize; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(Prt_al_labelobjectFontStyle; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(Prt_al_labelobjectFrameOption; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(Prt_al_labelobjectFrameWidth; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(Prt_al_labelobjectFramecolour; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(Prt_al_labelobjectLeftPos; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(Prt_al_LabelobjectTopPos; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(Prt_al_LabelobjectWidth; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(Prt_al_LabelobjectHeight; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(Prt_at_LabelobjectAlignment; [PREFERENCES:116]DataBlob:2; *)
	
End if 
ERR_MethodTrackerReturn("PRT_ManageDymoSettings"; $_t_oldMethodName)

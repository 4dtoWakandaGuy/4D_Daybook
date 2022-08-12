//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      MailP Lab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305($_bo_Continue; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_Columns; $_l_FormFeed; $_l_index; $_l_OK; $_l_Rows; $_l_WindowReferenceRow; $1C_LONGINT; $Form; ch5; cLabels)
	C_LONGINT:C283(rComp; rCont; rContr; rDiary; rOrd; rState; WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_CurrentTable; $1; DOC_p_CurrentTablePointer)
	C_REAL:C285(vT1; vT2; vT3; vT4; vT5)
	C_TEXT:C284($_t_LabelTypeName; $_t_oldMethodName; vDesc1; vDesc2; vDesc3; vDesc4; vDetails; vDetails1; vDetails2; vDetails3; vDetails4)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vOurRef; vProdCode; vSubGroup1; vSubGroup2; vSubGroup3; vSubGroup4; vT5Document; vTitle1)
	C_TEXT:C284(vTitle2; vTitle3; vTitle4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MailP Lab")
//MailP LabvDesc2vDesc2
<>SYS_l_CancelProcess:=0
vOurRef:=""

$_ptr_CurrentTable:=$1
If (cLabels=1)
	MailP_Ready("Are you ready to Print Labels?")
	If (OK=1)
		DOC_p_CurrentTablePointer:=$1
		Open_AnyTypeWindow(258; 483; 5; "Label Requirements")
		DIALOG:C40([DOCUMENTS:7]; "dAsk Label")
		$_l_OK:=OK
		OK:=1
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		CLOSE WINDOW:C154
		If ($_l_OK=1)
			Case of 
				: (vT1=1)
					$_t_LabelTypeName:="MailLabel"
					$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Mail Label")
					$_bo_Continue:=($_l_OK>=0)  // See in Preint_SetSize about this
					//PAGE SETUP([DOCUMENTS];"Mail Label")
					$_l_Rows:=8
					$_l_Columns:=2
				: (vT2=1)
					$_t_LabelTypeName:="Mail Label 7x2"
					
					$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Mail Label 7x2")
					$_bo_Continue:=($_l_OK>=0)  // See in Preint_SetSize about this
					//PAGE SETUP([DOCUMENTS];"Mail Label 7x2")
					$_l_Rows:=8
					$_l_Columns:=2
				: (vT3=1)
					$_t_LabelTypeName:="Mail Label4"
					$_l_OK:=PRINT_SetSIZE("A4"; "L"; "Mail Label4")
					// PAGE SETUP([DOCUMENTS];"Mail Label4")
					$_bo_Continue:=($_l_OK>=0)  // See in Preint_SetSize about this
					$_l_Rows:=9
					$_l_Columns:=4
				: (vT4=1)
					$_t_LabelTypeName:="Mail Label4/13"
					$_l_OK:=PRINT_SetSIZE("A4"; "L"; "Mail Label4/13")
					$_bo_Continue:=($_l_OK>=0)  // See in Preint_SetSize about this
					// PAGE SETUP([DOCUMENTS];"Mail Label4/13")
					$_l_Rows:=9
					$_l_Columns:=4
				: (vT5=1)
					$_l_OK:=1  //added -kmw,  04/11/08 v631b120d
					$_bo_Continue:=True:C214  //added -kmw,  04/11/08 v631b120d
				Else 
					$_l_OK:=-1
					$_bo_Continue:=False:C215  //typo fixed -kmw,  04/11/08 v631b120d   `$COnitnue:=False
			End case 
			If ($_bo_Continue)
				If (Vt5#1)
					If ($_l_OK=1)
						PRINT SETTINGS:C106
					End if 
				End if 
				
				vDesc1:=""
				vDesc2:=""
				vDesc3:=""
				vDesc4:=""
				vSubGroup1:=""
				vSubGroup2:=""
				vSubGroup3:=""
				vSubGroup4:=""
				vTitle1:=""
				vTitle2:=""
				vTitle3:=""
				vTitle4:=""
				vOurRef:=""
				$_l_FormFeed:=0
				//  PRINT SETTINGS
				If (OK=1)
					Check_Labels
					If (OK=1)
						FIRST RECORD:C50($_ptr_CurrentTable->)
						Mail_MSRec
						If (Vt5=0)
							While ((Not:C34(End selection:C36($_ptr_CurrentTable->))) & (<>SYS_l_CancelProcess#Current process:C322))
								Case of 
									: (vT1=1)
										//   PRINT LAYOUT([documents];"Label Extra")
									: (vT2=1)
										If ($_l_FormFeed=0)
											Print form:C5([DOCUMENTS:7]; "Blankspace_fORLABELS")
										End if 
										$_l_FormFeed:=$_l_FormFeed+1
										If ($_l_FormFeed>7)
											$_l_FormFeed:=0
										End if 
										Print form:C5([DOCUMENTS:7]; "Label Extra 7x2")
									: (vT3=1)
										
									: (vT4=1)
									: (VT5=1)
										//Label
								End case 
								$_l_index:=1
								If (Vt5#1)
									While (($_l_index<$_l_Rows) & (Not:C34(End selection:C36($_ptr_CurrentTable->))) & (<>SYS_l_CancelProcess#Current process:C322))  //2
										Case of 
											: (rComp=1)
												MComp_Add("L")
												vDetails1:=vDetails
												Mail_MSOurRef
												vTitle1:=vOurRef
												MailP_LabCC(->vDesc1; ->vSubGroup1)
												Mail_LetAlloc("Label")
												NEXT RECORD:C51($_ptr_CurrentTable->)
												Mail_MSRec
												If ([COMPANIES:2]Company_Code:1#"")
													MComp_Add("L")
													vDetails2:=vDetails
													Mail_MSOurRef
													vTitle2:=vOurRef
													
													MailP_LabCC(->vDesc2; ->vSubGroup2)
													
													Mail_LetAlloc("Label")
												Else 
													vDetails2:=""
													vTitle2:=""
													vSubGroup2:=""
													vDesc2:=""
												End if 
												NEXT RECORD:C51($_ptr_CurrentTable->)
												Mail_MSRec
												If ($_l_Columns>2)
													If ([COMPANIES:2]Company_Code:1#"")
														MComp_Add("L")
														vDetails3:=vDetails
														Mail_MSOurRef
														vTitle3:=vOurRef
														MailP_LabCC(->vDesc3; ->vSubGroup3)
														Mail_LetAlloc("Label")
													Else 
														vDetails3:=""
														vTitle3:=""
														vSubGroup3:=""
														vDesc3:=""
													End if 
													NEXT RECORD:C51($_ptr_CurrentTable->)
													Mail_MSRec
													If ($_l_Columns>3)
														If ([COMPANIES:2]Company_Code:1#"")
															MComp_Add("L")
															vDetails4:=vDetails
															Mail_MSOurRef
															vTitle4:=vOurRef
															MailP_LabCC(->vDesc4; ->vSubGroup4)
															Mail_LetAlloc("Label")
														Else 
															vDetails4:=""
															vTitle4:=""
															vSubGroup4:=""
															vDesc4:=""
														End if 
														NEXT RECORD:C51($_ptr_CurrentTable->)
														Mail_MSRec
													End if 
												End if 
												
											: (rCont=1)
												MContComp_Calc
												MCont_Add("L")
												vDetails1:=vDetails
												Mail_MSOurRef
												vTitle1:=vOurRef
												MailP_LabCC(->vDesc1; ->vSubGroup1)
												Mail_LetAlloc("Label")
												MZComp
												If ([CONTACTS:1]Company_Code:1#"")
													MContComp_Calc
													MCont_Add("L")
													vDetails2:=vDetails
													Mail_MSOurRef
													vTitle2:=vOurRef
													MailP_LabCC(->vDesc2; ->vSubGroup2)
													Mail_LetAlloc("Label")
												Else 
													vDetails2:=""
													vTitle2:=""
													vSubGroup2:=""
													vDesc2:=""
												End if 
												MZComp
												If ($_l_Columns>2)
													If ([CONTACTS:1]Company_Code:1#"")
														MContComp_Calc
														MCont_Add("L")
														vDetails3:=vDetails
														Mail_MSOurRef
														vTitle3:=vOurRef
														MailP_LabCC(->vDesc3; ->vSubGroup3)
														Mail_LetAlloc("Label")
													Else 
														vDetails3:=""
														vTitle3:=""
														vSubGroup3:=""
														vDesc3:=""
													End if 
													MZComp
													If ($_l_Columns>3)
														If ([CONTACTS:1]Company_Code:1#"")
															MContComp_Calc
															MCont_Add("L")
															vDetails4:=vDetails
															Mail_MSOurRef
															vTitle4:=vOurRef
															MailP_LabCC(->vDesc4; ->vSubGroup4)
															Mail_LetAlloc("Label")
														Else 
															vDetails4:=""
															vTitle4:=""
															vSubGroup4:=""
															vDesc4:=""
														End if 
														MZComp
													End if 
												End if 
												
											: (rDiary=1)
												RELATE ONE:C42([DIARY:12]Company_Code:1)
												RELATE ONE:C42([DIARY:12]Contact_Code:2)
												MCont_Add("L")
												vDetails1:=vDetails
												Mail_MSOurRef
												vTitle1:=vOurRef
												MailP_LabCC(->vDesc1; ->vSubGroup1)
												Mail_LetAlloc("Label")
												MZDiary
												If (([DIARY:12]Company_Code:1#""))
													RELATE ONE:C42([DIARY:12]Company_Code:1)
													RELATE ONE:C42([DIARY:12]Contact_Code:2)
													MCont_Add("L")
													vDetails2:=vDetails
													Mail_MSOurRef
													vTitle2:=vOurRef
													MailP_LabCC(->vDesc2; ->vSubGroup2)
													Mail_LetAlloc("Label")
												Else 
													vDetails2:=""
													vTitle2:=""
													vSubGroup2:=""
													vDesc2:=""
												End if 
												MZDiary
												If ($_l_Columns>2)
													If (([DIARY:12]Company_Code:1#""))
														RELATE ONE:C42([DIARY:12]Company_Code:1)
														RELATE ONE:C42([DIARY:12]Contact_Code:2)
														MCont_Add("L")
														vDetails3:=vDetails
														Mail_MSOurRef
														vTitle3:=vOurRef
														MailP_LabCC(->vDesc3; ->vSubGroup3)
														Mail_LetAlloc("Label")
													Else 
														vDetails3:=""
														vTitle3:=""
														vSubGroup3:=""
														vDesc3:=""
													End if 
													MZDiary
													If ($_l_Columns>3)
														If (([DIARY:12]Company_Code:1#""))
															RELATE ONE:C42([DIARY:12]Company_Code:1)
															RELATE ONE:C42([DIARY:12]Contact_Code:2)
															MCont_Add("L")
															vDetails4:=vDetails
															Mail_MSOurRef
															vTitle4:=vOurRef
															MailP_LabCC(->vDesc4; ->vSubGroup4)
															Mail_LetAlloc("Label")
														Else 
															vDetails4:=""
															vTitle4:=""
															vSubGroup4:=""
															vDesc4:=""
														End if 
														MZDiary
													End if 
												End if 
												
											: (rContr=1)
												RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
												RELATE ONE:C42([CONTRACTS:17]Contact_Code:2)
												MCont_Add("")
												vDetails1:=vDetails
												Mail_MSOurRef
												vTitle1:=vOurRef
												Mail_LetAlloc("Label")
												MZContr
												If (([CONTRACTS:17]Company_Code:1#""))
													RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
													RELATE ONE:C42([CONTRACTS:17]Contact_Code:2)
													MCont_Add("L")
													vDetails2:=vDetails
													Mail_MSOurRef
													vTitle2:=vOurRef
													Mail_LetAlloc("Label")
												Else 
													vDetails2:=""
													vTitle2:=""
												End if 
												MZContr
												
											: (rOrd>0)
												If (rOrd=2)
													RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
												End if 
												RELATE ONE:C42([ORDERS:24]Company_Code:1)
												RELATE ONE:C42([ORDERS:24]Contact_Code:2)
												MCont_Add("")
												vDetails1:=vDetails
												Mail_MSOurRef
												vTitle1:=vOurRef
												Mail_LetAlloc("Label")
												MZOrd
												If (([ORDERS:24]Company_Code:1#""))
													If (rOrd=2)
														RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
													End if 
													RELATE ONE:C42([ORDERS:24]Company_Code:1)
													RELATE ONE:C42([ORDERS:24]Contact_Code:2)
													MCont_Add("L")
													vDetails2:=vDetails
													Mail_MSOurRef
													vTitle2:=vOurRef
													Mail_LetAlloc("Label")
												Else 
													vDetails2:=""
													vTitle2:=""
												End if 
												MZOrd
												
											: ((rState=1) | (rState=3))
												MState_CalcRel
												MCont_Add("L")
												vDetails1:=vDetails
												Mail_MSOurRef
												vTitle1:=vOurRef
												Mail_LetAlloc("Label")
												NEXT RECORD:C51($_ptr_CurrentTable->)
												Mail_MSRec
												If ([COMPANIES:2]Company_Code:1#"")
													MState_CalcRel
													MCont_Add("L")
													vDetails2:=vDetails
													Mail_MSOurRef
													vTitle2:=vOurRef
													Mail_LetAlloc("Label")
												Else 
													vDetails2:=""
													vTitle2:=""
												End if 
												NEXT RECORD:C51($_ptr_CurrentTable->)
												Mail_MSRec
											: (rState=2)
												RELATE ONE:C42([INVOICES:39]Company_Code:2)
												RELATE ONE:C42([INVOICES:39]Contact_Code:3)
												MCont_Add("")
												vDetails1:=vDetails
												Mail_MSOurRef
												vTitle1:=vOurRef
												Mail_LetAlloc("Label")
												MZInv
												If (([INVOICES:39]Company_Code:2#""))
													RELATE ONE:C42([INVOICES:39]Company_Code:2)
													RELATE ONE:C42([INVOICES:39]Contact_Code:3)
													MCont_Add("L")
													vDetails2:=vDetails
													Mail_MSOurRef
													vTitle2:=vOurRef
													Mail_LetAlloc("Label")
												Else 
													vDetails2:=""
													vTitle2:=""
												End if 
												MZInv
												
												
												
										End case 
										Case of 
											: (vT1=1)
												Print form:C5([DOCUMENTS:7]; "Mail Label")
											: (vT2=1)
												If ($_l_FormFeed=0)
													Print form:C5([DOCUMENTS:7]; "Blankspace_fORLABELS")
												End if 
												$_l_FormFeed:=$_l_FormFeed+1
												If ($_l_FormFeed>7)
													$_l_FormFeed:=0
												End if 
												Print form:C5([DOCUMENTS:7]; "Mail Label 7x2")
											: (vT3=1)
												Print form:C5([DOCUMENTS:7]; "Mail Label4")
												PAGE BREAK:C6
											: (vT4=1)
												Print form:C5([DOCUMENTS:7]; "Mail Label4/13")
												PAGE BREAK:C6
										End case 
										$_l_index:=$_l_index+1
										NEXT RECORD:C51($_ptr_CurrentTable->)
									End while   //2
									If ((vT1=1) | (vT2=1))
										PAGE BREAK:C6
									End if 
									PRT_SetPrinterPaperOptions($_t_LabelTypeName)  //NG June 2005
								Else 
									//here we need to get the records into the mailsort order
									WS_CustomLabels(DOC_p_CurrentTablePointer)
									
									
								End if 
								NEXT RECORD:C51($_ptr_CurrentTable->)
							End while   //
						Else 
							//here we need to get the records into the mailsort order
							WS_CustomLabels(DOC_p_CurrentTablePointer)
						End if 
						
						
						
					End if 
				End if 
			End if 
			
		End if 
	End if 
End if 

If ((ch5=1) & (DB_GetModuleSettingByNUM(31)>1))
	MailP_Ready("Are you ready to Print Mailsort Bag Labels?")
	If (OK=1)
		Open_AnyTypeWindow(258; 483; 5; "Mailsort Bag Label Requirements")
		DIALOG:C40([DOCUMENTS:7]; "dAsk Label")
		CLOSE WINDOW:C154
		$_l_OK:=OK
		OK:=1
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		If ($_l_OK=1)
			
			Case of 
				: (vT1=1)
					$_t_LabelTypeName:="MailLabel"
					$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Mail Label")
					$_bo_Continue:=($_l_OK>=0)  // See in Preint_SetSize about this
					//PAGE SETUP([DOCUMENTS];"Mail Label")
					$_l_Rows:=8
					$_l_Columns:=2
				: (vT2=1)
					$_t_LabelTypeName:="Mail Label 7x2"
					
					$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Mail Label 7x2")
					$_bo_Continue:=($_l_OK>=0)  // See in Preint_SetSize about this
					//PAGE SETUP([DOCUMENTS];"Mail Label 7x2")
					$_l_Rows:=8
					$_l_Columns:=2
				: (vT3=1)
					$_t_LabelTypeName:="Mail Label4"
					$_l_OK:=PRINT_SetSIZE("A4"; "L"; "Mail Label4")
					$_bo_Continue:=($_l_OK>=0)  // See in Preint_SetSize about this
					// PAGE SETUP([DOCUMENTS];"Mail Label4")
					$_l_Rows:=9
					$_l_Columns:=4
				: (vT4=1)
					$_t_LabelTypeName:="Mail Label4/13"
					$_l_OK:=PRINT_SetSIZE("A4"; "L"; "Mail Label4/13")
					$_bo_Continue:=($_l_OK>=0)  // See in Preint_SetSize about this
					// PAGE SETUP([DOCUMENTS];"Mail Label4/13")
					$_l_Rows:=9
					$_l_Columns:=4
				Else 
					$_l_OK:=-1
					$_bo_Continue:=False:C215
			End case 
			If ($_bo_Continue)
				If ($_l_OK=1)  // See in Print_SetSize about this
					PRINT SETTINGS:C106
				End if 
				If (OK=1)
					vDesc1:=""
					vDesc2:=""
					vDesc3:=""
					vDesc4:=""
					vSubGroup1:=""
					vSubGroup2:=""
					vSubGroup3:=""
					vSubGroup4:=""
					vTitle1:=""
					vTitle2:=""
					vTitle3:=""
					vTitle4:=""
					vOurRef:=FirstWord(vProdCode)
					DB_t_CurrentFormUsage2:="Bag"
					
					QUERY:C277([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]Record_Number:1=999999; *)
					QUERY:C277([MAILSORT_MAIL:83];  & ; [MAILSORT_MAIL:83]SSC:3#"000@")
					Mail_MSSort
					Mail_MSStart
					
					While ((Not:C34(End selection:C36([MAILSORT_MAIL:83]))) & (<>SYS_l_CancelProcess#Current process:C322))
						
						Case of 
							: (vT2=1)
								Print form:C5([DOCUMENTS:7]; "Label Extra 7x2")
						End case 
						$_l_index:=1
						
						While (($_l_index<$_l_Rows) & (Not:C34(End selection:C36([MAILSORT_MAIL:83]))) & (<>SYS_l_CancelProcess#Current process:C322))
							
							Mail_MSBagLab
							vDetails1:=vDetails
							Mail_MSBagLab
							vDetails2:=vDetails
							If ($_l_Columns>2)
								Mail_MSBagLab
								vDetails3:=vDetails
								If ($_l_Columns>3)
									Mail_MSBagLab
									vDetails4:=vDetails
								End if 
							End if 
							
							Case of 
								: (vT1=1)
									Print form:C5([DOCUMENTS:7]; "Mail Label")
								: (vT2=1)
									If ($_l_FormFeed=0)
										Print form:C5([DOCUMENTS:7]; "Blankspace_fORLABELS")
									End if 
									$_l_FormFeed:=$_l_FormFeed+1
									If ($_l_FormFeed>7)
										$_l_FormFeed:=0
									End if 
									Print form:C5([DOCUMENTS:7]; "Mail Label 7x2")
								: (vT3=1)
									Print form:C5([DOCUMENTS:7]; "Mail Label4")
									PAGE BREAK:C6
								: (vT4=1)
									Print form:C5([DOCUMENTS:7]; "Mail Label4/13")
									PAGE BREAK:C6
							End case 
							$_l_index:=$_l_index+1
						End while 
						If ((vT1=1) | (vT2=1))
							PAGE BREAK:C6
						End if 
						
					End while 
					PRT_SetPrinterPaperOptions($_t_LabelTypeName)  //NG June 2005
					
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("MailP Lab"; $_t_oldMethodName)
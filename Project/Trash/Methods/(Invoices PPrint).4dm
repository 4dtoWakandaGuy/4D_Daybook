//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices PPrint
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 15:32`Method: Invoices PPrint
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(INV_aptr_ListboxSetup;0)
	C_BOOLEAN:C305($_bo_Accept; $_bo_Continue; $_bo_isPosted; $1; $2; INV_bo_Addingitem; INV_bo_newInvoice; PRT_bo_AskPerIteration; PRT_bo_AutoIteration; PRT_bo_ToPdf; PRT_bo_ToScreenPreview)
	C_BOOLEAN:C305(SR_bo_Validated)
	C_DATE:C307(vInvDate)
	C_LONGINT:C283(PRT_Count; VADD; vRe)
	C_REAL:C285(vTotal)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_CurrentWindowTitle; $_t_DocumentName; $_t_InvoiceTitle; $_t_oldMethodName; $_t_PrintText; $_t_WindowTitle; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; PRT_t_pdfOutputFilePath)
	C_TEXT:C284(vComments; vNumber; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices PPrint")
//TRACE
Invoices_FormL2
SR_bo_Validated:=False:C215
//Project Method Invoices PPrint/3/2(ID-1792-8380)
If (Count parameters:C259>=1)
	$_bo_Accept:=$1
Else 
	
	$_bo_Accept:=(DB_t_CurrentFormUsage3#"NoAcc")
	If (DB_t_CurrentFormUsage3#"NoAcc")
		//Gen_Confirm ("Hold Invoice screen after printing?";"No";"Yes")
		
		$_bo_Accept:=False:C215
		
		
	End if 
End if 

//Invoices PPrint
Menu_Record("Invoices PPrint"; "Print")
LBi_pRefs4upd(->INV_aptr_ListboxSetup)
If ((DB_t_CurrentFormUsage="CN") & ([INVOICES:39]Total_Invoiced:5>0))
	Inv_AcceptCNChk
End if 
INV_SaveDeliveryAddress
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage

If (([INVOICES:39]Invoice_Number:1="0") | ([INVOICES:39]Invoice_Number:1=""))
	Inv_No
	
	
End if 
vNumber:=[INVOICES:39]Invoice_Number:1
If (([INVOICES:39]Invoice_Number:1="0") | ([INVOICES:39]Invoice_Number:1="") | ([INVOICES:39]Company_Code:2="") | ([INVOICES:39]Period_Code:13="") | (([INVOICES:39]Total_Invoiced:5=0) & (DB_LedgerAllowZeroInvoices=False:C215)) | ([INVOICES:39]Invoice_Date:4=!00-00-00!))
	If (Count parameters:C259>=2)
		If ($2)
			Gen_Alert("Please complete the Invoice before Printing"; "Cancel")
		Else 
			Gen_Alert("Please complete the Invoice before Posting"; "Cancel")
		End if 
	Else 
		Gen_Alert("Please complete the Invoice before Printing"; "Cancel")
	End if 
Else 
	vRe:=0
	
	$_t_CurrentWindowTitle:=Get window title:C450
	Invoices_PostTx
	SET WINDOW TITLE:C213(vText+[INVOICES:39]Invoice_Number:1)
	If (([INVOICES:39]State:10=0) & ((Read only state:C362([INVOICES:39])) | (Locked:C147([INVOICES:39]))))
		//Gen_Alert ("You cannot Print the Invoice because the record is locked";"Cancel")
		If (Count parameters:C259>=2)
			If ($2)
				Gen_Alert("You cannot Print the Invoice because the record is locked"; "Cancel")
			Else 
				Gen_Alert("You cannot Post the Invoice because the record is locked"; "Cancel")
			End if 
		Else 
			Gen_Alert("You cannot Print the Invoice because the record is locked"; "Cancel")
		End if 
		
	Else 
		//Gen_Confirm ("Print "+vText+" No. "+[INVOICES]Invoice No+"?";"Yes";"No")
		If (Count parameters:C259>=2)
			If ($2)
				Gen_Confirm("Print "+vText+" No. "+[INVOICES:39]Invoice_Number:1+"?"; "Yes"; "No")
			Else 
				OK:=1
			End if 
		Else 
			//Selected from menu
			OK:=1
			//Gen_Confirm ("Print "+vText+" No. "+[INVOICES]Invoice No+"?";"Yes";"No")
		End if 
		
		If (OK=1)
			If ((DB_GetModuleSettingByNUM(Module_SalesLedger)#2) & (DB_GetModuleSettingByNUM(Module_SalesLedger)#4))
				//Gen_Alert ("You do not have access to Print "+vText+"s";"Cancel")
				If (Count parameters:C259>=2)
					If ($2)
						Gen_Alert("You do not have access to Post "+vText+"s"; "Cancel")
					Else 
						Gen_Alert("You do not have access to Print "+vText+"s"; "Cancel")
					End if 
				Else 
					Gen_Alert("You do not have access to Print "+vText+"s"; "Cancel")
				End if 
				
				
			Else 
				If ([INVOICES:39]Company_Code:2#[COMPANIES:2]Company_Code:1)
					RELATE ONE:C42([INVOICES:39]Company_Code:2)
				End if 
				RELATE ONE:C42([COMPANIES:2]Default_Credit_Stage:42)
				$_bo_isPosted:=False:C215
				If (Count parameters:C259<2)
					If ([INVOICES:39]Posted_Date:8#!00-00-00!)
						$_bo_isPosted:=True:C214
					End if 
				End if 
				If ([CREDIT_STAGES:54]Prevent_Invoice:7) & (Not:C34($_bo_isPosted))  //dont prevent reprinting an invoice if the account is on hold
					
					Gen_Alert("This Company has a Credit Stage of "+[CREDIT_STAGES:54]Stage_Code:1+" "+[CREDIT_STAGES:54]Stage_Name:2+" and cannot be Invoiced"; "Cancel")
				Else 
					If (INV_bo_Addingitem)
						DB_SaveRecord(->[INVOICES_ITEMS:161])
					End if 
					INV_bo_Addingitem:=False:C215
					Inv_InvCalc
					Invoices_Tot
					DB_SaveRecord(->[INVOICES:39])
					If ((vTotal=0) & (DB_LedgerAllowZeroInvoices=False:C215))
						Gen_Alert(vText+" "+[INVOICES:39]Invoice_Number:1+" has a Total Amount of zero"; "Cancel")
					Else 
						OK:=1
						If ([INVOICES:39]Posted_Date:8#!00-00-00!)
							//Gen_Confirm (vText+" "+[INVOICES]Invoice No+" has already been posted.  Are you sure you want to print it?";"Yes";"No")
							If (Count parameters:C259>=2)
								If ($2)
									//now printing a posted invoice--by choice
									//Gen_Alert ("You do not have access to Post "+vText+"s";"Cancel")
									OK:=1
								Else 
									//we cannot be here-because if $2 is False then we are trying to post an invoice--if it was posted we would not be calling this method
								End if 
							Else 
								Gen_Confirm(vText+" "+[INVOICES:39]Invoice_Number:1+" has already been posted.  Are you sure you want to print it?"; "Yes"; "No")
							End if 
							
							vRe:=1
						Else 
							vRe:=0
						End if 
						If (OK=1)
							vInvDate:=[INVOICES:39]Invoice_Date:4
							If (OK=1)
								//       Gen_PP1 (»[INVOICES];"Invoices")
								If (OK=1)
									
									$_t_PrintText:=vText
									DB_t_CurrentFormUsage:="Invoice"
									vComments:=""
									$_t_DocumentName:=$_t_PrintText+[INVOICES:39]Invoice_Number:1  // 05/04/04 pb
									PRT_Count:=1
									PRT_bo_ToScreenPreview:=False:C215
									PRT_bo_ToPdf:=False:C215
									PRT_bo_AskPerIteration:=False:C215
									PRT_bo_AutoIteration:=False:C215
									PRT_t_pdfOutputFilePath:=""
									$_t_WindowTitle:=Get window title:C450
									
									If (([INVOICES:39]Delivery_Company:30#"") | ([INVOICES:39]Deliver_To:32#"") | ([INVOICES:39]x_DeliveryAddressID:48>0))
										$_t_InvoiceTitle:=[INVOICES:39]Invoice_Number:1
										
										$_t_InvoiceTitle:=Replace string:C233($_t_InvoiceTitle; ":"; "")
										$_t_InvoiceTitle:=Replace string:C233($_t_InvoiceTitle; "/"; "_")
										$_t_InvoiceTitle:=Replace string:C233($_t_InvoiceTitle; "\\"; "_")
										
										SET WINDOW TITLE:C213($_t_InvoiceTitle)
										If (Count parameters:C259>=2)
											If ($2)
												$_bo_Continue:=Gen_PPSingle_2(->[INVOICES:39]; ->[INVOICES_ITEMS:161]; "Form DT2"; "INVFormSub2"; "Invoices Out"; DB_t_CurrentFormUsage; "Invoice DT"; "Invoices_FormL2"; 0; ->[INVOICES:39]State:10; "Invoice DT"; [INVOICES:39]Analysis_Code:17)  // 08/04/04 pb
												
												
											Else 
												//Do not print..
											End if 
										Else 
											$_bo_Continue:=Gen_PPSingle_2(->[INVOICES:39]; ->[INVOICES_ITEMS:161]; "Form DT2"; "INVFormSub2"; "Invoices Out"; DB_t_CurrentFormUsage; "Invoice DT"; "Invoices_FormL2"; 0; ->[INVOICES:39]State:10; "Invoice DT"; [INVOICES:39]Analysis_Code:17)  // 08/04/04 pb
											
										End if 
										
									Else 
										If (Count parameters:C259>=2)
											If ($2)
												
												$_bo_Continue:=Gen_PPSingle_2(->[INVOICES:39]; ->[INVOICES_ITEMS:161]; "Form2"; "INVFormSub2"; "Invoices Out"; DB_t_CurrentFormUsage; "Invoice"; "Invoices_FormL2"; 0; ->[INVOICES:39]State:10; "Invoice"; [INVOICES:39]Analysis_Code:17)  // 08/04/04 pb
												
											Else 
												//Do not print..
											End if 
										Else 
											$_bo_Continue:=Gen_PPSingle_2(->[INVOICES:39]; ->[INVOICES_ITEMS:161]; "Form2"; "INVFormSub2"; "Invoices Out"; DB_t_CurrentFormUsage; "Invoice"; "Invoices_FormL2"; 0; ->[INVOICES:39]State:10; "Invoice"; [INVOICES:39]Analysis_Code:17)  // 08/04/04 pb
										End if 
										
										
									End if 
									SET WINDOW TITLE:C213($_t_WindowTitle)
									vText:=$_t_PrintText
									
								End if 
								//    Gen_PP2 ("Invoices")
								If ((DB_t_CurrentFormUsage="Invoice") & (OK=1) & (vRe=0) & (Read only state:C362([INVOICES:39])=False:C215))
									If ([INVOICES:39]State:10=-1)
										If (DB_t_CurrentFormUsage3#"NoAcc") & ($_bo_Accept)
											ACCEPT:C269
										End if 
									Else 
										If (([INVOICES:39]State:10=0) | ([INVOICES:39]State:10=1))
											
											//THESE CAUSE UNWANTED SCREEN UPDATING
											//        If (◊InvUnproc)
											//      Gen_Confirm ("Were the Invoices printed OK?  Post them now?";"Yes";"No")
											//     Else
											//     Gen_Confirm ("Post the Invoices now?";"Post them";"Batch them")
											//   End if
											
											If (DB_GetLedgerINVAllowUnproc)
												//`Gen_Confirm ("Was "+vText+" "+vNumber+" printed OK?  Post it now?";"Yes";"No")
												//  CONFIRM("Was "+vText+" "+vNumber+" printed OK?  Post it now? (Cancel for No)")
												If (Count parameters:C259>=2)
													If ($2)
														//Print a posted invoice so don't ask
														OK:=1
													Else 
														//posting without printing so don't ask
														OK:=1
														
													End if 
												Else 
													Gen_Confirm("Was "+vText+" "+vNumber+" printed OK?  Post it now?"; "Yes"; "No")
												End if 
												
											Else 
												//Gen_Confirm ("Post "+vText+" "+vNumber+" now?";"Post now";"Batch it")
												If (Count parameters:C259>=2)
													If ($2)
														//Print a posted invoice so don't ask
														OK:=1
													Else 
														
														Gen_Confirm("Post "+vText+" "+vNumber+" now?"; "Post now"; "Batch it")
													End if 
												Else 
													Gen_Confirm("Post "+vText+" "+vNumber+" now?"; "Post now"; "Batch it")
												End if 
												
											End if 
											
											If (OK=0)
												OK:=1
												If (DB_GetLedgerINVAllowUnproc)
													Gen_Confirm("Batch the posting?"; "Yes"; "No")
													//CONFIRM("Batch the posting? (Cancel for No)")
												End if 
												
												If (OK=1)
													[INVOICES:39]State:10:=1
													Invoices_Tot  // NG March 2008 changed because sometimes this calculates incorrectly
													//[INVOICES]Total Invoiced:=vTotal
													//[INVOICES]Total InvExTax:=vSubtotal
													Invoices_InLPSt
													If (DB_t_CurrentFormUsage3#"NoAcc") & ($_bo_Accept)
														ACCEPT:C269
													End if 
												Else 
													VADD:=0
													INV_bo_newInvoice:=True:C214
												End if 
											Else 
												Inv_InvPost
												If ((DB_GetLedgerINVAllowUnproc=False:C215) & (OK=0))
													If (DB_t_CurrentFormUsage3#"NoAcc") & ($_bo_Accept)
														CANCEL:C270
													End if 
												Else 
													Invoices_InLPSt
													If (DB_t_CurrentFormUsage3#"NoAcc") & ($_bo_Accept)
														ACCEPT:C269
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
	
	SET WINDOW TITLE:C213($_t_CurrentWindowTitle)
	QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
	FORM SET OUTPUT:C54([INVOICES:39]; "Invoices Out")
	Invoices_InLPTi
	[INVOICES:39]State:10:=[INVOICES:39]State:10
End if 
DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
ERR_MethodTrackerReturn("Invoices PPrint"; $_t_oldMethodName)
If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.OACC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/06/2011 15:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_LB_Relations;0)
	//ARRAY TEXT(ACC_at_Relations;0)
	//ARRAY TEXT(ACC_at_RelationsCode;0)
	//ARRAY TEXT(ACC_at_RelationsName;0)
	//ARRAY TEXT(ACC_at_RelationTypes;0)
	C_BOOLEAN:C305($_bo_Found; $_bo_OK)
	C_LONGINT:C283($_l_FieldNumber; $_l_Index; $_l_RelationPosition; $_l_RelationsRow; $_l_SelectedRow; $_l_StringIndex; $_l_TableNumber; ACC_l_ExitCalled; ACC_l_Relations)
	C_TEXT:C284($_t_After; $_t_Before; $_t_ColumnName2; $_t_oldMethodName; ACC_t_TransChequeNo; ACC_t_TransCoCode; ACC_t_TransCurrencyCode; ACC_t_TransCurrencyCodeCred; ACC_t_TransInvoiceNo; ACC_t_TransJobCode; ACC_t_TransPurchCode)
	C_TEXT:C284(ACC_t_TransPurchinvno)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.OACC"; Form event code:C388)

//If (True)


$_l_SelectedRow:=Self:C308->
RESOLVE POINTER:C394(Self:C308; $_t_ColumnName2; $_l_TableNumber; $_l_FieldNumber)
//this is the cell we are leaving
//If ($2#6) & ($2#7)
//If ($_t_ColumnName2>0) & ($_l_SelectedRow>0)
Case of 
		//: ($_t_ColumnName2=1)  `Relationtype
	: ($_t_ColumnName2="ACC_at_Relations")  //Relationtype
		If (Not:C34(ACC_l_ExitCalled=1))
			ACC_l_ExitCalled:=1
			$_bo_OK:=True:C214
			If (ACC_at_Relations{$_l_SelectedRow}#"")
				For ($_l_StringIndex; Length:C16(ACC_at_Relations{$_l_SelectedRow}); 1; -1)
					If (Character code:C91(ACC_at_Relations{$_l_SelectedRow}[[$_l_StringIndex]])=64)
						If ($_l_StringIndex>1)
							$_t_Before:=Substring:C12(ACC_at_Relations{$_l_SelectedRow}; 1; $_l_StringIndex-1)
							If ($_l_StringIndex<Length:C16(ACC_at_Relations{$_l_SelectedRow}))
								$_t_After:=Substring:C12(ACC_at_Relations{$_l_SelectedRow}; $_l_StringIndex+1; Length:C16(ACC_at_Relations{$_l_SelectedRow}))
							Else 
								$_t_After:=""
							End if 
						Else 
							$_t_Before:=""
							If ($_l_StringIndex<Length:C16(ACC_at_Relations{$_l_SelectedRow}))
								$_t_After:=Substring:C12(ACC_at_Relations{$_l_SelectedRow}; $_l_StringIndex+1; Length:C16(ACC_at_Relations{$_l_SelectedRow}))
							Else 
								$_t_After:=""
							End if 
							
						End if 
						ACC_at_Relations{$_l_SelectedRow}:=$_t_Before+$_t_After
					End if 
					
				End for 
			End if 
			
			If (ACC_at_Relations{0}#"")
				If (ACC_at_Relations{0}#ACC_at_Relations{$_l_SelectedRow})
					If (ACC_at_RelationsCode{$_l_SelectedRow}#"")
						Gen_Alert("You cannot change the type of a relationship!")
						$_bo_OK:=False:C215
					End if 
				End if 
			End if 
			$_l_RelationsRow:=Find in array:C230(ACC_at_RelationTypes; ACC_at_Relations{$_l_SelectedRow})
			If ($_l_RelationsRow<0)
				//user typed and did not type whole thing
				$_bo_Found:=False:C215
				For ($_l_Index; 1; Size of array:C274(ACC_at_RelationTypes))
					$_l_RelationPosition:=Position:C15(ACC_at_Relations{$_l_SelectedRow}; ACC_at_RelationTypes{$_l_Index})
					If ($_l_RelationPosition=1)
						ACC_at_Relations{$_l_SelectedRow}:=ACC_at_RelationTypes{$_l_Index}
						$_bo_Found:=True:C214
					End if 
					
				End for 
				If (Not:C34($_bo_Found))
					ACC_at_Relations{$_l_SelectedRow}:=""
				End if 
				
			End if 
			
			
			If (ACC_at_Relations{$_l_SelectedRow}#"") & (ACC_at_Relations{$_l_SelectedRow}#ACC_at_Relations{0}) & ($_bo_OK)
				GOTO OBJECT:C206(ACC_l_Relations)
				Case of 
					: (ACC_at_Relations{$_l_SelectedRow}="Company")
						If (ACC_t_TransCoCode#"")
							Gen_Alert("A company code is already entered, you cannot enter another!")
							//AL_SetEnterable (ACC_l_Relations;1;3;ACC_at_RelationTypes)  `Transcode
							LB_SetChoiceList("lbRelations"; ->ACC_at_RelationTypes; ->ACC_l_Relations)
							
							ACC_at_Relations{$_l_SelectedRow}:=""
							
							EDIT ITEM:C870(ACC_at_Relations; $_l_SelectedRow)
							LB_SetScroll(->ACC_LB_Relations; $_l_SelectedRow)
							//SCROLL LINES(Self;$_l_SelectedRow)
							//AL_UpdateArrays (ACC_l_Relations;-2)
						Else 
							
							//AL_SetEnterable (ACC_l_Relations;1;0)
							OBJECT SET ENTERABLE:C238(ACC_at_Relations; False:C215)
							//AL_SetEnterable (ACC_l_Relations;2;1)
							OBJECT SET ENTERABLE:C238(ACC_at_RelationsCode; True:C214)
							//AL_UpdateArrays (ACC_l_Relations;-2)
							
							EDIT ITEM:C870(ACC_at_RelationsCode; $_l_SelectedRow)
							LB_SetScroll(->ACC_LB_Relations; $_l_SelectedRow)
							
							//SCROLL LINES(Self;$_l_SelectedRow)
						End if 
					: (ACC_at_Relations{$_l_SelectedRow}="Cheque")
						If (ACC_t_TransChequeNo#"")
							Gen_Alert("A cheque number is already entered, you cannot enter another!")
							ACC_at_Relations{$_l_SelectedRow}:=""
							//AL_SetEnterable (ACC_l_Relations;1;3;ACC_at_RelationTypes)  `Transcode
							LB_SetChoiceList("lbRelations"; ->ACC_at_RelationTypes; ->ACC_l_Relations)  //Transcode
							
							EDIT ITEM:C870(ACC_at_Relations; $_l_SelectedRow)
							LB_SetScroll(->ACC_LB_Relations; $_l_SelectedRow)
							
							
							//AL_UpdateArrays (ACC_l_Relations;-2)
							
						Else 
							
							//AL_SetEnterable (ACC_l_Relations;2;1)
							OBJECT SET ENTERABLE:C238(ACC_at_RelationsCode; True:C214)
							
							//AL_ExitCell (ACC_l_Relations)
							//AL_SetEnterable (ACC_l_Relations;1;0)
							OBJECT SET ENTERABLE:C238(ACC_at_Relations; False:C215)
							//AL_UpdateArrays (ACC_l_Relations;-2)
							
							EDIT ITEM:C870(ACC_at_RelationsCode; $_l_SelectedRow)
							LB_SetScroll(->ACC_LB_Relations; $_l_SelectedRow)
							
							
							
						End if 
					: (ACC_at_Relations{$_l_SelectedRow}="Job")
						If (ACC_t_TransJobCode#"")
							Gen_Alert("A Job number is already entered, you cannot enter another!")
							
							//AL_SetEnterable (ACC_l_Relations;1;3;ACC_at_RelationTypes)  `Transcode
							LB_SetChoiceList("lbRelations"; ->ACC_at_RelationTypes; ->ACC_l_Relations)  //Transcode
							
							ACC_at_Relations{$_l_SelectedRow}:=""
							
							//AL_UpdateArrays (ACC_l_Relations;-2)
							
							EDIT ITEM:C870(ACC_at_Relations; $_l_SelectedRow)
							LB_SetScroll(->ACC_LB_Relations; $_l_SelectedRow)
							
						Else 
							
							//AL_SetEnterable (ACC_l_Relations;1;0)
							OBJECT SET ENTERABLE:C238(ACC_at_Relations; False:C215)
							//AL_SetEnterable (ACC_l_Relations;2;1)
							OBJECT SET ENTERABLE:C238(ACC_at_RelationsCode; True:C214)
							
							EDIT ITEM:C870(ACC_at_RelationsCode; $_l_SelectedRow)
							LB_SetScroll(->ACC_LB_Relations; $_l_SelectedRow)
							
						End if 
						
					: (ACC_at_Relations{$_l_SelectedRow}="Purchase Order")
						If (ACC_t_TransPurchCode#"")
							Gen_Alert("An Purchase order is already entered, you cannot enter another!")
							
							//AL_SetEnterable (ACC_l_Relations;1;3;ACC_at_RelationTypes)  `Transcode
							LB_SetChoiceList("lbRelations"; ->ACC_at_RelationTypes; ->ACC_l_Relations)  //Transcode
							ACC_at_Relations{$_l_SelectedRow}:=""
							//AL_GotoCell (ACC_l_Relations;1;$_l_SelectedRow)
							EDIT ITEM:C870(ACC_at_Relations; $_l_SelectedRow)
							LB_SetScroll(->ACC_LB_Relations; $_l_SelectedRow)
							
							//AL_UpdateArrays (ACC_l_Relations;-2)
						Else 
							//AL_SetEnterable (ACC_l_Relations;1;0)
							OBJECT SET ENTERABLE:C238(ACC_at_Relations; False:C215)
							//AL_SetEnterable (ACC_l_Relations;2;1)
							OBJECT SET ENTERABLE:C238(ACC_at_RelationsCode; True:C214)
							
							//AL_UpdateArrays (ACC_l_Relations;-2)
							//AL_GotoCell (ACC_l_Relations;2;$_l_SelectedRow)
							EDIT ITEM:C870(ACC_at_RelationsCode; $_l_SelectedRow)
							LB_SetScroll(->ACC_LB_Relations; $_l_SelectedRow)
							
							
						End if 
					: (ACC_at_Relations{$_l_SelectedRow}="Purchase Invoice")
						If (ACC_t_TransPurchinvno#"")
							Gen_Alert("An Purchase invoice is already entered, you cannot enter another!")
							
							//AL_SetEnterable (ACC_l_Relations;1;3;ACC_at_RelationTypes)  `Transcode
							LB_SetChoiceList("lbRelations"; ->ACC_at_RelationTypes; ->ACC_l_Relations)  //Transcode
							
							ACC_at_Relations{$_l_SelectedRow}:=""
							
							//AL_UpdateArrays (ACC_l_Relations;-2)
							//aAL_GotoCell (ACC_l_Relations;1;$_l_SelectedRow)
							EDIT ITEM:C870(ACC_at_Relations; $_l_SelectedRow)
							LB_SetScroll(->ACC_LB_Relations; $_l_SelectedRow)
							
						Else 
							
							//AL_SetEnterable (ACC_l_Relations;1;0)
							OBJECT SET ENTERABLE:C238(ACC_at_Relations; False:C215)
							//AL_SetEnterable (ACC_l_Relations;2;1)
							OBJECT SET ENTERABLE:C238(ACC_at_RelationsCode; True:C214)
							
							//AL_UpdateArrays (ACC_l_Relations;-2)
							//AL_GotoCell (ACC_l_Relations;2;$_l_SelectedRow)
							EDIT ITEM:C870(ACC_at_RelationsCode; $_l_SelectedRow)
							LB_SetScroll(->ACC_LB_Relations; $_l_SelectedRow)
							
						End if 
					: (ACC_at_Relations{$_l_SelectedRow}="Sales Invoice")
						If (ACC_t_TransInvoiceNo#"")
							Gen_Alert("An Sales invoice is already entered, you cannot enter another!")
							
							//AL_SetEnterable (ACC_l_Relations;1;3;ACC_at_RelationTypes)  `Transcode
							LB_SetChoiceList("lbRelations"; ->ACC_at_RelationTypes; ->ACC_l_Relations)  //Transcode
							
							ACC_at_Relations{$_l_SelectedRow}:=""
							
							//AL_UpdateArrays (ACC_l_Relations;-2)
							//AL_GotoCell (ACC_l_Relations;1;$_l_SelectedRow)
							EDIT ITEM:C870(ACC_at_Relations; $_l_SelectedRow)
							LB_SetScroll(->ACC_LB_Relations; $_l_SelectedRow)
							
						Else 
							//AL_SetEnterable (ACC_l_Relations;1;0)
							OBJECT SET ENTERABLE:C238(ACC_at_Relations; False:C215)
							//AL_SetEnterable (ACC_l_Relations;2;1)
							OBJECT SET ENTERABLE:C238(ACC_at_RelationsCode; True:C214)
							
							//AL_UpdateArrays (ACC_l_Relations;-2)
							//AL_GotoCell (ACC_l_Relations;2;$_l_SelectedRow)
							EDIT ITEM:C870(ACC_at_RelationsCode; $_l_SelectedRow)
							LB_SetScroll(->ACC_LB_Relations; $_l_SelectedRow)
							
						End if 
				End case 
			Else 
				
				//AL_SetEnterable (ACC_l_Relations;1;3;ACC_at_RelationTypes)  `Transcode
				LB_SetChoiceList("lbRelations"; ->ACC_at_RelationTypes; ->ACC_l_Relations)  //Transcode
				ACC_at_Relations{$_l_SelectedRow}:=ACC_at_Relations{0}
				//AL_GotoCell (ACC_l_Relations;1;$_l_SelectedRow)
				EDIT ITEM:C870(ACC_at_Relations; $_l_SelectedRow)
				LB_SetScroll(->ACC_LB_Relations; $_l_SelectedRow)
				
				//AL_UpdateArrays (ACC_l_Relations;-2)
			End if 
			ACC_l_ExitCalled:=0
		End if 
		//: ($_t_ColumnName2=2)  `record code
	: ($_t_ColumnName2="ACC_at_RelationsCode")  //record code
		If (Not:C34(ACC_l_ExitCalled=1))
			ACC_l_ExitCalled:=1
			Case of 
				: (ACC_at_Relations{$_l_SelectedRow}="Company") & (ACC_at_RelationsCode{$_l_SelectedRow}#ACC_at_RelationsCode{0})
					
					If (OK=1)
						ACC_t_TransCoCode:=ACC_at_RelationsCode{$_l_SelectedRow}
						Check_CompanyNC(->ACC_t_TransCoCode; ->[COMPANIES:2]Company_Code:1; ->[TRANSACTION_BATCHES:30])
						
					End if 
					
					If (ACC_t_TransCoCode#"")
						ACC_at_RelationsCode{$_l_SelectedRow}:=ACC_t_TransCoCode
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=ACC_t_TransCoCode)
						ACC_at_RelationsName{$_l_SelectedRow}:=[COMPANIES:2]Company_Name:2
						UNLOAD RECORD:C212([COMPANIES:2])
						
					Else 
						ACC_at_RelationsName{$_l_SelectedRow}:=ACC_at_RelationsName{0}
						ACC_at_RelationsCode{$_l_SelectedRow}:=ACC_at_RelationsCode{0}
						ACC_t_TransCoCode:=ACC_at_RelationsCode{$_l_SelectedRow}
						
						
					End if 
					
					//AL_UpdateArrays (ACC_l_Relations;-2)
				: (ACC_at_Relations{$_l_SelectedRow}="Cheque") & (ACC_at_RelationsCode{$_l_SelectedRow}#ACC_at_RelationsCode{0})
					ACC_t_TransChequeNo:=ACC_at_RelationsCode{$_l_SelectedRow}
					
				: (ACC_at_Relations{$_l_SelectedRow}="Job")
					
					ACC_t_TransJobCode:=ACC_at_RelationsCode{$_l_SelectedRow}
					Check_MinorNC(->ACC_t_TransJobCode; ""; ->[JOBS:26]; ->[JOBS:26]Job_Code:1; ->[JOBS:26]Job_Name:2; "Job")
					If (ACC_t_TransJobCode#"")
						ACC_at_RelationsCode{$_l_SelectedRow}:=ACC_t_TransJobCode
						ACC_at_RelationsName{$_l_SelectedRow}:=[JOBS:26]Job_Name:2
						$_l_RelationsRow:=Find in array:C230(ACC_at_Relations; "Company")
						If ($_l_RelationsRow<0)
							INSERT IN ARRAY:C227(ACC_at_Relations; 1)
							INSERT IN ARRAY:C227(ACC_at_RelationsCode; 1)
							INSERT IN ARRAY:C227(ACC_at_RelationsName; 1)
							ACC_at_Relations{1}:="Company"
							$_l_RelationsRow:=1
						End if 
						ACC_t_TransCoCode:=[JOBS:26]Company_Code:3
						ACC_at_RelationsCode{$_l_RelationsRow}:=ACC_t_TransCoCode
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=ACC_t_TransCoCode)
						ACC_at_RelationsName{$_l_RelationsRow}:=[COMPANIES:2]Company_Name:2
						UNLOAD RECORD:C212([COMPANIES:2])
						
					Else 
						ACC_at_RelationsName{$_l_SelectedRow}:=ACC_at_RelationsName{0}
						ACC_at_RelationsCode{$_l_SelectedRow}:=ACC_at_RelationsCode{0}
						ACC_t_TransJobCode:=ACC_at_RelationsCode{0}
						
						//AL_GotoCell (ACC_l_Relations;2;$_l_SelectedRow)
						EDIT ITEM:C870(ACC_l_Relations; $_l_SelectedRow)
						LB_SetScroll(->ACC_LB_Relations; $_l_SelectedRow)
						
						
					End if 
					//AL_UpdateArrays (ACC_l_Relations;-2)
					
				: (ACC_at_Relations{$_l_SelectedRow}="Purchase Order")
					ACC_t_TransPurchCode:=ACC_at_RelationsCode{$_l_SelectedRow}
					Check_MinorNC(->ACC_t_TransPurchCode; ""; ->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Code:1; ->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; "Purchase")
					If (ACC_t_TransPurchCode#"")
						If ([PURCHASE_INVOICES:37]Posted_Date:12=!00-00-00!)
							Gen_Alert("That Purchase has not been Posted"; "")
							ACC_at_RelationsName{$_l_SelectedRow}:=ACC_at_RelationsName{0}
							ACC_at_RelationsCode{$_l_SelectedRow}:=ACC_at_RelationsCode{0}
							ACC_t_TransPurchCode:=ACC_at_RelationsCode{$_l_SelectedRow}
						Else 
							ACC_at_RelationsCode{$_l_SelectedRow}:=ACC_t_TransPurchCode
							ACC_at_RelationsName{$_l_SelectedRow}:=""
							If (ACC_t_TransCoCode="") & (ACC_t_TransPurchCode#"")
								$_l_RelationsRow:=Find in array:C230(ACC_at_Relations; "Company")
								If ($_l_RelationsRow<0)
									INSERT IN ARRAY:C227(ACC_at_Relations; 1)
									INSERT IN ARRAY:C227(ACC_at_RelationsCode; 1)
									INSERT IN ARRAY:C227(ACC_at_RelationsName; 1)
									ACC_at_Relations{1}:="Company"
									$_l_RelationsRow:=1
								End if 
								ACC_t_TransCoCode:=[PURCHASE_INVOICES:37]Company_Code:2
								ACC_at_RelationsCode{$_l_RelationsRow}:=ACC_t_TransCoCode
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=ACC_t_TransCoCode)
								ACC_at_RelationsName{$_l_RelationsRow}:=[COMPANIES:2]Company_Name:2
								UNLOAD RECORD:C212([COMPANIES:2])
								If (ACC_t_TransPurchinvno="")
									$_l_RelationsRow:=Find in array:C230(ACC_at_Relations; "Purchase Invoice")
									If ($_l_RelationsRow<0)
										INSERT IN ARRAY:C227(ACC_at_Relations; 1)
										INSERT IN ARRAY:C227(ACC_at_RelationsCode; 1)
										INSERT IN ARRAY:C227(ACC_at_RelationsName; 1)
										ACC_at_Relations{1}:="Purchase Invoice"
										$_l_RelationsRow:=1
									End if 
									ACC_t_TransPurchinvno:=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
									ACC_at_RelationsCode{$_l_RelationsRow}:=ACC_t_TransPurchinvno
									ACC_at_RelationsName{$_l_RelationsRow}:=""
								End if 
								
							End if 
						End if 
						
					Else 
						ACC_at_RelationsName{$_l_SelectedRow}:=ACC_at_RelationsName{0}
						ACC_at_RelationsCode{$_l_SelectedRow}:=ACC_at_RelationsCode{0}
						ACC_t_TransPurchCode:=ACC_at_RelationsCode{$_l_SelectedRow}
						
						//AL_GotoCell (ACC_l_Relations;2;$_l_SelectedRow)
						EDIT ITEM:C870(ACC_at_RelationsCode; $_l_SelectedRow)
						LB_SetScroll(->ACC_LB_Relations; $_l_SelectedRow)
						
					End if 
					//AL_UpdateArrays (ACC_l_Relations;-2)
					
				: (ACC_at_Relations{$_l_SelectedRow}="Purchase Invoice")
					ACC_t_TransPurchinvno:=ACC_at_RelationsCode{$_l_SelectedRow}
					Check_MinorNC(->ACC_t_TransPurchinvno; ""; ->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; ->[PURCHASE_INVOICES:37]Company_Code:2; "Purchase")
					If (ACC_t_TransPurchinvno#"")
						If ([PURCHASE_INVOICES:37]Posted_Date:12=!00-00-00!)
							Gen_Alert("That Purchase has not been Posted"; "")
							ACC_at_RelationsName{$_l_SelectedRow}:=ACC_at_RelationsName{0}
							ACC_at_RelationsCode{$_l_SelectedRow}:=ACC_at_RelationsCode{0}
							ACC_t_TransPurchinvno:=ACC_at_RelationsCode{$_l_SelectedRow}
						Else 
							ACC_at_RelationsCode{$_l_SelectedRow}:=ACC_t_TransPurchinvno
							ACC_at_RelationsName{$_l_SelectedRow}:=""
							If (ACC_t_TransCoCode="") & (ACC_t_TransPurchinvno#"")
								$_l_RelationsRow:=Find in array:C230(ACC_at_Relations; "Company")
								If ($_l_RelationsRow<0)
									INSERT IN ARRAY:C227(ACC_at_Relations; 1)
									INSERT IN ARRAY:C227(ACC_at_RelationsCode; 1)
									INSERT IN ARRAY:C227(ACC_at_RelationsName; 1)
									ACC_at_Relations{1}:="Company"
									$_l_RelationsRow:=1
								End if 
								ACC_t_TransCoCode:=[PURCHASE_INVOICES:37]Company_Code:2
								ACC_at_RelationsCode{$_l_RelationsRow}:=ACC_t_TransCoCode
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=ACC_t_TransCoCode)
								ACC_at_RelationsName{$_l_RelationsRow}:=[COMPANIES:2]Company_Name:2
								UNLOAD RECORD:C212([COMPANIES:2])
								If (ACC_t_TransPurchCode#"")
									$_l_RelationsRow:=Find in array:C230(ACC_at_Relations; "Purchase Order")
									If ($_l_RelationsRow<0)
										INSERT IN ARRAY:C227(ACC_at_Relations; 1)
										INSERT IN ARRAY:C227(ACC_at_RelationsCode; 1)
										INSERT IN ARRAY:C227(ACC_at_RelationsName; 1)
										ACC_at_Relations{1}:="Purchase Order"
										$_l_RelationsRow:=1
									End if 
									ACC_t_TransPurchCode:=[PURCHASE_INVOICES:37]Purchase_Code:1
									ACC_at_RelationsCode{$_l_RelationsRow}:=ACC_t_TransPurchCode
									ACC_at_RelationsName{$_l_RelationsRow}:=""
									
								End if 
								
							End if 
						End if 
					Else 
						ACC_at_RelationsName{$_l_SelectedRow}:=ACC_at_RelationsName{0}
						ACC_at_RelationsCode{$_l_SelectedRow}:=ACC_at_RelationsCode{0}
						ACC_t_TransPurchinvno:=ACC_at_RelationsCode{$_l_SelectedRow}
						
						//AL_GotoCell (ACC_l_Relations;2;$_l_SelectedRow)
						EDIT ITEM:C870(ACC_at_RelationsCode; $_l_SelectedRow)
						LB_SetScroll(->ACC_LB_Relations; $_l_SelectedRow)
						
					End if 
					
					//AL_UpdateArrays (ACC_l_Relations;-2)
				: (ACC_at_Relations{$_l_SelectedRow}="Sales Invoice")
					ACC_t_TransInvoiceNo:=ACC_at_RelationsCode{$_l_SelectedRow}
					Check_MinorNC(->ACC_t_TransInvoiceNo; ""; ->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES:39]Company_Code:2; "Invoice")
					
					If (ACC_t_TransInvoiceNo#"")
						ACC_at_RelationsCode{$_l_SelectedRow}:=ACC_t_TransInvoiceNo
						ACC_at_RelationsName{$_l_SelectedRow}:=""
						If (ACC_t_TransCoCode="") & (ACC_t_TransInvoiceNo#"")
							$_l_RelationsRow:=Find in array:C230(ACC_at_Relations; "Company")
							If ($_l_RelationsRow<0)
								INSERT IN ARRAY:C227(ACC_at_Relations; 1)
								INSERT IN ARRAY:C227(ACC_at_RelationsCode; 1)
								INSERT IN ARRAY:C227(ACC_at_RelationsName; 1)
								ACC_at_Relations{1}:="Company"
								$_l_RelationsRow:=1
							End if 
							ACC_t_TransCoCode:=[INVOICES:39]Company_Code:2
							ACC_at_RelationsCode{$_l_RelationsRow}:=ACC_t_TransCoCode
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=ACC_t_TransCoCode)
							ACC_at_RelationsName{$_l_RelationsRow}:=[COMPANIES:2]Company_Name:2
							ACC_t_TransCurrencyCode:=[INVOICES:39]Currency_Code:27
							ACC_t_TransCurrencyCodeCred:=ACC_t_TransCurrencyCode
							UNLOAD RECORD:C212([COMPANIES:2])
						End if 
					Else 
						ACC_at_RelationsName{$_l_SelectedRow}:=ACC_at_RelationsName{0}
						ACC_at_RelationsCode{$_l_SelectedRow}:=ACC_at_RelationsCode{0}
						ACC_t_TransInvoiceNo:=ACC_at_RelationsCode{$_l_SelectedRow}
						
						//AL_GotoCell (ACC_l_Relations;2;$_l_SelectedRow)
						EDIT ITEM:C870(ACC_at_RelationsCode; $_l_SelectedRow)
						LB_SetScroll(->ACC_LB_Relations; $_l_SelectedRow)
						
					End if 
					
					//AL_UpdateArrays (ACC_l_Relations;-2)
					
				Else 
					
			End case 
			//CALL PROCESS(Current process)
			ACC_l_ExitCalled:=0
		End if 
End case 
//End if
//End if
//End if

//WS_KEEPFOCUS
ERR_MethodTrackerReturn("OBJ:SubItemDisplay,ACC_LB_Relations"; $_t_oldMethodName)

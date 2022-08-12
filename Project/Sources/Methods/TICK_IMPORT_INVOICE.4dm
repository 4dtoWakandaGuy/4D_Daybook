//%attributes = {}
If (False:C215)
	//Project Method Name:      TICK_IMPORT_INVOICE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DocinText; 0)
	ARRAY TEXT:C222($_at_FolderContents; 0)
	ARRAY TEXT:C222($_at_RecordText; 0)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CurrentRow; $_l_DocPosition; $_l_DocumentSize; $_l_Index; $_l_NumberofDocuments; $_l_PathTest; $_l_PathTest2; $_l_RecordCount)
	C_TEXT:C284($_t_DocumentName; $_t_DocumentName2; $_t_DocumentPath; $_t_DocumentType; $_t_EndofField; $_t_EndofRecord; $_t_ImportInvoiceNumber; $_t_IncomingDocumentName; $_t_InvoiceAmount; $_t_InvoiceCreditAccount; $_t_InvoiceCustomerCode)
	C_TEXT:C284($_t_InvoiceDate; $_t_InvoiceDebitAccount; $_t_InvoiceTaxAmount; $_t_InvoiceTaxRate; $_t_InvoiceType; $_t_oldMethodName; $_t_Widow; $1)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TICK_IMPORT_INVOICE")
If (Count parameters:C259>=1)
	$_t_IncomingDocumentName:=$1
	$_t_EndofField:=Char:C90(9)
	$_t_EndofRecord:=Char:C90(13)
	Repeat 
		$_l_PathTest:=Test path name:C476($_t_IncomingDocumentName)
		If ($_l_PathTest=1)
			//the document exists
			//we must change the name of document -so it cannot be read again!
			
			$_t_DocumentPath:=PathFromPathName($_t_IncomingDocumentName)
			$_t_DocumentName:=FileNamefromPath
			$_l_PathTest2:=Test path name:C476($_t_DocumentPath+"Previous Imports")
			If ($_l_PathTest=2)  //folder exists
				ARRAY TEXT:C222($_at_FolderContents; 0)
				DOCUMENT LIST:C474($_t_DocumentPath+"Previous Imports"; $_at_FolderContents)
				$_l_NumberofDocuments:=Size of array:C274($_at_FolderContents)+1
				ARRAY TEXT:C222($_at_FolderContents; 0)
			Else 
				CREATE FOLDER:C475($_t_DocumentPath+"Previous Imports")
				$_l_NumberofDocuments:=1
			End if 
			$_l_CharacterPosition:=Position:C15("."; $_t_DocumentName)
			If ($_l_CharacterPosition=0)
				If (Is macOS:C1572)
					COPY DOCUMENT:C541($_t_IncomingDocumentName; $_t_DocumentPath+"Previous Import:"+$_t_DocumentName+String:C10($_l_NumberofDocuments))
				Else 
					COPY DOCUMENT:C541($_t_IncomingDocumentName; $_t_DocumentPath+"Previous Import\\"+$_t_DocumentName+String:C10($_l_NumberofDocuments))
				End if 
				
			Else 
				$_t_DocumentName2:=Substring:C12($_t_DocumentName; 1; $_l_CharacterPosition-1)
				$_t_DocumentType:=Substring:C12($_t_DocumentName; $_l_CharacterPosition+1; Length:C16($_t_DocumentName))
				If (Is macOS:C1572)
					COPY DOCUMENT:C541($_t_IncomingDocumentName; $_t_DocumentPath+"Previous Import:"+$_t_DocumentName2+String:C10($_l_NumberofDocuments)+"."+$_t_DocumentType)
				Else 
					COPY DOCUMENT:C541($_t_IncomingDocumentName; $_t_DocumentPath+"Previous Import\\"+$_t_DocumentName2+String:C10($_l_NumberofDocuments)+"."+$_t_DocumentType)
				End if 
			End if 
			ARRAY TEXT:C222($_at_DocinText; 100)
			$_ti_DocumentRef:=DB_OpenDocument($_t_IncomingDocumentName; "TEXT")
			$_l_CurrentRow:=0
			$_l_DocumentSize:=Get document size:C479($_ti_DocumentRef)
			Repeat 
				$_l_CurrentRow:=$_l_CurrentRow+1
				If ($_l_CurrentRow>Size of array:C274($_at_DocinText))
					INSERT IN ARRAY:C227($_at_DocinText; Size of array:C274($_at_DocinText)+1; 100)
				End if 
				RECEIVE PACKET:C104($_ti_DocumentRef; $_at_DocinText{$_l_CurrentRow}; 2000)
				$_l_DocPosition:=Get document position:C481($_ti_DocumentRef)
			Until (ok=0) | ($_l_DocPosition>=$_l_DocumentSize)  //we are at the end of the document
			//now delete the document
			ARRAY TEXT:C222($_at_DocinText; $_l_CurrentRow)
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
			DELETE DOCUMENT:C159($_t_IncomingDocumentName)
			//we now have the doc backed up and read into memory here we can parse the documen
			$_t_Widow:=""
			ARRAY TEXT:C222($_at_RecordText; 100)
			$_l_RecordCount:=0
			For ($_l_Index; 1; Size of array:C274($_at_DocinText))
				$_at_DocinText{$_l_Index}:=$_t_Widow+$_at_DocinText{$_l_Index}
				//now break this into record chunks
				Repeat 
					$_l_CharacterPosition:=Position:C15($_t_EndofRecord; $_at_DocinText{$_l_Index})
					If ($_l_CharacterPosition>0)
						//we have a record
						$_l_RecordCount:=$_l_RecordCount+1
						If ($_l_RecordCount>Size of array:C274($_at_RecordText))
							INSERT IN ARRAY:C227($_at_RecordText; Size of array:C274($_at_RecordText)+1; 100)
						End if 
						$_at_RecordText{$_l_RecordCount}:=Substring:C12($_at_DocinText{$_l_Index}; 1; $_l_CharacterPosition-1)
						$_at_DocinText{$_l_Index}:=Substring:C12($_at_DocinText{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_DocinText{$_l_Index}))
					End if 
				Until ($_l_CharacterPosition=0)
			End for 
			//we now have the data broken into records
			//we can now parse that and do the rest of the work
			
			//BEFORE THIS IS GENERIC
			
			ARRAY TEXT:C222($_at_RecordText; $_l_RecordCount)
			
			//BEFORE THIS IS GENERIC
			For ($_l_Index; 1; Size of array:C274($_at_RecordText))
				//TYPE(1=INVOICE 3 =Credit)
				//Date
				//Customer
				//Debit Account
				//Credit Account
				//Amount
				//Vat
				//Vat rate(Z=0)
				//INVOICE
				//Quantitty
				//13.11.00MAD00134113.140Z34545Quantity: 6
				//  $_l_CharacterPosition:=Position($_t_EndofField;$_at_RecordText{$_l_Index})
				$_t_InvoiceType:=""
				$_t_InvoiceDate:=""
				$_t_InvoiceCustomerCode:=""
				$_t_InvoiceDebitAccount:=""
				$_t_InvoiceCreditAccount:=""
				$_t_InvoiceAmount:=""
				$_t_InvoiceTaxAmount:=""
				$_t_InvoiceTaxRate:=""
				$_t_ImportInvoiceNumber:=""
				If ($_l_CharacterPosition>0)
					$_t_InvoiceType:=Substring:C12($_at_RecordText{$_l_Index}; 1; $_l_CharacterPosition-1)
					$_at_RecordText{$_l_Index}:=Substring:C12($_at_RecordText{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_RecordText{$_l_Index}))
					$_l_CharacterPosition:=Position:C15($_t_EndofField; $_at_RecordText{$_l_Index})
					If ($_l_CharacterPosition>0)
						$_t_InvoiceDate:=Substring:C12($_at_RecordText{$_l_Index}; 1; $_l_CharacterPosition-1)
						$_at_RecordText{$_l_Index}:=Substring:C12($_at_RecordText{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_RecordText{$_l_Index}))
						$_l_CharacterPosition:=Position:C15($_t_EndofField; $_at_RecordText{$_l_Index})
						If ($_l_CharacterPosition>0)
							$_t_InvoiceCustomerCode:=Substring:C12($_at_RecordText{$_l_Index}; 1; $_l_CharacterPosition-1)
							$_at_RecordText{$_l_Index}:=Substring:C12($_at_RecordText{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_RecordText{$_l_Index}))
							$_l_CharacterPosition:=Position:C15($_t_EndofField; $_at_RecordText{$_l_Index})
							If ($_l_CharacterPosition>0)
								$_t_InvoiceDebitAccount:=Substring:C12($_at_RecordText{$_l_Index}; 1; $_l_CharacterPosition-1)
								$_at_RecordText{$_l_Index}:=Substring:C12($_at_RecordText{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_RecordText{$_l_Index}))
								$_l_CharacterPosition:=Position:C15($_t_EndofField; $_at_RecordText{$_l_Index})
								If ($_l_CharacterPosition>0)
									$_t_InvoiceCreditAccount:=Substring:C12($_at_RecordText{$_l_Index}; 1; $_l_CharacterPosition-1)
									$_at_RecordText{$_l_Index}:=Substring:C12($_at_RecordText{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_RecordText{$_l_Index}))
									$_l_CharacterPosition:=Position:C15($_t_EndofField; $_at_RecordText{$_l_Index})
									If ($_l_CharacterPosition>0)
										$_t_InvoiceAmount:=Substring:C12($_at_RecordText{$_l_Index}; 1; $_l_CharacterPosition-1)
										$_at_RecordText{$_l_Index}:=Substring:C12($_at_RecordText{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_RecordText{$_l_Index}))
										$_l_CharacterPosition:=Position:C15($_t_EndofField; $_at_RecordText{$_l_Index})
										If ($_l_CharacterPosition>0)
											$_t_InvoiceTaxAmount:=Substring:C12($_at_RecordText{$_l_Index}; 1; $_l_CharacterPosition-1)
											$_at_RecordText{$_l_Index}:=Substring:C12($_at_RecordText{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_RecordText{$_l_Index}))
											$_l_CharacterPosition:=Position:C15($_t_EndofField; $_at_RecordText{$_l_Index})
											If ($_l_CharacterPosition>0)
												$_t_InvoiceTaxRate:=Substring:C12($_at_RecordText{$_l_Index}; 1; $_l_CharacterPosition-1)
												$_at_RecordText{$_l_Index}:=Substring:C12($_at_RecordText{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_RecordText{$_l_Index}))
												$_l_CharacterPosition:=Position:C15($_t_EndofField; $_at_RecordText{$_l_Index})
												If ($_l_CharacterPosition>0)
													$_t_ImportInvoiceNumber:=Substring:C12($_at_RecordText{$_l_Index}; 1; $_l_CharacterPosition-1)
													$_at_RecordText{$_l_Index}:=Substring:C12($_at_RecordText{$_l_Index}; $_l_CharacterPosition+1; Length:C16($_at_RecordText{$_l_Index}))
													$_l_CharacterPosition:=Position:C15($_t_EndofField; $_at_RecordText{$_l_Index})
												End if 
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
				If ($_t_ImportInvoiceNumber#"")
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_ImportInvoiceNumber)
				Else 
					REDUCE SELECTION:C351([INVOICES:39]; 0)
				End if 
				If (Records in selection:C76([INVOICES:39])=0)
					//it is a new one
					CREATE RECORD:C68([INVOICES:39])
					[INVOICES:39]Invoice_Number:1:=$_t_ImportInvoiceNumber
				End if 
				
				// [INVOICES]Company Code
				// [INVOICES]Contact Code
				//[INVOICES]Invoice Date
				// [INVOICES]Total Invoiced
				//  [INVOICES]Total Paid
				// [INVOICES]Total Due
				// [INVOICES]Posted Date
				//  [INVOICES]State
				//   [INVOICES]Terms
				//  [INVOICES]Comments
				// [INVOICES]Period Code
				// [INVOICES]Your Order No
				//[INVOICES]Debtors Acc
				// [INVOICES]Bank Acc
				//  [INVOICES]Analysis Code
				//  [INVOICES]Due Date
				// [INVOICES]VAT Prefix
				// [INVOICES]VAT Reg No
				// [INVOICES]UK EC
				//  [INVOICES]UK EC
				// [INVOICES]Credit Stage
				// [INVOICES]Base Text
				
				// [INVOICES]Print Comments
				// [INVOICES]Total InvExTax
				// [INVOICES]Currency Code
				// [INVOICES]Tax Rate
				//  [INVOICES]Area Code
				// [INVOICES]Delivery Comp
				//  [INVOICES]Delivery Cont
				//  [INVOICES]Deliver To
				// [INVOICES]Statement Date
				//  [INVOICES]Total Tax
				// [INVOICES]Cheque No
				// [INVOICES]Printed
				// [INVOICES]Layer Code
				// [INVOICES]Cash VAT Due
				// [INVOICES]Cash VAT
				// [INVOICES]Person
				//[INVOICES]ITEMS'Product Code
				// [INVOICES]ITEMS'Product Name
				//[INVOICES]ITEMS'Quantity[INVOICES]•
				//ITEMS'Sales Price
				//        [INVOICES]ITEMS
				
				
				
				
			End for 
			
			
			
		End if 
		
	Until (Ok=0)
End if 
ERR_MethodTrackerReturn("TICK_IMPORT_INVOICE"; $_t_oldMethodName)

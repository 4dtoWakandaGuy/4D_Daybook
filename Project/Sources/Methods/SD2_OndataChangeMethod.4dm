//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_OndataChangeMethod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_RelatedCompanyIDs;0)
	//ARRAY LONGINT(SD2_al_relatedContactID;0)
	//ARRAY TEXT(SD2_at_RelatedCompanyCodes;0)
	//ARRAY TEXT(SD2_at_RelatedCompanyNames;0)
	//ARRAY TEXT(SD2_at_RelatedContactName;0)
	//ARRAY TEXT(SD2_at_RelatedContactsCodes;0)
	//ARRAY TEXT(SD2_at_RelatedInvoiceCodes;0)
	C_BOOLEAN:C305($_bo_Unload)
	C_LONGINT:C283($_l_FieldNumber; $_l_RelatedCompanyRow; $_l_RelatedContactRow; $_l_TableNumber)
	C_POINTER:C301($_ptr_FocusObject)
	C_TEXT:C284($_t_CompanyName; $_t_oldMethodName; $_t_VariableName; SD2_t_CompanyName; SD2_t_InvoiceCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_OndataChangeMethod")

//NG Marc h 2008 this method is a replacement for DiaryInD for use in new style diary forms.
$_ptr_FocusObject:=Focus object:C278
RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
If ($_l_FieldNumber>0)  //pointer is to a field
	
	
	If (Modified:C32($_ptr_FocusObject->))
		Diary_InLPX($_ptr_FocusObject)
		Case of 
			: ($_l_TableNumber=Table:C252(->[DIARY:12])) & ($_l_FieldNumber=Field:C253(->[DIARY:12]Company_Code:1))
				If ([DIARY:12]Company_Code:1#"")
					ARRAY TEXT:C222(SD2_at_RelatedCompanyCodes; 0)
					ARRAY TEXT:C222(SD2_at_RelatedCompanyNames; 0)
					ARRAY LONGINT:C221(SD2_al_RelatedCompanyIDs; 0)
					$_l_RelatedCompanyRow:=Find in array:C230(SD2_at_RelatedCompanyCodes; [DIARY:12]Company_Code:1)
					If ($_l_RelatedCompanyRow<0)
						APPEND TO ARRAY:C911(SD2_at_RelatedCompanyCodes; [DIARY:12]Company_Code:1)
						$_bo_Unload:=False:C215
						If ([COMPANIES:2]Company_Code:1#[DIARY:12]Company_Code:1)
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
							$_bo_Unload:=True:C214
						End if 
						APPEND TO ARRAY:C911(SD2_at_RelatedCompanyNames; [COMPANIES:2]Company_Code:1)
						APPEND TO ARRAY:C911(SD2_al_RelatedCompanyIDs; [COMPANIES:2]x_ID:63)
						SD2_t_CompanyName:=[COMPANIES:2]Company_Name:2
						If ($_bo_Unload)
							UNLOAD RECORD:C212([COMPANIES:2])
						End if 
					End if 
				Else 
					If (Size of array:C274(SD2_at_RelatedCompanyCodes)=1)
						// we have just removed the company code
						//note if there were more than one company related we would not be here...we would be editing the list box area.
						ARRAY TEXT:C222(SD2_at_RelatedCompanyCodes; 0)
						ARRAY TEXT:C222(SD2_at_RelatedCompanyNames; 0)
						ARRAY LONGINT:C221(SD2_al_RelatedCompanyIDs; 0)
						SD2_t_CompanyName:=""
					End if 
				End if 
		End case 
		
	End if 
Else 
	//Pointer is to a var
	//Re-use the same object(varirables) on all diary forms..create a different Var if you want the effect to be different..keep it simple
	If ($_t_VariableName#"")
		Case of 
			: ($_t_VariableName="SD2_t_InvoiceCode")
				$_l_RelatedCompanyRow:=Find in array:C230(SD2_at_RelatedInvoiceCodes; SD2_t_InvoiceCode)
				If ($_l_RelatedCompanyRow<0)  //The invoice number is changed or new
					//User entering an invoice code...(no field on the table...
					//the following code is BASED on the function in ORDER ITEMS(OrderI_InLPX)
					
					RemoveLeadTr(Uppercase:C13(SD2_t_InvoiceCode); ->SD2_t_InvoiceCode)
					Check_MinorNC(->SD2_t_InvoiceCode; ""; ->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES:39]Company_Code:2; "Invoice")
					
					If (Records in selection:C76([INVOICES:39])=0)
						If (Size of array:C274(SD2_at_RelatedInvoiceCodes)=0)
							SD2_t_InvoiceCode:=""
							
						Else 
							//if the size of the array is greater than one would would not be editing this variable-we would be editing the list box area
							SD2_t_InvoiceCode:=SD2_at_RelatedInvoiceCodes{1}
						End if 
						
					Else 
						//here we must test that the invoice belongs to a company if a company is specked(if not the diary item should become linked to the company)
						If (Size of array:C274(SD2_at_RelatedInvoiceCodes)=0)
							APPEND TO ARRAY:C911(SD2_at_RelatedInvoiceCodes; SD2_t_InvoiceCode)
						Else 
							//if the size of the array is greater than one would would not be editing this variable-we would be editing the list box area
							SD2_at_RelatedInvoiceCodes{1}:=SD2_t_InvoiceCode
						End if 
						If ([DIARY:12]Company_Code:1="")
							If ([INVOICES:39]Company_Code:2#"")  //lets not assume
								[DIARY:12]Company_Code:1:=[INVOICES:39]Company_Code:2
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
								SD2_t_CompanyName:=[COMPANIES:2]Company_Name:2
							End if 
						Else 
							If ([INVOICES:39]Company_Code:2#"")  //lets not assume
								$_l_RelatedCompanyRow:=Find in array:C230(SD2_at_RelatedCompanyCodes; [INVOICES:39]Company_Code:2)
								If ($_l_RelatedCompanyRow<0)
									QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
									APPEND TO ARRAY:C911(SD2_al_RelatedCompanyIDs; [COMPANIES:2]x_ID:63)
									APPEND TO ARRAY:C911(SD2_at_RelatedCompanyCodes; [COMPANIES:2]Company_Code:1)
									If ([COMPANIES:2]Company_Name:2="")
										If ([COMPANIES:2]Private:37)
											$_t_CompanyName:="("+"Home Address"+")"
										Else 
											If ([COMPANIES:2]Address_Line_one:3#"")
												$_t_CompanyName:="("+[COMPANIES:2]Address_Line_one:3+")"
											Else 
												$_t_CompanyName:="("+"Unknown"+")"
											End if 
										End if 
									Else 
										$_t_CompanyName:=[COMPANIES:2]Company_Name:2
									End if 
									APPEND TO ARRAY:C911(SD2_at_RelatedCompanyNames; $_t_CompanyName)
								End if 
								
							End if 
						End if 
						UNLOAD RECORD:C212([COMPANIES:2])
						If ([DIARY:12]Contact_Code:2="")
							If ([INVOICES:39]Contact_Code:3#"")  //Lets not assume
								[DIARY:12]Contact_Code:2:=[INVOICES:39]Contact_Code:3
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[INVOICES:39]Contact_Code:3)
								If (Records in selection:C76([CONTACTS:1])=1)
									APPEND TO ARRAY:C911(SD2_al_relatedContactID; [CONTACTS:1]x_ID:33)
									APPEND TO ARRAY:C911(SD2_at_RelatedContactsCodes; [CONTACTS:1]Contact_Code:2)
									APPEND TO ARRAY:C911(SD2_at_RelatedContactName; [CONTACTS:1]Contact_Name:31)
								End if 
							End if 
						Else 
							If ([INVOICES:39]Contact_Code:3#"")
								$_l_RelatedContactRow:=Find in array:C230(SD2_at_RelatedContactsCodes; [INVOICES:39]Contact_Code:3)
								If ($_l_RelatedContactRow<0)
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[INVOICES:39]Contact_Code:3)
									If (Records in selection:C76([CONTACTS:1])=1)
										APPEND TO ARRAY:C911(SD2_al_relatedContactID; [CONTACTS:1]x_ID:33)
										APPEND TO ARRAY:C911(SD2_at_RelatedContactsCodes; [CONTACTS:1]Contact_Code:2)
										APPEND TO ARRAY:C911(SD2_at_RelatedContactName; [CONTACTS:1]Contact_Name:31)
									End if 
									
								End if 
							End if 
						End if 
					End if 
				End if 
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("SD2_OndataChangeMethod"; $_t_oldMethodName)

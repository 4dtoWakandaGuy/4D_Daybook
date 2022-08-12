//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_AN_Initiate
	//------------------ Method Notes ------------------
	//This method will insert a row in the array of active transactions(cant see we will ever have more than one row!
	//it will return an internal id for the row which is used to put data in there
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 15:32`Method: CCM_AN_Initiate
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CCM_al_RowIndexIDS;0)
	//ARRAY TEXT(CCM_at_ANFIelds;0)
	//ARRAY TEXT(CCM_at_SubmitData;0;0)
	C_BOOLEAN:C305(CCM_bo_ANFieldNamesInited)
	C_LONGINT:C283($_l_BlankRow; $_l_Index; $_l_IndexID; $_l_SizeofArray; $_l_SizeofArray2; $0; CCM_l_InternalTransactionID)
	C_TEXT:C284($_t_oldMethodName; CCM_T_AuthorizationLogin; CCM_T_AuthorizationPass)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_AN_Initiate")
If (Not:C34(CCM_bo_ANFieldNamesInited))
	ARRAY TEXT:C222(CCM_at_ANFIelds; 0)
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_login")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_tran_key")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_version")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_test_request")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_delim_data")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_delim_char")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_encap_char")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_relay_response")
	
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_first_name")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_last_name")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_company")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_address")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_city")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_state")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_zip")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_country")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_phone")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_fax")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_cust_id")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_cust_ip")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_customer_tax_ID")
	
	
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_email")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_email_customer")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_merchant_email")
	
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_invoice_num")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_description")
	
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_ship_to_first_name")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_ship_to_last_name")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_ship_to_company")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_ship_to_address")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_ship_to_city")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_ship_to_state")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_ship_to_zip")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_ship_to_country")
	
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_amount")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_currency_code")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_method")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_type")
	
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_recurring_billing")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_bank_aba_code")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_bank_acct_num")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_bank_acct_type")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_bank_name")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_bank_acct_name")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_echeck_type")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_card_num")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_exp_date")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_card_code")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_trans_ID")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_auth_code")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_authentication_indicator")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_cardholder_authentication_value")
	
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_po_num")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_tax")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_taxExempt")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_frieght")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_duty")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_first_name")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_last_name")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_company")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_address")
	
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_city")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_state")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_zip")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_country")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_phone")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_email")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_customer_ip")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_customer_organization_t ype")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_customer_tax_id")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_drivers_license_sum")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_drivers_licencse_state")
	APPEND TO ARRAY:C911(CCM_at_ANFields; "x_drivers_licence_dob")
	$_l_SizeofArray2:=Size of array:C274(CCM_at_ANFields)
	ARRAY TEXT:C222(CCM_at_SubmitData; 0; $_l_SizeofArray2)
	ARRAY LONGINT:C221(CCM_al_RowIndexIDS; 0)
	CCM_bo_ANFieldNamesInited:=True:C214
End if 

$_l_BlankRow:=Find in array:C230(CCM_al_RowIndexIDS; 0)  //no free row..insert one
If ($_l_BlankRow<0)
	$_l_SizeofArray:=Size of array:C274(CCM_at_SubmitData)  //GET THE CURRENT SIZE
	$_l_SizeofArray2:=Size of array:C274(CCM_at_ANFields)
	ARRAY TEXT:C222(CCM_at_SubmitData; $_l_SizeofArray+1; $_l_SizeofArray2)  //Resize the 2D array by one extra row
	CCM_l_InternalTransactionID:=0
	$_l_IndexID:=AA_GetNextID(->CCM_l_InternalTransactionID)  //CREATE AN INDEX NUMBER
	APPEND TO ARRAY:C911(CCM_al_RowIndexIDS; $_l_IndexID)  //store that
	$0:=$_l_IndexID
Else 
	CCM_l_InternalTransactionID:=0
	$_l_IndexID:=AA_GetNextID(->CCM_l_InternalTransactionID)  //CREATE AN INDEX NUMBER
	For ($_l_Index; 1; Size of array:C274(CCM_at_SubmitData{$_l_BlankRow}))
		//make sure the row is cleared out
		CCM_at_SubmitData{$_l_BlankRow}{$_l_Index}:=""
	End for 
	CCM_al_RowIndexIDS{$_l_BlankRow}:=$_l_IndexID
	$0:=$_l_IndexID
End if 
If ($_l_IndexID>0)
	CCM_AN_INSERTDATA($_l_IndexID; "x_login"; CCM_T_AuthorizationLogin; "x_tran_key"; CCM_T_AuthorizationPass; "X_version"; "3.1"; "x_Delim_data"; "TRUE"; "x_delim_char"; "|"; "x_relay_response"; "FALSE")
End if 
//Note that we never bother deleting rows, normally there will only be one row
ERR_MethodTrackerReturn("CCM_AN_Initiate"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_GetTransaxField
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/10/2009 09:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Type; $2)
	C_POINTER:C301($1; $4; $5)
	C_TEXT:C284($_t_Address1; $_t_Address2; $_t_AmountSTR; $_t_AuthCode; $_t_AVSCode; $_t_AVSMessage; $_t_CCEXPIRE; $_t_CCNumber; $_t_City; $_t_Company; $_t_Country)
	C_TEXT:C284($_t_customer_vault_action; $_t_customer_vault_id; $_t_CVV2; $_t_CVV2Code; $_t_CVV2Message; $_t_Email; $_t_FirstName; $_t_LastName; $_t_oldMethodName; $_t_OrderID; $_t_PaymentType)
	C_TEXT:C284($_t_PONumber; $_t_PreviousTransID; $_t_ResultXML; $_t_SentXML; $_t_State; $_t_StatusCode; $_t_StatusMessage; $_t_TransactionType; $_t_TransID; $_t_UserID; $_t_UserName)
	C_TEXT:C284($_t_xml_Child_Ref; $_t_xml_Element_Value; $_t_xml_Parent_Ref; $_t_XMLValue; $_t_ZIP; $0; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_GetTransaxField")

If (Count parameters:C259>=3)
	$_l_Type:=$2
	//$1 is a pointer to a blob the blob contains the xml response or the xml send data from the transaction
	//$2 is an indicator of whether this data is in the format of the response or the sent data. 1 for response  2 for sent
	//$3  is the name of the field to get..or blank
	//$4 if $3 is blank then $4 should be a point er to a text array to put the values extracted into
	//$5 if $4 is a pointer to where to put the values this can be a pointer to an array of the corresponding field names
	Case of 
		: ($_l_Type=1)  //from the response
			$_t_ResultXML:=BLOB to text:C555($1->; 3)
			$_t_XMLValue:=""
			
			$_t_xml_Parent_Ref:=DOM Parse XML variable:C720($_t_ResultXML)
			$_t_xml_Child_Ref:=DOM Get first child XML element:C723($_t_xml_Parent_Ref)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "TRANS_ID"; 1; $_t_TransID)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "STATUS_CODE"; 1; $_t_StatusCode)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "STATUS_MSG"; 1; $_t_StatusMessage)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "AUTH_CODE"; 1; $_t_AuthCode)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "AVS_CODE"; 1; $_t_AVSCode)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "AVS_MSG"; 1; $_t_AVSMessage)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "CVV2_CODE"; 1; $_t_CVV2Code)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "CVV2_MSG"; 1; $_t_CVV2Message)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "ORDERID"; 1; $_t_OrderID)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "CUSTOMER_VAULT_ID"; 1; $_t_customer_vault_id)
			$0:=$_t_TransID
			DOM CLOSE XML:C722($_t_xml_Parent_Ref)
			Case of 
				: ($3="TRANS_ID")
					$0:=$_t_TransID
				: ($3="STATUS_CODE")
					$0:=$_t_StatusCode
					
				: ($3="STATUS_MSG")
					$0:=$_t_StatusMessage
				: ($3="AUTH_CODE")
					$0:=$_t_AuthCode
				: ($3="AVS_CODE")
					$0:=$_t_AVSCode
				: ($3="AVS_MSG")
					$0:=$_t_AVSMessage
					
				: ($3="CVV2_CODE")
					$0:=$_t_CVV2Code
				: ($3="CVV2_MSG")
					$0:=$_t_CVV2Message
				: ($3="ORDERID")
					$0:=$_t_OrderID
				: ($3="CUSTOMER_VAULT_ID")
					$0:=$_t_customer_vault_id
				: ($3="")
					$0:=""
					If (Count parameters:C259>=4)
						APPEND TO ARRAY:C911($4->; $_t_TransID)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "TRANS_ID")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_StatusCode)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "STATUS_CODE")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_StatusMessage)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "STATUS_MSG")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_AuthCode)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "AUTH_CODE")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_AVSCode)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "AVS_CODE")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_TransID)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "TRANS_ID")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_AVSCode)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "AVS_CODE")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_AVSMessage)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "AVS_MSG")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_CVV2Code)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "$_t_CVV2Code")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_CVV2Message)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "CVV2_MSG")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_OrderID)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "ORDERID")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_customer_vault_id)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "CUSTOMER_VAULT_ID")
						End if 
						
					End if 
			End case 
			
		: ($_l_Type=2)
			
			$_t_SentXML:=BLOB to text:C555($1->; 3)
			$_t_XMLValue:=""
			
			$_t_xml_Parent_Ref:=DOM Parse XML variable:C720($_t_ResultXML)
			$_t_xml_Child_Ref:=DOM Get first child XML element:C723($_t_xml_Parent_Ref)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "TransactionType"; 1; $_t_TransactionType)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "GatewayUserName"; 1; $_t_UserName)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "GatewayPassword"; 1; $_t_UserID)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "TransactionID"; 1; $_t_PreviousTransID)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "Amount"; 1; $_t_AmountSTR)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "PaymentType"; 1; $_t_PaymentType)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "Customer_Vault_Action"; 1; $_t_customer_vault_action)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "Customer_Vault_ID"; 1; $_t_customer_vault_id)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "CCNumber"; 1; $_t_CCNumber)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "CCExpDate"; 1; $_t_CCEXPIRE)
			
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "CVV"; 1; $_t_CVV2)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "OrderID"; 1; $_t_OrderID)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "PONumber"; 1; $_t_PONumber)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "FirstName"; 1; $_t_FirstName)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "LastName"; 1; $_t_LastName)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "Company"; 1; $_t_Company)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "Address1"; 1; $_t_Address1)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "Address2"; 1; $_t_Address2)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "City"; 1; $_t_City)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "State"; 1; $_t_State)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "Zip"; 1; $_t_ZIP)
			
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "Country"; 1; $_t_Country)
			$_t_xml_Element_Value:=DOM Get XML element:C725($_t_xml_Child_Ref; "EMail"; 1; $_t_Email)
			
			
			DOM CLOSE XML:C722($_t_xml_Parent_Ref)
			
			Case of 
				: ($3="TansactionType")
					$0:=$_t_TransactionType
				: ($3="GatewayUserName")
					$0:=""  //we never return this
				: ($3="GatewayPassword")
					$0:=""
				: ($3="TransactionID")
					$0:=$_t_PreviousTransID
				: ($3="Amount")
					$0:=$_t_AmountSTR
				: ($3="PaymentType")
					$0:=$_t_PaymentType
				: ($3="Customer_Vault_Action")
					$0:=$_t_customer_vault_action
				: ($3="Customer_Vault_ID")
					$0:=$_t_customer_vault_id
				: ($3="CCNumber")
					$0:=""
				: ($3="CCExpDate")
					$0:=""
				: ($3="CVV")
					$0:=""
				: ($3="OrderID")
					$0:=$_t_OrderID
				: ($3="PONumber")
					$0:=$_t_PONumber
				: ($3="FirstName")
					$0:=$_t_FirstName
				: ($3="Company")
					$0:=$_t_Company
				: ($3="Address1")
					$0:=$_t_Address1
				: ($3="Address2")
					$0:=$_t_Address2
				: ($3="City")
					$0:=$_t_City
				: ($3="State")
					$0:=$_t_State
				: ($3="Zip")
					$0:=$_t_ZIP
				: ($3="Country")
					$0:=$_t_Country
				: ($3="EMail")
					$0:=$_t_Email
				: ($3="")
					$0:=""
					If (Count parameters:C259>=4)
						APPEND TO ARRAY:C911($4->; $_t_TransactionType)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "TansactionType")
						End if 
						APPEND TO ARRAY:C911($4->; "XXXX")
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "GatewayUserName")
						End if 
						APPEND TO ARRAY:C911($4->; "XXXXX")
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "GatewayPassword")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_PreviousTransID)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "TransactionID")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_AmountSTR)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "Amount")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_PaymentType)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "PaymentType")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_customer_vault_action)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "Customer_Vault_Action")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_customer_vault_id)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "Customer_Vault_ID")
						End if 
						APPEND TO ARRAY:C911($4->; "XXXX XXXX XXXX XXXX")
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "CCNumber")
						End if 
						APPEND TO ARRAY:C911($4->; "XXXX")
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "CCExpDate")
						End if 
						APPEND TO ARRAY:C911($4->; "XXX")
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "CVV")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_OrderID)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "OrderID")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_PONumber)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "PONumber")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_FirstName)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "FirstName")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_Company)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "Company")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_Address1)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "Address1")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_Address2)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "Address2")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_City)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "City")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_State)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "State")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_ZIP)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "Zip")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_Country)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "Country")
						End if 
						APPEND TO ARRAY:C911($4->; $_t_Email)
						If (Count parameters:C259>=5)
							APPEND TO ARRAY:C911($5->; "EMail")
						End if 
						
					End if 
			End case 
	End case 
End if 
ERR_MethodTrackerReturn("CCM_GetTransaxField"; $_t_oldMethodName)
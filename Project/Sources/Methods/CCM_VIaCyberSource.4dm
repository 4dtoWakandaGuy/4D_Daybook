//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_VIaCyberSource
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2009 15:33`Method: CCM_VIaCyberSource
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_City; $_t_Country; $_t_FirstName; $_t_LastName; $_t_MerchantID; $_t_MerchantReferenceCode; $_t_oldMethodName; $_t_password; $_t_PostalCode; $_t_State; $_t_Streetname)
	C_TEXT:C284($_t_TransactionKey; $_t_XMLtext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_VIaCyberSource")
//Test environment
//https: >> ics2wstest.ic3.com/commerce/1.x/transactionProcessor
//Production environment
//https: >> ics2ws.ic3.com/commerce/1.x/transactionProcessor

//```
$_t_TransactionKey:="jbiZm+6xUbxvwIrC78tAXvGn+qsHDQZH129pqWMovsK00YTkrcLb4NPj/8ZEwv//GHVNOa7GE5RT8X2n6/NX3hAj+9aB0tgU9+cwarGgh7+kcP0QVquS+gpImGtcoFgXw6hCzKNY3CYoCiKBci0dCcAbXPvZLYtK4JDPwyydXivMRY59JGKoNesl0kHyUxOVeyiAfwVoOcR8274yygOtWWduH3ZmwnWO79vmNzP24npfpy7ZlpykDjfQd5b"+"SU3rYmT1iOiRzgRwq/c4zB/nz2c/aYJSx5Pyk+WG1j67PNqkjLebqIAhTr8FS4kPahChaPD0NSx3SUDtdv2B9tkmazQ=="
//The above transaction key is only for testing.
$_t_XMLtext:="<?xml version="+Char:C90(34)+"1"+Char:C90(34)+"Encoding ="+Char:C90(34)+"UTF-8"+Char:C90(34)+"?><SOAP-ENV:Envelope xmlns:SOAP-ENV="+Char:C90(34)+"http: >> schemas.xmlsoap.org/soap/envelope/"+Char:C90(34)+"xmlns:ns1="+Char:C90(34)+"urn:schemas-cybersource-com:transaction-data-1.31"+Char:C90(34)+">"

$_t_XMLtext:=$_t_XMLtext+"<SOAP-ENV:Header xmlns:wsse="+Char:C90(34)+"http: >> docs.oasis-open.org/wss/2004/1/oasis-200401-wss-wssecurity-secext-1.0.xsd"+Char:C90(34)+">"
$_t_XMLtext:=$_t_XMLtext+"<wsse:Security SOAP-ENV:mustUnderstand="+Char:C90(34)+"1"+Char:C90(34)+"><wsse:UsernameToken>"
//$_t_XMLtext:=$_t_XMLtext+"<wsse:Username>"+$MerchantID"+</wsse:Username>"
$_t_XMLtext:=$_t_XMLtext+"<wsse:Password Type="+Char:C90(34)+"http: >> docs.oasis-open.org/wss/2004/1/oasis-200401-wss-username-token-profile-1#PasswordText"+Char:C90(34)+">"+$_t_password+"</wsse:Password>"
$_t_XMLtext:=$_t_XMLtext+"</wsse:UsernameToken></wsse:Security>"
$_t_XMLtext:=$_t_XMLtext+"</SOAP-ENV:Header><SOAP-ENV:Body>"
$_t_XMLtext:=$_t_XMLtext+"<ns1:requestMessage><ns1:merchantID>"+$_t_MerchantID+"</ns1:merchantID><ns1:merchantReferenceCode>"+$_t_MerchantReferenceCode+"</ns1:merchantReferenceCode><ns1:billTo>"
$_t_XMLtext:=$_t_XMLtext+"<ns1:firstName>"+$_t_FirstName+"</ns1:firstName><ns1:lastName>"+$_t_LastName+"</ns1:lastName><ns1:street1>"+$_t_Streetname+"</ns1:street1><ns1:city>"+$_t_City+"</ns1:city><ns1:state>"+$_t_State+"</ns1:state><ns1:postalCode>"+$_t_PostalCode+"</ns1:postalCode><ns1:country>"+$_t_Country+"</ns1:country><ns1:email>"+"null@cybersource.com</ns1:email>"
$_t_XMLtext:=$_t_XMLtext+"</ns1:billTo><ns1:item id="+Char:C90(34)+"0"+Char:C90(34)+">"
$_t_XMLtext:=$_t_XMLtext+"<ns1:unitPrice>12.34</ns1:unitPrice>"
$_t_XMLtext:=$_t_XMLtext+"<ns1:quantity>2</ns1:quantity></ns1:item>"
$_t_XMLtext:=$_t_XMLtext+"<ns1:purchaseTotals><ns1:currency>USD</ns1:currency>"
$_t_XMLtext:=$_t_XMLtext+"</ns1:purchaseTotals><ns1:card>"
$_t_XMLtext:=$_t_XMLtext+"<ns1:accountNumber>xxxxxxxxxxxx1111</ns1:accountNumber><ns1:expirationMonth>12</ns1:expirationMonth><ns1:expirationYear>2020</ns1:expirationYear>"
$_t_XMLtext:=$_t_XMLtext+"</ns1:card>"
$_t_XMLtext:=$_t_XMLtext+"<ns1:ccAuthService run="+Char:C90(34)+"True"+Char:C90(34)+"/></ns1:requestMessage>"
$_t_XMLtext:=$_t_XMLtext+"</SOAP-ENV:Body></SOAP-ENV:Envelope>"
//```
ERR_MethodTrackerReturn("CCM_VIaCyberSource"; $_t_oldMethodName)
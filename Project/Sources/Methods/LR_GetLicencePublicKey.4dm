//%attributes = {}
If (False:C215)
	//Project Method Name:      LR_GetLicencePublicKey
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/10/2012 12:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_PKDBPublicKey)
	C_TEXT:C284(<>LR_t_LicencerPK; $_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LR_GetLicencePublicKey")
If (Count parameters:C259=0) & (False:C215)
	$_ti_DocumentRef:=Open document:C264(""; "")  //Open the Licence numberer public key
	If ($_ti_DocumentRef#?00:00:00?)
		
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		DOCUMENT TO BLOB:C525(document; $_blb_PKDBPublicKey)
		CLEAR PASTEBOARD:C402
		APPEND DATA TO PASTEBOARD:C403("com.4d.private.text.native"; $_blb_PKDBPublicKey)
		Gen_Alert("Store the public key in the var")
		
	End if 
End if 
<>LR_t_LicencerPK:="-----BEGIN RSA PUBLIC KEY-----"+Char:C90(10)+"MIIBCgKCAQEA4I6g3DIK+RJ1ii7fpXb2Nrp8kviICdmyFpnQII3yXzqEqdHcFUh4"+Char:C90(10)+"qFzS/a/QY1XUVaX70ZRe0XdgLL209x68JMjFNuug0ZZkfes782TkgasQ40eo9Xlo"+Char:C90(10)+"qFgFyMCpS6HdbbaxRd+hXpdi6Yx+Tl9mDqMiJbiZ6RPy3vwnc0cAIzVin1ZTdgpA"+Char:C90(10)+"ZNgSOPLcJMaYQRDib7nrRCdQNOAv3xKzBFkD2Ce5msbu1y5r/gEvDJUtPCzjp5mg"+Char:C90(10)+"LqwJe2qQDRXBv557qxbUV96z4fUPO0dRPrxvkHaSanyQq5ZvyCtrIjzyjm4gmPlf"+Char:C90(10)+"CAz7UooV78CoqcVlIbsWgkdX5Q/I8FptCwIDAQAB"+Char:C90(10)+"-----END RSA PUBLIC KEY-----"
//TEXT TO BLOB(<>LR_t_LicencerPK;$_blb_PKDBPublicKey)
//BLOB TO DOCUMENT("PKDLIcence.txt";$_blb_PKDBPublicKey)
ERR_MethodTrackerReturn("LR_GetLicencePublicKey"; $_t_oldMethodName)

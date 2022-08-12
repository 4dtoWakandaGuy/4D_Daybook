//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_RetreiveLicenceBLOB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/10/2012 12:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_LicenceBLOB; $_blb_LicencerPublicKey; $_blb_MyPrivateKey)
	C_TEXT:C284(<>LR_t_LicencerPK; <>LR_T_PrivateKEYTEXT; $_t_oldMethodName; $_t_Output)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_RetreiveLicenceBLOB")
LR_CreatePublicKey(False:C215)
LR_GetLicencePublicKey(False:C215)

$_ti_DocumentRef:=Open document:C264(""; "")
If ($_ti_DocumentRef#?00:00:00?)
	
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	DOCUMENT TO BLOB:C525(document; $_blb_LicenceBLOB)
	//$_ti_DocumentRef:=Open Document("";"")  //Open the Licence numberer public key
	//If ($_ti_DocumentRef#†00:00:00†)
	//Close DocUMENT($_ti_DocumentRef)
	//DOCUMENT TO BLOB(document;$_blb_LicencerPublicKey)
	//SAVE VARIABLES("";$_blb_LicencerPublicKey)
	
	//$_ti_DocumentRef:=Open Document("";"")  //Open the Licence numberer public key
	//If ($_ti_DocumentRef#†00:00:00†)
	//Close DocUMENT($_ti_DocumentRef)
	//DOCUMENT TO BLOB(document;$_blb_MyPrivateKey)
	
	TEXT TO BLOB:C554(<>LR_T_PrivateKEYTEXT; $_blb_MyPrivateKey)
	TEXT TO BLOB:C554(<>LR_t_LicencerPK; $_blb_LicencerPublicKey)
	CLEAR PASTEBOARD:C402
	//APPEND DATA TO PASTEBOARD("com.4d.private.text.native";$_blb_LicencerPublicKey)
	//SET TEXT TO PASTEBOARD(<>LR_t_LicencerPK)
	DECRYPT BLOB:C690($_blb_LicenceBLOB; $_blb_LicencerPublicKey; $_blb_MyPrivateKey)
	$_t_Output:=BLOB to text:C555($_blb_LicenceBLOB; Mac text without length:K22:10)
End if 
ERR_MethodTrackerReturn("DB_RetreiveLicenceBLOB"; $_t_oldMethodName)
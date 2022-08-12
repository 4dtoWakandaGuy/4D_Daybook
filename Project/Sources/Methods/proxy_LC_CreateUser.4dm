//%attributes = {}
If (False:C215)
	//Project Method Name:      proxy_LC_CreateUser
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/10/2012 12:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(DB_bl_ResponseData)
	//C_UNKNOWN(DB_bl_ResponseText)
	C_BLOB:C604($_blb_LicencerPublicKey; $_blb_MyPrivateKey; DB_bl_RequestData)
	C_LONGINT:C283($_l_CustomerID; $_l_offset; $_l_Seed; $0; LR_l_LicencePortNumber)
	C_TEXT:C284(<>LR_t_LicencerPK; <>LR_T_PrivateKEYTEXT; $_t_BillingDetails; $_t_Name; $_t_oldMethodName; $1; $2; LR_t_LicenceHost; LR_T_WebserviceName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("proxy_LC_CreateUser")
LR_Custom
$_l_Seed:=7350
$_t_Name:="Hello"

$_t_BillingDetails:="Some Address"+Char:C90(13)+"Some more"
If (Count parameters:C259>=2)
	$_t_Name:=$1
	$_t_BillingDetails:=$2
	LR_CreatePublicKey(False:C215)
	LR_GetLicencePublicKey(False:C215)
	TEXT TO BLOB:C554(<>LR_T_PrivateKEYTEXT; $_blb_MyPrivateKey)
	TEXT TO BLOB:C554(<>LR_t_LicencerPK; $_blb_LicencerPublicKey)
	SET BLOB SIZE:C606(DB_bl_RequestData; 0)
	VARIABLE TO BLOB:C532($_l_Seed; DB_bl_RequestData; *)
	VARIABLE TO BLOB:C532($_t_Name; DB_bl_RequestData; *)
	VARIABLE TO BLOB:C532($_t_BillingDetails; DB_bl_RequestData; *)
	ENCRYPT BLOB:C689(DB_bl_RequestData; $_blb_MyPrivateKey; $_blb_LicencerPublicKey)
	
	//TRACE
	WEB SERVICE SET PARAMETER:C777("REQUserID"; DB_bl_RequestData)
	WEB SERVICE CALL:C778("http://"+LR_t_LicenceHost+":"+String:C10(LR_l_LicencePortNumber)+"/4DSOAP/"; LR_T_WebserviceName+"#LC_CreateUser"; "LC_CreateUser"; "http://www.4d.com/namespace/default"; Web Service dynamic:K48:1)
	
	If (OK=1)
		WEB SERVICE GET RESULT:C779(DB_bl_ResponseText; "UserID"; *)  // Memory clean-up on the final return value.
		TEXT TO BLOB:C554(DB_bl_ResponseText; DB_bl_ResponseData; Mac text without length:K22:10)
	End if 
	DECRYPT BLOB:C690(DB_bl_ResponseData; $_blb_LicencerPublicKey; $_blb_MyPrivateKey)
	$_l_offset:=0
	//TRACE
	BLOB TO VARIABLE:C533(DB_bl_ResponseData; $_l_CustomerID; $_l_offset)
	$0:=$_l_CustomerID
Else 
	$0:=-909
	
End if 
ERR_MethodTrackerReturn("proxy_LC_CreateUser"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      olcproxy_LC_CreateUser
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/10/2012 13:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_LicencerPublicKey; $_blb_MyPrivateKey; DB_bl_RequestData)
	C_TEXT:C284(<>LR_t_LicencerPK; <>LR_T_PrivateKEYTEXT; $_t_oldMethodName; $_t_PrefixName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("olcproxy_LC_CreateUser")

$_t_PrefixName:="Hello"
LR_CreatePublicKey(False:C215)
LR_GetLicencePublicKey(False:C215)
TEXT TO BLOB:C554($_t_PrefixName; DB_bl_RequestData; Mac text with length:K22:9)
TEXT TO BLOB:C554(<>LR_T_PrivateKEYTEXT; $_blb_MyPrivateKey)
TEXT TO BLOB:C554(<>LR_t_LicencerPK; $_blb_LicencerPublicKey)

ENCRYPT BLOB:C689(DB_bl_RequestData; $_blb_MyPrivateKey; $_blb_LicencerPublicKey)



WEB SERVICE SET PARAMETER:C777("DB_bl_RequestData"; DB_bl_RequestData)
//SET WEB SERVICE PARAMETER("DB_bl_ResponseData";$2)



WEB SERVICE CALL:C778("http://localhost:8085/4DSOAP/"; "A_WebService#LC_CreateUser"; "LC_CreateUser"; "http://www.4d.com/namespace/default"; Web Service dynamic:K48:1)

ERR_MethodTrackerReturn("olcproxy_LC_CreateUser"; $_t_oldMethodName)

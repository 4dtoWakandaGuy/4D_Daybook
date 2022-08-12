//%attributes = {}
If (False:C215)
	//Project Method Name:      CC_GenerateEncryptionKeys
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 23:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(<>CC_blb_KeytoKey1020102; $_blb_PrivateKey; $_blb_PublicKey; $_blb_RealPrivateKey; $_blb_RealPublicKey)
	C_LONGINT:C283($_l_ItemID; $_l_offset; $_l_Retries)
	C_TEXT:C284($_t_oldMethodName; $_t_PrivateKeyText; $_t_PublicKeyText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CC_GenerateEncryptionKeys")
//This method will generated encrpytion key pairs
//this will execute on the server one generated they will not change
//however because they are stored in the database they have to be encrypted themselves
//the keys for decrypting what the actual encryption pairs are therefore changed everytime the system is started

$_l_Retries:=0
While (Semaphore:C143("UpdatingKeys"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(2*(1+$_l_Retries))
End while 

$_l_ItemID:=PREF_GetPreferenceID("CC Security Preferences")

QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	GENERATE ENCRYPTION KEYPAIR:C688($_blb_PrivateKey; <>CC_blb_KeytoKey1020102)
	//This one will be stored in a resource
	//Now write the resource
	
	VARIABLE TO BLOB:C532($_blb_PrivateKey; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(<>CC_blb_KeytoKey1020102; [PREFERENCES:116]DataBlob:2; *)
	//ENCRYPT BLOB([Preferences]DataBlob;$_blb_PrivateKey;◊CC_bo_KeytoKey1020102)
	SAVE RECORD:C53([PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	
Else 
	//the encryption keys already exist
	//however because they are stored in the system they are encrypted
	//the encrpytion key used to encrpyte the encrpytion keys is therefore also stored
	//this is in a resource and therefor potentially discoverable.
	//So to protect it it will keep changing
	READ WRITE:C146([PREFERENCES:116])
	LOAD RECORD:C52([PREFERENCES:116])
	
	If (False:C215)
		//If (BLOB size($_blb_PrivateKey)>0)
	Else 
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_blb_PrivateKey; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>CC_blb_KeytoKey1020102; $_l_offset)
		
	End if 
	
End if 

CLEAR SEMAPHORE:C144("UpdatingKeys")
ERR_MethodTrackerReturn("CC_GenerateEncryptionKeys"; $_t_oldMethodName)
//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      CC_GetEncryptionKeys
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
	C_BLOB:C604(<>CC_blb_KeytoKey1020102; CC_blb_EnryptedBlob; CC_blb_vvv101023; CC_blb_vvv108013)
	C_LONGINT:C283($_l_ItemID; $_l_offset; $_l_Process; $_l_Retries)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CC_GetEncryptionKeys")
//This method-whichis invisible
//Gets the encrpytion keys-and then changes the key
CC_GenerateEncryptionKeys



If (BLOB size:C605(<>CC_blb_KeytoKey1020102)>0)
	$_l_Retries:=0
	While (Semaphore:C143("UpdatingKeys"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*(1+$_l_Retries))
	End while 
	$_l_ItemID:=PREF_GetPreferenceID("CC Security Preferences")
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	$_l_offset:=0
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CC_blb_vvv101023; $_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; CC_blb_vvv108013; $_l_offset)
	
	//the strangly named variable is just to make cracking harder
	
	CLEAR SEMAPHORE:C144("UpdatingKeys")
	If (False:C215)
		//And now change the unlocking key
		If (Application type:C494=4D Remote mode:K5:5)
			$_l_Process:=Execute on server:C373("CC_GenerateEncryptionKeys"; DB_ProcessMemoryinit(1); "Server Refresh")
		Else 
			$_l_Process:=New process:C317("CC_GenerateEncryptionKeys"; DB_ProcessMemoryinit(1); "Refresh")
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("CC_GetEncryptionKeys"; $_t_oldMethodName)
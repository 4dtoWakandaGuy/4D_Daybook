If (False:C215)
	//object Name: [USER]CCM_Prefs.Variable32
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 17:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_PrivateKey; CCM_blb_NameInBlob; CCM_blb_PublicKey)
	C_BOOLEAN:C305(CCM_bo_IsLicenced)
	C_LONGINT:C283(<>SYS_l_LoggedInaccount; $_l_Index)
	C_TEXT:C284($_t_DocumentPath; $_t_ModuleSTR; $_t_oldMethodName; $_t_UserName)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_Prefs.Variable32"; Form event code:C388)
Gen_Alert("Please select the document containing your licence key")
CCM_bo_IsLicenced:=False:C215
$_ti_DocumentRef:=DB_OpenDocument(""; "")
If ($_ti_DocumentRef#?00:00:00?)
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	DOCUMENT TO BLOB:C525(Document; CCM_blb_NameInBlob)
	$_t_DocumentPath:=PathFromPathName(Document)
	
	DOCUMENT TO BLOB:C525($_t_DocumentPath+"encKey.txt"; CCM_blb_PublicKey)
	
	DECRYPT BLOB:C690(CCM_blb_NameInBlob; CCM_blb_PublicKey)
	
	$_t_UserName:=BLOB to text:C555(CCM_blb_NameInBlob; 3)
	$_t_ModuleSTR:=""
	
	For ($_l_Index; Length:C16($_t_UserName); 1; -1)
		If ($_t_UserName[[$_l_Index]]=";")
			$_t_ModuleSTR:=Substring:C12($_t_UserName; $_l_Index+1; Length:C16($_t_UserName))
			$_t_UserName:=Substring:C12($_t_UserName; 1; $_l_Index-1)
			$_l_Index:=0
		End if 
		
	End for 
	If ($_t_ModuleSTR="01")
		If (<>SYS_l_LoggedInaccount=0)
			QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
		Else 
			QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
		End if 
		If ([USER:15]Name:38=$_t_UserName)
			//Product is licenced
			CCM_bo_IsLicenced:=True:C214
			GENERATE ENCRYPTION KEYPAIR:C688($_blb_PrivateKey; CCM_blb_PublicKey)
			ENCRYPT BLOB:C689(CCM_blb_NameInBlob; $_blb_PrivateKey)
		End if 
		UNLOAD RECORD:C212([USER:15])
		
	End if 
	
End if 
If (CCM_bo_IsLicenced)
	OBJECT SET VISIBLE:C603(*; "oTextLicenced"; True:C214)
Else 
	OBJECT SET VISIBLE:C603(*; "oTextNotLicenced"; True:C214)
End if 
ERR_MethodTrackerReturn("OBJ:CCM_Prefs,BenterLicence"; $_t_oldMethodName)

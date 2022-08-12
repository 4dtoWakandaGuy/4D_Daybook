If (False:C215)
	//object Name: [USER]CCM_Prefs.Variable33
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 17:26
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_PrivateKey; $_blb_PublicKey; CCM_blb_NameInBlob)
	C_LONGINT:C283(<>SYS_l_LoggedInaccount)
	C_TEXT:C284($_t_DocumentName; $_t_DocumentPath; $_t_NewPath; $_t_oldMethodName; $_t_password; $_t_PathName)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_Prefs.Variable33"; Form event code:C388)
// this button is only visible if logged in as designer
If (Current user:C182="Designer")
	$_t_password:=Gen_Request("Enter Password"; "")
	If ($_t_password="MAYDAY")  // this is not case sensitive
		GENERATE ENCRYPTION KEYPAIR:C688($_blb_PrivateKey; $_blb_PublicKey)
		If (<>SYS_l_LoggedInaccount=0)
			QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
		Else 
			QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
		End if 
		Gen_Alert("Note, in the following request the customer name must be the same as the name in "+"[USER]Name in the target database")
		
		$_t_password:=Gen_Request("Enter company name"; [USER:15]Name:38)
		If ($_t_password#"") & (OK=1)
			SET BLOB SIZE:C606(CCM_blb_NameInBlob; 0)
			TEXT TO BLOB:C554($_t_password+";01"; CCM_blb_NameInBlob; 3)
			ENCRYPT BLOB:C689(CCM_blb_NameInBlob; $_blb_PrivateKey)
			//Gen_Alert ("Create document to send this to client")
			$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT"; "Create document to send this to client"; True:C214)
			If ($_ti_DocumentRef#?00:00:00?)
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
				BLOB TO DOCUMENT:C526(Document; CCM_blb_NameInBlob)
				$_t_DocumentPath:=Document
				$_t_DocumentName:=DocNameFromPath($_t_DocumentPath)
				If (Substring:C12($_t_DocumentName; Length:C16($_t_DocumentName)-3; Length:C16($_t_DocumentName))#".txt")
					$_t_DocumentName:=$_t_DocumentName+".txt"
					$_t_PathName:=PathFromPathName($_t_DocumentPath)
					COPY DOCUMENT:C541(Document; $_t_PathName+$_t_DocumentName)
				End if 
				$_t_PathName:=PathFromPathName($_t_DocumentPath)
				$_t_NewPath:=$_t_PathName+"encKey.txt"
				$_ti_DocumentRef:=DB_CreateDocument($_t_NewPath; "TEXT"; "LIcence Key"; True:C214)
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
				BLOB TO DOCUMENT:C526(Document; $_blb_PublicKey)
				
				Gen_Alert("Send the two documents "+$_t_DocumentName+" and "+"encKey.txt"+" to your client for them to use")
				
			End if 
			UNLOAD RECORD:C212([USER:15])
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:CCM_Prefs,BCreateLicence"; $_t_oldMethodName)

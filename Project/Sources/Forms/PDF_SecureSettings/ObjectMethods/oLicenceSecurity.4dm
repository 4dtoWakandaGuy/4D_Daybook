If (False:C215)
	//object Name: Object Name:      PDF_SecureSettings.oLicenceSecurity
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/10/2011 12:28
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_PrivateKey; $_blb_PublicKey; PDF_Bl_NameInBlob; PDF_blb_PublicKey)
	C_BOOLEAN:C305($_bo_Continue; PDF_bo_IsLicenced)
	C_LONGINT:C283(<>SYS_l_LoggedInaccount; $_l_CharIndex)
	C_TEXT:C284($_t_DocumentName; $_t_DocumentPath; $_t_ModuleString; $_t_Name; $_t_NewPath; $_t_oldMethodName; $_t_Password)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PDF_SecureSettings.oLicenceSecurity"; Form event code:C388)
$_bo_Continue:=False:C215
If (Not:C34(Is compiled mode:C492))
	If (Current user:C182="Designer")
		
		Gen_Confirm("Create New Licence?"; "Yes"; "No")
		If (OK=1)
			$_bo_Continue:=False:C215
			HIDE WINDOW:C436
			$_t_Password:=Gen_Request("Enter Password"; "")
			SHOW WINDOW:C435
			If ($_t_Password="MAYDAY")  // this is not case sensitive
				GENERATE ENCRYPTION KEYPAIR:C688($_blb_PrivateKey; $_blb_PublicKey)
				If (<>SYS_l_LoggedInaccount=0)
					QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
				Else 
					QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
				End if 
				Gen_Alert("Note, in the following request the customer name must be the same as the name in "+"[USER]Name in the target database")
				
				HIDE WINDOW:C436
				$_t_Password:=Gen_Request("Enter company name"; [USER:15]Name:38)
				SHOW WINDOW:C435
				If ($_t_Password#"") & (OK=1)
					SET BLOB SIZE:C606(PDF_Bl_NameInBlob; 0)
					TEXT TO BLOB:C554($_t_Password+";02"; PDF_Bl_NameInBlob; 3)
					ENCRYPT BLOB:C689(PDF_Bl_NameInBlob; $_blb_PrivateKey)
					//Gen_Alert ("Create document to send this to client")
					$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT"; "Create document to send this to client"; True:C214)
					If ($_ti_DocumentRef#?00:00:00?)
						CLOSE DOCUMENT:C267($_ti_DocumentRef)
						BLOB TO DOCUMENT:C526(Document; PDF_Bl_NameInBlob)
						$_t_DocumentPath:=Document
						$_t_DocumentName:=DocNameFromPath($_t_DocumentPath)
						If (Substring:C12($_t_DocumentName; Length:C16($_t_DocumentName)-3; Length:C16($_t_DocumentName))#".txt")
							$_t_DocumentName:=$_t_DocumentName+".txt"
							$_t_DocumentPath:=PathFromPathName($_t_DocumentPath)
							COPY DOCUMENT:C541(Document; $_t_DocumentPath+$_t_DocumentName)
						End if 
						$_t_DocumentPath:=PathFromPathName($_t_DocumentPath)
						$_t_NewPath:=$_t_DocumentPath+"PDFKey.txt"
						$_ti_DocumentRef:=DB_CreateDocument($_t_NewPath; "TEXT"; "LIcence Key"; True:C214)
						CLOSE DOCUMENT:C267($_ti_DocumentRef)
						BLOB TO DOCUMENT:C526(Document; $_blb_PublicKey)
						Gen_Alert("Send the two documents "+$_t_DocumentName+" and "+"PDFkey.txt"+" to your client for them to use")
						
					End if 
					
				End if 
			End if 
			SHOW WINDOW:C435
		Else 
			$_bo_Continue:=True:C214
		End if 
	Else 
		$_bo_Continue:=True:C214
	End if 
Else 
	$_bo_Continue:=True:C214
End if 
If ($_bo_Continue)
	Gen_Alert("Please select the document containing your licence key")
	PDF_bo_IsLicenced:=False:C215
	HIDE WINDOW:C436
	$_ti_DocumentRef:=DB_OpenDocument(""; "")
	If ($_ti_DocumentRef#?00:00:00?)
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		DOCUMENT TO BLOB:C525(Document; PDF_Bl_NameInBlob)
		$_t_DocumentPath:=PathFromPathName(Document)
		
		DOCUMENT TO BLOB:C525($_t_DocumentPath+"PDFKey.txt"; PDF_blb_PublicKey)
		
		DECRYPT BLOB:C690(PDF_Bl_NameInBlob; PDF_blb_PublicKey)
		
		$_t_Name:=BLOB to text:C555(PDF_Bl_NameInBlob; 3)
		$_t_ModuleString:=""
		
		For ($_l_CharIndex; Length:C16($_t_Name); 1; -1)
			If ($_t_Name[[$_l_CharIndex]]=";")
				$_t_ModuleString:=Substring:C12($_t_Name; $_l_CharIndex+1; Length:C16($_t_Name))
				$_t_Name:=Substring:C12($_t_Name; 1; $_l_CharIndex-1)
				$_l_CharIndex:=0
			End if 
			
		End for 
		If ($_t_ModuleString="02")
			If (<>SYS_l_LoggedInaccount=0)
				QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
			Else 
				QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
			End if 
			If ([USER:15]Organisation:1=$_t_Name)
				//Product is licenced
				PDF_bo_IsLicenced:=True:C214
				GENERATE ENCRYPTION KEYPAIR:C688($_blb_PrivateKey; PDF_blb_PublicKey)
				ENCRYPT BLOB:C689(PDF_Bl_NameInBlob; $_blb_PrivateKey)
			End if 
			
		End if 
		
	End if 
	If (PDF_bo_IsLicenced)
		OBJECT SET VISIBLE:C603(*; "oLicenceSecurity"; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(*; "oLicenceSecurity"; True:C214)
	End if 
	SHOW WINDOW:C435
End if 
ERR_MethodTrackerReturn("OBJ PDF_SecureSettings.oLicenceSecurity"; $_t_oldMethodName)

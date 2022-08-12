//%attributes = {}
If (False:C215)
	//Project Method Name:      GetEmailSender
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Per_at_PersonnelNames_EmailFrom;0)
	//ARRAY TEXT(<>Per_t_PersonnelNames_EmailSMTP;0)
	//ARRAY TEXT(PER_at_DefaultHostAddresses;0)
	//ARRAY TEXT(PER_at_DefaultSignatures;0)
	//ARRAY TEXT(PER_at_EmailAddresses;0)
	//ARRAY TEXT(PER_at_EmailNames;0)
	C_BOOLEAN:C305(<>Email_bo_PersonInited)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_BlobOffset; $_l_EmailAddressRow; $_l_ItemID; $_l_SizeofArray; PER_l_UserModifiable)
	C_TEXT:C284(<>DB_t_UserGrEmailFrom; <>DB_t_UserGrEmailSMTP; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultSMTPhost; <>PER_t_CurrentUserName; $_t_DefaultEmailAddress; $_t_oldMethodName; $_t_SMTPAddress; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GetEmailSender")
ARRAY TEXT:C222(PER_at_EmailNames; 0)
ARRAY TEXT:C222(PER_at_EmailAddresses; 0)
While (Semaphore:C143("InitEmail"))
	DelayTicks(2)
End while 
If (<>Email_bo_PersonInited=False:C215)
	LOGIN_SetEmail
End if 
CLEAR SEMAPHORE:C144("InitEmail")



OBJECT SET VISIBLE:C603(*; "PER_Pi_GraphicEmailSender"; False:C215)
Case of   //Sender Address
	: (<>Per_at_PersonnelNames_EmailFrom#"")
		$0:=<>Per_at_PersonnelNames_EmailFrom
		$_t_SMTPAddress:=<>Per_t_PersonnelNames_EmailSMTP
		$_t_DefaultEmailAddress:=<>Per_at_PersonnelNames_EmailFrom
	: (<>DB_t_UserGrEmailSMTP#"")
		$0:=<>DB_t_UserGrEmailFrom
		$_t_SMTPAddress:=<>DB_t_UserGrEmailSMTP
		$_t_DefaultEmailAddress:=<>DB_t_UserGrEmailFrom
	Else 
		$0:=<>EMAIL_t_DefaultReplyToAddress
		$_t_SMTPAddress:=<>EMAIL_t_DefaultSMTPhost
		$_t_DefaultEmailAddress:=<>EMAIL_t_DefaultReplyToAddress
End case 

While (Semaphore:C143("EmalNames"))
	DelayTicks(20)
End while 
$_l_ItemID:=PREF_GetPreferenceID("email Names")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=<>PER_l_CurrentUserID)
If (Records in selection:C76([PREFERENCES:116])>0)
	$_l_BlobOffset:=0
	
	ARRAY TEXT:C222(PER_at_EmailNames; 0)
	ARRAY TEXT:C222(PER_at_EmailAddresses; 0)
	ARRAY TEXT:C222(PER_at_DefaultHostAddresses; 0)
	ARRAY TEXT:C222(PER_at_DefaultSignatures; 0)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PER_at_EmailNames; $_l_BlobOffset)
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PER_at_EmailAddresses; $_l_BlobOffset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PER_l_UserModifiable; $_l_BlobOffset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PER_at_DefaultHostAddresses; $_l_BlobOffset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PER_at_DefaultSignatures; $_l_BlobOffset)
				End if 
			End if 
		End if 
	End if 
	
	//Make sure everything is the same size
	$_l_SizeofArray:=Size of array:C274(PER_at_EmailNames)
	ARRAY TEXT:C222(PER_at_EmailNames; $_l_SizeofArray)
	ARRAY TEXT:C222(PER_at_EmailAddresses; $_l_SizeofArray)
	ARRAY TEXT:C222(PER_at_DefaultHostAddresses; $_l_SizeofArray)
	ARRAY TEXT:C222(PER_at_DefaultSignatures; $_l_SizeofArray)
	$_l_EmailAddressRow:=Find in array:C230(PER_at_EmailAddresses; $_t_DefaultEmailAddress)
	If ($_l_EmailAddressRow<0)
		APPEND TO ARRAY:C911(PER_at_EmailNames; <>PER_t_CurrentUserName)
		APPEND TO ARRAY:C911(PER_at_EmailAddresses; $_t_DefaultEmailAddress)
		APPEND TO ARRAY:C911(PER_at_DefaultHostAddresses; $_t_SMTPAddress)
		APPEND TO ARRAY:C911(PER_at_DefaultSignatures; GetEmailSignature)
	End if 
	
	If (Size of array:C274(PER_at_EmailNames)>1)
		OBJECT SET VISIBLE:C603(*; "PER_Pi_GraphicEmailSender"; True:C214)
		If (PER_l_UserModifiable>0)
			ARRAY TEXT:C222(PER_at_EmailNames; Size of array:C274(PER_at_EmailNames)+2)
			ARRAY TEXT:C222(PER_at_EmailAddresses; Size of array:C274(PER_at_EmailAddresses)+2)
			PER_at_EmailNames{Size of array:C274(PER_at_EmailNames)}:="Add Address"
			PER_at_EmailNames{Size of array:C274(PER_at_EmailNames)-1}:="-"
		End if 
	Else 
		If (PER_l_UserModifiable>0)
			OBJECT SET VISIBLE:C603(*; "PER_Pi_GraphicEmailSender"; True:C214)
			ARRAY TEXT:C222(PER_at_EmailNames; 1)
			ARRAY TEXT:C222(PER_at_EmailAddresses; 1)
			PER_at_EmailNames{1}:="Add Address"
		End if 
	End if 
	
	
Else 
	OBJECT SET VISIBLE:C603(PER_at_EmailNames; False:C215)
End if 
CLEAR SEMAPHORE:C144("EmalNames")
ERR_MethodTrackerReturn("GetEmailSender"; $_t_oldMethodName)
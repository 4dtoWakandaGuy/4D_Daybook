//%attributes = {}
If (False:C215)
	//Project Method Name:      LOGIN_SetEmail
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/12/2009 13:43`Method: LOGIN_SetEmail
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; <>PER_bo_CurrentGroupRestrictStat; <>Per_bo_EmailCOPY; <>UserGr_EmailCopytoOption; $_bo_Unload)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_StartModuleRow)
	C_TEXT:C284(<>DB_t_UserGrEmailFrom; <>DB_t_UserGrEmailSMTP; <>DefCopytoaddress; <>DefSignature; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultSMTPhost; <>Per_at_PersonnelNames_EMAILFROM; <>Per_at_PersonnelNames_EMAILSIGN; <>Per_t_PersonnelNames_EmailSMTP; <>Per_t_PersonnelNames_EmailTo; <>PER_t_CurrentEmailFrom)
	C_TEXT:C284(<>PER_t_UserGroup; <>UserGr_EmailSig; <>UserGr_EmailTo; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LOGIN_SetEmail")
//NG July 2007 this method was called at startup..it will get called if ◊EmailPersonInited is not true

While (Semaphore:C143("$InitingEmail"))
	DelayTicks
End while 

//NG Need to check on serverrrrrrr.
//TRACE
$_bo_Unload:=False:C215
If (<>Email_bo_PersonInited=False:C215)
	
	If (<>PER_l_CurrentUserID#0) | (Application type:C494=4D Server:K5:6)
		
		If (<>PER_t_CurrentEmailFrom="") | (<>Per_t_PersonnelNames_EmailSMTP="") | (<>Per_t_PersonnelNames_EmailTo="") | (<>Per_at_PersonnelNames_EmailFrom="") | (<>Per_at_PersonnelNames_EmailSign="")
			
			If (<>PER_l_CurrentUserID#[PERSONNEL:11]Personnel_ID:48)
				$_bo_Unload:=True:C214
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=<>PER_l_CurrentUserID)
			End if 
			
			<>PER_t_CurrentEmailFrom:=[PERSONNEL:11]Email_Address:36
			<>Per_t_PersonnelNames_EmailSMTP:=[PERSONNEL:11]PER_SMTPHOST:41
			//LOGIN_SmtpHosts (◊UserID;[PERSONNEL]PER_SMTPHOST)  `Commented out 11/03/09 v631b120p & 07/04/09 v631b120h_7 -kmw as it wasn't doing anything and NTK error handling may have been confused by it (shouldn't have been but just in case!)
			<>Per_t_PersonnelNames_EmailTo:=[PERSONNEL:11]PER_CopyToAddress:42
			<>Per_at_PersonnelNames_EmailFrom:=[PERSONNEL:11]Email_Address:36
			<>Per_at_PersonnelNames_EmailSign:=[PERSONNEL:11]Per_DefaultSignature:44
			<>Per_bo_EmailCOPY:=[PERSONNEL:11]PER_CopytoOption:43
			
			If (<>PER_t_CurrentEmailFrom="") | (<>Per_t_PersonnelNames_EmailSMTP="") | (<>Per_t_PersonnelNames_EmailTo="") | (<>Per_at_PersonnelNames_EmailFrom="") | (<>Per_at_PersonnelNames_EmailSign="")
				<>DB_t_UserGrEmailSMTP:=""
				<>UserGr_EmailTo:=""
				<>DB_t_UserGrEmailFrom:=""
				<>UserGr_EmailSig:=""
				
				If (<>PER_t_UserGroup="")
					<>PER_bo_CurrentGroupRestrictStat:=False:C215
					<>DB_t_UserGrEmailSMTP:=<>EMAIL_t_DefaultSMTPhost
					<>UserGr_EmailTo:=<>DefCopytoaddress
					<>DB_t_UserGrEmailFrom:=<>EMAIL_t_DefaultReplyToAddress
					<>UserGr_EmailSig:=<>DefSignature
					<>UserGr_EmailCopytoOption:=False:C215
					
				Else 
					QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=<>PER_t_UserGroup)
					$_bo_Unload:=True:C214
					
					If (Records in selection:C76([PERSONNEL_GROUPS:92])>0)
						
						
						
						<>DB_t_UserGrEmailSMTP:=[PERSONNEL_GROUPS:92]X_DEF_GRP_SMTPHOST:5
						<>UserGr_EmailTo:=[PERSONNEL_GROUPS:92]X_DEF_GRP_ReplyToAddress:6
						<>DB_t_UserGrEmailFrom:=[PERSONNEL_GROUPS:92]X_Def_GRP_EmailSenderAddress:10
						<>UserGr_EmailSig:=[PERSONNEL_GROUPS:92]X_Def_GRP_Signature:9
						<>UserGr_EmailCopytoOption:=[PERSONNEL_GROUPS:92]X_Def_CopytoOption:8
						
						If ([PERSONNEL_GROUPS:92]Start_Module:4#"")
							//If ($_l_StartModuleRow<=0)
							$_l_StartModuleRow:=Find in array:C230(<>Mod_at_ModuleName; [PERSONNEL_GROUPS:92]Start_Module:4)
							//End if
						End if 
						UNLOAD RECORD:C212([PERSONNEL_GROUPS:92])
						
					Else 
						
						
						<>DB_t_UserGrEmailSMTP:=<>EMAIL_t_DefaultSMTPhost
						<>UserGr_EmailTo:=<>DefCopytoaddress
						<>DB_t_UserGrEmailFrom:=<>EMAIL_t_DefaultReplyToAddress
						<>UserGr_EmailSig:=<>DefSignature
					End if 
					
				End if 
				
				If (<>DB_t_UserGrEmailSMTP="") | (<>UserGr_EmailTo="") | (<>UserGr_EmailTo="") | (<>DB_t_UserGrEmailFrom="") | (<>UserGr_EmailSig="")
					If (<>DB_t_UserGrEmailSMTP="")
						<>DB_t_UserGrEmailSMTP:=<>EMAIL_t_DefaultSMTPhost
					End if 
					If (<>UserGr_EmailTo="")
						<>UserGr_EmailTo:=<>DefCopytoaddress
					End if 
					If (<>DB_t_UserGrEmailFrom="")
						<>DB_t_UserGrEmailFrom:=<>EMAIL_t_DefaultReplyToAddress
					End if 
					If (<>UserGr_EmailSig="")
						<>UserGr_EmailSig:=<>DefSignature
					End if 
				End if 
				
				If (<>PER_t_CurrentEmailFrom="")
					<>PER_t_CurrentEmailFrom:=<>DB_t_UserGrEmailFrom
				End if 
				If (<>Per_t_PersonnelNames_EmailSMTP="")
					<>Per_t_PersonnelNames_EmailSMTP:=<>DB_t_UserGrEmailSMTP
				End if 
				If (<>Per_t_PersonnelNames_EmailTo="")
					<>Per_t_PersonnelNames_EmailTo:=<>UserGr_EmailTo
				End if 
				If (<>Per_at_PersonnelNames_EmailFrom="")
					<>Per_at_PersonnelNames_EmailFrom:=<>DB_t_UserGrEmailFrom
				End if 
				If (<>Per_at_PersonnelNames_EmailSign="")
					<>Per_at_PersonnelNames_EmailSign:=<>UserGr_EmailSig
				End if 
			End if 
		End if 
	End if 
End if 

CLEAR SEMAPHORE:C144("$InitingEmail")
If (<>PER_l_CurrentUserID#0) & (<>Per_t_PersonnelNames_EmailSMTP#"") | (Application type:C494=4D Server:K5:6)
	<>Email_bo_PersonInited:=True:C214
End if 

If ($_bo_Unload)
	UNLOAD RECORD:C212([PERSONNEL:11])
	UNLOAD RECORD:C212([PERSONNEL_GROUPS:92])
End if 
ERR_MethodTrackerReturn("LOGIN_SetEmail"; $_t_oldMethodName)

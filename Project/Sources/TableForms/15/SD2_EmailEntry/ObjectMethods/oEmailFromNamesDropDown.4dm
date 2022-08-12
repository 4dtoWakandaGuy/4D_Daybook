If (False:C215)
	//object Name: [USER]SD2_EmailEntry.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PER_at_EmailAddresses;0)
	//ARRAY TEXT(PER_at_EmailNames;0)
	//ARRAY TEXT(PER_at_DefaultSignatures;0)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_EmailFromRow; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRIght; $_l_WindowTop)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_EmailMailSignature; $_t_MailSignature2; $_t_oldMethodName; DOC_T_EmailFromcom; EMAIL_T_EmailSignature)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_EmailEntry.Variable3"; Form event code:C388)
If (PER_at_EmailNames>0)
	If (PER_at_EmailAddresses{PER_at_EmailNames}#"")
		[DIARY:12]Email_From:38:=PER_at_EmailAddresses{PER_at_EmailNames}
		[DIARY:12]Email_Person:39:=PER_at_EmailNames{PER_at_EmailNames}
		DOC_T_EmailFromcom:=[DIARY:12]Email_Person:39+"<"+[DIARY:12]Email_From:38+">"
		$_t_EmailMailSignature:=EMAIL_T_EmailSignature
		$_l_EmailFromRow:=Find in array:C230(PER_at_EmailAddresses; [DIARY:12]Email_From:38)
		If ($_l_EmailFromRow>0)
			If (PER_at_DefaultSignatures{$_l_EmailFromRow}#"")
				$_t_MailSignature2:=PER_at_DefaultSignatures{$_l_EmailFromRow}
				If ($_t_MailSignature2#$_t_EmailMailSignature)
					[DIARY:12]Email_Text:42:=Replace string:C233([DIARY:12]Email_Text:42; $_t_EmailMailSignature; $_t_MailSignature2)
					EMAIL_T_EmailSignature:=$_t_MailSignature2
				End if 
			End if 
		End if 
		
	Else 
		If (PER_at_EmailAddresses{PER_at_EmailNames}="Add Address")
			//add email address
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowBottom)
			OBJECT GET COORDINATES:C663([DIARY:12]Email_From:38; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			PER_EditEmails(<>PER_t_CurrentUserInitials; <>PER_l_CurrentUserID; $_l_WindowLeft+$_l_ObjectLeft; $_l_WindowTop+$_l_ObjectBottom; $_l_WindowLeft+$_l_ObjectRight)
			[DIARY:12]Email_From:38:=GetEmailSender
			DOC_T_EmailFromcom:=[DIARY:12]Email_Person:39+"<"+[DIARY:12]Email_From:38+">"
		End if 
	End if 
End if 
PER_at_EmailNames:=0
ERR_MethodTrackerReturn("OBJ [USER].SD2_EmailEntry.Variable3"; $_t_oldMethodName)
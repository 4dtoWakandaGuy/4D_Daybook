If (False:C215)
	//object Name: [DIARY]Diary_InEmail.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PER_at_DefaultSignatures;0)
	//ARRAY TEXT(PER_at_EmailAddresses;0)
	//ARRAY TEXT(PER_at_EmailNames;0)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_EmailAddressRow; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_T_EmailSignature; $_T_EmailSignature2; $_t_oldMethodName; DOC_T_EmailFromcom; EMAIL_T_EmailSignature)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InEmail.Variable10"; Form event code:C388)
If (PER_at_EmailNames>0)
	If (PER_at_EmailAddresses{PER_at_EmailNames}#"")
		[DIARY:12]Email_From:38:=PER_at_EmailAddresses{PER_at_EmailNames}
		[DIARY:12]Email_Person:39:=PER_at_EmailNames{PER_at_EmailNames}
		DOC_T_EmailFromcom:=[DIARY:12]Email_Person:39+"<"+[DIARY:12]Email_From:38+">"
		$_T_EmailSignature:=EMAIL_T_EmailSignature
		$_l_EmailAddressRow:=Find in array:C230(PER_at_EmailAddresses; [DIARY:12]Email_From:38)
		If ($_l_EmailAddressRow>0)
			If (PER_at_DefaultSignatures{$_l_EmailAddressRow}#"")
				$_T_EmailSignature2:=PER_at_DefaultSignatures{$_l_EmailAddressRow}
				If ($_T_EmailSignature2#$_T_EmailSignature)
					[DIARY:12]Email_Text:42:=Replace string:C233([DIARY:12]Email_Text:42; $_T_EmailSignature; $_T_EmailSignature2)
					EMAIL_T_EmailSignature:=$_T_EmailSignature2
				End if 
			End if 
		End if 
		
	Else 
		If (PER_at_EmailAddresses{PER_at_EmailNames}="Add Address")
			//add email address
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			OBJECT GET COORDINATES:C663([DIARY:12]Email_From:38; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			PER_EditEmails(<>PER_t_CurrentUserInitials; <>PER_l_CurrentUserID; $_l_WindowLeft+$_l_ObjectLeft; $_l_WindowTop+$_l_ObjectBottom; $_l_WindowLeft+$_l_ObjectRight)
			[DIARY:12]Email_From:38:=GetEmailSender
			DOC_T_EmailFromcom:=[DIARY:12]Email_Person:39+"<"+[DIARY:12]Email_From:38+">"
		End if 
	End if 
End if 
PER_at_EmailNames:=0
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InEmail.Variable10"; $_t_oldMethodName)

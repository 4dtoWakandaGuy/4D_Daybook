If (False:C215)
	//object Name: [DIARY]Diary_InDocument.Variable23
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PER_at_EmailAddresses;0)
	//ARRAY TEXT(PER_at_EmailNames;0)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InDocument.Variable23"; Form event code:C388)
If (PER_at_EmailNames>0)
	If (PER_at_EmailAddresses{PER_at_EmailNames}#"")
		[DIARY:12]Email_From:38:=PER_at_EmailAddresses{PER_at_EmailNames}
		[DIARY:12]Email_Person:39:=PER_at_EmailNames{PER_at_EmailNames}
	Else 
		If (PER_at_EmailAddresses{PER_at_EmailNames}="Add Address")
			//add email address
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			OBJECT GET COORDINATES:C663([DIARY:12]Email_From:38; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			PER_EditEmails(<>PER_t_CurrentUserInitials; <>PER_l_CurrentUserID; $_l_WindowLeft+$_l_ObjectLeft; $_l_WindowTop+$_l_ObjectBottom; $_l_WindowLeft+$_l_ObjectRight)
			[DIARY:12]Email_From:38:=GetEmailSender
		End if 
	End if 
End if 
PER_at_EmailNames:=0
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InDocument.Variable23"; $_t_oldMethodName)
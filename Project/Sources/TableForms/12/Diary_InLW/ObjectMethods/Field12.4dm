If (False:C215)
	//object Name: [DIARY]Diary_inLW.Field12
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
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	C_LONGINT:C283($_l_event; $_l_SelectedEmailRow; WS_l_SelectedEmailName)
	C_TEXT:C284($_t_oldMethodName; EMAIL_t_EmailType; WS_t_ContactID; WS_t_EmailAddress; WS_t_EmailName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_inLW.Field12"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Getting Focus:K2:7)
		If ((WS_t_EmailName#"") & (WS_t_EmailAddress#"")) | ((WS_t_EmailName="") & (WS_t_EmailAddress=""))
			//GOTO AREA([DIARY]Email_Subject)
			If (WS_l_SelectedEmailName>0)
				$_l_SelectedEmailRow:=WS_l_SelectedEmailName
			Else 
				If (WS_t_EmailAddress#"")
					$_l_SelectedEmailRow:=Find in array:C230(SD2_at_EmailAddresses; WS_t_EmailAddress)
				Else 
					$_l_SelectedEmailRow:=0
					WS_l_SelectedEmailName:=0
				End if 
			End if 
			If ($_l_SelectedEmailRow<0)
				INSERT IN ARRAY:C227(SD2_at_EmailType; 9999; 1)
				INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 9999; 1)
				INSERT IN ARRAY:C227(SD2_at_EmailName; 9999; 1)
				INSERT IN ARRAY:C227(SD2_at_ContactIDs; 9999; 1)
				SD2_at_EmailType{Size of array:C274(SD2_at_EmailType)}:=EMAIL_t_EmailType
				SD2_at_EmailAddresses{Size of array:C274(SD2_at_EmailAddresses)}:=WS_t_EmailAddress
				SD2_at_ContactIDs{Size of array:C274(SD2_at_ContactIDs)}:=WS_t_ContactID
				SD2_at_EmailName{Size of array:C274(SD2_at_EmailName)}:=WS_t_EmailName
				If (Size of array:C274(SD2_at_EmailName)>1)
					WS_l_SelectedEmailName:=0
					EMAIL_t_EmailType:=""
					WS_t_EmailAddress:=""
					WS_t_ContactID:=""
					WS_t_EmailName:=""
				End if 
			Else 
				SD2_at_EmailType{WS_l_SelectedEmailName}:=EMAIL_t_EmailType
				SD2_at_EmailAddresses{WS_l_SelectedEmailName}:=WS_t_EmailAddress
				SD2_at_ContactIDs{WS_l_SelectedEmailName}:=WS_t_ContactID
				SD2_at_EmailName{WS_l_SelectedEmailName}:=WS_t_EmailName
				If (Size of array:C274(SD2_at_EmailName)>1)
					WS_l_SelectedEmailName:=0
					EMAIL_t_EmailType:=""
					WS_t_EmailAddress:=""
					WS_t_ContactID:=""
					WS_t_EmailName:=""
				End if 
			End if 
		Else 
			
			//SD2_at_EmailType{WS_l_SelectedEmailName}:=EMAIL_t_EmailType
			// SD2_at_EmailAddresses{WS_l_SelectedEmailName}:=WS_t_EmailAddress
			// SD2_at_ContactIDs{WS_l_SelectedEmailName}:=WS_t_ContactID
			// SD2_at_EmailName{WS_l_SelectedEmailName}:=WS_t_EmailName
			// If (Size of array(SD2_at_EmailName)>1)
			//   WS_l_SelectedEmailName:=0
			//  EMAIL_t_EmailType:=""
			//  WS_t_EmailAddress:=""
			// WS_t_ContactID:=""
			// WS_t_EmailName:=""
		End if 
		
		
		
		SETEMAILFORMOBJECTS
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_inLW.Field12"; $_t_oldMethodName)

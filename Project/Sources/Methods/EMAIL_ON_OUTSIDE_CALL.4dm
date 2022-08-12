//%attributes = {}

If (False:C215)
	//Project Method Name:      EMAIL_ON_OUTSIDE_CALL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DOC_al_RecordNumbers;0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	C_BOOLEAN:C305(<>EMAIL_bo_NotHandleEmailing; $_bo_Continue; $1; EMAIL_bo_ConfirmBefore; Mail_bo_inOK)
	C_LONGINT:C283($_l_EmailRow; $_l_Index; DB_l_ButtonClickedFunction; DOC_l_CallEvent; DOC_l_ContactsProcess; EmailChoiceProc; iOK; WS_l_ContactElement; WS_l_SelectedEmailName)
	C_TEXT:C284($_t_EmailAddress; $_t_EmailName; $_t_oldMethodName; EMAIL_t_EmailType; vButtDisDry; WS_t_ContactID; WS_t_EmailAddress; WS_t_EmailName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EMAIL_ON_OUTSIDE_CALL")

If (Count parameters:C259=0)
	$_t_oldMethodName:=ERR_MethodTracker("EMAIL_ON_OUTSIDE_CALL")
	Mail_bo_inOK:=False:C215
	$_bo_Continue:=True:C214
	If (DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK")) | (iOK=1)
		iOK:=0
		DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Cancel")
		Mail_bo_inOK:=True:C214
		$_bo_Continue:=True:C214
		If (<>EMAIL_bo_NotHandleEmailing=False:C215)  //if this is true we are not sending
			$_bo_Continue:=Diary_PrintS(True:C214; EMAIL_bo_ConfirmBefore)
			If ($_bo_Continue)
				EMAIL_bo_ConfirmBefore:=True:C214
			End if 
			
		End if 
		
	Else 
		If ([DIARY:12]Email_ID:41<=0) & (Size of array:C274(SD2_at_EmailType)>0)
			Gen_Confirm("Are you sure you want to cancel this email?"; "Yes"; "No")
			$_bo_Continue:=(OK=1)
		Else 
			$_bo_Continue:=True:C214
		End if 
		If ($_bo_Continue)
			
			<>EMAIL_bo_NotHandleEmailing:=False:C215
			iOK:=0
			DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Cancel")
			Mail_bo_inOK:=False:C215  //not sending the email
		End if 
		
	End if 
	If ($_bo_Continue)
		In_ButtCall("Psuedo_Diary_InLLPA"; ""; "Minor_DelSinEx"; ->[DIARY:12]; ->[DIARY:12]Diary_Code:3; "RECORDINGS"; "3 9"; "Diary_InLLPB"; "DMaster"; "Diary_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDisDry)
	End if 
Else 
	//
	Case of 
		: (DOC_l_CallEvent>0)
			//an email name and address to use
			GOTO RECORD:C242([CONTACTS:1]; <>DOC_al_RecordNumbers{DOC_l_CallEvent})
			$_t_EmailAddress:=Contact_Email
			If ($_t_EmailAddress#"")
				WS_t_EmailAddress:=$_t_EmailAddress
				$_t_EmailName:=CON_BuildContactName
				WS_t_EmailName:=$_t_EmailName
				If (EmailChoiceProc>0)
					DOC_l_CallEvent:=1
					SET PROCESS VARIABLE:C370(EmailChoiceProc; DOC_l_CallEvent; DOC_l_CallEvent)
					POST OUTSIDE CALL:C329(EmailChoiceProc)
					
				End if 
				If ([DIARY:12]Contact_Code:2="")
					CREATE SET:C116([CONTACTS:1]; "$temp")
					[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
					Diary_InD
					MCont_Add("")
					Diary_InLLPHead
					WS_t_ContactID:=[DIARY:12]Contact_Code:2
					If (Size of array:C274(SD2_at_EmailType)=0)
						INSERT IN ARRAY:C227(SD2_at_EmailType; 9999; 1)
						INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 9999; 1)
						INSERT IN ARRAY:C227(SD2_at_EmailName; 9999; 1)
						INSERT IN ARRAY:C227(SD2_at_ContactIDs; 9999; 1)
					End if 
					WS_l_ContactElement:=Size of array:C274(SD2_at_EmailType)
					SD2_at_EmailType{1}:=EMAIL_t_EmailType
					SD2_at_EmailAddresses{1}:=WS_t_EmailAddress
					SD2_at_ContactIDs{1}:=WS_t_ContactID
					SD2_at_EmailName{1}:=WS_t_EmailName
					USE SET:C118("$temp")
					CLEAR SET:C117("$temp")
					
				Else 
					WS_t_ContactID:=[CONTACTS:1]Contact_Code:2
				End if 
				If (WS_t_EmailAddress#"")
					If (WS_l_SelectedEmailName=0)
						GOTO OBJECT:C206([DIARY:12]Email_Subject:40)
						$_l_EmailRow:=Find in array:C230(SD2_at_EmailAddresses; WS_t_EmailAddress)
						If ($_l_EmailRow<0)
							INSERT IN ARRAY:C227(SD2_at_EmailType; 9999; 1)
							INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 9999; 1)
							INSERT IN ARRAY:C227(SD2_at_EmailName; 9999; 1)
							INSERT IN ARRAY:C227(SD2_at_ContactIDs; 9999; 1)
							If (EMAIL_t_EmailType="")
								EMAIL_t_EmailType:="To"
							End if 
							SD2_at_EmailType{Size of array:C274(SD2_at_EmailType)}:=EMAIL_t_EmailType
							SD2_at_EmailAddresses{Size of array:C274(SD2_at_EmailAddresses)}:=WS_t_EmailAddress
							SD2_at_ContactIDs{Size of array:C274(SD2_at_ContactIDs)}:=WS_t_ContactID
							SD2_at_EmailName{Size of array:C274(SD2_at_EmailName)}:=WS_t_EmailName
							If (Size of array:C274(SD2_at_ContactIDs)>1)
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
							If (Size of array:C274(SD2_at_ContactIDs)>1)
								WS_l_SelectedEmailName:=0
								EMAIL_t_EmailType:=""
								WS_t_EmailAddress:=""
								WS_t_ContactID:=""
								WS_t_EmailName:=""
							End if 
							
						End if 
						//SETEMAILFORMOBJECTS
						RESET_DIARY_EMAIL_OBJS
					End if 
					
					
				End if 
			End if 
		: (DOC_l_CallEvent<0)
			DOC_l_ContactsProcess:=0
			//an email name and address to use
			BRING TO FRONT:C326(Current process:C322)
			
			USE SET:C118("<>SelectedRecords")
			QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Email_Before_At:30=""; *)
			QUERY SELECTION:C341([CONTACTS:1];  | ; [CONTACTS:1]EMail_After_At:24="")
			If (Records in selection:C76([CONTACTS:1])>0)
				Gen_Alert(String:C10(Records in selection:C76([CONTACTS:1]))+" Do not have an email address,"+" They will not be used")
			End if 
			USE SET:C118("<>SelectedRecords")
			CLEAR SET:C117("<>SelectedRecords")
			QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Email_Before_At:30#""; *)
			QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]EMail_After_At:24#"")
			
			
			//`````
			FIRST RECORD:C50([CONTACTS:1])
			For ($_l_Index; 1; Records in selection:C76([CONTACTS:1]))
				$_t_EmailAddress:=Contact_Email
				If ($_t_EmailAddress#"")
					WS_t_EmailAddress:=$_t_EmailAddress
					$_t_EmailName:=CON_BuildContactName
					WS_t_EmailName:=$_t_EmailName
					If (EmailChoiceProc>0)
						DOC_l_CallEvent:=1
						SET PROCESS VARIABLE:C370(EmailChoiceProc; DOC_l_CallEvent; DOC_l_CallEvent)
						POST OUTSIDE CALL:C329(EmailChoiceProc)
						
					End if 
					If ([DIARY:12]Contact_Code:2="")
						CREATE SET:C116([CONTACTS:1]; "Temp")
						[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
						Diary_InD
						MCont_Add("")
						Diary_InLLPHead
						WS_t_ContactID:=[DIARY:12]Contact_Code:2
						If (Size of array:C274(SD2_at_EmailType)=0)
							INSERT IN ARRAY:C227(SD2_at_EmailType; 9999; 1)
							INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 9999; 1)
							INSERT IN ARRAY:C227(SD2_at_EmailName; 9999; 1)
							INSERT IN ARRAY:C227(SD2_at_ContactIDs; 9999; 1)
						End if 
						WS_l_ContactElement:=Size of array:C274(SD2_at_EmailType)
						SD2_at_EmailType{1}:=EMAIL_t_EmailType
						SD2_at_EmailAddresses{1}:=WS_t_EmailAddress
						SD2_at_ContactIDs{1}:=WS_t_ContactID
						SD2_at_EmailName{1}:=WS_t_EmailName
						USE SET:C118("Temp")
						CLEAR SET:C117("Temp")
					Else 
						WS_t_ContactID:=[CONTACTS:1]Contact_Code:2
					End if 
					
					
					If (WS_t_EmailAddress#"")
						If (WS_l_SelectedEmailName=0)
							GOTO OBJECT:C206([DIARY:12]Email_Subject:40)
							$_l_EmailRow:=Find in array:C230(SD2_at_EmailAddresses; WS_t_EmailAddress)
							If ($_l_EmailRow<0)
								INSERT IN ARRAY:C227(SD2_at_EmailType; 9999; 1)
								INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 9999; 1)
								INSERT IN ARRAY:C227(SD2_at_EmailName; 9999; 1)
								INSERT IN ARRAY:C227(SD2_at_ContactIDs; 9999; 1)
								If (EMAIL_t_EmailType="")
									EMAIL_t_EmailType:="To"
								End if 
								SD2_at_EmailType{Size of array:C274(SD2_at_EmailType)}:=EMAIL_t_EmailType
								SD2_at_EmailAddresses{Size of array:C274(SD2_at_EmailAddresses)}:=WS_t_EmailAddress
								SD2_at_ContactIDs{Size of array:C274(SD2_at_ContactIDs)}:=WS_t_ContactID
								SD2_at_EmailName{Size of array:C274(SD2_at_EmailName)}:=WS_t_EmailName
								If (Size of array:C274(SD2_at_ContactIDs)>1)
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
								If (Size of array:C274(SD2_at_ContactIDs)>1)
									WS_l_SelectedEmailName:=0
									EMAIL_t_EmailType:=""
									WS_t_EmailAddress:=""
									WS_t_ContactID:=""
									WS_t_EmailName:=""
								End if 
							End if 
						End if 
						RESET_DIARY_EMAIL_OBJS
					End if 
				End if 
				
				NEXT RECORD:C51([CONTACTS:1])
			End for 
			
	End case 
	
End if 
ERR_MethodTrackerReturn("EMAIL_ON_OUTSIDE_CALL"; $_t_oldMethodName)
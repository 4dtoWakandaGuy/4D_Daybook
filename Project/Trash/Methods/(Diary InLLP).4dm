//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_InLLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/09/2010 10:04
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(wr view borders palette)
	//C_UNKNOWN(wr view format palette)
	//C_UNKNOWN(wr view references)
	//C_UNKNOWN(wr view standard palette)
	//C_UNKNOWN(wr view style palette)
	//ARRAY BOOLEAN(ACC_lb_Analysis;0)
	//ARRAY LONGINT(<>DOC_al_RecordNumbers;0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	//ARRAY TEXT(SD2_at_EmailName;0)
	//ARRAY TEXT(SD2_at_EmailType;0)
	C_BOOLEAN:C305($_bo_CodeMod; $_bo_CompanyMod; $_bo_ContactMod; $_bo_DateMod; $_bo_PersonMod; DB_bo_NoLoad; PAL_bo_ButtonSubFunction; SD_bo_AdditionalRelations)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_EmailAddressRow; $_l_Event; $_l_FieldNumber; $_l_Index; $_l_SizeofArray; $_l_TableNumber; ATTACH_COUNT; cSave; DB_l_ButtonClickedFunction; DOC_l_CallEvent; DOC_l_ContactsProcess)
	C_LONGINT:C283(EmailChoiceProc; EML_l_BUT1; EML_l_But2; EML_l_BUT3; EML_l_BUT4; EML_l_BUT5; EML_l_BUT6; EML_l_BUT7; EML_l_BUT8; EML_l_BUT9; iCancel)
	C_LONGINT:C283(iOK; PAL_BUTTON_10; PAL_BUTTON_7; PAL_BUTTON_8; PAL_BUTTON_9; REICIPIENT_COUNT; vCreate; vEdit; write; WS_l_ContactElement; WS_l_SelectedEmailName)
	C_POINTER:C301($_ptr_CurrentObject)
	C_TEXT:C284(<>eLetAct; $_t_EmailAddress; $_t_EmailName; $_t_oldMethodName; $_t_PalletButtonName; $_t_VarName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DB_t_CUrrentInputMenuRef; DOC_t_DocumentCode)
	C_TEXT:C284(EMAIL_t_EmailBody; EMAIL_T_EmailSignature; EMAIL_t_EmailTo; EMAIL_t_EmailType; EMAIL_t_FooterText; EMAIL_t_InsText; EML_t_COL1; EML_t_COL2; EML_t_COL3; EML_t_COL4; EML_t_COL5)
	C_TEXT:C284(EML_t_COL6; EML_t_COL7; EML_t_COL8; EML_t_COL9; EML_t_HED1; EML_t_HED2; EML_t_HED3; EML_t_HED4; EML_t_HED5; EML_t_HED6; EML_t_HED7)
	C_TEXT:C284(EML_t_HED8; EML_t_HED9; PAL_BUTTON; vButtDisDry; vContName; vFrom; vHeading; vPerson; vWT_EmailSenderName; WIN_t_CurrentInputForm; WS_t_ContactID)
	C_TEXT:C284(WS_t_EmailAddress; WS_t_EmailName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InLLP")
//LP Diary_InL LP
$_l_Event:=Form event code:C388

Case of 
		// : (Before)
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		
		
		OpenHelp(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		
		//BSW 20/06/03
		If (DB_t_CurrentFormUsage="E") & ([DIARY:12]Action_Code:9="") & (Not:C34(Undefined:C82(<>eLetAct)))
			[DIARY:12]Action_Code:9:=<>eLetAct
			If (<>eLetAct="")
				[DIARY:12]Action_Code:9:="Email"
			End if 
			
		End if 
		//modify this-probably
		If (WIN_t_CurrentInputForm="Diary_InEmail")
			WS_AutoscreenSize(1; 355; 597; Table name:C256(->[DIARY:12])+"_"+WIN_t_CurrentInputForm)
		Else 
			WS_AutoscreenSize(1; 0; 700; Table name:C256(->[DIARY:12])+"_"+WIN_t_CurrentInputForm)
		End if 
		Diary_InLLPB
		Macro_AccType("Load "+String:C10(Table:C252(->[DIARY:12])))
		In_ButtChkDis(->vButtDisDry)
		
		LB_SetupListbox(->ACC_lb_Analysis; "EML_t"; "EML_L"; 1; ->SD2_at_EmailType; ->SD2_at_EmailName; ->SD2_at_EmailAddresses)
		
		LB_SetColumnHeaders(->ACC_lb_Analysis; "EML_L"; 1; "Code"; "Name")
		
		LB_SetColumnWidths(->ACC_lb_Analysis; "EML_t"; 1; 22; 164; 220)
		LB_SetScroll(->ACC_lb_Analysis; -3; -2)
		LB_StyleSettings(->ACC_lb_Analysis; "Black"; 9; "EML_t"; ->[PREFERENCES:116])
		LB_SetEnterable(->ACC_lb_Analysis; False:C215; 0)
	: ($_l_Event=On Activate:K2:9)
		OpenHelp(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		
		DB_SetInputFormMenu(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		
		If (Records in selection:C76([DIARY:12])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
		In_ButtChkDis(->vButtDisDry)
		
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		
		If (Records in selection:C76([DIARY:12])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
		In_ButtChkDis(->vButtDisDry)
		
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall("Diary_InLLPA"; ""; "Minor_DelSinEx"; ->[DIARY:12]; ->[DIARY:12]Diary_Code:3; "Diary"; "3 9"; "Diary_InLLPB"; "DMaster"; "Diary_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDisDry)
	: ($_l_Event=On Outside Call:K2:11)
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
						SETEMAILFORMOBJECTS
						SET PROCESS VARIABLE:C370(EmailChoiceProc; DOC_l_CallEvent; DOC_l_CallEvent)
						POST OUTSIDE CALL:C329(EmailChoiceProc)
						
					End if 
					If ([DIARY:12]Contact_Code:2="")
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
					Else 
						WS_t_ContactID:=[CONTACTS:1]Contact_Code:2
					End if 
					If (WS_t_EmailAddress#"")
						If (WS_l_SelectedEmailName=0)
							GOTO OBJECT:C206([DIARY:12]Email_Subject:40)
							$_l_EmailAddressRow:=Find in array:C230(SD2_at_EmailAddresses; WS_t_EmailAddress)
							If ($_l_EmailAddressRow<0)
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
							SETEMAILFORMOBJECTS
						End if 
						
						
					End if 
				End if 
			: (DOC_l_CallEvent<0)
				DOC_l_ContactsProcess:=0
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
							$_l_EmailAddressRow:=Find in array:C230(SD2_at_EmailAddresses; WS_t_EmailAddress)
							If ($_l_EmailAddressRow<0)
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
								
								
								//SETEMAILFORMOBJECTS
								
							End if 
							
							
						End if 
					End if 
					NEXT RECORD:C51([CONTACTS:1])
					
				End for 
				
				SETEMAILFORMOBJECTS
				//`````
				
		End case 
		
	: ($_l_Event=On Data Change:K2:15)
		$_t_VarName:=""
		$_l_TableNumber:=0
		$_l_FieldNumber:=0
		$_ptr_CurrentObject:=Focus object:C278
		RESOLVE POINTER:C394($_ptr_CurrentObject; $_t_VarName; $_l_TableNumber; $_l_FieldNumber)
		If ($_t_VarName="WS_t_EmailName") | ($_t_VarName="WS_t_EmailAddress")
			
		Else 
			
		End if 
		$_bo_CompanyMod:=False:C215
		$_bo_ContactMod:=False:C215
		$_bo_CodeMod:=False:C215
		$_bo_PersonMod:=False:C215
		$_bo_DateMod:=False:C215
		Case of 
			: (Modified:C32([DIARY:12]Company_Code:1))
				$_bo_CompanyMod:=True:C214
			: (Modified:C32([DIARY:12]Contact_Code:2))
				$_bo_ContactMod:=True:C214
			: (Modified:C32([DIARY:12]Date_Do_From:4))
				$_bo_DateMod:=True:C214
			: (Modified:C32([DIARY:12]Person:8))
				$_bo_PersonMod:=True:C214
			: (Modified:C32([DIARY:12]Document_Code:15))
				$_bo_CodeMod:=True:C214
		End case 
		//```
		Diary_InD
		
		$_l_SizeofArray:=Size of array:C274(SD2_at_EmailType)
		
		Case of 
			: (Modified:C32([DIARY:12]Company_Code:1)) | ($_bo_CompanyMod)
				$_bo_CompanyMod:=False:C215
				MCont_Add("")
				Diary_InLLPHead
				If (WIN_t_CurrentInputForm="Diary_InEmail")
					If ([DIARY:12]Contact_Code:2="")
						If (WS_l_ContactElement>0)  //WS_l_ContactElement was set
							DELETE FROM ARRAY:C228(SD2_at_EmailType; WS_l_ContactElement; 1)
							DELETE FROM ARRAY:C228(SD2_at_EmailAddresses; WS_l_ContactElement; 1)
							DELETE FROM ARRAY:C228(SD2_at_EmailName; WS_l_ContactElement; 1)
							DELETE FROM ARRAY:C228(SD2_at_ContactIDs; WS_l_ContactElement; 1)
							EMAIL_t_EmailType:=SD2_at_EmailType{0}
							WS_t_EmailAddress:=SD2_at_EmailAddresses{0}
							WS_t_EmailName:=SD2_at_EmailName{0}
							WS_l_ContactElement:=0
							WS_l_SelectedEmailName:=0
							SETEMAILFORMOBJECTS
						End if 
					Else 
						//Diary Contact code changed?
						Case of 
							: (WS_l_ContactElement=0)
								INSERT IN ARRAY:C227(SD2_at_EmailType; 1; 1)
								INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 1; 1)
								INSERT IN ARRAY:C227(SD2_at_EmailName; 1; 1)
								INSERT IN ARRAY:C227(SD2_at_ContactIDs; 1; 1)
								SD2_at_EmailType{1}:="To"
								SD2_at_EmailAddresses{1}:=EMAIL_t_EmailTo
								SD2_at_ContactIDs{1}:=[DIARY:12]Contact_Code:2
								SD2_at_EmailName{1}:=vContName
								EMAIL_t_EmailType:=SD2_at_EmailType{1}
								WS_t_EmailAddress:=SD2_at_EmailAddresses{1}
								WS_t_EmailName:=SD2_at_EmailName{1}
								WS_l_ContactElement:=1
								WS_l_SelectedEmailName:=1
								SETEMAILFORMOBJECTS
							Else 
								If (Size of array:C274(SD2_at_EmailType)=0)
									INSERT IN ARRAY:C227(SD2_at_EmailType; 9999; 1)
									INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 9999; 1)
									INSERT IN ARRAY:C227(SD2_at_EmailName; 9999; 1)
									INSERT IN ARRAY:C227(SD2_at_ContactIDs; 9999; 1)
								End if 
								SD2_at_EmailType{WS_l_ContactElement}:="To"
								SD2_at_EmailAddresses{WS_l_ContactElement}:=EMAIL_t_EmailTo
								SD2_at_ContactIDs{WS_l_ContactElement}:=[DIARY:12]Contact_Code:2
								SD2_at_EmailName{WS_l_ContactElement}:=vContName
								EMAIL_t_EmailType:=SD2_at_EmailType{WS_l_ContactElement}
								WS_t_EmailAddress:=SD2_at_EmailAddresses{WS_l_ContactElement}
								WS_t_EmailName:=SD2_at_EmailName{WS_l_ContactElement}
								WS_l_SelectedEmailName:=0
								SETEMAILFORMOBJECTS
						End case 
					End if 
				Else 
					
					If (WIN_t_CurrentInputForm="Diary_InL13W")
						WR EXECUTE COMMAND:P12000:113(write; 803)
					End if 
					
				End if 
				
			: (Modified:C32([DIARY:12]Contact_Code:2)) | ($_bo_ContactMod)
				$_bo_ContactMod:=False:C215
				
				MCont_Add("")
				Diary_InLLPHead
				If (WIN_t_CurrentInputForm="Diary_InEmail")
					If ([DIARY:12]Contact_Code:2="")
						If (WS_l_ContactElement>0)  //WS_l_ContactElement was set
							DELETE FROM ARRAY:C228(SD2_at_EmailType; WS_l_ContactElement; 1)
							DELETE FROM ARRAY:C228(SD2_at_EmailAddresses; WS_l_ContactElement; 1)
							DELETE FROM ARRAY:C228(SD2_at_EmailName; WS_l_ContactElement; 1)
							DELETE FROM ARRAY:C228(SD2_at_ContactIDs; WS_l_ContactElement; 1)
							EMAIL_t_EmailType:=SD2_at_EmailType{0}
							WS_t_EmailAddress:=SD2_at_EmailAddresses{0}
							WS_t_EmailName:=SD2_at_EmailName{0}
							WS_l_ContactElement:=0
							WS_l_SelectedEmailName:=0
							SETEMAILFORMOBJECTS
						End if 
					Else 
						//Diary Contact code changed?
						Case of 
							: (WS_l_ContactElement=0)
								INSERT IN ARRAY:C227(SD2_at_EmailType; 1; 1)
								INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 1; 1)
								INSERT IN ARRAY:C227(SD2_at_EmailName; 1; 1)
								INSERT IN ARRAY:C227(SD2_at_ContactIDs; 1; 1)
								SD2_at_EmailType{1}:="To"
								SD2_at_EmailAddresses{1}:=EMAIL_t_EmailTo
								SD2_at_ContactIDs{1}:=[DIARY:12]Contact_Code:2
								SD2_at_EmailName{1}:=vContName
								EMAIL_t_EmailType:=SD2_at_EmailType{1}
								WS_t_EmailAddress:=SD2_at_EmailAddresses{1}
								WS_t_EmailName:=SD2_at_EmailName{1}
								WS_l_ContactElement:=1
								WS_l_SelectedEmailName:=0
								SETEMAILFORMOBJECTS
							Else 
								If (Size of array:C274(SD2_at_EmailType)=0)
									INSERT IN ARRAY:C227(SD2_at_EmailType; 9999; 1)
									INSERT IN ARRAY:C227(SD2_at_EmailAddresses; 9999; 1)
									INSERT IN ARRAY:C227(SD2_at_EmailName; 9999; 1)
									INSERT IN ARRAY:C227(SD2_at_ContactIDs; 9999; 1)
								End if 
								SD2_at_EmailType{WS_l_ContactElement}:="To"
								SD2_at_EmailAddresses{WS_l_ContactElement}:=EMAIL_t_EmailTo
								SD2_at_ContactIDs{WS_l_ContactElement}:=[DIARY:12]Contact_Code:2
								SD2_at_EmailName{WS_l_ContactElement}:=vContName
								EMAIL_t_EmailType:=SD2_at_EmailType{WS_l_ContactElement}
								WS_t_EmailAddress:=SD2_at_EmailAddresses{WS_l_ContactElement}
								WS_t_EmailName:=SD2_at_EmailName{WS_l_ContactElement}
								WS_l_SelectedEmailName:=0
								SETEMAILFORMOBJECTS
						End case 
					End if 
				Else 
					If (WIN_t_CurrentInputForm="Diary_InL13W")
						WR EXECUTE COMMAND:P12000:113(write; 803)
					End if 
				End if 
				
				
				
			: (Modified:C32([DIARY:12]Date_Do_From:4)) | ($_bo_DateMod)
				$_bo_DateMod:=False:C215
				vDate:=[DIARY:12]Date_Do_From:4
				Letter_Date
				Diary_InLLPHead
			: (Modified:C32([DIARY:12]Person:8)) | ($_bo_PersonMod)
				$_bo_PersonMod:=False:C215
				vFrom:=[PERSONNEL:11]Name:2
				If (WIN_t_CurrentInputForm="Diary_InL13W")
					WR EXECUTE COMMAND:P12000:113(write; 803)
				End if 
			: (Modified:C32([DIARY:12]Document_Code:15)) | ($_bo_CodeMod)
				$_bo_CodeMod:=False:C215
				If (False:C215)
					If (([DOCUMENTS:7]Document_Code:1#"") & (vCreate#2))
						Gen_Confirm("Create a duplicate copy of this Document, or View it?"+((Char:C90(13)+Char:C90(13)+"NB: It is a Standard Document, so should usually be copied.")*Num:C11([DOCUMENTS:7]Standard:9)); "Copy"; "View")
						If (OK=1)
							DUPLICATE RECORD:C225([DOCUMENTS:7])
							[DOCUMENTS:7]Document_Code:1:=[DOCUMENTS:7]Document_Code:1+DOC_t_DocumentCode
							RemoveLeadTr(Uppers2(Gen_Request("New Document Code:"; [DOCUMENTS:7]Document_Code:1)); ->[DOCUMENTS:7]Document_Code:1)
							[DOCUMENTS:7]Document_Code:1:=Substring:C12([DOCUMENTS:7]Document_Code:1; 1; 15)
							[DOCUMENTS:7]Standard:9:=False:C215
							[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
							[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
							[DOCUMENTS:7]Heading:2:=[DIARY:12]Document_Heading:32
							//WR O PICTURE TO AREA (Write;[DOCUMENTS]Write_)
							//Above command replace April 200 for 6.5
							WR SET DOC PROPERTY:P12000:109(write; wr view references:K12003:17; 0)
							WR SET DOC PROPERTY:P12000:109(write; wr view standard palette:K12003:12; 1)
							WR SET DOC PROPERTY:P12000:109(write; wr view format palette:K12003:13; 0)
							WR SET DOC PROPERTY:P12000:109(write; wr view style palette:K12003:14; 0)
							WR SET DOC PROPERTY:P12000:109(write; wr view borders palette:K12003:15; 0)
							WR PICTURE TO AREA:P12000:141(write; [DOCUMENTS:7]Write_:5)
						Else 
							vHeading:=[DOCUMENTS:7]Heading:2
							If (Documents_4DWriteAccessType(False:C215)="W@")
								WR SET DOC PROPERTY:P12000:109(write; wr view references:K12003:17; 0)
								WR SET DOC PROPERTY:P12000:109(write; wr view standard palette:K12003:12; 1)
								WR SET DOC PROPERTY:P12000:109(write; wr view format palette:K12003:13; 1)
								WR SET DOC PROPERTY:P12000:109(write; wr view style palette:K12003:14; 1)
								WR SET DOC PROPERTY:P12000:109(write; wr view borders palette:K12003:15; 1)
								WR PICTURE TO AREA:P12000:141(write; [DOCUMENTS:7]Write_:5)
								WR TEXT ACCESS:P12000:42(write; 1)
							Else 
								OBJECT SET ENTERABLE:C238([DOCUMENTS:7]Heading:2; False:C215)
								OBJECT SET ENTERABLE:C238([DOCUMENTS:7]Text:3; False:C215)
							End if 
						End if 
						cSave:=1
						vCreate:=1
					Else 
						vHeading:=[DOCUMENTS:7]Heading:2
						vCreate:=0
						If (Documents_4DWriteAccessType(False:C215)="W")
							WR SET DOC PROPERTY:P12000:109(write; wr view references:K12003:17; 1)
							WR SET DOC PROPERTY:P12000:109(write; wr view standard palette:K12003:12; 1)
							WR SET DOC PROPERTY:P12000:109(write; wr view format palette:K12003:13; 1)
							WR SET DOC PROPERTY:P12000:109(write; wr view style palette:K12003:14; 1)
							WR SET DOC PROPERTY:P12000:109(write; wr view borders palette:K12003:15; 1)
							WR PICTURE TO AREA:P12000:141(write; [DOCUMENTS:7]Write_:5)
							WR TEXT ACCESS:P12000:42(write; 1)
						Else 
							OBJECT SET ENTERABLE:C238([DOCUMENTS:7]Heading:2; False:C215)
							OBJECT SET ENTERABLE:C238([DOCUMENTS:7]Text:3; False:C215)
						End if 
					End if 
				End if 
				
				vEdit:=0
				
		End case 
		If ([DIARY:12]Contact_Code:2#"") & (([CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24)#"")
			EMAIL_t_EmailTo:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
		End if 
		vWT_EmailSenderName:=vPerson
		[DIARY:12]Email_Person:39:=vPerson
		
		Attach_Count:=Records in selection:C76([EMAIL_ATTACHMENTS:103])
		Reicipient_Count:=Records in selection:C76([EMAIL_RECIPIENTS:104])
		//: (Deactivated)
	: ($_l_Event=On Clicked:K2:4)
		If (PAL_BUTTON#"")
			$_t_PalletButtonName:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalletButtonName)
			PAL_bo_ButtonSubFunction:=False:C215
		End if 
End case 
ERR_MethodTrackerReturn("Diary_InLLP"; $_t_oldMethodName)
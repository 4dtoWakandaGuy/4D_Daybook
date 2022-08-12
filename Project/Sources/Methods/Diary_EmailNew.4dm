//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_EmailNew
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/03/2010 14:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>WP_at_DocumentDiaryActionCode;0)
	//ARRAY TEXT(<>WP_at_DocumentDiaryActionName;0)
	C_BOOLEAN:C305(<>Email_bo_Enabled; DB_bo_RecordModified; Mail_bo_inOK)
	C_LONGINT:C283($_l_ActionCodePosition; $_l_OK; cSave; rDiary; WS_l_SelDocTemplateClass; xNext)
	C_TEXT:C284(<>SYS_t_4DWriteType; $_t_AlertMessage; $_t_CloseSave; $_t_CurrentFormUsage; $_t_CurrentInputForm; $_t_DocumentCodeOld; $_t_EmailHeadingOld; $_t_EmailSubjectOld; $_t_EmailTextOld; $_t_oldMethodName; $_t_WriteAccessType)
	C_TEXT:C284(DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

//TRACE
$_t_oldMethodName:=ERR_MethodTracker("Diary_EmailNew")
//Diary_LetNew
//TRACE
If (<>Email_bo_Enabled)
	Menu_Record("Diary_LetNew"; "New Document")
	
	$_t_CurrentInputForm:=WIN_t_CurrentInputForm
	WIN_t_CurrentInputForm:="Diary_InEmail"
	WS_l_SelDocTemplateClass:=3
	READ WRITE:C146([DOCUMENTS:7])
	$_t_WriteAccessType:=Letters_FileI(False:C215)
	FORM SET INPUT:C55([DOCUMENTS:7]; "eMail_in")
	WIN_t_CurrentInputForm:="eMail_in"
	
	Start_ProcMail
	MCont_Add("")
	$_t_CloseSave:=DB_t_CallOnCloseorSave
	xNext:=0
	rDiary:=1
	$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
	$_t_DocumentCodeOld:=[DIARY:12]Document_Code:15
	//***************************** added -kmw 29/09/08 *****************************
	//Added these vars because selecting a template can change these values...
	//...but not send an actual email...user could then cancel out. This would mean...
	//...these values could get changed opn the diary when user probably wouldn't...
	//...expect them to have been (ie it's the same principle as the above var for...
	//...change in diary document code...except that it's easier as although in the event of a cancel we revert any...
	//...diary field back to original, unlike above var (used on cancel to check for change in doc code) we wouldn't also have to delete any records).
	$_t_EmailTextOld:=[DIARY:12]Email_Text:42
	$_t_EmailSubjectOld:=[DIARY:12]Email_Subject:40
	$_t_EmailHeadingOld:=[DIARY:12]Document_Heading:32  //Didn't see this getting set when user selects a template but logically it's a similar concept so doing this just in case (theoretically it would make sense to me if we tested for changes in ANY diary field that might get effected by email (for instance we could check things like diary action description as well)
	//********************************************************************************
	
	
	//  If ((◊Write="SW") | (◊Write="WS"))  ` SuperWrite or 4D "Silver"
	If (<>SYS_t_4DWriteType="WS")  // 4D "Silver" 24/04/02 pb
		$_l_ActionCodePosition:=Find in array:C230(<>WP_at_DocumentDiaryActionCode; [DIARY:12]Action_Code:9)
		If ($_l_ActionCodePosition>0)
			<>WP_at_DocumentDiaryActionCode:=$_l_ActionCodePosition
			<>WP_at_DocumentDiaryActionName:=$_l_ActionCodePosition
		End if 
		DB_t_CurrentFormUsage:="LetNew"
		Letters_SWNew2
		If (OK=1)
			[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
			[DIARY:12]Document_Heading:32:=[DOCUMENTS:7]Heading:2
			[DIARY:12]Export:24:=Export_Stamp2([DIARY:12]Export:24)
			DB_bo_RecordModified:=True:C214
		End if 
		DB_SetMenuBar(""; 17)  //needed to crrect menu 92 from Document
	Else 
		$_l_OK:=0
		If ([DIARY:12]Document_Code:15#"")
			RELATE ONE:C42([DIARY:12]Document_Code:15)
			If (Records in selection:C76([DOCUMENTS:7])=0)
				$_l_OK:=1
			Else 
				//but hang on -this might be not a template but the letter already
				//eg go NEW DOCUMENT then new document again-there can only be one document
				Case of 
					: ([DOCUMENTS:7]Document_Class:14=Text Email Template)  //this is a template
						$_l_OK:=1
					: ([DOCUMENTS:7]Document_Class:14=Text Email)  //this is an email
						If ([DOCUMENTS:7]Document_Status:15=-1)
							CONFIRM:C162("This Email cannot be modified, would you like to make a copy?"; "YES"; "NO")
							If (OK=1)
								$_l_OK:=1
							End if 
						Else 
							$_l_OK:=1
						End if 
						
					Else 
						$_l_OK:=0
						$_t_AlertMessage:=". To send a letter Via Email Select Print Letter"
						// ALERT("This document cannot be opened from here, it is not an email or email te
						Gen_Alert("This document cannot be opened from here, it is not an email or email template"+$_t_AlertMessage)
						
						
				End case 
				
			End if 
			
		Else 
			$_l_OK:=1
		End if 
		
		If ($_l_OK>0)
			//[DOCUMENTS]Person:=[DIARY]Person
			//DB_SaveRecord(->[DOCUMENTS])
			//modify this
			$_t_CurrentInputForm:=WIN_t_CurrentInputForm
			READ WRITE:C146([DOCUMENTS:7])
			FORM SET INPUT:C55([USER:15]; "SD2_EmailEntry")
			//INPUT FORM([USER];"Pseudo_diary_inEmail2")
			Open_Pro_Window("New Document"; 0; 2; ->[USER:15]; "SD2_EmailEntry")
			
			//NG May 2004 added form name to above(this is the correct form event if it looks wrong)
			cSave:=1
			WIN_t_CurrentInputForm:="Diary_InEmail"
			READ WRITE:C146([USER:15])
			//ALL RECORDS([USER])
			ADD RECORD:C56([USER:15]; *)
			If (OK=1) | (Mail_bo_inOK)
				[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
				[DIARY:12]Document_Heading:32:=[DOCUMENTS:7]Heading:2
				[DIARY:12]Export:24:=Export_Stamp2([DIARY:12]Export:24)
				DB_SaveRecord(->[DIARY:12])
				DB_bo_RecordModified:=True:C214
			Else 
				//************************** changed -kmw 23/09/08  ****************************
				//[DIARY]Document Code:=$_t_DocumentCodeOld
				//If ($_t_DocumentCodeOld#[DOCUMENTS]LDocument_Code)
				//DB_DeletionControl (->[DOCUMENTS])
				//DELETE RECORD([DOCUMENTS])
				//End if
				If ($_t_DocumentCodeOld#[DIARY:12]Document_Code:15)
					If ([DOCUMENTS:7]Document_Code:1#[DIARY:12]Document_Code:15)
						READ WRITE:C146([DOCUMENTS:7])
						QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[DIARY:12]Document_Code:15)
					Else 
						LOAD RECORD:C52([DOCUMENTS:7])
					End if 
					If (Records in selection:C76([DOCUMENTS:7])>0)
						If ([DOCUMENTS:7]Document_Class:14<0)  //added -kmw 26/09/08
							DB_DeletionControl(->[DOCUMENTS:7])
							DELETE RECORD:C58([DOCUMENTS:7])
						Else   //added -kmw 26/09/08
							//TRACE  //added -kmw 26/09/08
							//current document (and therefore diary document code) is a template so we shouldn't delete this document (but this shouldn't happen!!!)
						End if   //added -kmw 26/09/08
					End if 
					[DIARY:12]Document_Code:15:=$_t_DocumentCodeOld
				End if 
				//********************************************************************************
				
				//***************************** added -kmw 29/09/08 *****************************
				//Added these checks because selecting a template can change these values...
				//...but not send an actual email...user could then cancel out. This would mean...
				//...these values could get changed opn the diary when user probably wouldn't...
				//...expect them to have been (ie it's the same principle as the above check for...
				//...change in diary document code...except taht ity's easier as although we revert the...
				//...diary field back to oriingal, unlike above we don't also have to delete any records).
				If ($_t_EmailTextOld#[DIARY:12]Email_Text:42)
					[DIARY:12]Email_Text:42:=$_t_EmailTextOld
				End if 
				If ($_t_EmailSubjectOld#[DIARY:12]Email_Subject:40)
					[DIARY:12]Email_Subject:40:=$_t_EmailSubjectOld
				End if 
				If ($_t_EmailHeadingOld#[DIARY:12]Document_Heading:32)
					[DIARY:12]Document_Heading:32:=$_t_EmailHeadingOld  //Didn't see this getting set when user selects a template but logically it's a similar concept so doing this just in case (theoretically it would make sense to me if we tested for changes in ANY diary field that might get effected by email (for instance we could check things like diary action description as well)
				End if 
				//********************************************************************************
			End if 
			
			WIN_t_CurrentInputForm:=$_t_CurrentInputForm
			Close_ProWin(Table name:C256(->[USER:15])+"_"+"Pseudo_diary_inEmail2")
			If (<>SYS_t_4DWriteType="WS")  // 4DWrite "Silver"
				SET MENU BAR:C67(17)
			End if 
			
		End if 
	End if 
	
	DB_t_CallOnCloseorSave:=$_t_CloseSave
	UNLOAD RECORD:C212([DOCUMENTS:7])
	READ ONLY:C145([DOCUMENTS:7])
	rDiary:=0
	DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
	WIN_t_CurrentInputForm:=$_t_CurrentInputForm
	FORM SET INPUT:C55([DOCUMENTS:7]; WIN_t_CurrentInputForm)
Else 
	// ALERT("Email is not enabled")
	Gen_Alert("Email is not enabled.")
	
End if 
ERR_MethodTrackerReturn("Diary_EmailNew"; $_t_oldMethodName)
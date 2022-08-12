//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary LetSee
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/06/2010 18:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Update; $_bo_WPAccess; DB_bo_RecordModified; FromDiary; Mail_bo_inOK)
	C_LONGINT:C283($_l_OK; rDiary; WS_l_SelDocTemplateClass; xNext)
	C_TEXT:C284(<>SYS_t_4DWriteType; $_t_CloseSave; $_t_DocumentCodeOLD; $_t_DocumentHeadingOLD; $_t_EmailSubjectOLD; $_t_EmailTextOLD; $_t_oldMethodName; $_t_Reference; $_t_Write; DB_t_CallOnCloseorSave; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary LetSee")
//Diary LetSee

FromDiary:=True:C214
Menu_Record("Diary LetSee"; "View Document")
If ((DB_GetModuleSettingByNUM(Module_WPManager))>1)
	$_bo_WPAccess:=True:C214
Else 
	$_bo_WPAccess:=False:C215
End if 

Start_ProcMail
MCont_Add("")

If ([DIARY:12]Document_Code:15#"")  //added 26/9/8-kmw, v631b118
	RELATE ONE:C42([DIARY:12]Document_Code:15)
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[DIARY:12]Document_Code:15)
	If (Records in selection:C76([DOCUMENTS:7])>0)
		$_t_CloseSave:=DB_t_CallOnCloseorSave
		xNext:=0
		OK:=1
		rDiary:=1
		
		// If ([DOCUMENTS]Standard)
		// Gen_Confirm ("This is a Standard Document.  Are you sure you want to view and e
		//If (OK=1)
		//Diary_LetNew
		//OK:=0
		//Else
		OK:=1
		$_bo_Update:=False:C215
		//End if
		// End if
		If (OK=1)
			If ((DB_GetModuleSettingByNUM(Module_WPManager))=3)
				READ ONLY:C145([DOCUMENTS:7])
			Else 
				READ WRITE:C146([DOCUMENTS:7])
			End if 
			If (Records in selection:C76([DOCUMENTS:7])>0)
				//  WS_l_SelDocTemplateClass:=1
				//  Letters_FileI (False)
				//      If (◊Write="SW") out 24/04/02 pb
				//        vType:=[DOCUMENTS]SDocuments_Type
				//        xNext:=0
				//        CREATE SET([DOCUMENTS];"Master")
				//       Open_Pro_Window ([DOCUMENTS]LDocument_Code
				//      Else
				
				$_t_DocumentCodeOLD:=[DIARY:12]Document_Code:15  //added -kmw 29/09/08 (so we can correct do doucment code reversion functionality  in the event the user cancels (ala how we now handle this in Diary_EmailNew))
				$_t_EmailTextOLD:=[DIARY:12]Email_Text:42  //added -kmw 29/09/08 (so we can correct do doucment code reversion functionality  in the event the user cancels (ala how we now handle this in Diary_EmailNew))
				$_t_EmailSubjectOLD:=[DIARY:12]Email_Subject:40  //added -kmw 29/09/08 (so we can correct do doucment code reversion functionality  in the event the user cancels (ala how we now handle this in Diary_EmailNew))
				$_t_DocumentHeadingOLD:=[DIARY:12]Document_Heading:32  //added -kmw 29/09/08 (so we can correct do doucment code reversion functionality  in the event the user cancels (ala how we now handle this in Diary_EmailNew))
				
				
				Open_Pro_Window("Open_Document"; 0; 2; ->[DOCUMENTS:7]; WIN_t_CurrentInputForm)
				//NG May 2004 added input form
				$_t_Reference:=Table name:C256(->[DOCUMENTS:7])+"_"+WIN_t_CurrentInputForm
				//       End if
				Case of 
					: ([DOCUMENTS:7]Document_Class:14=4D Write Letter Template) & ($_bo_WPAccess)
						WS_l_SelDocTemplateClass:=1
						$_t_Write:=Letters_FileI(True:C214)
						$_t_Reference:=Table name:C256(->[DOCUMENTS:7])+"_"+WIN_t_CurrentInputForm
						If ($_t_Write#"")
							$_bo_Update:=True:C214
							$_l_OK:=1
							DUPLICATE RECORD:C225([DOCUMENTS:7])
							Set_DocumentCode(2; "L")
							[DOCUMENTS:7]Document_Class:14:=-(Abs:C99([DOCUMENTS:7]Document_Class:14))
							[DOCUMENTS:7]Standard:9:=False:C215
							[DOCUMENTS:7]Document_Status:15:=0
							DB_SaveRecord(->[DOCUMENTS:7])
							MODIFY RECORD:C57([DOCUMENTS:7]; *)
							If (OK=1)
								[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
							Else 
								[DIARY:12]Document_Code:15:=""
							End if 
						End if 
					: ([DOCUMENTS:7]Document_Class:14=4D Write Letter Template) & (Not:C34($_bo_WPAccess))
						Gen_Alert("You do not have access to the WP Module"; "Cancel")
						$_t_Reference:=""
					: ([DOCUMENTS:7]Document_Class:14=4D Write Letter) & ($_bo_WPAccess)
						WS_l_SelDocTemplateClass:=1
						$_t_Write:=Letters_FileI(True:C214)
						$_t_Reference:=Table name:C256(->[DOCUMENTS:7])+"_"+WIN_t_CurrentInputForm
						If ($_t_Write#"")
							$_bo_Update:=True:C214
							MODIFY RECORD:C57([DOCUMENTS:7]; *)
						End if 
					: ([DOCUMENTS:7]Document_Class:14=4D Write Letter) & (Not:C34($_bo_WPAccess))
						
						Gen_Alert("You do not have access to the WP Module"; "Cancel")
						$_t_Reference:=""
					: ([DOCUMENTS:7]Document_Class:14=Text Email) | ([DOCUMENTS:7]Document_Class:14=Text Email Template)
						WS_l_SelDocTemplateClass:=3
						$_t_Write:=Letters_FileI(False:C215)
						$_bo_Update:=True:C214
						
						WIN_t_CurrentInputForm:="Diary_InEmail"
						//modify this
						$_t_Reference:=Table name:C256(->[USER:15])+"_"+"Pseudo_diary_inEmail2"
						//INPUT FORM([USER];"Pseudo_diary_inEmail2")
						FORM SET INPUT:C55([USER:15]; "SD2_EmailEntry")
						READ WRITE:C146([USER:15])
						
						ADD RECORD:C56([USER:15]; *)  //we dont save this!
						If (Mail_bo_inOK)
							[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
							[DIARY:12]Document_Heading:32:=[DOCUMENTS:7]Heading:2
							[DIARY:12]Export:24:=Export_Stamp2([DIARY:12]Export:24)
							DB_bo_RecordModified:=True:C214
						End if 
					Else 
						Gen_Alert("This Document cannot be opened from here it is not a letter or eMail.")
				End case 
				
				
				//******************* moved kmw  29/09/08*********************
				//moved to after the check to see if user cancelled out of form....because Close_ProWin is setting Ok system variable to 1
				//If ($_t_Reference="")
				//Close_ProWin
				//Else
				//Close_ProWin ($_t_Reference)
				//End if
				//  `       If ((◊Write="WS") | (◊Write="SW"))  ` 4DWrite "Silver" or SuperWrite
				//If (◊Write="WS")  ` 4DWrite "Silver" 24/04/02 pb
				//
				//DB_SetMenuBar ("";17)
				//End if
				//***************************************************************
				If (OK=1) & ($_bo_Update)
					[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
					[DIARY:12]Document_Heading:32:=[DOCUMENTS:7]Heading:2
					[DIARY:12]Export:24:=Export_Stamp2([DIARY:12]Export:24)
					DB_bo_RecordModified:=True:C214  //added kmw  29/09/08
				Else 
					//************************ kmw 29/09/09 -Corrected document code reversion functionality to be like the new way we now do it in Diary_EmailNew ***************************
					//[DIARY]Document Code:=Old([DOCUMENTS]LDocument_Code)
					//[DIARY]Doc Heading:=Old([DOCUMENTS]Heading)
					If ($_t_DocumentCodeOLD#[DIARY:12]Document_Code:15)
						If ([DOCUMENTS:7]Document_Code:1#[DIARY:12]Document_Code:15)
							READ WRITE:C146([DOCUMENTS:7])
							QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[DIARY:12]Document_Code:15)
						Else 
							LOAD RECORD:C52([DOCUMENTS:7])
						End if 
						If (Records in selection:C76([DOCUMENTS:7])>0)
							If ([DOCUMENTS:7]Document_Class:14<0)
								DB_DeletionControl(->[DOCUMENTS:7])
								DELETE RECORD:C58([DOCUMENTS:7])
							Else   //Shouldn't happen!!
								//TRACE
							End if 
						End if 
						[DIARY:12]Document_Code:15:=$_t_DocumentCodeOLD
					End if 
					If ($_t_EmailTextOLD#[DIARY:12]Email_Text:42)
						[DIARY:12]Email_Text:42:=$_t_EmailTextOLD
					End if 
					If ($_t_EmailSubjectOLD#[DIARY:12]Email_Subject:40)
						[DIARY:12]Email_Subject:40:=$_t_EmailSubjectOLD
					End if 
					If ($_t_DocumentHeadingOLD#[DIARY:12]Document_Heading:32)
						[DIARY:12]Document_Heading:32:=$_t_DocumentHeadingOLD
					End if 
					//***************************************************************************************************************************
				End if 
				
				//******************* moved kmw  29/09/08*********************
				//moved to after the check to see if user cancelled out of form....because Close_ProWin is setting Ok system variable to 1
				If ($_t_Reference="")
					Close_ProWin
				Else 
					Close_ProWin($_t_Reference)
				End if 
				//       If ((◊Write="WS") | (◊Write="SW"))  ` 4DWrite "Silver" or SuperWrite
				If (<>SYS_t_4DWriteType="WS")  // 4DWrite "Silver" 24/04/02 pb
					
					DB_SetMenuBar(""; 17)
				End if 
				//***************************************************************
				
				UNLOAD RECORD:C212([DOCUMENTS:7])
				READ ONLY:C145([DOCUMENTS:7])
			End if 
		End if 
		DB_t_CallOnCloseorSave:=$_t_CloseSave
		DB_bo_RecordModified:=True:C214
		rDiary:=0
		
	Else   //NOTE 26/9/8-kmw v631b118, shouldn't happen because system shouldn't allow user to type in non existent document...but if problem eslewhere (for instance if document is deleted but field not blanked out) then this is a good message to display.
		//***************************** Altered 26/09/08 -kmw, v631b118 *****************************
		//Gen_Alert ("Please first enter a Document Code to View";"Try again")
		
		//Moved the above line and now use the following block of code instead...
		//(Shouldn't arrive in here if they havn't entered...
		//... a document code on the diary and it's more appropriate...
		//... anyway if the message is regarding inability to find the document...
		//...as that's exactly what it just tried to do).
		Gen_Alert("Sorry, document '"+[DIARY:12]Document_Code:15+"' does not seem to exist."; "Try again")
		//***********************************************************************************************
	End if 
Else   //added 26/9/8-kmw, v631b118 (SHOULDN"T ACTUALLY HAPPEN BUT BETTER SAFE THAN SORRY ESPECIALLY GIVEN THAT THE MESSAGE GIVEN BELOW IS THE ORINGAL ONE AND ITS CONTENT SUGGESTS THAT IT CAN IN FACT HAPPEN)
	Gen_Alert("Please first enter a Document Code to View"; "Try again")  //moved to here 26/09/08 -kmw, v631b118
End if   //added 26/9/8-kmw, v631b118

//Else
// Gen_Alert ("You do not have access to the WP Module";"Cancel")
//End if
FromDiary:=False:C215
ERR_MethodTrackerReturn("Diary LetSee"; $_t_oldMethodName)
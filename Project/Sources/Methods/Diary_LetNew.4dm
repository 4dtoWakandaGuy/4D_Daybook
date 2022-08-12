//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_LetNew
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 09:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(DOC_bo_FromDiary)
	//C_UNKNOWN(rDiary)
	//C_UNKNOWN(Write)
	//C_UNKNOWN(WriteOffscreen)
	//C_UNKNOWN(xNext)
	//ARRAY LONGINT(DOC_al_TemplatesInclude;0)
	//ARRAY TEXT(<>WP_at_DocumentDiaryActionCode;0)
	//ARRAY TEXT(<>WP_at_DocumentDiaryActionName;0)
	//ARRAY TEXT(WS_at_TemplateNames;0)
	//ARRAY TEXT(WS_at_TemplateRefs;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; DOC_bo_AutoPrint; DOC_bo_TemplateSelected; DOC_bo_FromDiary; DB_bo_4DwriteFullWindow; DB_bo_RecordModified; DOC_bo_AutoPrint; DOC_bo_TemplateSelected)
	C_LONGINT:C283($_l_Clash; $_l_IsUnique; $_l_OK; $_l_TemplateRow; $_l_TemplateSize; rDiary; Write; WriteOffscreen; WS_l_SelDocTemplateClass; xNext; $_l_ActionCodeRow)
	C_LONGINT:C283($_l_Clash; $_l_IsUnique; $_l_OK; $_l_TemplateRow; $_l_TemplateSize; WS_l_SelDocTemplateClass)
	C_TEXT:C284($_t_CloseSave; $_t_CurrentFormUsage; $_t_DocumentCode; $_t_DocumentCodeOLD; $_t_DocumentHeadingOLD; $_t_EmailSubjectOLD; $_t_EmailTextOLD; $_t_FormReference; $_t_oldMethodName; $_t_WriteAccessType; DB_t_CurrentFormUsage)
	C_TEXT:C284(DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DOC_t_DocumentCode; WIN_t_CurrentInputForm; <>SYS_t_4DWriteType; $_t_CloseSave; $_t_CurrentFormUsage; $_t_DocumentCode; $_t_DocumentCodeOLD; $_t_DocumentHeadingOLD; $_t_EmailSubjectOLD)
	C_TEXT:C284($_t_EmailTextOLD; $_t_FormReference; $_t_oldMethodName; $_t_WriteAccessType; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DOC_t_DocumentCode; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_LetNew")
//Diary_LetNew
DOC_bo_FromDiary:=True:C214
$_t_WriteAccessType:=""
If ([DIARY:12]Diary_Code:3="")  // 29/05/02 pb
	//  ALERT("Please select or create a Diary entry first.")
	Gen_Alert("Please select or create a Diary entry first.")
Else 
	Menu_Record("Diary_LetNew"; "New Document")
	If ((DB_GetModuleSettingByNUM(Module_WPManager)=2) | (DB_GetModuleSettingByNUM(Module_WPManager)=4))
		READ WRITE:C146([DOCUMENTS:7])
		WS_l_SelDocTemplateClass:=1
		$_t_WriteAccessType:=Letters_FileI(True:C214)
		If ($_t_WriteAccessType#"")
			Start_ProcMail
			MCont_Add("")
			$_t_CloseSave:=DB_t_CallOnCloseorSave
			xNext:=0
			rDiary:=1
			$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
			
			$_t_DocumentCodeOLD:=[DIARY:12]Document_Code:15
			$_t_EmailTextOLD:=[DIARY:12]Email_Text:42  //added -kmw 29/09/08 (so we can correct do doucment code reversion functionality  in the event the user cancels (ala how we now handle this in Diary_EmailNew))
			$_t_EmailSubjectOLD:=[DIARY:12]Email_Subject:40  //added -kmw 29/09/08 (so we can correct do doucment code reversion functionality  in the event the user cancels (ala how we now handle this in Diary_EmailNew))
			$_t_DocumentHeadingOLD:=[DIARY:12]Document_Heading:32  //added -kmw 29/09/08 (so we can correct do doucment code reversion functionality  in the event the user cancels (ala how we now handle this in Diary_EmailNew))
			
			If ([DIARY:12]Document_Code:15="")
				//here let the user select a document
				WriteOffscreen:=WR New offscreen area:P12000:47  //wr new offscreen area
				ARRAY TEXT:C222(WS_at_TemplateRefs; 0)
				ARRAY TEXT:C222(WS_at_TemplateNames; 0)
				ARRAY LONGINT:C221(DOC_al_TemplatesInclude; 0)
				LET_FindTemplates
				ARRAY LONGINT:C221(DOC_al_TemplatesInclude; Size of array:C274(WS_at_TemplateNames))
				If (Size of array:C274(WS_at_TemplateRefs)>0)
					DOC_bo_AutoPrint:=False:C215
					Let_selectTemplate("Letter"; "Print"; "Preview")
					WR ON ERROR:P12000:52("")
					If (DOC_bo_TemplateSelected)
						$_l_TemplateRow:=Find in array:C230(DOC_al_TemplatesInclude; 1)
						If ($_l_TemplateRow>0)
							QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=WS_at_TemplateRefs{$_l_TemplateRow})
							ARRAY TEXT:C222(WS_at_TemplateRefs; 0)
							ARRAY TEXT:C222(WS_at_TemplateNames; 0)
							ARRAY LONGINT:C221(DOC_al_TemplatesInclude; 0)
							$_l_TemplateSize:=Picture size:C356([DOCUMENTS:7]Write_:5)
							//WR Area to Pi
							WR PICTURE TO AREA:P12000:141(WriteOffscreen; [DOCUMENTS:7]Write_:5)
							//now create the new document
							READ WRITE:C146([DOCUMENTS:7])
							DUPLICATE RECORD:C225([DOCUMENTS:7])
							// [DOCUMENTS]Write_:=WR Area to picture (Write;1;1)
							DelayTicks(30)
							//DOC_t_DocumentCode:=Gen_CodePref (5;->[DOCUMENTS]LDocument_Code)
							Repeat 
								$_t_DocumentCode:=Gen_CodePref(5; ->[DOCUMENTS:7]Document_Code:1)
								SET QUERY DESTINATION:C396(3; $_l_IsUnique)
								QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_DocumentCode)
								If ($_l_IsUnique=0)
									DOC_t_DocumentCode:=$_t_DocumentCode
								End if 
								SET QUERY DESTINATION:C396(0)
							Until ($_l_IsUnique=0)
							
							
							If (DB_t_CurrentFormUsage="Q@")
								Set_DocumentCode(2; "Q"; DOC_t_DocumentCode)
							Else 
								Set_DocumentCode(2; "L"; DOC_t_DocumentCode)
							End if 
							[DOCUMENTS:7]Standard:9:=False:C215
							[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
							[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
							[DOCUMENTS:7]Heading:2:=[DIARY:12]Document_Heading:32
							[DOCUMENTS:7]Document_Class:14:=-([DOCUMENTS:7]Document_Class:14)
							[DOCUMENTS:7]Document_Status:15:=1
							
							// WR PICTURE TO AREA (WriteOffscreen;[DOCUMENTS]Write_)
							DOC_SetWriteModifiable(Write; 2; True:C214)
							DB_MenuAction("Functions"; "See Modulus Text"; 2; "")
							DB_MenuAction("Functions"; "See 4D Write Text"; 3; "")
							DB_MenuAction("Functions"; "Preview"; 3; "")
							
							[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
							DB_SaveRecord(->[DOCUMENTS:7])
						End if 
					End if 
				End if 
			End if 
			
			//  If ((◊Write="SW") | (◊Write="WS"))  ` SuperWrite or 4DWrite "Silver"
			If (<>SYS_t_4DWriteType="WS")  // 4DWrite "Silver" 24/04/02 pb
				$_l_ActionCodeRow:=Find in array:C230(<>WP_at_DocumentDiaryActionCode; [DIARY:12]Action_Code:9)
				If ($_l_ActionCodeRow>0)
					<>WP_at_DocumentDiaryActionCode:=$_l_ActionCodeRow
					<>WP_at_DocumentDiaryActionName:=$_l_ActionCodeRow
				End if 
				DB_t_CurrentFormUsage:="LetNew"
				Letters_SWNew2
				If (OK=1)
					[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
					[DIARY:12]Document_Heading:32:=[DOCUMENTS:7]Heading:2
					[DIARY:12]Export:24:=Export_Stamp2([DIARY:12]Export:24)
					DB_bo_RecordModified:=True:C214
				End if 
				DB_SetMenuBar(""; 17)
				//needed to crrect menu 92 from Document
			Else 
				$_l_OK:=0
				If ([DIARY:12]Document_Code:15#"")
					RELATE ONE:C42([DIARY:12]Document_Code:15)
					If (Records in selection:C76([DOCUMENTS:7])=0)
						$_l_OK:=1
						Let_No("L")
						
						Repeat 
							SET QUERY DESTINATION:C396(3; $_l_Clash)
							QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DOC_t_DocumentCode)
							SET QUERY DESTINATION:C396(0)
							If ($_l_Clash>0)
								Let_No("L")
							End if 
						Until ($_l_Clash=0)
						
						CREATE RECORD:C68([DOCUMENTS:7])
						[DOCUMENTS:7]Document_Code:1:="L"+DOC_t_DocumentCode
						[DOCUMENTS:7]Document_Class:14:=-3
						
					Else 
						//but hang on -this might be not a template but the letter already
						//eg go NEW DOCUMENT then new document again-there can only be one document
						Case of 
							: ([DOCUMENTS:7]Document_Class:14=3)  //this is a template
								$_l_OK:=1
								DUPLICATE RECORD:C225([DOCUMENTS:7])
								Set_DocumentCode(2; "L")
								[DOCUMENTS:7]Document_Class:14:=-(Abs:C99([DOCUMENTS:7]Document_Class:14))
								
								[DOCUMENTS:7]Standard:9:=False:C215
								[DOCUMENTS:7]Document_Status:15:=0
							: ([DOCUMENTS:7]Document_Class:14=-3)  //this is a letter
								If ([DOCUMENTS:7]Document_Status:15=-1)
									CONFIRM:C162("This Letter cannot be modified, would you like to make a copy?"; "YES"; "NO")
									If (OK=1)
										$_l_OK:=1
										DUPLICATE RECORD:C225([DOCUMENTS:7])
										Set_DocumentCode(3; "L")
										[DOCUMENTS:7]Document_Class:14:=-3
										[DOCUMENTS:7]Standard:9:=False:C215
										[DOCUMENTS:7]Document_Status:15:=0
									End if 
								Else 
									$_l_OK:=1
								End if 
								
							Else 
								$_l_OK:=0
								// ALERT("This document cannot be opened from here, it is not a letter or template
								Gen_Alert("This document cannot be opened from here, it is not a letter or template.")
						End case 
						
					End if 
					
				Else 
					Let_No("L")
					$_l_OK:=1
					SET QUERY DESTINATION:C396(3; $_l_Clash)
					Repeat 
						QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DOC_t_DocumentCode)
						If ($_l_Clash>0)
							Let_No("L")
						End if 
					Until ($_l_Clash=0)
					SET QUERY DESTINATION:C396(0)
					CREATE RECORD:C68([DOCUMENTS:7])
					[DOCUMENTS:7]Document_Code:1:="L"+DOC_t_DocumentCode
					[DOCUMENTS:7]Document_Class:14:=-3
				End if 
				If ($_l_OK>0)
					
					[DOCUMENTS:7]Person:10:=[DIARY:12]Person:8
					DB_SaveRecord(->[DOCUMENTS:7])
					DB_bo_4DwriteFullWindow:=True:C214
					Open_Pro_Window("New Document"; 0; 2; ->[DOCUMENTS:7]; WIN_t_CurrentInputForm)
					//NG may 2004 added input form
					//here just print!
					$_t_FormReference:=Table name:C256(->[DOCUMENTS:7])+"_"+WIN_t_CurrentInputForm
					If (DOC_bo_AutoPrint)
						WR PICTURE TO AREA:P12000:141(WriteOffscreen; [DOCUMENTS:7]Write_:5)
						PRINT SETTINGS:C106
						WR PRINT:P12000:4(WriteOffscreen; 0; 1)
						$_t_FormReference:=""
					Else 
						MODIFY RECORD:C57([DOCUMENTS:7]; *)
						WR ON COMMAND:P12000:116(0; "")
						DB_bo_4DwriteFullWindow:=False:C215
					End if 
					
					
					//**************** kmw 29/09/08 -moved entire cancel/accept checking functionality to directly after the documebnt modified and before window closed (so OK system variable doesn't get set to 1 after close of window which incorrectly makes it ALWAYS look lik euser has accepted the document)
					If (OK=1)
						[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
						[DIARY:12]Document_Heading:32:=[DOCUMENTS:7]Heading:2
						[DIARY:12]Export:24:=Export_Stamp2([DIARY:12]Export:24)
						DB_bo_RecordModified:=True:C214
					Else 
						//************************ kmw 29/09/08 -Corrected document code reversion functionality to be like the new way we now do it in Diary_EmailNew ***************************
						//[DIARY]Document Code:=$_t_DocumentCodeOLD
						//If ($_t_DocumentCodeOLD#[DOCUMENTS]LDocument_Code)
						//DB_DeletionControl (->[DOCUMENTS])
						
						//DELETE RECORD([DOCUMENTS])
						//End if
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
					//********************************************************************************************************************************************************************************************************************
					
					If ($_t_FormReference#"")  //ADDED MAY 2004
						Close_ProWin($_t_FormReference)
					Else 
						Close_ProWin
					End if 
					
				End if 
				
				If (<>SYS_t_4DWriteType="WS")  // 4dWrite "Silver"
					SET MENU BAR:C67(17)
				End if 
				
			End if 
			DB_t_CallOnCloseorSave:=$_t_CloseSave
			UNLOAD RECORD:C212([DOCUMENTS:7])
			READ ONLY:C145([DOCUMENTS:7])
			rDiary:=0
			DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
		End if 
		
	Else 
		Gen_Alert("You do not have access to the WP Module"; "Cancel")
	End if 
	DOC_bo_FromDiary:=False:C215
End if 
If ($_t_WriteAccessType#"")
	WR DELETE OFFSCREEN AREA:P12000:38(WriteOffscreen)
End if 
ERR_MethodTrackerReturn("Diary_LetNew"; $_t_oldMethodName)

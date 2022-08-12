//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      MAsk Print
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2009 12:26`Method: MAsk Print
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY LONGINT(WS_al_EmailID;0)
	//ARRAY TEXT(SD3_at_DocDiaryCode;0)
	//ARRAY TEXT(WS_at_Attachments;0)
	//ARRAY TEXT(WS_at_AttachmentsPath;0)
	C_BOOLEAN:C305($_bo_EmailOK; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>AutoProc; $_l_Email; $_l_OK; $_l_WindowReferenceRow; bd1; bd3; bd4; cLetters; cMerged; cOC; cPreview)
	C_LONGINT:C283(MMLetterClass; rDiary; vNo; vNo2; vP; vPages; vPS; WIN_l_CurrentWinRef)
	C_POINTER:C301($1; DOC_p_CurrentTablePointer)
	C_TEXT:C284($_t_oldMethodName; MMeMailCode; MMLetterCode; VLetterCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MAsk Print")
//MAsk Print
cPreview:=0
vP:=1
vPS:=1
vNo2:=vNo
bd3:=1
While (vPS=1)
	//Open window(50;50;50+486;50+276;1987)
	
	DOC_p_CurrentTablePointer:=$1
	Open_AnyTypeWindow(152; 560; 1988; "Print Requirements")
	ARRAY TEXT:C222(WS_at_Attachments; 0)
	ARRAY TEXT:C222(WS_at_AttachmentsPath; 0)
	ARRAY TEXT:C222(SD3_at_DocDiaryCode; 0)
	ARRAY LONGINT:C221(WS_al_EmailID; 0)
	
	UNLOAD RECORD:C212([DOCUMENTS:7])
	
	DIALOG:C40([DOCUMENTS:7]; "dAsk Print")
	CLOSE WINDOW:C154
	$_l_OK:=OK
	OK:=1
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	<>AutoProc:=0
	If ($_l_OK=0)
		vP:=0
		vPS:=0
	Else 
		If ((cLetters=1) | (cMerged=1) | (cPreview=1) | (cOC=1) | (bd1=1) | (bd4=1))
			If (VLetterCode#"")
				Case of 
					: (MMLetterClass=4D Write Letter Template) | (MMLetterClass=4D Write Letter) | (MMLetterClass=0)  //this is a letter
						QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=vLetterCode)
						If ((Records in selection:C76([DOCUMENTS:7])#1) & (vLetterCode#"") & (rDiary=0) & (vLetterCode#"AUTO"))
							Gen_Confirm("That Document Code does not exist"; "Try Again"; "Cancel")
							If (OK=0)
								vPS:=0
							End if 
						Else 
							If ((rDiary=1) & ((vLetterCode="") | (vLetterCode="AUTO")))
								vPS:=0
								vPages:=1
							Else 
								If (vLetterCode="")
									cLetters:=0
									cMerged:=0
									cPreview:=0
									cMerged:=0
									cOC:=0
									bd1:=0
									bd4:=0
									vPS:=0
									vPages:=1
								Else 
									//Letter_Load
									vPS:=0
								End if 
							End if 
						End if 
						//if we have selected email that will be handled later
					: (MMLetterClass=Text Email Template) | (MMLetterClass=Text Email)
						//this is sending an email
						//the DOCUMENT to attach is in MMLetterCOde
						//but first we must check we can attach the document
						$_bo_EmailOK:=True:C214
						If (MMLetterCode#"")
							//the is a document to attach to the email
							$_l_Email:=EmailCheckPDFWriter
							If ($_l_Email=0)
								
								//   ALERT("You have selected to attach a document to an eMail. This cannot be don
								Gen_Alert("You have selected to attach a document to an eMail. This cannot be done.")
								$_bo_EmailOK:=False:C215
							End if 
						Else 
							$_bo_EmailOK:=True:C214
						End if 
						
						
						//email attachments can be done
						QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=MMeMailCode)
						If ((Records in selection:C76([DOCUMENTS:7])#1) & (vLetterCode#"") & (rDiary=0) & (vLetterCode#"AUTO"))
							Gen_Confirm("That Document Code does not exist"; "Try Again"; "Cancel")
							If (OK=0)
								vPS:=0
							End if 
						Else 
							If ((rDiary=1) & ((vLetterCode="") | (vLetterCode="AUTO")))
								vPS:=0
								vPages:=1
							Else 
								If (vLetterCode="")
									cLetters:=0
									cMerged:=0
									cPreview:=0
									cMerged:=0
									cOC:=0
									bd1:=0
									vPS:=0
									vPages:=1
								Else 
									Letter_Load
									vPS:=0
								End if 
							End if 
						End if 
				End case 
			Else 
				Case of 
					: (MMLetterClass=0) | (MMLetterClass=4D Write Letter) | (MMLetterClass=4D Write Letter Template)  //this is a letter
						MMLetterCode:=Letters_In("1"; 1)
						If ((rDiary=1) & (MMLetterCode=""))
							vPS:=0
							vPages:=1
						Else 
							If (MMLetterCode="")
								cLetters:=0
								cMerged:=0
								cPreview:=0
								cMerged:=0
								cOC:=0
								bd1:=0
								bd4:=0
								vPS:=0
								vPages:=1
							Else 
								Letter_Load
								vPS:=0
							End if 
						End if 
						MMLetterClass:=4D Write Letter Template
						//MMLetterCode:=vLetterCode
					: (MMLetterClass=Text Email) | (MMLetterClass=Text Email Template)  //this is an email
						
						//  MMEmailCode:=Letters_In ("3";1)
						MMEmailCode:=""
						MMLetterClass:=Text Email
						If ((rDiary=1) & (MMEmailCode=""))
							vPS:=0
							vPages:=1
						Else 
							If (MMEmailCode="")
								cLetters:=0
								cMerged:=0
								cPreview:=0
								cMerged:=0
								cOC:=0
								bd1:=0
								bd4:=0
								vPS:=0
								vPages:=1
							Else 
								Letter_Load
								vPS:=0
							End if 
						End if 
				End case 
				
			End if 
			
		Else 
			vPS:=0
		End if 
	End if 
	
End while 
vNo:=vNo2
ERR_MethodTrackerReturn("MAsk Print"; $_t_oldMethodName)

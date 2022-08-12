//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_inLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>LetCode)
	//C_UNKNOWN(BDup)
	//C_UNKNOWN(CB_saveasTemplate)
	//C_UNKNOWN(DOC_bo_FromDiary)
	//C_UNKNOWN(vAdd)
	//C_UNKNOWN(vButtDisDOC)
	//C_UNKNOWN(vLetterCode)
	//C_UNKNOWN(Write_2)
	//ARRAY TEXT(DB_at_TemplateTypes;0)
	C_BOOLEAN:C305(DB_bo_4DwriteFullWindow; DOC_bo_CheckType; DOC_bo_DOCUserPassword; DOC_bo_PDFPreventCopy; DOC_bo_PDFPreventEdit; DOC_bo_PDFPreventPrinting; DOC_bo_PDFUserPassword; DOC_bo_FromDiary; PDF_bo_IsLicenced; PDF_bo_UserPassword; DB_bo_4DwriteFullWindow)
	C_BOOLEAN:C305(DOC_bo_CheckType; DOC_bo_DOCUserPassword; DOC_bo_PDFPreventCopy; DOC_bo_PDFPreventEdit; DOC_bo_PDFPreventPrinting; PDF_bo_IsLicenced; PDF_bo_UserPassword)
	C_LONGINT:C283($_l_UsageCount; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; BDup; CB_saveasTemplate; DOC_l_MakeHTML; vAdd; Write; WRITE_2)
	C_LONGINT:C283($_l_offset; $_l_UsageCount; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; DOC_l_MakeHTML)
	C_PICTURE:C286($_pic_Picture)
	C_TEXT:C284(<>LetCode; <>PER_t_CurrentUserInitials; <>SYS_t_4DWriteType; $_t_ApplicationPath; $_t_DocumentWriteType; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vButtDisDOC; vLetterCode)
	C_TEXT:C284(WIN_t_CurrentInputForm; <>PER_t_CurrentUserInitials; <>SYS_t_4DWriteType; $_t_ApplicationPath; $_t_DocumentWriteType; $_t_oldMethodName; DB_t_CurrentFormUsage2; WIN_t_CurrentInputForm; WriteDocument)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_inLPB")
DOC_bo_PDFPreventCopy:=False:C215
DOC_bo_PDFPreventEdit:=False:C215
DOC_bo_PDFPreventPrinting:=False:C215
PDF_bo_UserPassword:=False:C215
CB_saveasTemplate:=0
vLetterCode:=[DOCUMENTS:7]Document_Code:1
//this code sets the document class
$_t_DocumentWriteType:=""
GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom+1)
PDF_EncyptLoadPrefs
PDF_bo_IsLicenced:=PDF_EncryptVerfifyLicence
//make sure that  WIN_t_CurrentInputForm is always set
If ([DOCUMENTS:7]Document_Class:14=0) & (DOC_bo_CheckType)
	Case of 
		: (WIN_t_CurrentInputForm="Letters_in")
			$_t_DocumentWriteType:="Write"
			//TEXT TEMPLATE
			If (Record number:C243([DOCUMENTS:7])#-3)  //not a new record!
				CONFIRM:C162("Convert this document to a letter template?"; "No"; "Yes")
				If (OK=0)
					[DOCUMENTS:7]Document_Class:14:=Text Letter Template
				End if 
			Else 
				[DOCUMENTS:7]Document_Class:14:=Text Letter Template
			End if 
		: (WIN_t_CurrentInputForm="Letters_inW")
			$_t_DocumentWriteType:="Write"
			//4D WRITE TEMPLATE
			If (Record number:C243([DOCUMENTS:7])#-3)  //not a new record!
				CONFIRM:C162("Convert this document to a letter template?"; "No"; "Yes")
				If (OK=0)
					[DOCUMENTS:7]Document_Class:14:=4D Write Letter Template
				End if 
			Else 
				[DOCUMENTS:7]Document_Class:14:=4D Write Letter Template
			End if 
			If (PDF_bo_IsLicenced)
				If (BLOB size:C605([DOCUMENTS:7]PDF_Options:31)>0)
					$_l_offset:=0
					BLOB TO VARIABLE:C533([DOCUMENTS:7]PDF_Options:31; DOC_bo_PDFPreventCopy; $_l_offset)
					If (BLOB size:C605([DOCUMENTS:7]PDF_Options:31)>$_l_offset)
						BLOB TO VARIABLE:C533([DOCUMENTS:7]PDF_Options:31; DOC_bo_PDFPreventEdit; $_l_offset)
						If (BLOB size:C605([DOCUMENTS:7]PDF_Options:31)>$_l_offset)
							BLOB TO VARIABLE:C533([DOCUMENTS:7]PDF_Options:31; DOC_bo_PDFPreventPrinting; $_l_offset)
							If (BLOB size:C605([DOCUMENTS:7]PDF_Options:31)>$_l_offset)
								BLOB TO VARIABLE:C533([DOCUMENTS:7]PDF_Options:31; DOC_bo_DOCUserPassword; $_l_offset)
							End if 
						End if 
					End if 
				End if 
			Else 
				OBJECT SET VISIBLE:C603(*; "oPdfOptions@"; False:C215)
			End if 
			
		: (WIN_t_CurrentInputForm="Report_in")
			$_t_DocumentWriteType:="Report"
			//SUPERREPORT TEMPLATE
			If (Record number:C243([DOCUMENTS:7])#-3)  //not a new record!
				CONFIRM:C162("Convert this Superreport to a SuperReport template?"; "No"; "Yes")
				If (OK=0)
					[DOCUMENTS:7]Document_Class:14:=SuperReportReport Template
				End if 
			Else 
				[DOCUMENTS:7]Document_Class:14:=SuperReportReport Template
			End if 
			If (PDF_bo_IsLicenced)
				If (BLOB size:C605([DOCUMENTS:7]PDF_Options:31)>0)
					$_l_offset:=0
					BLOB TO VARIABLE:C533([DOCUMENTS:7]PDF_Options:31; DOC_bo_PDFPreventCopy; $_l_offset)
					If (BLOB size:C605([DOCUMENTS:7]PDF_Options:31)>$_l_offset)
						BLOB TO VARIABLE:C533([DOCUMENTS:7]PDF_Options:31; DOC_bo_PDFPreventEdit; $_l_offset)
						If (BLOB size:C605([DOCUMENTS:7]PDF_Options:31)>$_l_offset)
							BLOB TO VARIABLE:C533([DOCUMENTS:7]PDF_Options:31; DOC_bo_PDFPreventPrinting; $_l_offset)
							If (BLOB size:C605([DOCUMENTS:7]PDF_Options:31)>$_l_offset)
								BLOB TO VARIABLE:C533([DOCUMENTS:7]PDF_Options:31; DOC_bo_DOCUserPassword; $_l_offset)
							End if 
						End if 
					End if 
				End if 
			Else 
				//SET VISIBLE(*;"oPdfOptions@";False)
			End if 
		: (WIN_t_CurrentInputForm="Letters_inSW")
			$_t_DocumentWriteType:="Swrite"  //Dead
			//SUPERWRITE TEMPLATE  !
			If (Record number:C243([DOCUMENTS:7])#-3)  //not a new record!
				CONFIRM:C162("Convert this document to a letter template?"; "No"; "Yes")
				If (OK=0)
					[DOCUMENTS:7]Document_Class:14:=SuperWrite Letter Template
				End if 
			Else 
				[DOCUMENTS:7]Document_Class:14:=SuperWrite Letter Template
			End if 
		: (WIN_t_CurrentInputForm="eMail_in")
			$_t_DocumentWriteType:="Email"
			//eMail TEMPLATE  !
			If (Record number:C243([DOCUMENTS:7])#-3)  //not a new record!
				CONFIRM:C162("Convert this to an eMail template?"; "No"; "Yes")
				If (OK=0)
					[DOCUMENTS:7]Document_Class:14:=Text Email Template
				End if 
			Else 
				[DOCUMENTS:7]Document_Class:14:=Text Email Template
			End if 
			If ([DOCUMENTS:7]Document_Class:14=4D Write Email)
				$_t_DocumentWriteType:="Write"
				OBJECT SET VISIBLE:C603(*; "oEmailText"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oEmail4DWrite"; True:C214)
				OBJECT SET VISIBLE:C603(DOC_l_MakeHTML; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(DOC_l_MakeHTML; False:C215)
				
				OBJECT SET VISIBLE:C603(*; "oEmailText"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oEmail4DWrite"; False:C215)
			End if 
		Else 
	End case 
Else 
	If ([DOCUMENTS:7]Document_Class:14=4D Write Email)
		$_t_DocumentWriteType:="Write"
		OBJECT SET VISIBLE:C603(*; "oEmailText"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oEmail4DWrite"; True:C214)
		OBJECT SET VISIBLE:C603(DOC_l_MakeHTML; False:C215)
	Else 
		OBJECT SET VISIBLE:C603(DOC_l_MakeHTML; False:C215)
		
		OBJECT SET VISIBLE:C603(*; "oEmailText"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oEmail4DWrite"; False:C215)
	End if 
	
End if 
If ($_t_DocumentWriteType="Write") & (DB_UserHas4DWriteAccess)
	Write_2:=WR New offscreen area:P12000:47  //wr new offscreen area
	$_pic_Picture:=WR Area to picture:P12000:139(Write_2; 1; 1)
	WR PICTURE TO AREA:P12000:141(Write; $_pic_Picture)
	WR DELETE OFFSCREEN AREA:P12000:38(Write_2)
	
End if 

If ([DOCUMENTS:7]Document_Class:14<0)
	OBJECT SET VISIBLE:C603(CB_saveasTemplate; True:C214)
	OBJECT SET VISIBLE:C603(*; "oTemplateType@"; True:C214)
Else 
	OBJECT SET VISIBLE:C603(CB_saveasTemplate; False:C215)
	OBJECT SET VISIBLE:C603(*; "oTemplateType@"; True:C214)
	ARRAY TEXT:C222(DB_at_TemplateTypes; 2)
	DB_at_TemplateTypes{1}:="Merged Letter(not selectable as a template For mailings)"
	DB_at_TemplateTypes{2}:="Template Document(available as a template for mailings"
	If ([DOCUMENTS:7]X_Template_Type:30=0)
		DB_at_TemplateTypes:=2
	Else 
		DB_at_TemplateTypes:=1
	End if 
End if 


If ([DOCUMENTS:7]Document_Code:1#"")
	OBJECT SET ENTERABLE:C238([DOCUMENTS:7]Document_Code:1; False:C215)
Else 
	//new Document make code
	Set_DocumentCode(1)
	[DOCUMENTS:7]Standard:9:=True:C214
	vLetterCode:=[DOCUMENTS:7]Document_Code:1
End if 



If ((Documents_4DWriteAccessType(False:C215)="W") & (DB_t_CurrentFormUsage2#"SeeTxt"))
	//  WR DELETE OFFSCREEN AREA (write)
	If (Picture size:C356([DOCUMENTS:7]Write_:5)=0)
		WR PICTURE TO AREA:P12000:141(Write; $_pic_Picture)
		If (Is Windows:C1573)
			
			$_t_ApplicationPath:=PathFromPathName(Application file:C491)
			WriteDocument:=$_t_ApplicationPath+"LetTem.4WR"
			If (Test path name:C476(WriteDocument)=1)
				WR OPEN DOCUMENT:P12000:48(Write; WriteDocument)
				If (DOC_bo_FromDiary)
					DOC_SetWriteModifiable(Write; 2; True:C214)
				Else 
					DOC_SetWriteModifiable(Write; 1; True:C214)
				End if 
				
			Else 
				WR PICTURE TO AREA:P12000:141(Write; $_pic_Picture)
				If (DOC_bo_FromDiary)
					DOC_SetWriteModifiable(Write; 2; True:C214)
				Else 
					DOC_SetWriteModifiable(Write; 1; True:C214)
				End if 
			End if 
		Else 
			$_t_ApplicationPath:=PathFromPathName(Application file:C491)
			WriteDocument:=$_t_ApplicationPath+"Letter Template"
			If (Test path name:C476(WriteDocument)=1)
				WR OPEN DOCUMENT:P12000:48(Write; WriteDocument)
				If (DOC_bo_FromDiary)
					DOC_SetWriteModifiable(Write; 2; True:C214)
				Else 
					DOC_SetWriteModifiable(Write; 1; True:C214)
				End if 
			Else 
				WR PICTURE TO AREA:P12000:141(Write; $_pic_Picture)
				If (DOC_bo_FromDiary)
					DOC_SetWriteModifiable(Write; 2; True:C214)
				Else 
					DOC_SetWriteModifiable(Write; 1; True:C214)
				End if 
			End if 
		End if 
	Else 
		If (Record number:C243([DOCUMENTS:7])#-3)
			WR PICTURE TO AREA:P12000:141(Write; [DOCUMENTS:7]Write_:5)
		Else 
			WR PICTURE TO AREA:P12000:141(Write; $_pic_Picture)
		End if 
		
	End if 
	
	
	
	
	If (DOC_bo_FromDiary)
		DOC_SetWriteModifiable(Write; 2; True:C214)
	Else 
		DOC_SetWriteModifiable(Write; 1; True:C214)
	End if 
	DB_MenuAction("Functions"; "See Modulus Text"; 2; "")
	DB_MenuAction("Functions"; "See 4D Write Text"; 3; "")
	DB_MenuAction("Functions"; "Preview"; 3; "")
	
	OBJECT SET VISIBLE:C603(BDup; False:C215)
Else 
	If ($_t_DocumentWriteType="Write")
		If (Record number:C243([DOCUMENTS:7])#-3)
			WR PICTURE TO AREA:P12000:141(Write; [DOCUMENTS:7]Write_:5)
		Else 
			WR PICTURE TO AREA:P12000:141(Write; $_pic_Picture)
		End if 
		
		
		If (DOC_bo_FromDiary)
			DOC_SetWriteModifiable(Write; 2; False:C215)
		Else 
			DOC_SetWriteModifiable(Write; 1; False:C215)
		End if 
		
		
		DB_MenuAction("Functions"; "See Modulus Text"; 2; "")
		DB_MenuAction("Functions"; "See 4D Write Text"; 3; "")
		DB_MenuAction("Functions"; "Preview"; 3; "")
	End if 
	OBJECT SET VISIBLE:C603(BDup; True:C214)
	
End if 


//If ((◊Write="SW") | (◊Write="WS"))
If (<>SYS_t_4DWriteType="WS")  // 24/04/02 pb
Else 
	If (([DOCUMENTS:7]Document_Font:7#"") & ([DOCUMENTS:7]Document_Font_Size:8>0))
		SetFontsByPointerParameter([DOCUMENTS:7]Document_Font_Size:8; [DOCUMENTS:7]Document_Font:7; 0; ->[DOCUMENTS:7]Heading:2; ->[DOCUMENTS:7]Text:3)
		
		//Set_FontsFS ("[DOCUMENTS]Heading+[DOCUMENTS]Text";[DOCUMENTS]FDocument_Font;[DOCUMENTS]iDocument_Font_Size)
	End if 
	DB_MenuAction("Functions"; "See Modulus Text"; 3; "")
	DB_MenuAction("Functions"; "See 4D Write Text"; 2; "")
	DB_MenuAction("Functions"; "Preview"; 2; "")
	
	If (DB_t_CurrentFormUsage2#"SeeTxt")
		
		DB_MenuAction("Functions"; "Preview"; 2; "")
	End if 
End if 

<>LetCode:=[DOCUMENTS:7]Document_Code:1
If ((vAdd=1) & ([DOCUMENTS:7]Person:10=""))
	[DOCUMENTS:7]Person:10:=<>PER_t_CurrentUserInitials
End if 

Gen_AutoProc
vButtDisDOC:="I  PMO   SSSRCADT"
Input_Buttons(->[DOCUMENTS:7]; ->vButtDisDOC)
If (DB_bo_4DwriteFullWindow)
	WR ON COMMAND:P12000:116(Write; "DB_4DwriteMenu")
	WR EXECUTE COMMAND:P12000:113(Write; 20)
End if 
SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
If ([DOCUMENTS:7]Document_Class:14>0) & ([DOCUMENTS:7]Document_Code:1#"")
	//this is a template..if the template is used on a diary then the template cannot be changed.
	SET QUERY DESTINATION:C396(3; $_l_UsageCount)
	QUERY:C277([DIARY:12]; [DIARY:12]Document_Code:15=[DOCUMENTS:7]Document_Code:1)
	SET QUERY DESTINATION:C396(0)
	
	If ($_l_UsageCount>0)
		If (DOC_bo_FromDiary)
			DOC_SetWriteModifiable(Write; 2; False:C215)
		Else 
			DOC_SetWriteModifiable(Write; 1; False:C215)
		End if 
	End if 
	
End if 


Macro_AccType("Load "+String:C10(Table:C252(->[DOCUMENTS:7])))
ERR_MethodTrackerReturn("Letters_inLPB"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      TEMP_IMPCHANGEDMACROS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 10:34
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DocumentList; 0)
	ARRAY TEXT:C222($_at_MethodNames; 0)
	C_BLOB:C604($_blb_DocumentBLOB)
	C_BOOLEAN:C305($_bo_Export; NOPROC)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Index; $_l_isOK; $_l_Path2; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_CodeName; $_t_CurrentActiveDirectory2; $_t_Folder; $_t_FolderEXPORT; $_t_FolderTEST; $_t_oldMethodName; $_t_Packet; $_t_Path; $_t_Prefix; MacroText)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TEMP_IMPCHANGEDMACROS")
//This method will export the text of each
//macro
//to a document
NOPROC:=True:C214
Open window:C153(20; 40; 21; 41; 4)
ALL RECORDS:C47([COMPANIES:2])
ONE RECORD SELECT:C189([COMPANIES:2])
FORM SET INPUT:C55([COMPANIES:2]; "Text_Expand")

CONFIRM:C162("Import CHanges"; "NO"; "YES")

If (OK=0)
	
	
	$_t_Folder:=DB_SelectFolder("Select a folder for your NEW documents")
	$_t_Path:=""
	$_l_Path2:=0
	
	Repeat 
		If (Is macOS:C1572)
			$_t_FolderTEST:=$_t_Folder+"MACROS"+$_t_Path
			
			
		Else 
			$_t_FolderTEST:=$_t_Folder+"MACROS"+$_t_Path
			
		End if 
		$_l_Path2:=$_l_Path2+1
		$_l_isOK:=Test path name:C476($_t_FolderTEST)
		If ($_l_isOK<0)
			If (Is macOS:C1572)
				CREATE FOLDER:C475($_t_FolderTEST)
			Else 
				CREATE FOLDER:C475($_t_FolderTEST)
			End if 
		Else 
			$_t_Path:=String:C10($_l_Path2)
		End if 
	Until ($_l_isOK<0)
	$_l_isOK:=Test path name:C476($_t_FolderTEST)
	$_t_Folder:=$_t_FolderTEST
	$_t_CurrentActiveDirectory2:=Get 4D folder:C485
	$_ti_DocumentRef:=DB_CreateDocument($_t_CurrentActiveDirectory2+"PrefDocPath"; "TEXT")
	SEND PACKET:C103($_ti_DocumentRef; $_t_Folder)
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	$_t_FolderEXPORT:=$_t_Folder
	//ALL RECORDS([MACROS])
	//ORDER BY([MACROS];[MACROS]Macro Code)
	//C_TEXT($_t_Folder)
	//MAcro_exportConVersion ($_t_Folder)
	//CONFIRM("Export Completed";"Continue";"Stop")
	//End if
	//CLOSE WINDOW
	//If (OK=1)
	//If (Not(Compiled application))
	//  CONFIRM("Code Creation";"Continue";"Stop")
	Repeat 
		$_t_Prefix:=Request:C163("ENTER 2 DIGIT PREFIX"; "")
	Until ($_t_Prefix#"") & (Length:C16($_t_Prefix)=2)
	$_t_CurrentActiveDirectory2:=Get 4D folder:C485
	
	$_t_Folder:=DB_SelectFolder("Select a folder with macros")
	//  RECEIVE PACKET($_ti_DocumentRef;$_t_Packet;Char(13))
	// Close DocUMENT($_ti_DocumentRef)
	//Close DocUMENT($_ti_DocumentRef)
	$_t_Path:=$_t_Folder
	$_l_isOK:=Test path name:C476($_t_Path)
	If ($_l_isOK=0)
		READ WRITE:C146([SCRIPTS:80])
		ARRAY TEXT:C222($_at_DocumentList; 0)
		ARRAY TEXT:C222($_at_MethodNames; 0)
		DOCUMENT LIST:C474($_t_Path; $_at_DocumentList)
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(20; 60; 20; 60; 4)
		//$_ti_DocumentRef:=Open Document($_t_CurrentActiveDirectory2+"PrefDocPath";"TEXT")
		For ($_l_Index; 1; Size of array:C274($_at_DocumentList))
			
			If (Test path name:C476($_t_Path+$_at_DocumentList{$_l_Index})=1)
				
				
				MacroText:=""
				If (Is macOS:C1572)
					$_ti_DocumentRef:=DB_OpenDocument($_t_Path+$_at_DocumentList{$_l_Index}; "TEXT")
				Else 
					$_ti_DocumentRef:=DB_OpenDocument($_t_Path+"\\"+$_at_DocumentList{$_l_Index}; "TEXT")
				End if 
				RECEIVE PACKET:C104($_ti_DocumentRef; $_t_CodeName; Char:C90(13))
				
				$_t_CodeName:=Replace string:C233($_t_CodeName; "`Macro Code "; "")
				$_t_CodeName:=Replace string:C233($_t_CodeName; Char:C90(13); "")
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
				QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_CodeName)
				$_bo_Export:=False:C215
				
				If (Records in selection:C76([SCRIPTS:80])=0)
					CREATE RECORD:C68([SCRIPTS:80])
					[SCRIPTS:80]Script_Code:1:=$_t_CodeName
					$_bo_Export:=True:C214
				End if 
				
				
				If (Is macOS:C1572)
					$_ti_DocumentRef:=DB_OpenDocument($_t_Path+$_at_DocumentList{$_l_Index}; "TEXT")
				Else 
					$_ti_DocumentRef:=DB_OpenDocument($_t_Path+"\\"+$_at_DocumentList{$_l_Index}; "TEXT")
				End if 
				CLEAR PASTEBOARD:C402
				
				Repeat 
					RECEIVE PACKET:C104($_ti_DocumentRef; $_t_Packet; 32000)
					MacroText:=MacroText+$_t_Packet
					
					TEXT TO BLOB:C554(MacroText; $_blb_DocumentBLOB; 3)
					APPEND DATA TO PASTEBOARD:C403("TEXT"; $_blb_DocumentBLOB)
					
				Until (OK=0) | ($_t_Packet="")
				MacroText:=Replace string:C233(MacroText; $_t_CodeName; "")
				If ($_bo_Export=True:C214)
					[SCRIPTS:80]Recording_Text:4:=MacroText
					DB_SaveRecord(->[SCRIPTS:80])
					$_bo_Export:=True:C214
				Else 
					$_bo_Export:=False:C215
					If ([SCRIPTS:80]Recording_Text:4#MacroText)
						[SCRIPTS:80]Recording_Text:4:=MacroText
						$_bo_Export:=True:C214
						DB_SaveRecord(->[SCRIPTS:80])
					End if 
				End if 
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
				If ($_bo_Export)
					
					// MAcro_exportConVersion ($_t_Folderexport)
					
				End if 
			End if 
			
		End for 
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	End if 
End if 
//End if
NOPROC:=False:C215
ERR_MethodTrackerReturn("TEMP_IMPCHANGEDMACROS"; $_t_oldMethodName)

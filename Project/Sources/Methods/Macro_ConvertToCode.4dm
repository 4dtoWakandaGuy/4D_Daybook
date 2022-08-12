//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_ConvertToCode
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
	C_BOOLEAN:C305(NOPROC)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_isOK; $_l_methodNameRow; $_l_NumAdd; $_t_path2)
	C_TEXT:C284($_t_CodeName; $_t_CurrentActiveDirectory2; $_t_Folder; $_t_FolderTEST; $_t_Name; $_t_Name2; $_t_oldMethodName; $_t_Packet; $_t_Path; $_t_Prefix; $_t_Text)
	C_TEXT:C284(MACRO_HEADING; MacroText)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_ConvertToCode")
//This method will export the text of each
//macro
//to a document

NOPROC:=True:C214
Open window:C153(20; 40; 21; 41; 4)
ALL RECORDS:C47([COMPANIES:2])
ONE RECORD SELECT:C189([COMPANIES:2])
FORM SET INPUT:C55([COMPANIES:2]; "Text_Expand")

CONFIRM:C162("Export Macros"; "Done"; "YES")

If (OK=0)
	
	
	$_t_Folder:=DB_SelectFolder("Select a folder for your documents")
	$_t_Path:=""
	$_t_path2:=0
	
	Repeat 
		If (Is macOS:C1572)
			$_t_FolderTEST:=$_t_Folder+"MACROS"+$_t_Path
		Else 
			$_t_FolderTEST:=$_t_Folder+"MACROS"+$_t_Path
		End if 
		$_t_path2:=$_t_path2+1
		$_l_isOK:=Test path name:C476($_t_FolderTEST)
		If ($_l_isOK<0)
			CREATE FOLDER:C475($_t_FolderTEST)
			
		Else 
			$_t_Path:=String:C10($_t_path2)
		End if 
	Until ($_l_isOK<0)
	$_l_isOK:=Test path name:C476($_t_FolderTEST)
	$_t_Folder:=$_t_FolderTEST
	$_t_CurrentActiveDirectory2:=Get 4D folder:C485
	$_ti_DocumentRef:=DB_CreateDocument($_t_CurrentActiveDirectory2+"PrefDocPath"; "TEXT")
	SEND PACKET:C103($_ti_DocumentRef; $_t_Folder)
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	
	ALL RECORDS:C47([SCRIPTS:80])
	ORDER BY:C49([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1)
	MAcro_exportConVersion($_t_Folder)
	CONFIRM:C162("Export Completed"; "Continue"; "Stop")
End if 
CLOSE WINDOW:C154
If (OK=1)
	If (Not:C34(Is compiled mode:C492))
		CONFIRM:C162("Code Creation"; "Continue"; "Stop")
		Repeat 
			$_t_Prefix:=Request:C163("ENTER 2 DIGIT PREFIX"; "")
		Until ($_t_Prefix#"") & (Length:C16($_t_Prefix)=2)
		$_t_CurrentActiveDirectory2:=Get 4D folder:C485
		$_ti_DocumentRef:=DB_OpenDocument($_t_CurrentActiveDirectory2+"PrefDocPath"; "TEXT")
		RECEIVE PACKET:C104($_ti_DocumentRef; $_t_Packet; Char:C90(13))
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		
		$_t_Path:=$_t_Packet
		$_l_isOK:=Test path name:C476($_t_Path)
		If ($_l_isOK=0)
			ARRAY TEXT:C222($_at_DocumentList; 0)
			ARRAY TEXT:C222($_at_MethodNames; 0)
			DOCUMENT LIST:C474($_t_Path; $_at_DocumentList)
			Open window:C153(20; 60; 20; 60; 4)
			$_ti_DocumentRef:=DB_OpenDocument($_t_CurrentActiveDirectory2+"PrefDocPath"; "TEXT")
			For ($_l_Index; 1; Size of array:C274($_at_DocumentList))
				MacroText:=""
				
				$_ti_DocumentRef:=DB_OpenDocument($_t_Path+Folder separator:K24:12+$_at_DocumentList{$_l_Index}; "TEXT")
				
				RECEIVE PACKET:C104($_ti_DocumentRef; $_t_CodeName; Char:C90(13))
				$_t_CodeName:=Replace string:C233($_t_CodeName; "`Macro Code "; "")
				$_t_CodeName:=Replace string:C233($_t_CodeName; Char:C90(13); "")
				
				$_ti_DocumentRef:=DB_OpenDocument($_t_Path+Folder separator:K24:12+$_at_DocumentList{$_l_Index}; "TEXT")
				
				CLEAR PASTEBOARD:C402
				
				Repeat 
					RECEIVE PACKET:C104($_ti_DocumentRef; $_t_Packet; 32000)
					MacroText:=MacroText+$_t_Packet
					TEXT TO BLOB:C554(MacroText; $_blb_DocumentBLOB; 3)
					APPEND DATA TO PASTEBOARD:C403("TEXT"; $_blb_DocumentBLOB)
					
				Until (OK=0) | ($_t_Packet="")
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
				$_t_Name:=""
				For ($_l_Index2; 1; Length:C16($_at_DocumentList{$_l_Index}))
					If ($_at_DocumentList{$_l_Index}[[$_l_Index2]]=" ") & ($_t_Name#"")
						Case of 
							: ($_l_Index2<Length:C16($_at_DocumentList{$_l_Index}))
								$_t_Name:=$_t_Name+"_"
							: ($_at_DocumentList{$_l_Index}[[$_l_Index2-1]]#"_")
								$_t_Name:=$_t_Name+"_"
						End case 
					Else 
						Case of 
							: ((Character code:C91($_at_DocumentList{$_l_Index}[[$_l_Index2]]))>64) & ((Character code:C91($_at_DocumentList{$_l_Index}[[$_l_Index2]]))<99)
								$_t_Name:=$_t_Name+$_at_DocumentList{$_l_Index}[[$_l_Index2]]
							: ((Character code:C91($_at_DocumentList{$_l_Index}[[$_l_Index2]]))>96) & ((Character code:C91($_at_DocumentList{$_l_Index}[[$_l_Index2]]))<123)
								$_t_Name:=$_t_Name+$_at_DocumentList{$_l_Index}[[$_l_Index2]]
						End case 
					End if 
				End for 
				$_l_NumAdd:=1
				$_l_methodNameRow:=Find in array:C230($_at_MethodNames; $_t_Name)
				If ($_l_methodNameRow<0)
					INSERT IN ARRAY:C227($_at_MethodNames; 99999; 1)
					$_at_MethodNames{Size of array:C274($_at_MethodNames)}:=$_t_Name
				Else 
					Repeat 
						$_t_Name2:=$_t_Name+String:C10($_l_NumAdd)
						$_l_methodNameRow:=Find in array:C230($_at_MethodNames; $_t_Name)
						If ($_l_methodNameRow>0)
							$_l_NumAdd:=$_l_NumAdd+1
						Else 
							$_t_Name:=$_t_Name2
						End if 
					Until ($_l_methodNameRow<0)
					INSERT IN ARRAY:C227($_at_MethodNames; 99999; 1)
					$_at_MethodNames{Size of array:C274($_at_MethodNames)}:=$_t_Name
				End if 
				MACRO_HEADING:="CREATE "+$_t_Prefix+"_"+$_t_Name
				
				DIALOG:C40([MODULES:63]; "Conversion_Pallette")
				READ WRITE:C146([SCRIPTS:80])
				
				
				
				QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_CodeName)
				If (Records in selection:C76([SCRIPTS:80])=1)
					$_t_Text:=[SCRIPTS:80]Recording_Text:4
					[SCRIPTS:80]Recording_Text:4:="C_BOOLEAN(SCRPT_bo_Run4D)"+Char:C90(13)
					
					[SCRIPTS:80]Recording_Text:4:=[SCRIPTS:80]Recording_Text:4+"SCRPT_bo_Run4D:=TRUE"+Char:C90(13)
					[SCRIPTS:80]Recording_Text:4:=[SCRIPTS:80]Recording_Text:4+"If(SCRPT_bo_Run4D)"+Char:C90(13)
					[SCRIPTS:80]Recording_Text:4:=[SCRIPTS:80]Recording_Text:4+$_t_Prefix+"_"+$_t_Name+Char:C90(13)
					[SCRIPTS:80]Recording_Text:4:=[SCRIPTS:80]Recording_Text:4+"ELSE"+Char:C90(13)
					[SCRIPTS:80]Recording_Text:4:=[SCRIPTS:80]Recording_Text:4+$_t_Text+Char:C90(13)
					[SCRIPTS:80]Recording_Text:4:=[SCRIPTS:80]Recording_Text:4+"END IF"
					DB_SaveRecord(->[SCRIPTS:80])
					$_ti_DocumentRef:=DB_OpenDocument($_t_Path+":"+$_at_DocumentList{$_l_Index}; "TEXT")
					SET DOCUMENT POSITION:C482($_ti_DocumentRef; 0; 1)
					$_t_Text:=[SCRIPTS:80]Recording_Text:4
					$_t_Text:="C_BOOLEAN(SCRPT_bo_Run4D)"+Char:C90(13)
					
					$_t_Text:=$_t_Text+"SCRPT_bo_Run4D:=TRUE"+Char:C90(13)
					$_t_Text:=$_t_Text+"If(SCRPT_bo_Run4D)"+Char:C90(13)
					$_t_Text:=$_t_Text+$_t_Prefix+"_"+$_t_Name+Char:C90(13)
					$_t_Text:=$_t_Text+"ELSE"+Char:C90(13)
					SEND PACKET:C103($_ti_DocumentRef; $_t_Text)
					SEND PACKET:C103($_ti_DocumentRef; MacroText)
					SEND PACKET:C103($_ti_DocumentRef; "END IF")
					CLOSE DOCUMENT:C267($_ti_DocumentRef)
					
				Else 
					//macro does not exist so change the document
					$_ti_DocumentRef:=DB_OpenDocument($_t_Path+":"+$_at_DocumentList{$_l_Index}; "TEXT")
					SET DOCUMENT POSITION:C482($_ti_DocumentRef; 0; 1)
					$_t_Text:="COMPILER_MACROS"+Char:C90(13)
					$_t_Text:="C_BOOLEAN(SCRPT_bo_Run4D)"+Char:C90(13)
					
					$_t_Text:=$_t_Text+"SCRPT_bo_Run4D:=TRUE"+Char:C90(13)
					$_t_Text:=$_t_Text+"If(SCRPT_bo_Run4D)"+Char:C90(13)
					$_t_Text:=$_t_Text+$_t_Prefix+"_"+$_t_Name+Char:C90(13)
					$_t_Text:=$_t_Text+"ELSE"+Char:C90(13)
					
					SEND PACKET:C103($_ti_DocumentRef; $_t_Text)
					SEND PACKET:C103($_ti_DocumentRef; MacroText)
					SEND PACKET:C103($_ti_DocumentRef; "END IF")
					CLOSE DOCUMENT:C267($_ti_DocumentRef)
				End if 
				
			End for 
			CLOSE WINDOW:C154
		End if 
	End if 
End if 
NOPROC:=False:C215
ERR_MethodTrackerReturn("Macro_ConvertToCode"; $_t_oldMethodName)

//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Macro translate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/01/2010 13:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_NewCommands; 0)
	ARRAY TEXT:C222($_at_oldCommands; 0)
	C_BOOLEAN:C305($_bo_WordStarted)
	C_LONGINT:C283(<>SCPT_l_CheckVersion; $_l_CharacterPosition; $_l_CharacterPosition2; $_l_characterPosition3; $_l_OldCommandRow; $_l_Space)
	C_TEXT:C284($_t_After; $_t_AfterBEFORE; $_t_ApplicationVersion; $_t_Before; $_t_BeforeBefore; $_t_Line; $_t_oldMethodName; $_t_ReturnText; $_t_Text; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro translate")
//  `This method will ensure there are no V6/V6/V2004 commands in a macro
//-it is embedded in the macro trigger
//and is called when the record is loaded
ARRAY TEXT:C222($_at_NewCommands; 0)
ARRAY TEXT:C222($_at_oldCommands; 0)

If (True:C214)
	//trace
	$_t_Text:=$1
	//if you modify this method or any of the other translate method
	// change the value passed to Macro_CurrentversionCheck
	<>SCPT_l_CheckVersion:=Macro_CurrentVersionCheck(12)
	$_t_Text:=Macro_translateFieldNames($_t_Text)
	$_t_Text:=MACRO_Translate4DWrite($_t_Text)
	$_t_Text:=Macro_ConvertModulusCalls($_t_Text)
	ARRAY TEXT:C222($_at_oldCommands; 0)
	ARRAY TEXT:C222($_at_NewCommands; 0)
	$0:=""
	//?00:00:00?
	$_t_Text:=Replace string:C233($_t_Text; "≤≤"; "[[")
	$_t_Text:=Replace string:C233($_t_Text; "≥≥"; "]]")
	$_t_Text:=Replace string:C233($_t_Text; "†"; "?")
	$_t_Text:=Replace string:C233($_t_Text; "»"; "->")
	
	
	
	APPEND TO ARRAY:C911($_at_oldCommands; "CHECK ITEM")
	APPEND TO ARRAY:C911($_at_NewCommands; "SET_MENU ITEM MARK")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "Count files")
	APPEND TO ARRAY:C911($_at_NewCommands; "Count tables")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "Current default file")
	APPEND TO ARRAY:C911($_at_NewCommands; "Current default table")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "DEFAULT FILE")
	APPEND TO ARRAY:C911($_at_NewCommands; "DEFAULT TABLE")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "DISABLE ITEM")
	APPEND TO ARRAY:C911($_at_NewCommands; "DISABLE MENU ITEM")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "ENABLE ITEM")
	APPEND TO ARRAY:C911($_at_NewCommands; "ENABLE MENU ITEM")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "External window")
	APPEND TO ARRAY:C911($_at_NewCommands; "Open external window")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "FIELD ATTRIBUTES")
	APPEND TO ARRAY:C911($_at_NewCommands; "GET FIELD PROPERTIES")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "Fieldname")
	APPEND TO ARRAY:C911($_at_NewCommands; "Field name")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "File")
	APPEND TO ARRAY:C911($_at_NewCommands; "Table")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "Filename")
	APPEND TO ARRAY:C911($_at_NewCommands; "Table name")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "FORM FEED")
	APPEND TO ARRAY:C911($_at_NewCommands; "PAGE BREAK")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "GET PLATFORM INFO")
	APPEND TO ARRAY:C911($_at_NewCommands; "PLATFORM PROPERTIES")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "GRAPH FILE")
	APPEND TO ARRAY:C911($_at_NewCommands; "GRAPH TABLE")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "INPUT LAYOUT")
	APPEND TO ARRAY:C911($_at_NewCommands; "INPUT FORM")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "JOIN")
	APPEND TO ARRAY:C911($_at_NewCommands; "RELATE ONE SELECTION")
	
	
	APPEND TO ARRAY:C911($_at_oldCommands; "Last area")
	APPEND TO ARRAY:C911($_at_NewCommands; "Last object")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "Layout page")
	APPEND TO ARRAY:C911($_at_NewCommands; "Current form page")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "LOAD VARIABLE")
	APPEND TO ARRAY:C911($_at_NewCommands; "LOAD VARIABLES")
	
	
	APPEND TO ARRAY:C911($_at_oldCommands; "OUTPUT LAYOUT")
	APPEND TO ARRAY:C911($_at_NewCommands; "OUTPUT FORM")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "PRINT LAYOUT")
	APPEND TO ARRAY:C911($_at_NewCommands; "PRINT FORM")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "PROCESS ATTRIBUTES")
	APPEND TO ARRAY:C911($_at_NewCommands; "PROCESS PROPERTIES")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "PROJECT SELECTION")
	APPEND TO ARRAY:C911($_at_NewCommands; "RELATE MANY SELECTION")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "Records in file")
	APPEND TO ARRAY:C911($_at_NewCommands; "Records in table")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "SAVE VARIABLE")
	APPEND TO ARRAY:C911($_at_NewCommands; "SAVE VARIABLES")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "SEARCH")
	APPEND TO ARRAY:C911($_at_NewCommands; "QUERY")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "SEARCH BY FORMULA")
	APPEND TO ARRAY:C911($_at_NewCommands; "QUERY BY FORMULA")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "SEARCH BY LAYOUT")
	APPEND TO ARRAY:C911($_at_NewCommands; "QUERY BY EXAMPLE")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "SEARCH SELECTION")
	APPEND TO ARRAY:C911($_at_NewCommands; "QUERY SELECTION")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "SEARCH SELECTION BY FORMULA")
	APPEND TO ARRAY:C911($_at_NewCommands; "QUERY SELECTION BY FORMULA")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "SEARCH SUBRECORDS")
	APPEND TO ARRAY:C911($_at_NewCommands; "QUERY SUBRECORDS")
	
	
	APPEND TO ARRAY:C911($_at_oldCommands; "SET INTERFACE")
	APPEND TO ARRAY:C911($_at_NewCommands; "SET PLATFORM INTERFACE")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "SET ITEM")
	APPEND TO ARRAY:C911($_at_NewCommands; "SET_MENU ITEM")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "SORT BY FORMULA")
	APPEND TO ARRAY:C911($_at_NewCommands; "ORDER BY FORMULA")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "SORT SELECTION")
	APPEND TO ARRAY:C911($_at_NewCommands; "ORDER BY")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "SORT SUBSELECTION")
	APPEND TO ARRAY:C911($_at_NewCommands; "ORDER SUBRECORDS BY")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "Ascii")
	APPEND TO ARRAY:C911($_at_NewCommands; "Character Code")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "INSERT ELEMENT")
	APPEND TO ARRAY:C911($_at_NewCommands; "insert in array")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "DELETE ELEMENT")
	APPEND TO ARRAY:C911($_at_NewCommands; "DELETE FROM ARRAY")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "INSERT LIST ITEM")
	APPEND TO ARRAY:C911($_at_NewCommands; "INSERT IN LIST")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "DELETE LIST ITEM")
	APPEND TO ARRAY:C911($_at_NewCommands; "DELETE FROM LIST")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "GET PLugin LIST")
	APPEND TO ARRAY:C911($_at_NewCommands; "PLugin LIST")
	
	APPEND TO ARRAY:C911($_at_oldCommands; "SORT BY INDEX")
	APPEND TO ARRAY:C911($_at_NewCommands; "ORDER BY")
	
	$_t_ApplicationVersion:=Application version:C493
	If (Num:C11($_t_ApplicationVersion)>=1200)
		APPEND TO ARRAY:C911($_at_oldCommands; "DECODE")
		APPEND TO ARRAY:C911($_at_NewCommands; "BASE64 DECODE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "ENCODE")
		APPEND TO ARRAY:C911($_at_NewCommands; "BASE64 ENCODE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "GOTO AREA")
		APPEND TO ARRAY:C911($_at_NewCommands; "GOTO OBJECT")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "FIRST PAGE")
		APPEND TO ARRAY:C911($_at_NewCommands; "FORM FIRST PAGE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "Current form page")
		APPEND TO ARRAY:C911($_at_NewCommands; "FORM Get current page")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "GET FORM OBJECTS")
		APPEND TO ARRAY:C911($_at_NewCommands; "FORM GET OBJECTS")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "GET FORM PARAMETER")
		APPEND TO ARRAY:C911($_at_NewCommands; "FORM GET PARAMETER")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "GET FORM PROPERTIES")
		APPEND TO ARRAY:C911($_at_NewCommands; "FORM GET PROPERTIES")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "GOTO PAGE")
		APPEND TO ARRAY:C911($_at_NewCommands; "FORM GOTO PAGE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "LAST PAGE")
		APPEND TO ARRAY:C911($_at_NewCommands; "FORM LAST PAGE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "NEXT PAGE")
		APPEND TO ARRAY:C911($_at_NewCommands; "FORM NEXT PAGE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "PREVIOUS PAGE")
		APPEND TO ARRAY:C911($_at_NewCommands; "FORM PREVIOUS PAGE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SET FORM HORIZONTAL RESIZING")
		APPEND TO ARRAY:C911($_at_NewCommands; "FORM SET HORIZONTAL RESIZING")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "INPUT FORM")
		APPEND TO ARRAY:C911($_at_NewCommands; "FORM SET INPUT")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "OUTPUT FORM")
		APPEND TO ARRAY:C911($_at_NewCommands; "FORM SET OUTPUT")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SET FORM SIZE")
		APPEND TO ARRAY:C911($_at_NewCommands; "FORM SET SIZE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SET FORM VERTICAL RESIZING")
		APPEND TO ARRAY:C911($_at_NewCommands; "FORM SET VERTICAL RESIZING")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "DELETE LISTBOX COLUMN")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX DELETE COLUMN")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "DELETE LISTBOX ROW")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX DELETE ROW")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "GET LISTBOX ARRAYS")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX GET ARRAYS")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "GET LISTBOX CELL POSITION")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX GET CELL POSITION")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "Get listbox column width")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX Get column width")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "Get listbox information")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX Get information")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "Get number of listbox columns")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX Get number of columns")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "Get number of listbox rows")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX Get number of rows")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "Get listbox rows height")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX Get rows height")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "GET LISTBOX TABLE SOURCE")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX GET TABLE SOURCE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "INSERT LISTBOX COLUMN")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX INSERT COLUMN")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "INSERT LISTBOX COLUMN FORMULA")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX INSERT COLUMN FORMULA")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "INSERT LISTBOX ROW")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX INSERT ROW")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "MOVED LISTBOX COLUMN NUMBER")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX MOVED COLUMN NUMBER")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "MOVED LISTBOX ROW NUMBER")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX MOVED ROW NUMBER")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SELECT LISTBOX ROW")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX SELECT ROW")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SET LISTBOX COLUMN WIDTH")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX SET COLUMN WIDTH")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SET LISTBOX GRID COLOR")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX SET GRID COLOR")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SET LISTBOX ROWS HEIGHT")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX SET ROWS HEIGHT")
		
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SET LISTBOX TABLE SOURCE")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX SET TABLE SOURCE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SHOW LISTBOX GRID")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX SHOW GRID")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SORT LISTBOX COLUMNS")
		APPEND TO ARRAY:C911($_at_NewCommands; "LISTBOX SORT COLUMNS")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "Get alignment")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT Get alignment")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "BEST OBJECT SIZE")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT GET BEST SIZE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "GET OBJECT RECT")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT GET COORDINATES")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "Get format")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT Get format")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "MOVE OBJECT")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT MOVE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SET ALIGNMENT")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT SET ALIGNMENT")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SET CHOICE LIST")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT SET CHOICE LIST NAME")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SET COLOR")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT SET COLOR")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SET ENTERABLE")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT SET ENTERABLE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SET FILTER")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT SET FILTER")
		
		
		APPEND TO ARRAY:C911($_at_oldCommands; "FONT SIZE")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT SET FONT SIZE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "FONT STYLE")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT SET FONT STYLE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "FONT")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT SET FONT")
		
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SET FORMAT")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT SET FORMAT")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SET RGB COLORS")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT SET RGB COLORS")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SET SCROLLBAR VISIBLE")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT SET SCROLLBAR")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "BUTTON TEXT")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT SET TITLE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "SET VISIBLE")
		APPEND TO ARRAY:C911($_at_NewCommands; "OBJECT SET VISIBLE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "COMPRESS PICTURE")
		APPEND TO ARRAY:C911($_at_NewCommands; "QT COMPRESS PICTURE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "LOAD COMPRESS PICTURE FROM FILE")
		APPEND TO ARRAY:C911($_at_NewCommands; "QT LOAD COMPRESS PICTURE FROM FILE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "COMPRESS PICTURE FILE")
		APPEND TO ARRAY:C911($_at_NewCommands; "QT COMPRESS PICTURE FILE")
		
		APPEND TO ARRAY:C911($_at_oldCommands; "GOTO AREA")
		APPEND TO ARRAY:C911($_at_NewCommands; "GOTO OBJECT")
		
		
	End if 
	
	$0:=""
	
	
	$_l_CharacterPosition:=0
	Repeat 
		If ($_t_Text#"")
			$_l_CharacterPosition:=Position:C15(Char:C90(13); $_t_Text)
			
			If ($_l_CharacterPosition>0)
				$_t_Line:=Substring:C12($_t_Text; 1; $_l_CharacterPosition-1)
				$_t_Text:=Substring:C12($_t_Text; $_l_CharacterPosition+1; Length:C16($_t_Text))
			Else 
				$_t_Line:=$_t_Text
				$_t_Text:=""
			End if 
			
			//NOW FIND ANYCOMMAND IN $_t_Line
			$_l_CharacterPosition2:=Position:C15("("; $_t_Line)
			If ($_l_CharacterPosition2>0)
				$_t_AfterBEFORE:=""
				$_t_BeforeBefore:=""
				$_t_Before:=Substring:C12($_t_Line; 1; $_l_CharacterPosition2-1)
				$_bo_WordStarted:=False:C215
				
				For ($_l_Space; Length:C16($_t_Before); 1; -1)
					
					Case of 
						: ($_t_Before[[$_l_Space]]=" ") & (Not:C34($_bo_WordStarted))
							$_t_AfterBEFORE:=$_t_Before[[$_l_Space]]+$_t_AfterBEFORE
						: ($_t_Before[[$_l_Space]]#" ") & (Not:C34($_bo_WordStarted))
							If ($_t_AfterBEFORE#"")
								$_t_Before:=Substring:C12($_t_Before; 1; $_l_Space)
							End if 
							
							$_bo_WordStarted:=True:C214
						: ($_t_Before[[$_l_Space]]=" ") & ($_bo_WordStarted)
							If ($_l_Space>1)
								If ($_t_Before[[$_l_Space-1]]=" ")  //this could be a 2 word command
									$_l_characterPosition3:=$_l_Space
									$_t_BeforeBefore:=Substring:C12($_t_Before; 1; $_l_Space)
									$_t_Before:=Substring:C12($_t_Before; $_l_Space+1; Length:C16($_t_Before))
									$_l_Space:=0
								End if 
								
							Else 
								
								$_l_characterPosition3:=$_l_Space
								$_t_BeforeBefore:=Substring:C12($_t_Before; 1; $_l_Space)
								$_t_Before:=Substring:C12($_t_Before; $_l_Space+1; Length:C16($_t_Before))
								$_l_Space:=0
							End if 
							
					End case 
					
				End for 
				
				$_t_Line:=Substring:C12($_t_Line; $_l_CharacterPosition2; Length:C16($_t_Line))
				$_l_OldCommandRow:=Find in array:C230($_at_oldCommands; $_t_Before)
				If ($_l_OldCommandRow>0)
					$_t_Before:=$_at_NewCommands{$_l_OldCommandRow}
				End if 
				$_t_Line:=$_t_BeforeBefore+$_t_Before+$_t_AfterBEFORE+$_t_Line
			End if 
			$_l_CharacterPosition2:=Position:C15("="; $_t_Line)
			$_t_Before:=""
			If ($_l_CharacterPosition2>0)
				$_t_Before:=Substring:C12($_t_Line; 1; $_l_CharacterPosition2)
				$_t_Line:=Substring:C12($_t_Line; $_l_CharacterPosition2+1; Length:C16($_t_Line))
			End if 
			
			
			$_l_CharacterPosition2:=Position:C15("("; $_t_Line)
			$_t_After:=""
			If ($_l_CharacterPosition2>0)
				$_t_After:=Substring:C12($_t_Line; $_l_CharacterPosition2; Length:C16($_t_Line))
				$_t_Line:=Substring:C12($_t_Line; 1; $_l_CharacterPosition2-1)
			End if 
			$_l_OldCommandRow:=Find in array:C230($_at_oldCommands; $_t_Line)
			If ($_l_OldCommandRow>0)
				$_t_Line:=$_at_NewCommands{$_l_OldCommandRow}
			End if 
			$_t_Line:=$_t_Before+$_t_Line+$_t_After
			$_t_ReturnText:=$_t_ReturnText+$_t_Line+Char:C90(13)
			
		End if 
	Until ($_l_CharacterPosition=0) | ($_t_Text="")
	
	$0:=$_t_ReturnText
	
	//TRACE
End if 
ERR_MethodTrackerReturn("Macro translate"; $_t_oldMethodName)

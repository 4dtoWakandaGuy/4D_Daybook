//%attributes = {}
If (False:C215)
	//Project Method Name:      MACRO_Translate4DWrite
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_NewCommands; 0)
	ARRAY TEXT:C222($_at_OldCommands; 0)
	C_BOOLEAN:C305($_bo_Exit; $_bo_WordsStarted)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CharacterPosition2; $_l_CharacterPosition3; $_l_CommandPosition; $_l_Space)
	C_TEXT:C284($_t_After; $_t_AfterBefore; $_t_Before; $_t_BeforeBefore; $_t_IncomingText; $_t_Line; $_t_oldMethodName; $_t_ReturnText; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MACRO_Translate4DWrite")
//  `This method will ensure there are no V3 commands in a macro
//-it is embedded in the macro trigger
//and is called when the record is loaded
If (True:C214)
	ARRAY TEXT:C222($_at_OldCommands; 49)
	ARRAY TEXT:C222($_at_NewCommands; 49)
	$_at_NewCommands{1}:=("WR O Area to picture")
	$_at_NewCommands{2}:=("WR O AUTO SAVE")
	$_at_NewCommands{3}:=("WR O CHANGE STYLE")
	$_at_NewCommands{4}:=("WR O COMPUTE NOW")
	$_at_NewCommands{5}:=("WR O Count Stylesheet")
	$_at_NewCommands{6}:=("WR O CREATE STYLESHEET")
	$_at_NewCommands{7}:=("WR O DELETE STYLESHEET")
	$_at_NewCommands{8}:=("WR O DISPLAY MENUBAR")
	$_at_NewCommands{9}:=("WR O DISPLAY RULER")
	$_at_NewCommands{10}:=("WR O DISPLAY SCROLLBARS")
	$_at_NewCommands{11}:=("WR O DO COMMAND")
	$_at_NewCommands{12}:=("WR O EXPERT COMMAND")
	$_at_NewCommands{13}:=("WR O Find")
	$_at_NewCommands{14}:=("WR O Font name")
	$_at_NewCommands{15}:=("WR O Font number")
	$_at_NewCommands{16}:=("WR O GET ATTRIBUTES")
	$_at_NewCommands{17}:=("WR O GET MARGINS")
	$_at_NewCommands{18}:=("WR O Get pack options")
	$_at_NewCommands{19}:=("WR O Get page")
	$_at_NewCommands{20}:=("WR O Get_Picture")
	$_at_NewCommands{21}:=("WR O GET PREFERENCES")
	$_at_NewCommands{22}:=("WR O GET RULER")
	$_at_NewCommands{23}:=("WR O Get ScrollBars")
	$_at_NewCommands{24}:=("WR O GET STYLESHEET")
	$_at_NewCommands{25}:=("WR O GET TABS")
	$_at_NewCommands{26}:=("WR O INSERT HYPHEN")
	$_at_NewCommands{27}:=("WR O INSERT PICTURE")
	$_at_NewCommands{28}:=("WR O Is Hyphen")
	$_at_NewCommands{29}:=("WR O LINE SPACING")
	$_at_NewCommands{30}:=("WR O MENU STATUS")
	$_at_NewCommands{31}:=("WR O ModuleInfo")
	$_at_NewCommands{32}:=("WR O MOVE PICTURE")
	$_at_NewCommands{33}:=("WR O ON MENU")
	$_at_NewCommands{34}:=("WR O OPTIONS")
	$_at_NewCommands{35}:=("WR O Page number")
	$_at_NewCommands{36}:=("WR O PICTURE TO AREA")
	$_at_NewCommands{37}:=("WR O Picture to offscreen are")
	$_at_NewCommands{38}:=("WR O REMOVE HYPHEN")
	$_at_NewCommands{39}:=("WR O Replace")
	$_at_NewCommands{40}:=("WR O RESIZE PICTURE")
	$_at_NewCommands{41}:=("WR O Save to picture")
	$_at_NewCommands{42}:=("WR O SET ATTRIBUTES")
	$_at_NewCommands{43}:=("WR O SET MARGINS")
	$_at_NewCommands{44}:=("WR O SET PACK OPTIONS")
	$_at_NewCommands{45}:=("WR O SET PREFERENCES")
	$_at_NewCommands{46}:=("WR O SET TABS")
	$_at_NewCommands{47}:=("WR O STATISTICS")
	$_at_NewCommands{48}:=("WR O STRUCTURE ACCESS")
	$_at_NewCommands{49}:=("WR O TEXT ALIGNMENT")
	$_at_OldCommands{1}:=("WR Area to picture")
	$_at_OldCommands{2}:=("WR AUTO SAVE")
	$_at_OldCommands{3}:=("WR CHANGE STYLE")
	$_at_OldCommands{4}:=("WR COMPUTE NOW")
	$_at_OldCommands{5}:=("WR Count Stylesheet")
	$_at_OldCommands{6}:=("WR CREATE STYLESHEET")
	$_at_OldCommands{7}:=("WR DELETE STYLESHEET")
	$_at_OldCommands{8}:=("WR DISPLAY MENUBAR")
	$_at_OldCommands{9}:=("WR DISPLAY RULER")
	$_at_OldCommands{10}:=("WR DISPLAY SCROLLBARS")
	$_at_OldCommands{11}:=("WR DO COMMAND")
	$_at_OldCommands{12}:=("WR EXPERT COMMAND")
	$_at_OldCommands{13}:=("WR Find")
	$_at_OldCommands{14}:=("WR Font name")
	$_at_OldCommands{15}:=("WR Font number")
	$_at_OldCommands{16}:=("WR GET ATTRIBUTES")
	$_at_OldCommands{17}:=("WR GET MARGINS")
	$_at_OldCommands{18}:=("WR Get pack options")
	$_at_OldCommands{19}:=("WR Get page")
	$_at_OldCommands{20}:=("WR Get_Picture")
	$_at_OldCommands{21}:=("WR GET PREFERENCES")
	$_at_OldCommands{22}:=("WR GET RULER")
	$_at_OldCommands{23}:=("WR Get ScrollBars")
	$_at_OldCommands{24}:=("WR GET STYLESHEET")
	$_at_OldCommands{25}:=("WR GET TABS")
	$_at_OldCommands{26}:=("WR INSERT HYPHEN")
	$_at_OldCommands{27}:=("WR INSERT PICTURE")
	$_at_OldCommands{28}:=("WR Is Hyphen")
	$_at_OldCommands{29}:=("WR LINE SPACING")
	$_at_OldCommands{30}:=("WR MENU STATUS")
	$_at_OldCommands{31}:=("WR ModuleInfo")
	$_at_OldCommands{32}:=("WR MOVE PICTURE")
	$_at_OldCommands{33}:=("WR ON MENU")
	$_at_OldCommands{34}:=("WR OPTIONS")
	$_at_OldCommands{35}:=("WR Page number")
	$_at_OldCommands{36}:=("WR PICTURE TO AREA")
	$_at_OldCommands{37}:=("WR Picture to offscreen area")
	$_at_OldCommands{38}:=("WR REMOVE HYPHEN")
	$_at_OldCommands{39}:=("WR Replace")
	$_at_OldCommands{40}:=("WR RESIZE PICTURE")
	$_at_OldCommands{41}:=("WR Save to picture")
	$_at_OldCommands{42}:=("WR SET ATTRIBUTES")
	$_at_OldCommands{43}:=("WR SET MARGINS")
	$_at_OldCommands{44}:=("WR SET PACK OPTIONS")
	$_at_OldCommands{45}:=("WR SET PREFERENCES")
	$_at_OldCommands{46}:=("WR SET TABS")
	$_at_OldCommands{47}:=("WR STATISTICS")
	$_at_OldCommands{48}:=("WR STRUCTURE ACCESS")
	$_at_OldCommands{49}:=("WR TEXT ALIGNMENT")
	$0:=""
	$_t_IncomingText:=$1
	$_l_CharacterPosition:=0
	Repeat 
		If ($_t_IncomingText#"")
			$_l_CharacterPosition:=Position:C15(Char:C90(13); $_t_IncomingText)
			
			If ($_l_CharacterPosition>0)
				$_t_Line:=Substring:C12($_t_IncomingText; 1; $_l_CharacterPosition-1)
				$_t_IncomingText:=Substring:C12($_t_IncomingText; $_l_CharacterPosition+1; Length:C16($_t_IncomingText))
			Else 
				$_t_Line:=$_t_IncomingText
				$_t_IncomingText:=""
			End if 
			
			//NOW FIND ANYCOMMAND IN $_t_Line
			$_l_CharacterPosition2:=Position:C15("("; $_t_Line)
			If ($_l_CharacterPosition2>0)
				$_t_AfterBefore:=""
				$_t_BeforeBefore:=""
				$_t_Before:=Substring:C12($_t_Line; 1; $_l_CharacterPosition2-1)
				$_bo_WordsStarted:=False:C215
				
				For ($_l_Space; Length:C16($_t_Before); 1; -1)
					
					Case of 
						: ($_t_Before[[$_l_Space]]=" ") & (Not:C34($_bo_WordsStarted))
							$_t_AfterBefore:=$_t_Before[[$_l_Space]]+$_t_AfterBefore
						: ($_t_Before[[$_l_Space]]#" ") & (Not:C34($_bo_WordsStarted))
							If ($_t_AfterBefore#"")
								$_t_Before:=Substring:C12($_t_Before; 1; $_l_Space)
							End if 
							
							$_bo_WordsStarted:=True:C214
						: ($_t_Before[[$_l_Space]]=" ") & ($_bo_WordsStarted)
							If ($_l_Space>1)
								If ($_t_Before[[$_l_Space-1]]=" ")  //this could be a 2 word command
									$_l_CharacterPosition3:=$_l_Space
									$_t_BeforeBefore:=Substring:C12($_t_Before; 1; $_l_Space)
									$_t_Before:=Substring:C12($_t_Before; $_l_Space+1; Length:C16($_t_Before))
									$_l_Space:=0
								End if 
								
							Else 
								
								$_l_CharacterPosition3:=$_l_Space
								$_t_BeforeBefore:=Substring:C12($_t_Before; 1; $_l_Space)
								$_t_Before:=Substring:C12($_t_Before; $_l_Space+1; Length:C16($_t_Before))
								$_l_Space:=0
							End if 
							
					End case 
					
				End for 
				
				$_t_Line:=Substring:C12($_t_Line; $_l_CharacterPosition2; Length:C16($_t_Line))
				$_l_CommandPosition:=Find in array:C230($_at_OldCommands; $_t_Before)
				If ($_l_CommandPosition>0)
					$_t_Before:=$_at_NewCommands{$_l_CommandPosition}
				End if 
				$_t_Line:=$_t_BeforeBefore+$_t_Before+$_t_AfterBefore+$_t_Line
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
				If ($_t_Line#"")
					Repeat 
						
						If ($_t_Line[[Length:C16($_t_Line)]]=" ")
							$_t_Line:=Substring:C12($_t_Line; 1; Length:C16($_t_Line)-1)
						End if 
						If ($_t_Line#"")
							$_bo_Exit:=($_t_Line[[Length:C16($_t_Line)]]#" ")
						Else 
							$_bo_Exit:=True:C214
						End if 
					Until ($_bo_Exit)
				End if 
			End if 
			$_l_CommandPosition:=Find in array:C230($_at_OldCommands; $_t_Line)
			If ($_l_CommandPosition>0)
				$_t_Line:=$_at_NewCommands{$_l_CommandPosition}
			End if 
			$_t_Line:=$_t_Before+$_t_Line+$_t_After
			$_t_ReturnText:=$_t_ReturnText+$_t_Line+Char:C90(13)
			
		End if 
	Until ($_l_CharacterPosition=0) | ($_t_IncomingText="")
	
	$0:=$_t_ReturnText
	
	//TRACE
End if 
ERR_MethodTrackerReturn("MACRO_Translate4DWrite"; $_t_oldMethodName)

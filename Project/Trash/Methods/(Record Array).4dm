//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Record Array
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 15:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SCPT_at_ScriptCommands;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record Array")

ARRAY TEXT:C222(<>SCPT_at_ScriptCommands; 0)

APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Accept")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Cancel")
//◊aRecord{3}:="Click (x;y;nModifiers)"
//◊aRecord{4}:="Key ("+Char(34)+"Characters"+Char(34)+";nModifiers)"
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Gen Message ("+Char:C90(34)+"Comments"+Char:C90(34)+")")
//◊aRecord{6}:="Wait (nSeconds)"
//◊aRecord{7}:="Button (x;y;nModifiers)"
//◊aRecord{8}:="Backspace"
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Menu ("+Char:C90(34)+"Procedure"+Char:C90(34)+";nBytes;"+Char:C90(34)+"Name"+Char:C90(34)+")")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "New Record")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Next")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Previous")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Last")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "First")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Find")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Find More Choices")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Select")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Select Inverse")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Sort")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Report Generator")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Global Change")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Count")
//◊aRecord{23}:="Dial"
//◊aRecord{24}:="Dial Options"
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Menus")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Set Functions")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Graph Generator")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Return")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Tab")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Menu ("+Char:C90(34)+"Module"+Char:C90(34)+")")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Evaluate (String(Current Date;1))")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Evaluate (◊CompCode)")

APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Evaluate (◊User)")
//◊aRecord{34}:="Key (nAscii;nModifiers)"
//◊aRecord{35}:="Double Click (x;y;nModifiers)"
//◊aRecord{36}:="Wait on Event (Return)"
//◊aRecord{37}:="Wait on Event (Click)"
//◊aRecord{38}:="Pause"
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Gen_Confirm ("+Char:C90(34)+"Question"+Char:C90(34)+";"+Char:C90(34)+"Yes"+Char:C90(34)+";"+Char:C90(34)+"No"+Char:C90(34)+")")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Gen_Alert ("+Char:C90(34)+"Statement"+Char:C90(34)+";"+Char:C90(34)+"OK"+Char:C90(34)+")")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Menu ("+Char:C90(34)+Get localized string:C991("MenuItem_MacrosPalette")+Char:C90(34)+")")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Play ("+Char:C90(34)+"Sound Name"+Char:C90(34)+";0)")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Beep")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Execute Formula (mNumber:=20)")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Macro ("+Char:C90(34)+"ANOTHER"+Char:C90(34)+")")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "If (mVariable=True)")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Else")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "End if")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "While (mVariable=True)")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "End while")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "ConfirmT ("+Char:C90(34)+"Text"+Char:C90(34)+";"+Char:C90(34)+"Y"+Char:C90(34)+";"+Char:C90(34)+"N"+Char:C90(34)+";"+Char:C90(34)+"Title"+Char:C90(34)+")")
//◊aRecord{52}:="Wait for State (2)"
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "For")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "End for")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Repeat")
APPEND TO ARRAY:C911(<>SCPT_at_ScriptCommands; "Until")
//If (DB_GetModuleSetting(Module_IntServer)>1)
//ALArrayFillT (»◊aRecord;"IME Startup (mStack;mMin;mMax)"
//;"IME StatProc";"Int Reply (mHtml)";
//"Int FldInput (mFldPtr)";"Int Quote (mText)";"Int MacroMem")
//End if
SORT ARRAY:C229(<>SCPT_at_ScriptCommands; >)
<>SCPT_at_ScriptCommands:=1
ERR_MethodTrackerReturn("Record Array"; $_t_oldMethodName)
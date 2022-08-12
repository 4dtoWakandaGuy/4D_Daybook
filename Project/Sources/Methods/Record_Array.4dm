//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_Array
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
	//ARRAY TEXT(SCPT_at_ScriptCommands;0)
	C_POINTER:C301($_Ptr_Array; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_Array")
If (Count parameters:C259>=1)
	$_Ptr_Array:=$1
Else 
	$_Ptr_Array:=->SCPT_at_ScriptCommands
End if 

ARRAY TEXT:C222($_Ptr_Array->; 0)

APPEND TO ARRAY:C911($_Ptr_Array->; "Accept")
APPEND TO ARRAY:C911($_Ptr_Array->; "Cancel")
//◊aRecord{3}:="Click (x;y;nModifiers)"
//◊aRecord{4}:="Key ("+Char(34)+"Characters"+Char(34)+";nModifiers)"
APPEND TO ARRAY:C911($_Ptr_Array->; "Gen_Message ("+Char:C90(34)+"Comments"+Char:C90(34)+")")
//◊aRecord{6}:="Wait (nSeconds)"
//◊aRecord{7}:="Button (x;y;nModifiers)"
//◊aRecord{8}:="Backspace"
APPEND TO ARRAY:C911($_Ptr_Array->; "Menu ("+Char:C90(34)+"Procedure"+Char:C90(34)+";nBytes;"+Char:C90(34)+"Name"+Char:C90(34)+")")
APPEND TO ARRAY:C911($_Ptr_Array->; "New Record")
APPEND TO ARRAY:C911($_Ptr_Array->; "Next")
APPEND TO ARRAY:C911($_Ptr_Array->; "Previous")
APPEND TO ARRAY:C911($_Ptr_Array->; "Last")
APPEND TO ARRAY:C911($_Ptr_Array->; "First")
APPEND TO ARRAY:C911($_Ptr_Array->; "Find")
APPEND TO ARRAY:C911($_Ptr_Array->; "Find More Choices")
APPEND TO ARRAY:C911($_Ptr_Array->; "Select")
APPEND TO ARRAY:C911($_Ptr_Array->; "Select Inverse")
APPEND TO ARRAY:C911($_Ptr_Array->; "Sort")
APPEND TO ARRAY:C911($_Ptr_Array->; "Report Generator")
APPEND TO ARRAY:C911($_Ptr_Array->; "Global Change")
APPEND TO ARRAY:C911($_Ptr_Array->; "Count")
//◊aRecord{23}:="Dial"
//◊aRecord{24}:="Dial Options"
APPEND TO ARRAY:C911($_Ptr_Array->; "Menus")
APPEND TO ARRAY:C911($_Ptr_Array->; "Set Functions")
APPEND TO ARRAY:C911($_Ptr_Array->; "Graph Generator")
APPEND TO ARRAY:C911($_Ptr_Array->; "Return")
APPEND TO ARRAY:C911($_Ptr_Array->; "Tab")
APPEND TO ARRAY:C911($_Ptr_Array->; "Menu ("+Char:C90(34)+"Module"+Char:C90(34)+")")
APPEND TO ARRAY:C911($_Ptr_Array->; "Evaluate (String(Current Date;1))")
APPEND TO ARRAY:C911($_Ptr_Array->; "Evaluate (◊CompCode)")

APPEND TO ARRAY:C911($_Ptr_Array->; "Evaluate (◊User)")
//◊aRecord{34}:="Key (nAscii;nModifiers)"
//◊aRecord{35}:="Double Click (x;y;nModifiers)"
//◊aRecord{36}:="Wait on Event (Return)"
//◊aRecord{37}:="Wait on Event (Click)"
//◊aRecord{38}:="Pause"
APPEND TO ARRAY:C911($_Ptr_Array->; "Gen_Confirm ("+Char:C90(34)+"Question"+Char:C90(34)+";"+Char:C90(34)+"Yes"+Char:C90(34)+";"+Char:C90(34)+"No"+Char:C90(34)+")")
APPEND TO ARRAY:C911($_Ptr_Array->; "Gen_Alert ("+Char:C90(34)+"Statement"+Char:C90(34)+";"+Char:C90(34)+"OK"+Char:C90(34)+")")
APPEND TO ARRAY:C911($_Ptr_Array->; "Menu ("+Char:C90(34)+Get localized string:C991("MenuItem_MacrosPalette")+Char:C90(34)+")")
APPEND TO ARRAY:C911($_Ptr_Array->; "Play ("+Char:C90(34)+"Sound Name"+Char:C90(34)+";0)")
APPEND TO ARRAY:C911($_Ptr_Array->; "Beep")
APPEND TO ARRAY:C911($_Ptr_Array->; "Execute Formula (mNumber:=20)")
APPEND TO ARRAY:C911($_Ptr_Array->; "Macro ("+Char:C90(34)+"ANOTHER"+Char:C90(34)+")")
APPEND TO ARRAY:C911($_Ptr_Array->; "If (mVariable=True)")
APPEND TO ARRAY:C911($_Ptr_Array->; "Else")
APPEND TO ARRAY:C911($_Ptr_Array->; "End if")
APPEND TO ARRAY:C911($_Ptr_Array->; "While (mVariable=True)")
APPEND TO ARRAY:C911($_Ptr_Array->; "End while")
APPEND TO ARRAY:C911($_Ptr_Array->; "ConfirmT ("+Char:C90(34)+"Text"+Char:C90(34)+";"+Char:C90(34)+"Y"+Char:C90(34)+";"+Char:C90(34)+"N"+Char:C90(34)+";"+Char:C90(34)+"Title"+Char:C90(34)+")")
//◊aRecord{52}:="Wait for State (2)"
APPEND TO ARRAY:C911($_Ptr_Array->; "For")
APPEND TO ARRAY:C911($_Ptr_Array->; "End for")
APPEND TO ARRAY:C911($_Ptr_Array->; "Repeat")
APPEND TO ARRAY:C911($_Ptr_Array->; "Until")
//If (DB_GetModuleSetting(Module_IntServer)>1)
//ALArrayFillT (»◊aRecord;"IME Startup (mStack;mMin;mMax)"
//;"IME StatProc";"Int Reply (mHtml)";
//"Int FldInput (mFldPtr)";"Int Quote (mText)";"Int MacroMem")
//End if
SORT ARRAY:C229($_Ptr_Array->; >)
$_Ptr_Array->:=1
ERR_MethodTrackerReturn("Record_Array"; $_t_oldMethodName)

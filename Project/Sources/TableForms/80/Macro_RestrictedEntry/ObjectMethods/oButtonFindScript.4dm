If (False:C215)
	//object Name: [SCRIPTS]Macro_RestrictedEntry.Button2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2011 10:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(MAC_at_aMacroCodes;0)
	//ARRAY TEXT(MAC_at_aMacroNames;0)
	//ARRAY TEXT(MAC_at_Script;0)
	C_LONGINT:C283($_l_Index; $_l_OK; BFind; DB_l_CurrentReportSortTable)
	C_TEXT:C284($_t_oldMethodName; $_t_ScriptCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].Macro_RestrictedEntry.Button2"; Form event code:C388)
$_l_OK:=1
$_t_ScriptCode:=[SCRIPTS:80]Script_Code:1
PUSH RECORD:C176([SCRIPTS:80])

//here we need a list of Macros
ARRAY TEXT:C222(MAC_at_aMacroCodes; 0)
ARRAY TEXT:C222(MAC_at_aMacroNames; 0)
ARRAY TEXT:C222(MAC_at_Script; 0)
//ALL RECORDS([MACROS]) 10/07/02 pb
QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Name:2#""; *)
QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Script_Code:1#$_t_ScriptCode)

QUERY SELECTION:C341([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=DB_l_CurrentReportSortTable; *)
QUERY SELECTION:C341([SCRIPTS:80];  | ; [SCRIPTS:80]Table_Number:8=0)

SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Code:1; MAC_at_aMacroCodes; [SCRIPTS:80]Script_Name:2; MAC_at_aMacroNames; [SCRIPTS:80]Recording_Text:4; MAC_at_Script)
For ($_l_Index; 1; Size of array:C274(MAC_at_aMacroCodes))
	MAC_at_aMacroNames{$_l_Index}:=MAC_at_aMacroNames{$_l_Index}+" "+"("+MAC_at_aMacroCodes{$_l_Index}+")"
	
End for 
SORT ARRAY:C229(MAC_at_aMacroNames; MAC_at_aMacroCodes; MAC_at_Script)
OBJECT SET VISIBLE:C603(MAC_at_aMacroNames; True:C214)

OBJECT SET VISIBLE:C603(BFind; False:C215)
POP RECORD:C177([SCRIPTS:80])
ONE RECORD SELECT:C189([SCRIPTS:80])
ERR_MethodTrackerReturn("OBJ [SCRIPTS].Macro_RestrictedEntry.Button2"; $_t_oldMethodName)

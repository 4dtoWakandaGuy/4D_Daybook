If (False:C215)
	//object Name: [USER]WS_SetManager.Button7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SM_at_ScriptCodes;0)
	//ARRAY TEXT(SM_at_ScriptNames;0)
	C_LONGINT:C283($_l_OK)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Button7"; Form event code:C388)
$_l_OK:=1
//here we need a list of Macros
ARRAY TEXT:C222(SM_at_ScriptCodes; 0)
ARRAY TEXT:C222(SM_at_ScriptNames; 0)

//ALL RECORDS([MACROS]) 10/07/02 pb
QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Name:2#"")
SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Code:1; SM_at_ScriptCodes; [SCRIPTS:80]Script_Name:2; SM_at_ScriptNames)
FORM GOTO PAGE:C247(4)
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Button7"; $_t_oldMethodName)
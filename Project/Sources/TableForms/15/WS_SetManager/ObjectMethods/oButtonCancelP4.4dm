If (False:C215)
	//object Name: [USER]WS_SetManager.Button12
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
	C_LONGINT:C283($_l_FieldNumber; $_l_ItemReference; $_l_SourceProcess; $_l_SublistID; $_l_TableNumber)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_ItemText; $_t_oldMethodName; $_t_VariableName; SM_T_MacroText; SM_T_MacroText2; SM_t_ScriptCode; SM_t_ScriptName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Button12"; Form event code:C388)

QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=SM_t_ScriptCode)
If (Records in selection:C76([SCRIPTS:80])=0)
	CREATE RECORD:C68([SCRIPTS:80])
	[SCRIPTS:80]Script_Code:1:=SM_t_ScriptCode
	[SCRIPTS:80]Script_Name:2:="LM "+SM_t_ScriptName
	[SCRIPTS:80]Person:5:=<>PER_t_CurrentUserInitials
	[SCRIPTS:80]Table_Number:8:=$_l_TableNumber
End if 
[SCRIPTS:80]Modified_Date:10:=Current date:C33(*)
SM_t_ScriptName:=[SCRIPTS:80]Script_Name:2
SM_T_MacroText:=[SCRIPTS:80]Recording_Text:4
SM_T_MacroText2:=""
ARRAY TEXT:C222(SM_at_ScriptCodes; 0)
ARRAY TEXT:C222(SM_at_ScriptNames; 0)
FORM GOTO PAGE:C247(3)
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Button12"; $_t_oldMethodName)

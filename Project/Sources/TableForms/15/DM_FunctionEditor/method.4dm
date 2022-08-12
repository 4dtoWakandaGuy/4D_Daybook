If (False:C215)
	//Table Form Method Name: [USER]DM_FunctionEditor
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_ClassID; $_l_event)
	C_TEXT:C284($_t_oldMethodName; DM_T_MacroText; DM_t_ScriptCODE; DM_t_ScriptName; DM_t_ScriptNameOLD; DM_t_SimpleStatement; DM_t_SimpleStatementOLD)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].DM_FunctionEditor"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "DM_FunctionEditor")
		SET WINDOW TITLE:C213("Edit Status Function")
		DM_t_ScriptNameOLD:=DM_t_ScriptName
		DM_t_ScriptCODE:=""
		DM_t_ScriptName:=""
		DM_T_MacroText:=""
		If (DM_t_SimpleStatement#"")
			
			$_l_ClassID:=Data Import Macro
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Class:11=$_l_ClassID)
			QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Script_Name:2=DM_t_SimpleStatement)
		Else 
			REDUCE SELECTION:C351([SCRIPTS:80]; 0)
		End if 
		
		If (Records in selection:C76([SCRIPTS:80])=1)
			DM_t_ScriptName:=[SCRIPTS:80]Script_Name:2
			DM_t_ScriptNameOLD:=DM_t_ScriptName
			DM_t_ScriptCODE:=[SCRIPTS:80]Script_Code:1
			DM_T_MacroText:=[SCRIPTS:80]Recording_Text:4
			FORM GOTO PAGE:C247(2)
			WS_AutoscreenSize(2; 324; 324)
		Else 
			DM_t_SimpleStatementOLD:=DM_t_SimpleStatement
			WS_AutoscreenSize(2; 151; 324)
			FORM GOTO PAGE:C247(1)
			
		End if 
End case 
ERR_MethodTrackerReturn("FM:DM_FunctionEditor"; $_t_oldMethodName)

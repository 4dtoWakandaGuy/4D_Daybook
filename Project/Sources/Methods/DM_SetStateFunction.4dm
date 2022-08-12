//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_SetStateFunction
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ClassID; $_l_CurrentWinRefOLD; DM_l_Save; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; $0; $1; DM_T_MacroText; DM_t_ScriptCODE; DM_t_ScriptCodeRef; DM_t_ScriptName; DM_t_SimpleStatement)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_SetStateFunction")
//this method will display a window where the user
//can either set a short executable statement
//or set a macro name to call for a longer function


DM_t_SimpleStatement:=$1
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; -1990)
DIALOG:C40([USER:15]; "DM_FunctionEditor")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
If (DM_l_Save=1)
	//if it is a macro save it
	If (DM_t_ScriptName#"")
		READ WRITE:C146([SCRIPTS:80])
		If (DM_t_ScriptCODE="")
			CREATE RECORD:C68([SCRIPTS:80])
			DM_t_ScriptCodeRef:="DM_t_ScriptCODE"
			[SCRIPTS:80]Script_Code:1:=String:C10(AA_GetNextIDinMethod(->DM_t_ScriptCodeRef))
			
		Else 
			$_l_ClassID:=Data Import Macro
			
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Class:11=$_l_ClassID)
			QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Script_Code:1=DM_t_ScriptCODE)
		End if 
		[SCRIPTS:80]Script_Name:2:=DM_t_ScriptName
		[SCRIPTS:80]Recording_Text:4:=DM_T_MacroText
		DB_SaveRecord(->[SCRIPTS:80])
		DM_t_SimpleStatement:=DM_t_ScriptName
		UNLOAD RECORD:C212([SCRIPTS:80])
	End if 
	
	
	
End if 
$0:=DM_t_SimpleStatement
ERR_MethodTrackerReturn("DM_SetStateFunction"; $_t_oldMethodName)
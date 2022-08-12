If (False:C215)
	//object Name: [ACTIONS]Action_In.Variable30
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; SD2_t_TUMacroCode; SD2_t_TUScriptName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Variable30"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		Check_MinorNC(->SD2_t_TUMacroCode; ""; ->[SCRIPTS:80]; ->[SCRIPTS:80]Script_Code:1; ->[SCRIPTS:80]Script_Name:2; "Macro")
		If (SD2_t_TUMacroCode#"")
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=SD2_t_TUMacroCode)
			SD2_t_TUScriptName:=[SCRIPTS:80]Script_Name:2
			UNLOAD RECORD:C212([SCRIPTS:80])
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Variable30"; $_t_oldMethodName)

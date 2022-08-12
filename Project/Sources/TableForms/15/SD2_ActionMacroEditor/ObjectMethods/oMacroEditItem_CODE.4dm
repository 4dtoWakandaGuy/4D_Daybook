If (False:C215)
	//object Method Name: Object Name:      [USER].SD2_ActionMacroEditor.oMacroEditItem_CODE
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
	C_LONGINT:C283($_l_event; $_l_WildCardPosition)
	C_TEXT:C284($_t_oldMethodName; SD2_t_mScriptCodes; SD2_t_TestName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ActionMacroEditor.oMacroEditItem_CODE"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		$_l_WildCardPosition:=Position:C15(Char:C90(64); SD2_t_mScriptCodes)
		If ($_l_WildCardPosition>0)
			
			Check_MinorNC(->SD2_t_mScriptCodes; "Macros"; ->[SCRIPTS:80]; ->[SCRIPTS:80]Script_Code:1; ->[SCRIPTS:80]Script_Name:2)  //5
		Else 
			SD2_t_TestName:=SD2_t_mScriptCodes+"@"
			Check_MinorNC(->SD2_t_TestName; "Macros"; ->[SCRIPTS:80]; ->[SCRIPTS:80]Script_Code:1; ->[SCRIPTS:80]Script_Name:2)  //5
			SD2_t_mScriptCodes:=SD2_t_TestName
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ActionMacroEditor.oMacroEditItem_CODE"; $_t_oldMethodName)

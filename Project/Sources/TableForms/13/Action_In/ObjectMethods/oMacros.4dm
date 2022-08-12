If (False:C215)
	//object Name: [ACTIONS]Action_In.oMacros
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
	//ARRAY BOOLEAN(SD2_LB_Macros;0)
	//ARRAY TEXT(SD2_at_ScriptCodes;0)
	//ARRAY TEXT(SD2_at_ScriptNames;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; LB_l_MacroColumn; SD2_EventHandler; SD2_l_SelectedMacro)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; SD2_t_MacroCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.oMacros"; Form event code:C388)
$_l_event:=Form event code:C388

RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
SD2_l_SelectedMacro:=Self:C308->
LB_l_MacroColumn:=LB_GetColumn(->SD2_LB_Macros; $_t_VariableName)
Case of 
	: ($_l_event=On Header Click:K2:40)
		
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		SD2_l_SelectedMacro:=Self:C308->
		LB_l_MacroColumn:=LB_GetColumn(->SD2_LB_Macros; $_t_VariableName)
		If ($_t_VariableName="SD2_at_ScriptCodes")
			EDIT ITEM:C870(Self:C308->)
		End if 
	: ($_l_event=On Data Change:K2:15)
		//AL_GetCurrCell (SD2_l_Macros;$_l_Column;$_l_Row)
		
		If (LB_l_MacroColumn=1)
			If (SD2_l_SelectedMacro>0)
				SD2_EventHandler:=1
				SD2_t_MacroCode:=SD2_at_ScriptCodes{SD2_l_SelectedMacro}
				If (SD2_t_MacroCode#"")
					Check_MinorNC(->SD2_t_MacroCode; ""; ->[SCRIPTS:80]; ->[SCRIPTS:80]Script_Code:1; ->[SCRIPTS:80]Script_Name:2; "Macro")
					SD2_at_ScriptCodes{SD2_l_SelectedMacro}:=SD2_t_MacroCode
					If (SD2_t_MacroCode#"")
						QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=SD2_t_MacroCode)
						SD2_at_ScriptNames{SD2_l_SelectedMacro}:=[SCRIPTS:80]Script_Name:2
						UNLOAD RECORD:C212([SCRIPTS:80])
					End if 
				End if 
				SD2_EventHandler:=0
				
			End if 
			
			
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.oMacros"; $_t_oldMethodName)

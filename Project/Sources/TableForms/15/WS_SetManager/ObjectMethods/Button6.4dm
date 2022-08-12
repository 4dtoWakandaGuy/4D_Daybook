If (False:C215)
	//object Name: [USER]WS_SetManager.Button6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2011 20:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SetContextItemContextID;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	C_BOOLEAN:C305($_bo_AutoScript; $_bo_NewScript; $_bo_OptionKey; SM_bo_Busy)
	C_LONGINT:C283($_l_ContextID; $_l_EditScriptProcess; $_l_ItemReference; $_l_ItemReferenceRow; $_l_OK; $_l_SelectedListItem; $_l_SubListID; $_l_TableNUmber; SM_HL_l_SETMANAGER)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_ItemText; $_t_oldMethodName; $_t_ScriptName; SM_T_MacroText; SM_t_ScriptCode; SM_t_ScriptName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Button6"; Form event code:C388)
SM_bo_Busy:=True:C214
$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
SM_SaveModifiedList

If ($_l_SelectedListItem>0)
	GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
	SM_ListItemShared($_l_ItemReference)
	If ($_l_ItemReference<10000)
		SM_t_ScriptCode:=String:C10($_l_ItemReference)
		SM_t_ScriptName:="Data Query "+$_t_ItemText
		$_l_ItemReferenceRow:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
		If ($_l_ItemReferenceRow<0)
			Gen_Alert("You must name the list before you attempt to create rules")
			
		Else 
			
			$_l_ContextID:=SM_al_SetContextItemContextID{$_l_ItemReferenceRow}
			$_l_TableNUmber:=SM_TableFromContextID($_l_ContextID)
			READ WRITE:C146([SCRIPTS:80])
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=SM_t_ScriptCode)
			$_bo_NewScript:=False:C215
			$_bo_AutoScript:=False:C215
			If (Records in selection:C76([SCRIPTS:80])=0)
				$_l_OK:=Gen_Confirm_WithHideOption(2; "Create Auto Search?"; "Yes"; "No")
				If ($_l_OK=0)
					$_bo_AutoScript:=False:C215
					CREATE RECORD:C68([SCRIPTS:80])
					[SCRIPTS:80]Script_Code:1:=SM_t_ScriptCode
					[SCRIPTS:80]Script_Name:2:="LM "+SM_t_ScriptName
					[SCRIPTS:80]Person:5:=<>PER_t_CurrentUserInitials
					[SCRIPTS:80]Table_Number:8:=$_l_TableNUmber
					[SCRIPTS:80]Script_Class:11:=SM Macro
					
					$_bo_NewScript:=True:C214
				Else 
					$_bo_NewScript:=True:C214
					$_bo_AutoScript:=True:C214
					HIDE PROCESS:C324(Current process:C322)
					//Create Macro
				End if 
				
			End if 
			
			If ([SCRIPTS:80]Script_Class:11=0) & ($_bo_AutoScript=False:C215)
				//AutoSearch
				[SCRIPTS:80]Script_Class:11:=SM Macro
			End if 
			If ([SCRIPTS:80]Script_Class:11#SM AutoSearch) & ($_bo_AutoScript=False:C215)
				[SCRIPTS:80]Modified_Date:10:=Current date:C33(*)
				SM_t_ScriptName:=[SCRIPTS:80]Script_Name:2
				SM_T_MacroText:=[SCRIPTS:80]Recording_Text:4
				FORM GOTO PAGE:C247(3)
			Else 
				$_bo_OptionKey:=Macintosh option down:C545 | Windows Alt down:C563
				If ($_bo_OptionKey)
					[SCRIPTS:80]Modified_Date:10:=Current date:C33(*)
					SM_t_ScriptName:=[SCRIPTS:80]Script_Name:2
					SM_T_MacroText:=[SCRIPTS:80]Recording_Text:4
					FORM GOTO PAGE:C247(3)
					
				Else 
					If ($_bo_NewScript=False:C215)
						SM_t_ScriptCode:=[SCRIPTS:80]Script_Code:1
						$_t_ScriptName:=[SCRIPTS:80]Script_Name:2
						<>PER_t_CurrentUserInitials:=[SCRIPTS:80]Person:5
						$_l_TableNUmber:=[SCRIPTS:80]Table_Number:8
						UNLOAD RECORD:C212([SCRIPTS:80])
						READ ONLY:C145([SCRIPTS:80])
						
					Else 
						$_t_ScriptName:="LM "+SM_t_ScriptName
					End if 
					HIDE PROCESS:C324(Current process:C322)
					$_l_EditScriptProcess:=New process:C317("SM_EditMacro"; 32000; "Create Auto Macro"; Current process:C322; SM_t_ScriptCode; $_t_ScriptName; <>PER_t_CurrentUserInitials; $_l_TableNUmber)
				End if 
				
				//edit macro
				
				
			End if 
		End if 
		
	End if 
Else 
	Gen_Alert("You must select a list  to add rules to.")
End if 
ERR_MethodTrackerReturn("OBJ:WS_SetManager,BMacro"; $_t_oldMethodName)

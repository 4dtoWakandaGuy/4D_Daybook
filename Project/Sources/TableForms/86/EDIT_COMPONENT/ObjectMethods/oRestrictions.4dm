If (False:C215)
	//object Method Name: Object Name:      [COMPONENTS].EDIT_COMPONENT.oRestrictions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2011 08:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PC_at_RestrictionFIlter;0)
	C_BOOLEAN:C305(PC_bo_ComponentMod)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row; PRD_l_LBCodeFormats; PRD_l_ScriptEdit)
	C_TEXT:C284($_t_oldMethodName; $_t_PersonCode; PC_t_RestrictionFilter)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPONENTS].EDIT_COMPONENT.oRestrictions"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		LISTBOX GET CELL POSITION:C971(PRD_l_LBCodeFormats; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			
			Case of 
				: ($_l_Column=2)
					PC_bo_ComponentMod:=True:C214
			End case 
			
			
		End if 
	: ($_l_event=On Double Clicked:K2:5)
		$_l_Row:=Self:C308->
		If (PC_at_RestrictionFIlter{$_l_Row}#"")
			$_t_PersonCode:=PC_at_RestrictionFIlter{$_l_Row}
			PRD_l_ScriptEdit:=New process:C317("Record_EditLst"; DB_ProcessMemoryinit(2); $_t_PersonCode; $_t_PersonCode)
			If (PRD_l_ScriptEdit>0)
				Process_StartAr(PRD_l_ScriptEdit; "Edit Macro")
			End if 
			
		End if 
		
	: ($_l_event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(PRD_l_LBCodeFormats; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			Case of 
				: ($_l_Column=2)  //check box
					PC_bo_ComponentMod:=True:C214
				: ($_l_Column=4)  //filter(macro name)
					PC_t_RestrictionFilter:=PC_at_RestrictionFIlter{$_l_Row}
					If (PC_t_RestrictionFilter#"")
						Check_MinorNC(->PC_t_RestrictionFilter; "Script"; ->[SCRIPTS:80]; ->[SCRIPTS:80]Script_Code:1; ->[SCRIPTS:80]Script_Name:2; "Script")
						If (PC_t_RestrictionFilter#"")
							
							If ([SCRIPTS:80]Script_Code:1#PC_t_RestrictionFilter)
								PC_bo_ComponentMod:=True:C214
								PC_at_RestrictionFIlter{$_l_Row}:=PC_t_RestrictionFilter
							End if 
						Else 
							PC_at_RestrictionFIlter{$_l_Row}:=PC_t_RestrictionFilter
							
						End if 
					End if 
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [COMPONENTS].EDIT_COMPONENT.oRestrictions"; $_t_oldMethodName)

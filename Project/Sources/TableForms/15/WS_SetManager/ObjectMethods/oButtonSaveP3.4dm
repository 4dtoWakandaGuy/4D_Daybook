If (False:C215)
	//object Name: [USER]WS_SetManager.Button8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/05/2011 11:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SetClassID;0)
	//ARRAY LONGINT(SM_al_SetContextItemContextID;0)
	//ARRAY LONGINT(SM_al_SetitemsClassID;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	//ARRAY TEXT(SM_at_SetClass;0)
	//ARRAY TEXT(SM_at_SetitemsClassName;0)
	C_BOOLEAN:C305(SM_bo_Busy)
	C_LONGINT:C283($_l_ClassID; $_l_SelectedListItem; $_l_FieldNumber; $_l_Icon; $_l_ItemReference; $_l_ListItemRow; $_l_SourceProcess; $_l_SubListID; $_l_TableNumber; SM_HL_l_SETMANAGER)
	C_TEXT:C284($_t_ClassName; $_t_ItemText; $_t_oldMethodName; $_t_VariableName; SM_T_MacroText; SM_t_ScriptCode; SM_t_ScriptName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Button8"; Form event code:C388)
If (SM_t_ScriptName#"") & (SM_T_MacroText#"")
	[SCRIPTS:80]Recording_Text:4:=SM_T_MacroTExt
	[SCRIPTS:80]Script_Name:2:=SM_t_ScriptName
	[SCRIPTS:80]Same_Process:6:=True:C214
	
	DB_SaveRecord(->[SCRIPTS:80])
	UNLOAD RECORD:C212([SCRIPTS:80])
	READ ONLY:C145([SCRIPTS:80])
	//we now have a macro associated with a list so we must change the list class
	SELECT LIST ITEMS BY REFERENCE:C630(SM_HL_l_SETMANAGER; Num:C11(SM_t_ScriptCode))
	$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
	GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
	$_l_ListItemRow:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
	//get the class
	// and then update it
	ARRAY TEXT:C222(SM_at_SetClass; 4)
	ARRAY LONGINT:C221(SM_al_SetClassID; 4)
	SM_at_SetClass{1}:="Fixed List"
	SM_at_SetClass{2}:="Dynamic List"
	SM_at_SetClass{3}:="Fixed List with Dynamic Query"
	SM_at_SetClass{4}:="Group"
	SM_al_SetClassID{1}:=853
	SM_al_SetClassID{2}:=854
	SM_al_SetClassID{3}:=852
	SM_al_SetClassID{4}:=855
	$_t_ClassName:=SM_at_SetitemsClassName{$_l_ListItemRow}
	$_l_ClassID:=SM_al_SetitemsClassID{$_l_ListItemRow}
	Case of 
		: ($_l_ClassID=853)  //does not have a macro currently
			QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_l_ItemReference)
			If (Records in selection:C76([USER_SETS:105])>0)
				//has both
				SM_UpdateArrays("PER"; $_t_ItemText; $_l_ItemReference; SM_al_SetContextItemContextID{$_l_ListItemRow}; ""; 0; SM_at_SetClass{3}; SM_al_SetClassID{3})
			Else 
				//has no list so
				SM_UpdateArrays("PER"; $_t_ItemText; $_l_ItemReference; SM_al_SetContextItemContextID{$_l_ListItemRow}; ""; 0; SM_at_SetClass{2}; SM_al_SetClassID{2})
			End if 
			UNLOAD RECORD:C212([USER_SETS:105])
			$_l_Icon:=SM_al_SetitemsClassID{$_l_ListItemRow}
			If ($_l_Icon=0)
				$_l_Icon:=853
			End if 
			//SELECT LIST ITEM BY REFERENCE(list;itemRef)
			SET LIST ITEM PROPERTIES:C386(SM_HL_l_SETMANAGER; $_l_ItemReference; True:C214; Plain:K14:1; 131072+$_l_Icon)
			//////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
			
			
	End case 
	FORM GOTO PAGE:C247(1)
End if 

SM_bo_Busy:=False:C215
ERR_MethodTrackerReturn("OBJ:WS_SetManager,BSave"; $_t_oldMethodName)
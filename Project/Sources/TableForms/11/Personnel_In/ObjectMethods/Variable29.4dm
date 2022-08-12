If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.Variable29
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PER_al_ContextViews;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(MOD_at_ModuleStartName;0)
	//ARRAY TEXT(PER_at_ContextViews;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283($_l_ContextRow; $_l_StartModuleRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.Variable29"; Form event code:C388)
If (MOD_at_ModuleStartName>0)
	[PERSONNEL:11]Start_Module:29:=MOD_at_ModuleStartName{MOD_at_ModuleStartName}
Else 
	[PERSONNEL:11]Start_Module:29:=""
End if 
ARRAY LONGINT:C221(PER_al_ContextViews; 0)
ARRAY TEXT:C222(PER_at_ContextViews; 0)
If ([PERSONNEL:11]Start_Module:29="")
	$_l_StartModuleRow:=0
Else 
	$_l_StartModuleRow:=Find in array:C230(<>Mod_at_ModuleName; [PERSONNEL:11]Start_Module:29)
End if 
Modules_LoadContextViews($_l_StartModuleRow; ->PER_al_ContextViews; ->PER_at_ContextViews)
If ([PERSONNEL:11]HomeTable:52>0)
	$_l_ContextRow:=Find in array:C230(PER_al_ContextViews; [PERSONNEL:11]HomeTable:52)
	If ($_l_ContextRow<0)
		$_l_ContextRow:=0
		[PERSONNEL:11]HomeTable:52:=0
	End if 
Else 
	$_l_ContextRow:=0
End if 
PER_at_ContextViews:=$_l_ContextRow
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("OBJ:Personnel_In,MOD_at_ModuleName"; $_t_oldMethodName)

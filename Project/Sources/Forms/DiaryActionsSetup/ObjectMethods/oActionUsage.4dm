If (False:C215)
	//object Name: Object Name:      DiaryActionsSetup.oActionUsage
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_ActionMod;0)
	//ARRAY BOOLEAN(SD2_at_ActionInclude1;0)
	//ARRAY BOOLEAN(SD2_at_ActionInclude2;0)
	//ARRAY BOOLEAN(SD2_at_ActionInclude3;0)
	//ARRAY BOOLEAN(SD2_at_ActionInclude4;0)
	//ARRAY BOOLEAN(SD2_lb_Actions;0)
	C_BOOLEAN:C305(SD2_bo_SettingsMod)
	C_LONGINT:C283($_l_ClickedColumn; $_l_Column; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_Variable)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DiaryActionsSetup.oActionUsage"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Data Change:K2:15)
		RESOLVE POINTER:C394(Self:C308; $_t_Variable; $_l_TableNumber; $_l_FieldNumber)
		$_l_ClickedColumn:=LB_GetColumn(->SD2_lb_Actions; $_t_Variable)
		$_l_Row:=Self:C308->
		Case of 
			: ($_l_ClickedColumn=3)
				SD2_abo_ActionMod{$_l_Row}:=True:C214
				SD2_bo_SettingsMod:=True:C214
			: ($_l_ClickedColumn=4)
				SD2_abo_ActionMod{$_l_Row}:=True:C214
				SD2_bo_SettingsMod:=True:C214
			: ($_l_ClickedColumn=7)
				SD2_abo_ActionMod{$_l_Row}:=True:C214
				SD2_bo_SettingsMod:=True:C214
			: ($_l_ClickedColumn=5)
				If (SD2_at_ActionInclude3{$_l_Row})
					SD2_abo_ActionMod{$_l_Row}:=True:C214
					SD2_bo_SettingsMod:=True:C214
					SD2_at_ActionInclude2{$_l_Row}:=False:C215
					SD2_at_ActionInclude1{$_l_Row}:=False:C215
					SD2_at_ActionInclude4{$_l_Row}:=False:C215
				End if 
			: ($_l_ClickedColumn=6)
				SD2_abo_ActionMod{$_l_Row}:=True:C214
				SD2_bo_SettingsMod:=True:C214
				SD2_at_ActionInclude2{$_l_Row}:=False:C215
				SD2_at_ActionInclude1{$_l_Row}:=False:C215
				SD2_at_ActionInclude3{$_l_Row}:=False:C215
		End case 
		If (SD2_at_ActionInclude2{$_l_Row}=False:C215) & (SD2_at_ActionInclude1{$_l_Row}=False:C215) & (SD2_at_ActionInclude4{$_l_Row}=False:C215)
			If (SD2_at_ActionInclude3{$_l_Row}=False:C215)
				SD2_bo_SettingsMod:=True:C214
				SD2_abo_ActionMod{$_l_Row}:=True:C214
				//not a timed action and not in schedule or workflow
				SD2_at_ActionInclude3{$_l_Row}:=True:C214
			End if 
		Else 
			If (SD2_at_ActionInclude3{$_l_Row}=True:C214)
				SD2_bo_SettingsMod:=True:C214
				SD2_abo_ActionMod{$_l_Row}:=True:C214
				SD2_at_ActionInclude3{$_l_Row}:=False:C215
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ DiaryActionsSetup.oActionUsage"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MenuValidateShortcut
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/01/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_MenuShortCutModifier;0)
	//ARRAY LONGINT(DB_al_MenuShortCutsUsed;0)
	//ARRAY TEXT(DB_at_MenuShortCut;0)
	C_BOOLEAN:C305(DB_bo_MenusInited)
	C_LONGINT:C283($_l_MenuShortcut; $_l_UsedShortcutRow; $3)
	C_TEXT:C284($_t_Character; $_t_MenuReference; $_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_MenuValidateShortcut")
$_t_MenuReference:=$1
$_l_MenuShortcut:=$3
Case of 
	: ($2="4D menu")
		If ($_l_MenuShortcut>0)
			$_t_Character:=Char:C90($_l_MenuShortcut)
			$_l_UsedShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
			If ($_l_UsedShortcutRow>0) & (Not:C34(DB_bo_MenusInited))
				$_l_UsedShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
				If ($_l_UsedShortcutRow>0) & (Not:C34(DB_bo_MenusInited))
					$_l_UsedShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
					If ($_l_UsedShortcutRow<0)
						$_t_Character:=Char:C90($_l_MenuShortcut)
						SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_Character; 2048+512)
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
					Else 
						//dont add the short cut
					End if 
					
				Else 
					$_t_Character:=Char:C90($_l_MenuShortcut)
					SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_Character; 2048)
					APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
				End if 
				
			Else 
				
				$_t_Character:=Char:C90($_l_MenuShortcut)
				SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortcut)
				APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
				
			End if 
		End if 
		
	: ($2="menu string")
		If ($_l_MenuShortcut>0)
			$_t_Character:=Char:C90($_l_MenuShortcut)
			$_l_UsedShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
			If ($_l_UsedShortcutRow>0) & (Not:C34(DB_bo_MenusInited))
				$_l_UsedShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
				If ($_l_UsedShortcutRow>0) & (Not:C34(DB_bo_MenusInited))
					$_l_UsedShortcutRow:=Find in array:C230(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
					If ($_l_UsedShortcutRow<0)
						$_t_Character:=Char:C90($_l_MenuShortcut)
						DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_Character
						DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048+512
						APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048+512)
					Else 
						//dont add the short cut
					End if 
					
				Else 
					$_t_Character:=Char:C90($_l_MenuShortcut)
					DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_Character
					DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=2048
					APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut+2048)
					
				End if 
			Else 
				DB_at_MenuShortCut{Size of array:C274(DB_at_MenuShortCut)}:=$_t_Character
				DB_al_MenuShortCutModifier{Size of array:C274(DB_al_MenuShortCutModifier)}:=0
				APPEND TO ARRAY:C911(DB_al_MenuShortCutsUsed; $_l_MenuShortcut)
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("DB_MenuValidateShortcut"; $_t_oldMethodName)
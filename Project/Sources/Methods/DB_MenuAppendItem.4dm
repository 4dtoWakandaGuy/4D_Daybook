//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MenuAppendItem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/01/2012 15:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_MenuShortCutModifier;0)
	//ARRAY TEXT(DB_at_menuitem;0)
	//ARRAY TEXT(DB_at_MenuItem4DFunction;0)
	//ARRAY TEXT(DB_at_MenuItemParameter;0)
	//ARRAY TEXT(DB_at_MenuShortCut;0)
	C_BOOLEAN:C305($_bo_Validate; $7)
	C_LONGINT:C283($_l_MenuShortcut; $_l_Modifier; $6; $8)
	C_POINTER:C301($_ptr_MenuItem; $_ptr_MenuItemFunction; $_ptr_MenuItemParameter; $_ptr_MenuItemShortcut; $_ptr_MenuItemShortcutModifier; $10; $11; $12; $13; $9)
	C_TEXT:C284($_t_Character; $_t_MenuItemName; $_t_MenuMethod; $_t_MenuParameter; $_t_MenuReference; $_t_MenuType; $_t_oldMethodName; $1; $2; $3; $4)
	C_TEXT:C284($5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_MenuAppendItem")
If (Count parameters:C259>=3)
	
	$_t_MenuType:=$2
	$_t_MenuReference:=$1
	$_t_MenuItemName:=$3
	$_t_MenuMethod:=""
	$_t_MenuParameter:=""
	$_l_MenuShortcut:=0
	If (Count parameters:C259>=4)
		$_t_MenuMethod:=$4
		If (Count parameters:C259>=5)
			$_t_MenuParameter:=$5
			If (Count parameters:C259>=6)
				$_l_MenuShortcut:=$6
			End if 
		End if 
	End if 
	If (Count parameters:C259>=7)
		$_bo_Validate:=$7
	Else 
		$_bo_Validate:=False:C215
	End if 
	
	
	$_l_Modifier:=0
	If (Count parameters:C259>=8)
		$_l_Modifier:=$8
	End if 
	If (Count parameters:C259>13)
		$_ptr_MenuItem:=$9
		$_ptr_MenuItemFunction:=$10
		$_ptr_MenuItemShortcut:=$11
		$_ptr_MenuItemShortcutModifier:=$12
		$_ptr_MenuItemParameter:=$13
	Else 
		$_ptr_MenuItem:=->DB_at_menuitem
		$_ptr_MenuItemFunction:=->DB_at_MenuItem4DFunction
		$_ptr_MenuItemShortcut:=->DB_at_MenuShortCut
		$_ptr_MenuItemShortcutModifier:=->DB_al_MenuShortCutModifier
		$_ptr_MenuItemParameter:=->DB_at_MenuItemParameter
	End if 
	
	Case of 
		: ($_t_MenuType="4D menu")
			INSERT MENU ITEM:C412($_t_MenuReference; -1; $_t_MenuItemName)
			SET MENU ITEM METHOD:C982($_t_MenuReference; -1; $_t_MenuMethod)
			SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_t_MenuParameter)
			If ($_l_Modifier>0)
				$_t_Character:=Char:C90($_l_MenuShortcut)
				SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_t_Character; $_l_Modifier)
				
			Else 
				SET MENU ITEM SHORTCUT:C423($_t_MenuReference; -1; $_l_MenuShortcut)
			End if 
		: ($_t_MenuType="menu string")
			APPEND TO ARRAY:C911($_ptr_MenuItem->; $_t_MenuItemName)
			APPEND TO ARRAY:C911($_ptr_MenuItemFunction->; $_t_MenuMethod)
			APPEND TO ARRAY:C911($_ptr_MenuItemParameter->; $_t_MenuParameter)
			If ($_l_MenuShortcut>0)
				$_t_Character:=Char:C90($_l_MenuShortcut)
				APPEND TO ARRAY:C911($_ptr_MenuItemShortcut->; "")
			End if 
			APPEND TO ARRAY:C911($_ptr_MenuItemShortcutModifier->; $_l_Modifier)
	End case 
	If ($_bo_Validate) & ($_l_MenuShortcut>0)
		DB_MenuValidateShortcut($_t_MenuReference; $_t_MenuType; $_l_MenuShortcut)
		
	End if 
	
End if 
ERR_MethodTrackerReturn("DB_MenuAppendItem"; $_t_oldMethodName)
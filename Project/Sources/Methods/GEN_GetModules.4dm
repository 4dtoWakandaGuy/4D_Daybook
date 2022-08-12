//%attributes = {}

If (False:C215)
	//Project Method Name:      GEN_GetModules
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(DB_aI_aMod;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	ARRAY TEXT:C222($_at_ProcessNames; 0)
	//ARRAY TEXT(GEN_at_ContextualMenuItemFunt;0)
	//ARRAY TEXT(GEN_at_ContextualMenuItems;0)
	C_BOOLEAN:C305($1; Gen_bo_ContextualMenuinit)
	C_LONGINT:C283(<>MenuProc; $_l_CurrentRow; $_l_ItemsIndex; $_l_menuCount; $_l_menuCountItems; $_l_MenuItemNumber; $_l_MenuNumber; $_l_ModuleRow)
	C_TEXT:C284($_t_ItemName; $_t_MenuSTR; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GEN_GetModules")



//$_t_oldMethodName:=ERR_MethodTracker ("GEN_GetModules")


While (Semaphore:C143("$GettingModules"))
	DelayTicks(2)
	//ALERT("Starting-Getting Modules delayed")
	
End while 
//ALERT("Starting-Check_Modules")
Check_Modules
//ALERT("Starting-Check_Modules Done")
If (<>MenuProc>0)
	
	//ALERT("Starting-Getting Modules")
	ARRAY TEXT:C222(GEN_at_ContextualMenuItems; 0)
	ARRAY TEXT:C222(GEN_at_ContextualMenuItemFunt; 0)
	$_l_menuCount:=Count menus:C404(<>MenuProc)
	$_l_MenuNumber:=3
	//ALERT("Starting-Getting Modules Menu count "+String($_l_menuCount))
	For ($_l_ItemsIndex; 1; $_l_menuCount)
		//ALERT("Starting-Getting Modules Number "+String($_l_ItemsIndex))
		$_l_MenuItemNumber:=$_l_ItemsIndex+2049
		$_t_MenuSTR:=Get menu title:C430($_l_MenuItemNumber; <>MenuProc)
		//ALERT("Starting-Getting Modules title "+$_t_MenuSTR)
		
		If ($_t_MenuSTR=Get localized string:C991("Menu_Volumes"))
			//ALERT("Starting-Getting Modules is menu volumes")
			$_l_MenuNumber:=$_l_ItemsIndex
			$_l_ItemsIndex:=$_l_menuCount
		End if 
	End for 
	
	//ALERT("Starting-Getting Modules Menu titles got")
	If ($_l_MenuNumber>0)
		If (Size of array:C274(<>Mod_at_ModuleName)>0)
			$_l_menuCount:=Count menus:C404(<>MenuProc)
			If ($_l_menuCount>=$_l_MenuNumber)
				$_l_menuCountItems:=Count menu items:C405($_l_MenuNumber; <>MenuProc)
				ARRAY TEXT:C222($_at_ProcessNames; $_l_menuCountItems)
				$_l_CurrentRow:=0
				For ($_l_ItemsIndex; 1; $_l_menuCountItems)
					$_t_ItemName:=Get menu item:C422($_l_MenuNumber; $_l_ItemsIndex; <>MenuProc)
					If ($_t_ItemName="-")
						$_l_ItemsIndex:=99999
					Else 
						$_l_CurrentRow:=$_l_CurrentRow+1
						If ($_t_ItemName="Word Processor")
							$_t_ItemName:="Word Processing"
						End if 
						If ($_t_ItemName="General Ledger")
							$_t_ItemName:="Nominal Ledger"
						End if 
						$_at_ProcessNames{$_l_CurrentRow}:=$_t_ItemName
						
					End if 
					
				End for 
				
				ARRAY TEXT:C222(GEN_at_ContextualMenuItems; 100)
				ARRAY TEXT:C222(GEN_at_ContextualMenuItemFunt; 100)
				$_l_CurrentRow:=0
				For ($_l_ItemsIndex; 1; Size of array:C274($_at_ProcessNames))
					If ($_at_ProcessNames{$_l_ItemsIndex}="Nominal Ledger")
						$_l_ModuleRow:=Find in array:C230(<>Mod_at_ModuleName; "General Ledger")
					Else 
						
						If ($_at_ProcessNames{$_l_ItemsIndex}="Communications")
							$_l_ModuleRow:=Find in array:C230(<>Mod_at_ModuleName; "Remote access")
						Else 
							$_l_ModuleRow:=Find in array:C230(<>Mod_at_ModuleName; $_at_ProcessNames{$_l_ItemsIndex})
						End if 
					End if 
					
					If ($_l_ModuleRow>0)
						//For ($_l_ItemsIndex;1;Size of array(◊aMod)
						
						If ($_l_ModuleRow<=Size of array:C274(DB_aI_aMod)) & ($_l_ModuleRow<=Size of array:C274(<>Mod_at_ProcessFunction))
							If (DB_aI_aMod{$_l_ModuleRow}>=2)
								$_l_CurrentRow:=$_l_CurrentRow+1
								GEN_at_ContextualMenuItems{$_l_CurrentRow}:=$_at_ProcessNames{$_l_ItemsIndex}
								GEN_at_ContextualMenuItemFunt{$_l_CurrentRow}:=<>Mod_at_ProcessFunction{$_l_ModuleRow}
							End if 
						Else 
							GEN_at_ContextualMenuItems{$_l_CurrentRow}:=""
							GEN_at_ContextualMenuItemFunt{$_l_CurrentRow}:=""
						End if 
						
					End if 
				End for 
				ARRAY TEXT:C222(GEN_at_ContextualMenuItems; $_l_CurrentRow)
				ARRAY TEXT:C222(GEN_at_ContextualMenuItemFunt; $_l_CurrentRow)
				Gen_bo_ContextualMenuinit:=True:C214
			End if 
		End if 
		
	End if 
	//ALERT("Starting-Getting Modules Got")
	
End if 
CLEAR SEMAPHORE:C144("$GettingModules")
//ERR_MethodTrackerReturn ("GEN_GetModules";$_t_oldMethodName)

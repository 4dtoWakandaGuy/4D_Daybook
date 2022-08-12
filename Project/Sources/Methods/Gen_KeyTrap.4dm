//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_KeyTrap
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Additional; 0)
	//ARRAY TEXT(GEN_at_ContextualMenuItemFunt;0)
	//ARRAY TEXT(GEN_at_ContextualMenuItems;0)
	C_BOOLEAN:C305(<>MenuFront; <>MOD_bo_ModuleSelected)
	C_LONGINT:C283(<>MenuProc; $_l_Break; $_l_Index; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_PopupSelected; Trap1ST)
	C_TEXT:C284(<>MOD_t_ModuleExecute; $_t_ExecuteMethodName; $_t_oldMethodName; $_t_oldMethodName2; $_t_PopupMenu; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Gen_KeyTrap")

// MY SPEED MENU project method
If (True:C214)
	If (<>MenuProc=0)
		<>MenuProc:=1
	End if 
	DB_t_CurrentFormUsage:=""
	If (Trap1ST=0)
		//GEN_GetModules 
		
		
		Trap1St:=1
	End if 
	
	GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
	If (Macintosh control down:C544 | ($_l_MouseButton=2))
		If (False:C215)
			$_t_PopupMenu:="About this database...<I;(-!"
		Else 
			$_t_PopupMenu:=""
		End if 
		For ($_l_Index; 1; Size of array:C274(GEN_at_ContextualMenuItems))
			$_t_PopupMenu:=$_t_PopupMenu+";"+GEN_at_ContextualMenuItems{$_l_Index}
		End for 
		$_l_Break:=Size of array:C274(GEN_at_ContextualMenuItems)
		$_t_PopupMenu:=$_t_PopupMenu+";(-;"+"Functions Palette"+";"+"Volumes Palette"+";"+"Macros Palette"+";"+"Data Lists Palette"+";"+"Windows Palette"  //bsw 17/08/04 Processes Palette
		ARRAY TEXT:C222($_at_Additional; 3)
		
		$_at_Additional{1}:="ZMenu_ModBar2"
		$_at_Additional{2}:="SCPT_LaunchPalette"
		$_at_Additional{3}:="Gen_ListSet"
		//$_at_Additional{5}:="ProcessesP "
		$_l_PopupSelected:=Pop up menu:C542($_t_PopupMenu)
		Case of 
			: ($_l_PopupSelected=0)
				// Display Information
			: ($_l_PopupSelected>=1) & ($_l_PopupSelected<=$_l_Break)
				BRING TO FRONT:C326(<>MenuProc)
				<>MenuFront:=True:C214
				//$_t_oldMethodName2:=ERR_MethodTracker ("Execute: "+GEN_at_ContextualMenuItemFunt{$_l_PopupSelected})
				//EXECUTE FORMULA(GEN_at_ContextualMenuItemFunt{$_l_PopupSelected})
				$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace(GEN_at_ContextualMenuItemFunt{$_l_PopupSelected})
				EXECUTE METHOD:C1007($_t_ExecuteMethodName)
				<>MOD_bo_ModuleSelected:=True:C214
				<>MOD_t_ModuleExecute:=GEN_at_ContextualMenuItemFunt{$_l_PopupSelected}
			: ($_l_PopupSelected>($_l_Break+1))
				$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$_at_Additional{($_l_PopupSelected-$_l_Break)-1})
				//EXECUTE FORMULA($_at_Additional{($_l_PopupSelected-$_l_Break)-1})
				$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($_at_Additional{($_l_PopupSelected-$_l_Break)-1})
				EXECUTE METHOD:C1007($_t_ExecuteMethodName)
				
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("Gen_KeyTrap"; $_t_oldMethodName)
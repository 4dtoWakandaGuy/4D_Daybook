//%attributes = {}
If (False:C215)
	//Project Method Name:      BAR_ButtonMethod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/05/2010 10:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(<>MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	C_LONGINT:C283($_l_ButtonNumber; $_l_CallBackProcess; $_l_MenuBarNumber; $_l_ModuleProc; $_l_ModuleRow; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $1; $3; ModuleNumber)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName; $_t_PopupString; $_t_ProcessName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BAR_t_ButtonMethod")
If (Count parameters:C259>=1)
	//TRACE
	$_l_ButtonNumber:=$1
	If ($_l_ButtonNumber>1)
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
		ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
		$_l_ModuleRow:=Find in array:C230(<>MOD_al_ModuleBarNum; ModuleNumber)
		//Now buld the 'pop-up' from the menu bar for that module
		If (Count parameters:C259<2)
			$_l_MenuBarNumber:=<>MOD_al_ModuleBarNum{$_l_ModuleRow}
		Else 
			$_l_MenuBarNumber:=$2->{$_l_ModuleRow}
		End if 
		If (Count parameters:C259>=3)
			$_l_ModuleProc:=$3
		End if 
		$_t_ProcessName:=<>Mod_at_ProcessFunction{$_l_MenuBarNumber}
		Menu_ModBarButt($_l_ModuleRow+1)
		//TRACE
		
		$_t_PopupString:=Modules_PopMenuBuild($_t_ProcessName)
		$_l_CallBackProcess:=Current process:C322
		$_l_ModuleRow:=New process:C317("BAR_DisplayPopUp"; 256000; $_t_ProcessName; $_l_CallBackProcess; $_l_ButtonNumber; $_l_MouseX; $_l_MouseY; $_t_PopupString)
		BRING TO FRONT:C326($_l_ModuleRow)
	End if 
End if 
ERR_MethodTrackerReturn("BAR_t_ButtonMethod"; $_t_oldMethodName)
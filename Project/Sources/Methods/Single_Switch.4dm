//%attributes = {}
If (False:C215)
	//Project Method Name:      Single_Switch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	C_BOOLEAN:C305(<>OneEntry)
	C_LONGINT:C283(<>BAR; <>MENU_l_BarModule; <>MenuProc; $_l_ProcessNumber; $2)
	C_TEXT:C284($_t_MenuName; $_t_oldMethodName; $_t_oldMethodName2; $1)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Single_Switch")

If (<>MenuProc=0)
	<>MenuProc:=1
End if 
Menu_Record("Single Switch"; "Batch Entry")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (Count parameters:C259>=1)
	$_t_MenuName:=$1
Else 
	$_t_MenuName:=Get localized string:C991("Menu_File")
End if 
If (Count parameters:C259>=2)
	$_l_ProcessNumber:=$2
Else 
	$_l_ProcessNumber:=<>MenuProc
End if 


If (<>OneEntry)
	<>OneEntry:=False:C215
	DB_MenuAction($_t_MenuName; Get localized string:C991("MenuItem_BatchEntry"); 4; ""; $_l_ProcessNumber; False:C215)
	If (Is Windows:C1573)  //needed to force it to turn the check off
		
		If (<>MENU_l_BarModule<=Size of array:C274(<>Mod_at_ProcessFunction))
			If (<>Mod_at_ProcessFunction{<>MENU_l_BarModule}#"")
				<>Bar:=0
				$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
				EXECUTE FORMULA:C63(<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
			End if 
		End if 
		
	Else 
		
		
	End if 
Else 
	<>OneEntry:=True:C214
	If (Is Windows:C1573)  //needed to force it to turn the check off
		DB_MenuAction($_t_MenuName; Get localized string:C991("MenuItem_BatchEntry"); 4; "18"; $_l_ProcessNumber; False:C215)
		
		If (<>MENU_l_BarModule<=Size of array:C274(<>Mod_at_ProcessFunction))
			If (<>Mod_at_ProcessFunction{<>MENU_l_BarModule}#"")
				<>Bar:=0
				$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
				EXECUTE FORMULA:C63(<>Mod_at_ProcessFunction{<>MENU_l_BarModule})
			End if 
		End if 
		
	Else 
		DB_MenuAction($_t_MenuName; Get localized string:C991("MenuItem_BatchEntry"); 4; "18"; $_l_ProcessNumber; False:C215)
		
	End if 
End if 
ERR_MethodTrackerReturn("Single_Switch"; $_t_oldMethodName)

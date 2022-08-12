//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_PlayExec
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
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_BracketPosition)
	C_TEXT:C284($_t_oldMethodName; $_t_oldMethodName2; $_t_Parameter1; $1; vMTitle3)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Record_PlayExec")

//Record_PlayExec
If (Count parameters:C259>=1)
	$_t_Parameter1:=$1
	If ($_t_Parameter1="@◊aMod{@") | ($_t_Parameter1="@<>Mod_al_ModuleAccessType{@")
		$0:=False:C215
		Gen_Alert("You are not allowed to Execute a statement containing the ◊aMod array"; "Sorry")
	Else 
		
		$0:=True:C214
	End if 
Else 
	$_l_BracketPosition:=Position:C15("("; vMTitle3)
	If ($_l_BracketPosition>0)
		$_t_Parameter1:=Substring:C12(vMTitle3; $_l_BracketPosition+1; Length:C16(vMTitle3)-$_l_BracketPosition-1)
		
		If ($_t_Parameter1#"")
			If ($_t_Parameter1="@◊aMod{@") | ($_t_Parameter1="@<>Mod_al_ModuleAccessType{@")
				Gen_Alert("You are not allowed to Execute a statement containing the ◊aMod array"; "Sorry")
			Else 
				$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$_t_Parameter1)
				EXECUTE FORMULA:C63($_t_Parameter1)
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Record_PlayExec"; $_t_oldMethodName)

//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_OpGen
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Type)
	C_POINTER:C301($_ptr_FocusObject)
	C_TEXT:C284($_t_oldMethodName; $_t_Single; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_OpGen")

$_ptr_FocusObject:=Focus object:C278
$_l_Type:=Type:C295($_ptr_FocusObject->)
If (($_l_Type=0) | ($_l_Type=2) | ($_l_Type=24))
	If (Substring:C12($_ptr_FocusObject->; 2; 1)="=")
		$_ptr_FocusObject->:=$1+Substring:C12($_ptr_FocusObject->; 3; 32000)
	Else 
		$_t_Single:=Substring:C12($_ptr_FocusObject->; 1; 1)
		If (($_t_Single="=") | ($_t_Single=">") | ($_t_Single="<") | ($_t_Single="#") | (Character code:C91($_t_Single)=64))
			$_ptr_FocusObject->:=$1+Substring:C12($_ptr_FocusObject->; 2; 32000)
		Else 
			$_ptr_FocusObject->:=$1+$_ptr_FocusObject->
		End if 
	End if 
Else 
	Gen_Alert("This Function can only be used for text fields"; "Cancel")
End if 
ERR_MethodTrackerReturn("Sel_OpGen"; $_t_oldMethodName)

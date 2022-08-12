//%attributes = {}
If (False:C215)
	//Project Method Name:      Edit_Pass
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Edit_Pass")
vText:=Gen_Request("Change "+Current user:C182+" Password to:")
If (OK=1)
	Are_You_Sure
	If (OK=1)
		If (vText="")
			Gen_Confirm("You specified a blank Password.  Are you really sure?"; "No"; "Yes")
			If (OK=0)
				OK:=1
			Else 
				OK:=0
			End if 
		End if 
		If (OK=1)
			CHANGE PASSWORD:C186(vText)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Edit_Pass"; $_t_oldMethodName)

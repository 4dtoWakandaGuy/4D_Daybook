//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      QuickAdd InCan
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
	C_LONGINT:C283(vAct2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QuickAdd InCan")
If (vAct2>1)
	Gen_Confirm("Are you sure you want to Cancel "+String:C10(vAct2)+" Items?"; "Try again"; "Cancel")
	If (OK=0)
		CANCEL:C270
	End if 
Else 
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("QuickAdd InCan"; $_t_oldMethodName)
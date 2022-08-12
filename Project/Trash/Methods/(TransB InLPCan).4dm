//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      TransB_InLPCan
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
	C_LONGINT:C283(vAdd)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB_InLPCan")
If (vAdd=1)
	Gen_Confirm("Are you sure you want to Cancel this Batch?"; "Keep it"; "Cancel")
	If (OK=0)
		CANCEL:C270
	End if 
Else 
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("TransB_InLPCan"; $_t_oldMethodName)
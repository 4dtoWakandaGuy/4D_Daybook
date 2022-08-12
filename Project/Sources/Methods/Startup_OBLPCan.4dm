//%attributes = {}
If (False:C215)
	//Project Method Name:      Startup_OBLPCan
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
	//C_UNKNOWN(a01Stri1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Startup_OBLPCan")
If (Size of array:C274(a01Stri1)>0)
	Gen_Confirm("Are you sure you want to Cancel all of the Opening Balances"+" typed in to date?"; "Keep them"; "Cancel")
	If (OK=0)
		CANCEL:C270
	End if 
Else 
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("Startup_OBLPCan"; $_t_oldMethodName)
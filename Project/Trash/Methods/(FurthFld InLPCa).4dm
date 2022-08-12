//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      FurthFld_InLPCa
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
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFld_InLPCa")
If (DB_bo_RecordModified)
	Gen_Confirm("Are you sure you want to Cancel all changes made to the Further Fields?"; "Keep them"; "Cancel")
	If (OK=0)
		CANCEL:C270
	End if 
Else 
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("FurthFld_InLPCa"; $_t_oldMethodName)
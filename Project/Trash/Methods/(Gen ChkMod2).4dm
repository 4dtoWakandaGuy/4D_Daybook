//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen ChkMod2
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
	C_BOOLEAN:C305(vMod2; DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen ChkMod2")
If ((vMod2=False:C215) & (DB_bo_RecordModified=True:C214))
	vMod2:=True:C214
End if 
If ((vMod2=True:C214) & (DB_bo_RecordModified=False:C215))
	DB_bo_RecordModified:=True:C214
End if 
ERR_MethodTrackerReturn("Gen ChkMod2"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_PP2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283(vAdd; vAdd2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_PP2")
//Gen_PP2
USE NAMED SELECTION:C332($1)
CLEAR NAMED SELECTION:C333($1)
//OUTPUT LAYOUT("Attendees Out")
vAdd:=vAdd2
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("Gen_PP2"; $_t_oldMethodName)
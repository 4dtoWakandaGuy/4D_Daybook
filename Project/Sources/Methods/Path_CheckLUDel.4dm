//%attributes = {}
If (False:C215)
	//Project Method Name:      Path_CheckLUDel
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Path_CheckLUDel")
READ WRITE:C146([LICENCE_UPDATES:97])
ALL RECORDS:C47([LICENCE_UPDATES:97])
DELETE SELECTION:C66([LICENCE_UPDATES:97])
READ ONLY:C145([LICENCE_UPDATES:97])
ERR_MethodTrackerReturn("Path_CheckLUDel"; $_t_oldMethodName)
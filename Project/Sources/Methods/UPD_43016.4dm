//%attributes = {}
If (False:C215)
	//Project Method Name:      UPD_43016
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

$_t_oldMethodName:=ERR_MethodTracker("UPD_43016")
//this need to run when updating to V4.3.016
//in this the CONTACTS has had an X_ID field added
//this is a numeric ID for the record
READ WRITE:C146([CONTACTS:1])

ALL RECORDS:C47([CONTACTS:1])
DB_lockFile(->[CONTACTS:1])
APPLY TO SELECTION:C70([CONTACTS:1]; [CONTACTS:1]x_ID:33:=AA_GetNextIDinMethod(->[CONTACTS:1]x_ID:33))

AA_CheckFileUnlockedByTableNUM(Table:C252(->[CONTACTS:1]))
//now we can update the [qualities]
ALL RECORDS:C47([INFORMATION:55])
//at this point they all relate to contacts!
ERR_MethodTrackerReturn("UPD_43016"; $_t_oldMethodName)
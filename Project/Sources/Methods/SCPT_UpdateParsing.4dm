//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_UpdateParsing
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/08/2012 20:02
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

$_t_oldMethodName:=ERR_MethodTracker("SCPT_UpdateParsing")

MESSAGES OFF:C175
READ WRITE:C146([SCRIPTS:80])
QUERY BY FORMULA:C48([SCRIPTS:80]; [SCRIPTS:80]ParsedStamp:24<([SCRIPTS:80]ModifiedStamp:23-100))
APPLY TO SELECTION:C70([SCRIPTS:80]; MACRO_ParseForCode([SCRIPTS:80]Script_Code:1; False:C215))
ERR_MethodTrackerReturn("SCPT_UpdateParsing"; $_t_oldMethodName)
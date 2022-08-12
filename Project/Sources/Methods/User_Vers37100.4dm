//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers37100
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/08/2012 18:34
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

$_t_oldMethodName:=ERR_MethodTracker("User_Vers37100")
User_Message(Char:C90(13)+"    Creating Project Record States")
READ WRITE:C146([TABLE_RECORD_STATES:90])
States_Create("10"; "Provisional"; 89; "08910"; "PROVISIONAL PROJECT"; "Prov")
States_Create("20"; "Confirmed"; 89; "08920"; "CONFIRMED PROJECT"; "Conf")
States_Create("30"; "Current"; 89; "08930"; "CURRENT PROJECT"; "Curr")
States_Create("40"; "Completed"; 89; "08940"; "COMPLETED PROJECT"; "Comp")
READ ONLY:C145([TABLE_RECORD_STATES:90])
UNLOAD RECORD:C212([TABLE_RECORD_STATES:90])

READ WRITE:C146([CODE_USES:91])
QUERY:C277([JOB_TYPES:65]; [JOB_TYPES:65]Type_Code:1#"")
FIRST RECORD:C50([JOB_TYPES:65])
While (Not:C34(End selection:C36([JOB_TYPES:65])))
	Gen_CUCreate("065"+[JOB_TYPES:65]Type_Code:1; 1)
	Gen_CUCreate("065"+[JOB_TYPES:65]Type_Code:1; 2)
	Gen_CUCreate("065"+[JOB_TYPES:65]Type_Code:1; 3)
	Gen_CUCreate("065"+[JOB_TYPES:65]Type_Code:1; 4)
	NEXT RECORD:C51([JOB_TYPES:65])
End while 
READ ONLY:C145([CODE_USES:91])
UNLOAD RECORD:C212([CODE_USES:91])
ERR_MethodTrackerReturn("User_Vers37100"; $_t_oldMethodName)
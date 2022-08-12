//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers37105
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

$_t_oldMethodName:=ERR_MethodTracker("User_Vers37105")
READ WRITE:C146([TABLE_RECORD_STATES:90])
READ WRITE:C146([CODE_USES:91])
READ WRITE:C146([JOBS:26])
User_Message(Char:C90(13)+"    Creating Jobs Record States")

States_Create("10"; "Provisional"; 26; "02610"; "PROVISIONAL JOB"; "Prov")
QUERY:C277([JOBS:26]; [JOBS:26]State:9="0")
Gen_AppToSel(->[JOBS:26]; ->[JOBS:26]State:9; "02610")
Gen_CUCreate("09002610"; 18)

States_Create("20"; "Confirmed"; 26; "02620"; "CONFIRMED JOB"; "Conf")
Gen_CUCreate("09002620"; 1)
Gen_CUCreate("09002620"; 7)
Gen_CUCreate("09002620"; 8)
Gen_CUCreate("09002620"; 9)
Gen_CUCreate("09002620"; 12)

States_Create("30"; "Current"; 26; "02630"; "CURRENT JOB"; "Curr")
QUERY:C277([JOBS:26]; [JOBS:26]State:9="1")
Gen_AppToSel(->[JOBS:26]; ->[JOBS:26]State:9; "02630")
Gen_CUCreate("09002630"; 2)
Gen_CUCreate("09002630"; 4)
Gen_CUCreate("09002630"; 5)
Gen_CUCreate("09002630"; 6)
Gen_CUCreate("09002630"; 7)
Gen_CUCreate("09002630"; 8)
Gen_CUCreate("09002630"; 9)
Gen_CUCreate("09002630"; 10)
Gen_CUCreate("09002630"; 11)
Gen_CUCreate("09002630"; 12)

States_Create("40"; "Completed"; 26; "02640"; "COMPLETED JOB"; "Comp")
QUERY:C277([JOBS:26]; [JOBS:26]State:9="2")
Gen_AppToSel(->[JOBS:26]; ->[JOBS:26]State:9; "02640")
Gen_CUCreate("09002640"; 9)
Gen_CUCreate("09002640"; 11)
Gen_CUCreate("09002640"; 12)

States_Create("50"; "Cancelled"; 26; "02650"; "CANCELLED JOB"; "Canc")
QUERY:C277([JOBS:26]; [JOBS:26]State:9="-1")
Gen_AppToSel(->[JOBS:26]; ->[JOBS:26]State:9; "02650")
Gen_CUCreate("09002650"; 9)
Gen_CUCreate("09002650"; 12)
Gen_CUCreate("09002650"; 15)
Gen_CUCreate("09002650"; 16)
Gen_CUCreate("09002650"; 17)

READ ONLY:C145([TABLE_RECORD_STATES:90])
READ ONLY:C145([CODE_USES:91])
READ ONLY:C145([JOBS:26])
UNLOAD RECORD:C212([TABLE_RECORD_STATES:90])
UNLOAD RECORD:C212([CODE_USES:91])
UNLOAD RECORD:C212([JOBS:26])
ERR_MethodTrackerReturn("User_Vers37105"; $_t_oldMethodName)
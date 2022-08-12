//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_InLPM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_InLPM")
[COMPANIES:2]Modified_Date:32:=<>DB_d_CurrentDate
[COMPANIES:2]Export:33:=Export_Stamp3([COMPANIES:2]Export:33)
DB_bo_RecordModified:=True:C214
Gen_FindVars
ERR_MethodTrackerReturn("Companies_InLPM"; $_t_oldMethodName)
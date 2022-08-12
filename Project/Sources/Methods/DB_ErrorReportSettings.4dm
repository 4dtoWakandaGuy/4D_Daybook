//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ErrorReportSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 12:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>DB_bo_ErrorSettingsInited)
	C_TEXT:C284(<>DB_t_ErrorReportAddress; <>DB_t_ErrorReportPerson; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ErrorReportSettings")
If (Not:C34(<>DB_bo_ErrorSettingsInited))
	<>DB_t_ErrorReportPerson:="Nigel Greenlee"  // email error reports sent to this person
	<>DB_t_ErrorReportAddress:="nigel.greenlee@btinternet.com"  // 22/04/02 pb
	<>DB_bo_ErrorSettingsInited:=True:C214
End if 
ERR_MethodTrackerReturn("DB_ErrorReportSettings"; $_t_oldMethodName)
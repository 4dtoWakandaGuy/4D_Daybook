If (False:C215)
	//Project Form Method Name: REP_ReportSelector
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; REP_l_Context)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM REP_ReportSelector"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		If (REP_l_Context>0)
			//we want the Super-reports for this context
			//we want the quick reports STORED for this context
			//we want the standard reports for this context
			//we want macros of report class for this context
			//Case of
			//z: ($0
		End if 
End case 
ERR_MethodTrackerReturn("FM REP_ReportSelector"; $_t_oldMethodName)

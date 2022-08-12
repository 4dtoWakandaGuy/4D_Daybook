//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_REP_SetReportSorts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/01/2012 12:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_ShowSorts)
	C_LONGINT:C283(DB_l_ReportType)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_REP_SetReportSorts")

Case of 
	: (DB_l_ReportType=SuperReportReport Template)
		//[DOCUMENTS]Options:=String(DB_l_CurrentReportSortTable)+":"+String(DB_l_CurrentReportSortFIeld)
		
	: (DB_l_ReportType=SuperWrite Report Template)
		DB_bo_ShowSorts:=True:C214
		DBQR_ShowSortColumns
		
		
End case 
ERR_MethodTrackerReturn("DB_REP_SetReportSorts"; $_t_oldMethodName)
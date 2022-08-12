If (False:C215)
	//object Name: [EW_ExportProjects]Entry.Checkbox1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(EW_at_TimePeriods;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.Checkbox1"; Form event code:C388)
If ([EW_ExportProjects:117]AutoRun:3)
	Case of 
		: ([EW_ExportSteps:118]WhatDataToExport:4="current selection")
			//     ALERT("You cannot export the current selection of records automatically. "+
			Gen_Alert("You cannot export the current selection of records automatically. "+"Please select another data selection option.")
			[EW_ExportProjects:117]AutoRun:3:=False:C215
			FORM GOTO PAGE:C247(2)
			
		Else 
			[EW_ExportProjects:117]AutoRunPeriod:4:=1
			[EW_ExportProjects:117]AutoRunPeriodType:5:=EW_at_TimePeriods{Find in array:C230(EW_at_TimePeriods; "days")}
			EW_at_TimePeriods:=Find in array:C230(EW_at_TimePeriods; "days")
			[EW_ExportProjects:117]NextRunDate:6:=Current date:C33(*)+1
			[EW_ExportProjects:117]NextRuntime:8:=Current time:C178(*)
			[EW_ExportProjects:117]ErrorReportHandling:21:="1000"
	End case 
Else 
	[EW_ExportProjects:117]AutoRunPeriod:4:=0
	[EW_ExportProjects:117]AutoRunPeriodType:5:=""
	[EW_ExportProjects:117]NextRunDate:6:=!00-00-00!
	[EW_ExportProjects:117]NextRuntime:8:=?00:00:00?
	[EW_ExportProjects:117]ErrorReportHandling:21:="0000"
End if 
EW_HideShowObjects
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.Checkbox1"; $_t_oldMethodName)

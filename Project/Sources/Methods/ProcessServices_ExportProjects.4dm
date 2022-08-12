//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessServices_ExportProjects
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
	C_BOOLEAN:C305(yFatalError)
	C_LONGINT:C283($_l_Index; $_l_MonthOf)
	C_TEXT:C284($_t_HourName; $_t_MinutesPastHour; $_t_oldMethodName; $_t_SMSmessage; $_t_Text; tErrorMsg)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessServices_ExportProjects")
// processServices_ExportProjects
// Runs Exports at specified date/time
// 11/09/02 pb

For ($_l_Index; 1; Records in selection:C76([EW_ExportProjects:117]))
	//  If ([EW_ExportProjects]ErrorMessage="")
	If ([EW_ExportProjects:117]FatalError:26=False:C215)
		EW_ExportNow([EW_ExportProjects:117]RecordNumber:2; "S")
		If (tErrorMsg="")  // the export was concluded OK
			$_t_MinutesPastHour:=String:C10(([EW_ExportProjects:117]NextRuntime:8\60)%60)
			Case of 
				: ([EW_ExportProjects:117]AutoRunPeriod:4=1)  // hours
					If (Current time:C178(*)>?23:00:00?)
						[EW_ExportProjects:117]NextRunDate:6:=Add to date:C393(Current date:C33(*); 0; 0; 1)
						[EW_ExportProjects:117]NextRuntime:8:=Time:C179("00:"+$_t_MinutesPastHour+":00")
					Else 
						$_t_HourName:=String:C10((Current time:C178(*)\3600)+[EW_ExportProjects:117]AutoRunPeriod:4)
						[EW_ExportProjects:117]NextRuntime:8:=Time:C179($_t_HourName+":"+$_t_MinutesPastHour+":00")
					End if 
					
				: ([EW_ExportProjects:117]AutoRunPeriod:4=2)  // days
					[EW_ExportProjects:117]NextRunDate:6:=Add to date:C393(Current date:C33(*); 0; 0; 1)
					
				: ([EW_ExportProjects:117]AutoRunPeriod:4=3)  // weeks
					[EW_ExportProjects:117]NextRunDate:6:=Add to date:C393(Current date:C33(*); 0; 0; 7)
					
				: ([EW_ExportProjects:117]AutoRunPeriod:4=4)  // months
					$_l_MonthOf:=Month of:C24([EW_ExportProjects:117]NextRunDate:6)
					Case of 
						: ($_l_MonthOf=1) | ($_l_MonthOf=3) | ($_l_MonthOf=5) | ($_l_MonthOf=7) | ($_l_MonthOf=8) | ($_l_MonthOf=10) | ($_l_MonthOf=12)  // 31 days
							[EW_ExportProjects:117]NextRunDate:6:=Add to date:C393(Current date:C33(*); 0; 0; 31)
						: ($_l_MonthOf=9) | ($_l_MonthOf=4) | ($_l_MonthOf=6) | ($_l_MonthOf=11)  //30 days
							[EW_ExportProjects:117]NextRunDate:6:=Add to date:C393(Current date:C33(*); 0; 0; 30)
						: (IsALeapYear(Current date:C33(*)))
							[EW_ExportProjects:117]NextRunDate:6:=Add to date:C393(Current date:C33(*); 0; 0; 29)
						Else 
							[EW_ExportProjects:117]NextRunDate:6:=Add to date:C393(Current date:C33(*); 0; 0; 28)
					End case 
			End case 
			[EW_ExportProjects:117]NextRunDate:6:=[EW_ExportProjects:117]NextRunDate:6
			If ([EW_ExportProjects:117]ErrorReportHandling:21[[1]]="2")  // send success report
				$_t_Text:="Date: "+String:C10(Current date:C33(*))+Char:C90(13)+"Time: "+String:C10(Current time:C178(*))+Char:C90(13)
				$_t_Text:=$_t_Text+Char:C90(13)+"DayBook reported that the automated Data Export "
				$_t_Text:=$_t_Text+Char:C90(34)+[EW_ExportProjects:117]ProjectName:1+Char:C90(34)+" was successfully completed."+Char:C90(13)
				$_t_SMSmessage:="DayBook Data Export message:"+Char:C90(13)+"The automated Data Export "+Char:C90(34)+[EW_ExportProjects:117]ProjectName:1+Char:C90(34)
				$_t_SMSmessage:=$_t_SMSmessage+" was successfully completed."
				EW_ResultReport([EW_ExportProjects:117]ErrorReportHandling:21; $_t_SMSmessage; $_t_Text; True:C214)
			End if   // errpr reports
		Else   // there was some problem or other
			[EW_ExportProjects:117]ErrorMessage:17:=tErrorMsg+Char:C90(13)
			If ([EW_ExportProjects:117]ErrorReportHandling:21[[1]]#"0")
				$_t_Text:="Date: "+String:C10(Current date:C33(*))+Char:C90(13)+"Time: "+String:C10(Current time:C178(*))+Char:C90(13)
				$_t_Text:=$_t_Text+Char:C90(13)+"DayBook reported the following error whilst attempting to complete "+"the automated Data Export "
				$_t_Text:=$_t_Text+Char:C90(34)+[EW_ExportProjects:117]ProjectName:1+Char:C90(34)+":"+Char:C90(13)+Char:C90(13)+tErrorMsg+Char:C90(13)+Char:C90(13)
				If (yFatalError)
					[EW_ExportProjects:117]FatalError:26:=True:C214
					$_t_Text:=$_t_Text+"Please note that no further attempts will be made to run this Data Export "+"until the error is fixed."+Char:C90(13)
					$_t_Text:=$_t_Text+"After the error has been fixed, please open up the Export Project, go to the "+"Auto Run tab,  and click the Clear button to clear the error message."+Char:C90(13)
				Else 
					$_t_Text:=$_t_Text+"The error was not fatal but some data may be missing."
				End if 
				$_t_SMSmessage:="Daybook error message:"+Char:C90(13)+"Could not complete automated Data Export: "+[EW_ExportProjects:117]ProjectName:1
				EW_ResultReport([EW_ExportProjects:117]ErrorReportHandling:21; $_t_SMSmessage; $_t_Text; False:C215)
			End if   // errpr reports
		End if 
		If (yFatalError=False:C215)
			[EW_ExportProjects:117]LastRunDate:28:=Current date:C33(*)
			[EW_ExportProjects:117]LastRunTime:29:=Current time:C178(*)
		End if 
		DB_SaveRecord(->[EW_ExportProjects:117])
	End if 
	NEXT RECORD:C51([EW_ExportProjects:117])
End for 
ERR_MethodTrackerReturn("ProcessServices_ExportProjects"; $_t_oldMethodName)

//Variable Declarations
If (True:C214)
	C_REAL:C285(iLoc)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.AutoReportPop-up/Drop-down List"; Form event code:C388)
Case of 
		
	: (Self:C308-><1)
		iLoc:=Find in array:C230(Self:C308->; [EW_ExportProjects:117]ErrorReportDiaryName:20)
		If (iLoc>0)
			Self:C308->:=iLoc
		Else 
			Self:C308->:=1
			[EW_ExportProjects:117]ErrorReportDiaryName:20:=Self:C308->{Self:C308->}
		End if 
		
	Else   // Ok
		[EW_ExportProjects:117]ErrorReportDiaryName:20:=Self:C308->{Self:C308->}
End case 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.AutoReportPop-up/Drop-down List"; $_t_oldMethodName)

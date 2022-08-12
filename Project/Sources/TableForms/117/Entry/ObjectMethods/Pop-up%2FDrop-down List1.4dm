//Variable Declarations
If (True:C214)
	C_REAL:C285(iLoc)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.Pop-up/Drop-down List1"; Form event code:C388)
Case of 
	: (Self:C308-><1)
		iLoc:=Find in array:C230(Self:C308->; [EW_ExportProjects:117]ConvertChars:11)
		If (iLoc>0)
			Self:C308->:=iLoc
		Else 
			Self:C308->:=1
			[EW_ExportProjects:117]ConvertChars:11:=Self:C308->{1}
		End if 
	Else 
		[EW_ExportProjects:117]ConvertChars:11:=Self:C308->{Self:C308->}
End case 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.Pop-up/Drop-down List1"; $_t_oldMethodName)

//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(EW_al_ExportTableNumbers;0)
	//ARRAY TEXT(EW_at_ControlExportTables;0)
	C_LONGINT:C283($_l_TableNumber)
	C_REAL:C285(iLoc)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.ex2Pop-up/Drop-down List1"; Form event code:C388)
Case of 
	: (Self:C308->=1) & ([EW_ExportSteps:118]BaseTablenumber:3=0)
		// "select a table"    -- do nothing
	: (Self:C308->=1) & ([EW_ExportSteps:118]BaseTablenumber:3>0)
		Self:C308->:=Find in array:C230(Self:C308->; [EW_ExportSteps:118]BaseTablenumber:3)
		
	: (Self:C308-><1)
		iLoc:=Find in array:C230(Self:C308->; [EW_ExportSteps:118]BaseTablenumber:3)
		If (iLoc>0)
			Self:C308->:=iLoc
		Else 
			Self:C308->:=1
			[EW_ExportSteps:118]BaseTablenumber:3:=EW_al_ExportTableNumbers{1}  // EW_al_DBTableNumbers
		End if 
		
	: (Size of array:C274(EW_at_ControlExportTables)=1)
		If (EW_at_ControlExportTables{1}=Self:C308->{Self:C308->})
			// just leave it as-is
		Else 
			//      $_l_TableNumber:=EW_al_ExportTableNumbers{EW_at_ExportTableNames}
			CONFIRM:C162("Are you sure you want to change the base table from "+EW_at_ControlExportTables{1}+" to "+Self:C308->{Self:C308->}+"?"; "No"; "Yes")
			If (OK=0)
				//       [EW_ExportSteps]BaseTablenumber:=$_l_TableNumber
				EW_ExportBKfieldArrays
				[EW_ExportTables:120]FileName:5:=Replace string:C233(Self:C308->{Self:C308->}; " "; "")+".txt"
			Else 
				Self:C308->:=Find in array:C230(EW_al_ExportTableNumbers; [EW_ExportSteps:118]BaseTablenumber:3)  // 2/12/02
			End if 
		End if 
		
	: (Size of array:C274(EW_at_ControlExportTables)>1)
		//    ALERT("If you want to change the base table, please delete the related table
		Gen_Alert("If you want to change the base table, please delete the related table"+" exports first.")
		
	Else   // Ok to select new table
		EW_ExportBKfieldArrays
		[EW_ExportTables:120]FileName:5:=Replace string:C233(Self:C308->{Self:C308->}; " "; "")+".txt"
End case 
EW_HideShowObjects
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.ex2Pop-up/Drop-down List1"; $_t_oldMethodName)

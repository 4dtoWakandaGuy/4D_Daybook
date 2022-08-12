//Variable Declarations
If (True:C214)
	//ARRAY TEXT(EW_at_aScriptNames;0)
	//ARRAY TEXT(EW_at_ScriptQueryCodes;0)
	//ARRAY TEXT(SM_at_ScriptNames;0)
	C_BOOLEAN:C305(EW_bo_ModifiedStep)
	C_LONGINT:C283($_l_SelectRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.selectPop-up/Drop-down List1"; Form event code:C388)
Case of 
	: (Self:C308-><1)
		$_l_SelectRow:=Find in array:C230(EW_at_ScriptQueryCodes; [EW_ExportSteps:118]MacroCode:7)
		If ($_l_SelectRow>0)
			Self:C308->:=$_l_SelectRow
		Else 
			Self:C308->:=1
			[EW_ExportSteps:118]MacroCode:7:=EW_at_ScriptQueryCodes{1}
		End if 
	Else 
		Case of 
			: (Self:C308->{Self:C308->}="Select by Macro") & (Size of array:C274(EW_at_aScriptNames)=0)
				//       ALERT("There are  no Data Export Macros_In the database.")
				Gen_Alert("There are  no Data Export Macros_In the database.")
				$_l_SelectRow:=Find in array:C230(Self:C308->; [EW_ExportSteps:118]WhatDataToExport:4)
				Self:C308->:=$_l_SelectRow
			Else 
				[EW_ExportSteps:118]WhatDataToExport:4:=Self:C308->{Self:C308->}
				If (Self:C308->{Self:C308->}="Select by Macro")
					[EW_ExportSteps:118]MacroCode:7:=EW_at_ScriptQueryCodes{1}
					SM_at_ScriptNames:=1
				End if 
				EW_bo_ModifiedStep:=True:C214
		End case 
End case 
EW_HideShowObjects
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.selectPop-up/Drop-down List1"; $_t_oldMethodName)

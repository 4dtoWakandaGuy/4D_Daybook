//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_HideShowObjects
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(EW_at_TimePeriods;0)
	//Array TEXT(EW_at_ControlExportTables;0)
	C_LONGINT:C283(cDiary; cEmail; cSMS; s1; s2; s3)
	C_TEXT:C284($_t_oldMethodName; tReplaceCharText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_HideShowObjects")
// EW_HideShowObjects
// 28/096/02 pb

If ([EW_ExportProjects:117]AutoRun:3)
	OBJECT SET VISIBLE:C603(*; "Auto@"; True:C214)
	If ([EW_ExportProjects:117]AutoRunPeriodType:5="")
		EW_at_TimePeriods:=1
		[EW_ExportProjects:117]AutoRunPeriodType:5:=EW_at_TimePeriods{1}
	Else 
		EW_at_TimePeriods:=Find in array:C230(EW_at_TimePeriods; [EW_ExportProjects:117]AutoRunPeriodType:5)
	End if 
Else 
	OBJECT SET VISIBLE:C603(*; "Auto@"; False:C215)
	EW_at_TimePeriods:=0
	[EW_ExportProjects:117]AutoRunPeriodType:5:=""
End if 

OBJECT SET VISIBLE:C603(*; "SetList"; False:C215)
OBJECT SET VISIBLE:C603(*; "MacroList"; False:C215)
Case of 
	: ([EW_ExportSteps:118]WhatDataToExport:4="Select by Macro")
		OBJECT SET VISIBLE:C603(*; "MacroList"; True:C214)
		
	: ([EW_ExportSteps:118]WhatDataToExport:4="saved set")  // 14/11/02
		OBJECT SET VISIBLE:C603(*; "SetList"; True:C214)
End case 

If ([EW_ExportSteps:118]BaseTablenumber:3=0)  // must be a new Export
	OBJECT SET VISIBLE:C603(*; "Ex@"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "Ex@"; True:C214)
End if 

If (Size of array:C274(EW_at_ControlExportTables)=0)
	OBJECT SET VISIBLE:C603(*; "DeleteButton"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "DeleteButton"; True:C214)
End if 

Case of 
	: ([EW_ExportProjects:117]RecordDelimiter:15="Return@")
		tReplaceCharText:="Replace embedded Return characters with:"
	: ([EW_ExportProjects:117]RecordDelimiter:15="Pipe@")
		tReplaceCharText:="Replace embedded Pipe characters with:"
	: ([EW_ExportProjects:117]RecordDelimiter:15="New Line@")
		tReplaceCharText:="Replace embedded New Line characters with:"
End case 

If ([EW_ExportProjects:117]AutoRun:3)
	OBJECT SET VISIBLE:C603(*; "Auto@"; True:C214)
	s1:=0
	s2:=0
	s3:=0
	Case of 
		: ([EW_ExportProjects:117]ErrorReportHandling:21[[1]]="0")  // no error reporting
			s1:=1
			OBJECT SET VISIBLE:C603(*; "AutoReport@"; False:C215)
		: ([EW_ExportProjects:117]ErrorReportHandling:21[[1]]="1")  // report errors
			s2:=1
			OBJECT SET VISIBLE:C603(*; "AutoReport@"; True:C214)
		: ([EW_ExportProjects:117]ErrorReportHandling:21[[1]]="2")  // report errors and completion
			s3:=1
			OBJECT SET VISIBLE:C603(*; "AutoReport@"; True:C214)
	End case 
	If ([EW_ExportProjects:117]ErrorReportHandling:21[[1]]#"0")
		If ([EW_ExportProjects:117]ErrorReportHandling:21[[2]]="1")
			cEmail:=1
		Else 
			cEmail:=0
		End if 
		If ([EW_ExportProjects:117]ErrorReportHandling:21[[3]]="1")
			cSMS:=1
		Else 
			cSMS:=0
		End if 
		If ([EW_ExportProjects:117]ErrorReportHandling:21[[4]]="1")
			cDiary:=1
		Else 
			cDiary:=0
		End if 
	End if 
Else 
	OBJECT SET VISIBLE:C603(*; "Auto@"; False:C215)
End if 

If ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")
	OBJECT SET VISIBLE:C603(*; "bk@"; True:C214)
	OBJECT SET VISIBLE:C603(*; "EX2@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "EXPlug-in Area2@"; False:C215)  // related tables area
	OBJECT SET VISIBLE:C603(*; "select@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "MacroList"; False:C215)
	//  SET VISIBLE(*;"EX1";False)
	//  SET VISIBLE(*;"EXSelectRbutton";False)
	//  SET VISIBLE(*;"EXModifyRbutton";False)
	//  Case of
	//    : ( •[EW_ExportSteps]BKExportTable• ="items") | ( •[EW_ExportSteps]BKExportT
	//     SET VISIBLE(*;"bkPics";True)
	//  Else
	//`     SET VISIBLE(*;"bkPics";False)
	// End case
Else 
	OBJECT SET VISIBLE:C603(*; "bk@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "EX2@"; True:C214)
	OBJECT SET VISIBLE:C603(*; "EXPlug-in Area2"; True:C214)  // related tables area
	OBJECT SET VISIBLE:C603(*; "select@"; True:C214)
	//  SET VISIBLE(*;"EX1";True)
	//  SET VISIBLE(*;"EXSelectRbutton";True)
	//  SET VISIBLE(*;"EXModifyRbutton";True)
End if 
ERR_MethodTrackerReturn("EW_HideShowObjects"; $_t_oldMethodName)
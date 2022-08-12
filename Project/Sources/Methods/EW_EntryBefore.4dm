//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_EntryBefore
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/10/2012 15:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(EW_abo_ExportByCollection;0)
	//ARRAY BOOLEAN(EW_lb_DataExports;0)
	//ARRAY INTEGER(EW_ai_ExportOrder;0)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY LONGINT(EW_al_DBTableNumbers;0)
	//ARRAY LONGINT(EW_al_ExportRecordNumbers;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	//ARRAY TEXT(EW_at_BKExportTable;0)
	//ARRAY TEXT(EW_at_CharacterConversion;0)
	//ARRAY TEXT(EW_at_ControlExportTables;0)
	//ARRAY TEXT(EW_at_DBTableNames;0)
	//ARRAY TEXT(EW_at_ExportFormats;0)
	//ARRAY TEXT(EW_at_Personnel;0)
	//ARRAY TEXT(EW_at_RecordDelimitOptions;0)
	//ARRAY TEXT(EW_at_TabControl;0)
	//ARRAY TEXT(EW_at_TimePeriods;0)
	//ARRAY TEXT(EW_at_WhatData;0)
	C_BOOLEAN:C305(EW_bo_ModifiedStep; yNewStep)
	C_LONGINT:C283($_l_FormEvent; $_l_index; $_l_Offset; DE_l_BUT1; DE_l_BUT2; EW_l_ExportProjectTable; r1; r2; r3; rselect)
	C_REAL:C285(OldTabControlEW)
	C_TEXT:C284($_t_oldMethodName; oDE_COL1; oDE_COL2; oDE_COL3; oDE_COL4; oDE_HED1; oDE_HED2; oDE_HED3; oDE_HED4; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_EntryBefore")
// EW_EntryBefore
// 10/09/02 pb
//If (Record number([EW_ExportProjects])=-3)  ` it's a new record
If (Is new record:C668([EW_ExportProjects:117]))  // 30/07/03 pb
	If (EW_l_ExportProjectTable>0)
		[EW_ExportProjects:117]ProjectPrimeTableNumber:39:=EW_l_ExportProjectTable
	End if 
	[EW_ExportProjects:117]RecordNumber:2:=Gen_RecordNumber(Table:C252(->[EW_ExportProjects:117]))
	[EW_ExportProjects:117]Exportformat:7:=EW_at_ExportFormats{1}
	[EW_ExportProjects:117]ConvertChars:11:="None"
	[EW_ExportProjects:117]RecordDelimiter:15:="Return (ASCII 13)"
	[EW_ExportProjects:117]DelimiterReplaceChar:16:=" "
	//  [EW_ExportProjects]IncludeParentRecordData:=True
	[EW_ExportProjects:117]ErrorReportHandling:21:="0000"
	[EW_ExportProjects:117]Exportformat:7:="Tab-Delimited Text File"
	[EW_ExportProjects:117]IncludefieldHeadings:10:=True:C214
	[EW_ExportProjects:117]ExportToSeparatefiles:14:=True:C214
	[EW_ExportProjects:117]IncludeParentRecordData:13:=False:C215
	[EW_ExportProjects:117]BKServerPort:23:=80
	[EW_ExportProjects:117]NonFatalErrorsAllowed:27:=5
	[EW_ExportProjects:117]BKTimeout:30:=5  // 5 seconds default 30/07/03 pb
	[EW_ExportProjects:117]BKMaxDuration:31:=10  // 30/07/03 pb
End if 
SET WINDOW TITLE:C213("Export Wizard: "+[EW_ExportProjects:117]ProjectName:1)
REDUCE SELECTION:C351([EW_StepActions:119]; 0)
rselect:=1
EW_DetailsArrays

vTitle:="Export Wizard"
EW_at_ExportFormats:=Find in array:C230(EW_at_ExportFormats; [EW_ExportProjects:117]Exportformat:7)
QUERY:C277([EW_ExportSteps:118]; [EW_ExportSteps:118]ProjectNumber:1=[EW_ExportProjects:117]RecordNumber:2)
SELECTION TO ARRAY:C260([EW_ExportSteps:118]Order:2; EW_ai_ExportOrder; [EW_ExportSteps:118]BaseTablenumber:3; EW_al_DBTableNumbers; [EW_ExportSteps:118]RecordNumber:6; EW_al_ExportRecordNumbers; [EW_ExportSteps:118]CatalogueExport:9; EW_abo_ExportByCollection)
ARRAY TEXT:C222(EW_at_DBTableNames; Size of array:C274(EW_al_DBTableNumbers))
For ($_l_index; 1; Size of array:C274(EW_al_DBTableNumbers))
	If (EW_abo_ExportByCollection{$_l_index}=True:C214)
		EW_at_DBTableNames{$_l_index}:="Catalogue"
	Else 
		EW_at_DBTableNames{$_l_index}:=Table name:C256(EW_al_DBTableNumbers{$_l_index})
	End if 
End for 
yNewStep:=False:C215  // must come before EW_FieldArrays!
SORT ARRAY:C229(EW_ai_ExportOrder; EW_at_DBTableNames; EW_al_ExportRecordNumbers; EW_al_DBTableNumbers)
OBJECT SET VISIBLE:C603(EW_al_ExportRecordNumbers; False:C215)
OBJECT SET VISIBLE:C603(EW_al_DBTableNumbers; False:C215)
//SET ENTERABLE(atOne;True)  ` or false!
//SET ENTERABLE(alTwo;True)
LB_SetupListbox(->EW_lb_DataExports; "oDE"; "DE_L"; 1; ->EW_ai_ExportOrder; ->EW_at_DBTableNames; ->EW_al_ExportRecordNumbers; ->EW_al_DBTableNumbers)
LB_SetColumnHeaders(->EW_lb_DataExports; "DE_L"; 1; "Order"; "Table")
LB_SetColumnWidths(->EW_lb_DataExports; "oDE"; 1; 150; 250)  // dont need to worry about the invisible ones
LB_SetScroll(->EW_lb_DataExports; -2; -2)

EW_at_WhatData:=Find in array:C230(EW_at_WhatData; [EW_ExportSteps:118]WhatDataToExport:4)
ARRAY TEXT:C222(EW_at_TabControl; 4)
EW_at_TabControl{1}:="Project"
EW_at_TabControl{2}:="Exports"
EW_at_TabControl{3}:="Auto Run"
EW_at_TabControl{4}:="Preferences"
EW_bo_ModifiedStep:=False:C215
EW_at_CharacterConversion:=Find in array:C230(EW_at_CharacterConversion; [EW_ExportProjects:117]ConvertChars:11)
$_l_FormEvent:=0  // ALP events
EW_at_TabControl:=1
OldTabControlEW:=1
Case of 
	: ([EW_ExportProjects:117]ExportToSeparatefiles:14)
		r3:=1
	: ([EW_ExportProjects:117]IncludeParentRecordData:13)
		r1:=1
	Else 
		r2:=1
End case 
ARRAY TEXT:C222(EW_at_ControlExportTables; 0)
EW_HideShowObjects
EW_at_RecordDelimitOptions:=Find in array:C230(EW_at_RecordDelimitOptions; [EW_ExportProjects:117]RecordDelimiter:15)
EW_at_Personnel:=Find in array:C230(EW_at_Personnel; [EW_ExportProjects:117]ErrorReportDiaryName:20)
EW_at_TimePeriods:=Find in array:C230(EW_at_TimePeriods; [EW_ExportProjects:117]AutoRunPeriodType:5)
ARRAY TEXT:C222(EW_at_BKExportTable; 2)
EW_at_BKExportTable{1}:="Items"
EW_at_BKExportTable{2}:="Customers"

ARRAY TEXT:C222(DM_at_BKModelNames; 0)
ARRAY LONGINT:C221(DM_al_BKModelIDS; 0)
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=-3)
If (Records in selection:C76([PREFERENCES:116])=0)
	// don't create it here -- this is done in the ecommerce setup screen
Else 
	$_l_Offset:=0
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_at_BKModelNames; $_l_Offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_al_BKModelIDS; $_l_Offset)
	SORT ARRAY:C229(DM_at_BKModelNames; DM_al_BKModelIDS)
	INSERT IN ARRAY:C227(DM_at_BKModelNames; 1)
	INSERT IN ARRAY:C227(DM_al_BKModelIDS; 1)
	DM_at_BKModelNames{1}:="Select Store"
	UNLOAD RECORD:C212([PREFERENCES:116])
End if 
ERR_MethodTrackerReturn("EW_EntryBefore"; $_t_oldMethodName)
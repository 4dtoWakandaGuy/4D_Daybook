//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_ExportBKfieldArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/10/2012 15:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(EW_al_ExportTableNumbers;0)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	//ARRAY TEXT(EW_at_BKExportTable;0)
	//ARRAY TEXT(EW_at_ControlExportTables;0)
	//ARRAY TEXT(EW_at_ExportTableNames;0)
	C_BOOLEAN:C305($_bo_CatalogueExport; $_bo_Continue; $0; EW_bo_ModifiedStep)
	C_LONGINT:C283($_l_Mapnumber; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_TableName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_ExportBKfieldArrays")
// EW_ExportBKfieldArrays
// 16/10/02 pb
// This method determines whether the export format is Business Kit (ecommerce0
// and if it is, the field arrays are built from the field Map table
// instead of from the table's complete field list

$_bo_Continue:=True:C214
$_l_TableNumber:=EW_al_ExportTableNumbers{EW_at_ExportTableNames}
$_t_TableName:=EW_at_ExportTableNames{EW_at_ExportTableNames}
$_bo_CatalogueExport:=False:C215
If ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")
	$_l_Mapnumber:=DM_al_BKModelIDS{DM_at_BKModelNames}
	QUERY:C277([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]x_MapSetID:7=$_l_Mapnumber; *)
	QUERY:C277([EW_BK_FieldMap:121];  & ; [EW_BK_FieldMap:121]BKFieldName:3#"")
	Case of 
		: (Records in selection:C76([EW_BK_FieldMap:121])=0)
			ALERT:C41("You have not set up any field mapping for this Data Model."+" Please go to the ecommmerce setup page to do this.")
			$_bo_Continue:=False:C215
			
		: ([EW_BK_FieldMap:121]DayBookTableNumber:1=Table:C252(->[CONTACTS:1])) | ([EW_BK_FieldMap:121]DayBookTableNumber:1=Table:C252(->[COMPANIES:2]))
			$_l_TableNumber:=Table:C252(->[CONTACTS:1])
			$_t_TableName:="Contacts"
		: ([EW_BK_FieldMap:121]DayBookTableNumber:1=Table:C252(->[PRODUCTS:9])) | ([EW_BK_FieldMap:121]DayBookTableNumber:1=Table:C252(->[CATALOGUE:108]))
			$_l_TableNumber:=Table:C252(->[PRODUCTS:9])
			$_t_TableName:="Products"
		Else 
			$_l_TableNumber:=0
	End case 
	$_bo_CatalogueExport:=False:C215
	//  If ($_l_TableNumber=Table(->[Catalogue]))  ` 28/02/03 pb
	// $_l_TableNumber:=Table(->[PRODUCTS])
	//  $_bo_CatalogueExport:=True
	// End if
	//  QUERY([EW_BK_FieldMap]; & ;[EW_BK_FieldMap]BKTableName=[EW_ExportSteps]BKModel
	Case of 
		: (Records in selection:C76([EW_BK_FieldMap:121])=0) & ([EW_ExportSteps:118]CatalogueExport:9=True:C214)
			//    ALERT("In order to export by catalogue, you must  "+"set up field mapping fo
			Gen_Alert("In order to export by catalogue, you must  "+"set up field mapping for the Daybook table Products and "+"ecommerce table Items.")
			$_bo_Continue:=False:C215
			EW_at_ExportTableNames:=Find in array:C230(EW_al_ExportTableNumbers; [EW_ExportSteps:118]BaseTablenumber:3)
			
		: (Records in selection:C76([EW_BK_FieldMap:121])=0)
			//   ALERT("No Daybook ecommerce map fields have been set up for the Daybook table
			Gen_Alert("No Daybook ecommerce map fields have been set up for the Daybook table "+$_t_TableName+" and ecommerce table "+[EW_ExportSteps:118]BKModelName:8+".")
			$_bo_Continue:=False:C215
			EW_at_ExportTableNames:=Find in array:C230(EW_al_ExportTableNumbers; [EW_ExportSteps:118]BaseTablenumber:3)
		Else 
			If ($_bo_CatalogueExport) & (EW_at_BKExportTable{EW_at_BKExportTable}#"Items")
				EW_at_BKExportTable:=Find in array:C230(EW_at_BKExportTable; "items")
			End if 
	End case 
End if 

If ($_bo_Continue)
	//  DB_SaveRecord(->[EW_ExportTables])  ` 2/12/02 pb
	ARRAY TEXT:C222(EW_at_ControlExportTables; 1)
	EW_at_ControlExportTables{1}:=$_t_TableName
	RELATE MANY:C262([EW_ExportTables:120]RecordNumber:2)
	DELETE SELECTION:C66([EW_StepActions:119])
	QUERY:C277([EW_ExportTables:120]; [EW_ExportTables:120]ExportStepNumber:1=[EW_ExportSteps:118]RecordNumber:6)
	// If (Records in selection([EW_ExportTables])=1)
	//   DELETE RECORD([EW_ExportTables])
	//  End if
	If (Records in selection:C76([EW_ExportTables:120])=0)
		CREATE RECORD:C68([EW_ExportTables:120])
		//   [EW_ExportSteps]BaseTablenumber:=$_l_TableNumber
		[EW_ExportTables:120]ExportStepNumber:1:=[EW_ExportSteps:118]RecordNumber:6
		[EW_ExportTables:120]RecordNumber:2:=Gen_RecordNumber(Table:C252(->[EW_ExportTables:120]))
		[EW_ExportTables:120]Order:4:=1
		//   [EW_ExportTables]TableNumber:=[EW_ExportSteps]BaseTablenumber
	End if 
	[EW_ExportSteps:118]BaseTablenumber:3:=$_l_TableNumber  //2/12/02 pb
	[EW_ExportTables:120]TableNumber:3:=$_l_TableNumber
	DB_SaveRecord(->[EW_ExportTables:120])  // 2/12/02 pb
	[EW_ExportSteps:118]CatalogueExport:9:=$_bo_CatalogueExport
	//  RELATE MANY([EW_ExportTables]RecordNumber)
	//  DELETE SELECTION([EW_StepActions])
	EW_DetailsArrays
	//  [EW_ExportTables]FileName:=Replace string(Lowercase
	//(Table name(EW_al_ExportTableNumbers{EW_at_ExportTableNames}));" ";"")+".txt"
	EW_FieldArrays([EW_ExportSteps:118]BaseTablenumber:3; 0)
	EW_bo_ModifiedStep:=True:C214
End if   //             $yContiinue
$0:=$_bo_Continue
EW_HideShowObjects
ERR_MethodTrackerReturn("EW_ExportBKfieldArrays"; $_t_oldMethodName)
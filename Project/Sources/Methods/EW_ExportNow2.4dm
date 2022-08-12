//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_ExportNow2
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
	C_BOOLEAN:C305(EW_bo_Continue)
	C_LONGINT:C283($_l_offset; $i; $j; $k)
	C_REAL:C285(lThermoProcess)
	C_TEXT:C284($_t_oldMethodName; EW_schedule; s2RecordDelimiter; s3FieldDelimiter; tBlankSubtableRows; tExportText; tRepeatData)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_ExportNow2")
// EW_ExportNow2
// Does the actual exporting of the data
// 22/07/02 pb

//$schedule:=$1
//C_BLOB(bSubTableData)
//C_BLOB(bRelatedTableData)
MESSAGES OFF:C175

// first find all the Steps
QUERY:C277([EW_ExportSteps:118]; [EW_ExportSteps:118]ProjectNumber:1=[EW_ExportProjects:117]RecordNumber:2)
ORDER BY:C49([EW_ExportSteps:118]; [EW_ExportSteps:118]Order:2)
// $ResultMessage:=""
tBlankSubtableRows:=""  // rows to insert in front of related data,
// when there are subtable fields as well as related records
tRepeatData:=""  // repeated parent table data to include with subrecords and related records
// could be blank or could contain data

Case of 
	: ([EW_ExportProjects:117]Exportformat:7="Daybook Ecommerce")
		s3FieldDelimiter:=Char:C90(9)
	: ([EW_ExportProjects:117]Exportformat:7="Daybook Publisher")
		s3FieldDelimiter:=Char:C90(9)
	: ([EW_ExportProjects:117]Exportformat:7="Tab-Delimited Text File")
		s3FieldDelimiter:=Char:C90(9)
	: ([EW_ExportProjects:117]Exportformat:7="Comma-Delimited Text File")
		s3FieldDelimiter:=Char:C90(34)+","+Char:C90(34)
	Else 
		// should never happen ...
		//TRACE
		s3FieldDelimiter:=Char:C90(9)
End case 
Case of 
	: ([EW_ExportProjects:117]RecordDelimiter:15="Return@")
		s2RecordDelimiter:=Char:C90(13)
	: ([EW_ExportProjects:117]RecordDelimiter:15="Pipe@")
		s2RecordDelimiter:="|"
	: ([EW_ExportProjects:117]RecordDelimiter:15="new line@")
		s2RecordDelimiter:=Char:C90(10)
	Else   // shouldn't ever happen ...
		//TRACE
		s2RecordDelimiter:=Char:C90(13)
End case 
FIRST RECORD:C50([EW_ExportSteps:118])
If (EW_schedule="L")
	lThermoProcess:=OPEN_THERMOMETER("Exporting data ...")
End if 
For ($i; 1; Records in selection:C76([EW_ExportSteps:118]))
	If (EW_bo_Continue=False:C215)
		$i:=Records in selection:C76([EW_ExportSteps:118])
	Else 
		//  tExportText:=""
		QUERY:C277([EW_ExportTables:120]; [EW_ExportTables:120]ExportStepNumber:1=[EW_ExportSteps:118]RecordNumber:6)
		ORDER BY:C49([EW_ExportTables:120]; [EW_ExportTables:120]Order:4)
		
		For ($j; 1; Records in selection:C76([EW_ExportTables:120]))
			tExportText:=""
			If (EW_schedule="L")
				If (Process state:C330(lThermoProcess)<0)  // User pressed Cancel button on the thermometer
					EW_bo_Continue:=False:C215
				End if 
			End if 
			If (EW_bo_Continue=False:C215)
				$j:=Records in selection:C76([EW_ExportTables:120])
			Else 
				EW_ExportNowTables  // 26/11/02 pb
			End if   // can't continue
			NEXT RECORD:C51([EW_ExportTables:120])
		End for   // recs in sel [EW_ExportTables]
		
		NEXT RECORD:C51([EW_ExportSteps:118])
	End if   // can't continue
End for 
If (EW_schedule="L")
	CLOSE_THERMOMETER
End if 
MESSAGES ON:C181
ERR_MethodTrackerReturn("EW_ExportNow2"; $_t_oldMethodName)
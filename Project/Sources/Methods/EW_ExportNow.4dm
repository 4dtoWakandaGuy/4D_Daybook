//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_ExportNow
	//------------------ Method Notes ------------------
	// EW_ExportNow
	// Export data using the Export Wizard
	// 22/7/02 pb
	// Parameters: $1 = the record number of the Export Project to use
	//                     $2 = "S" for scheduled or "L" for live
	//                             (live means it was done manually)
	//                             (scheduled means it was done automatically)
	
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 10:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(EW_ExportBlob)
	C_BOOLEAN:C305(EW_bo_Continue; yFatalError)
	C_LONGINT:C283($1; EW_iErrorcount; lDatetime)
	C_REAL:C285(lThermoProcess)
	C_TEXT:C284($_t_oldMethodName; $2; EW_schedule; t_session; tErrorMsg; tfolderPath)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_ExportNow")

ON ERR CALL:C155("EW_OnErr")
EW_schedule:=$2
tfolderPath:=""
yFatalError:=False:C215  // TRUE if an error occurs which must stop the export --
// e.g. if a file cannot be created, of the BK isn't running
EW_iErrorcount:=0
EW_bo_Continue:=True:C214
If (EW_schedule="S")  // it is a scheduled export
	QUERY:C277([EW_ExportProjects:117]; [EW_ExportProjects:117]RecordNumber:2=$1)
Else 
	//  $iSelectedStep:=Selected record number([EW_ExportSteps])
	FIRST RECORD:C50([EW_ExportSteps:118])
End if 
lDatetime:=[EW_ExportProjects:117]LastRunDateTimeStamp:38
[EW_ExportProjects:117]LastRunDateTimeStamp:38:=GEN_TimeDateStamp(Current date:C33(*); Current time:C178(*))  // do this before we start the export!
tErrorMsg:=""
Case of 
	: ((EW_schedule="S") & (Locked:C147([EW_ExportProjects:117])))
		// this is a problem 'cos we need to track when the next scheduled run is
		tErrorMsg:="The Export Project record is locked."
		yFatalError:=True:C214
		
	: ((EW_schedule="S") & (Test path name:C476([EW_ExportProjects:117]ExportFolderName:9)#Is a folder:K24:2))
		tErrorMsg:="The specified export folder does not exist."
		yFatalError:=True:C214
		
	: ((EW_schedule="L") & (Test path name:C476([EW_ExportProjects:117]ExportFolderName:9)#Is a folder:K24:2))
		tFolderPath:=""
		tFolderPath:=DB_SelectFolder("Select the export file folder:")
		If (tFolderPath="")
			tErrorMsg:="The export has been aborted."
		End if 
		
	Else   // Ok to rock 'n roll
		Case of 
			: ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")
				EW_TestBkconnection([EW_ExportProjects:117]BKIPAddress:22; [EW_ExportProjects:117]BKServerPort:23)
				
				// no files to create
			: (EW_schedule="L")
				tFolderPath:=DB_SelectFolder("Select the export file folder:")
			Else 
				tFolderPath:=[EW_ExportProjects:117]ExportFolderName:9
		End case 
End case 
Case of 
	: (tFolderPath="") & ([EW_ExportProjects:117]Exportformat:7#"daybook ecommerce")
		// bye bye
	: ((tErrorMsg#"") & (EW_schedule="L"))
		//    ALERT(tErrorMsg)
		Gen_Alert(tErrorMsg)
		// bye bye
	: ((tErrorMsg#"") & (EW_schedule="S"))
		EW_ErrorHandling
		[EW_ExportProjects:117]ErrorMessage:17:=tErrorMsg
	Else   // OK to export the data ...
		EW_ExportNow2
		If (([EW_ExportProjects:117]Exportformat:7="daybook ecommerce") & ([EW_ExportSteps:118]BKModelName:8="customers"))
			
		End if 
		Case of 
			: (EW_schedule="L") & (tErrorMsg#"")
				If (yFatalError)
					tErrorMsg:="The export was aborted. Reason:"+Char:C90(13)+tErrorMsg
				Else 
					tErrorMsg:="Errors were encountered during the export:"+Char:C90(13)+tErrorMsg
				End if 
				//  ALERT(tErrorMsg)
				Gen_Alert(tErrorMsg)
				
			: (EW_schedule="L")
				//BEEP
				If (Process state:C330(lThermoProcess)<0)
					//  ALERT("Export cancelled at your request.")
					Gen_Alert("Export cancelled at your request.")
				Else 
					//   ALERT("Finished exporting the data!")
					Gen_Alert("Finished exporting the data!")
				End if 
		End case 
End case 
ON ERR CALL:C155("")
ERR_MethodTrackerReturn("EW_ExportNow"; $_t_oldMethodName)
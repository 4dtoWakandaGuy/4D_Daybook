//%attributes = {"publishedSoap":true,"publishedWsdl":true}
If (False:C215)
	//Project Method Name:      MIR_SoapCallEvents
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
	C_BLOB:C604(MIR_Bl_SOAP_oBLOB)
	C_BOOLEAN:C305(<>doneintegre)
	C_LONGINT:C283($_l_CharPosition; $_l_Compressed; $_l_DocumentNameLength; $_l_Index; $_l_Integrateprocess; $_l_LogFIleID; $_l_MirrorProcess; $_t_ErrorCode; MIR_l_SOAP_LErrorNumber; MIR_l_SOAP_LResult)
	C_REAL:C285($0)
	C_TEXT:C284(<>MIR_t_LastLogNumber; $_t_DatabaseName; $_t_LogFIleBackupID; $_t_MirrorBackupFolderPath; $_t_MirrorLastBackupID; $_t_MirrorNumberBackups; $_t_MirrorStructureFolderpath; $_t_oldMethodName; $1; $2; $3)
	C_TEXT:C284(MIR_t_SOAP_tAction; MIR_t_SOAP_tDatabaseName; MIR_t_SOAP_tLogFile)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_SoapCallEvents")

// Purpose: Handles SOAP requests for the Mirroring process


// Declare variables for SOAP Types

// Declare local variables

SOAP DECLARATION:C782(MIR_t_SOAP_tDatabaseName; Is text:K8:3; SOAP input:K46:1; "MIR_t_SOAP_tDatabaseName")
SOAP DECLARATION:C782(MIR_t_SOAP_tAction; Is text:K8:3; SOAP input:K46:1; "MIR_t_SOAP_tAction")
SOAP DECLARATION:C782(MIR_Bl_SOAP_oBLOB; Is BLOB:K8:12; SOAP input:K46:1; "MIR_Bl_SOAP_oBLOB")
SOAP DECLARATION:C782(MIR_t_SOAP_tLogFile; Is text:K8:3; SOAP input:K46:1; "MIR_t_SOAP_tLogFile")
SOAP DECLARATION:C782(MIR_l_SOAP_LResult; Is longint:K8:6; SOAP output:K46:2; "MIR_l_SOAP_LResult")

READ ONLY:C145(*)  // Set tables to read only for now

$_t_ErrorCode:=0
MIR_l_SOAP_LErrorNumber:=0

$_t_DatabaseName:=Structure file:C489
$_t_MirrorStructureFolderpath:=PathFromPathName($_t_DatabaseName)
$_t_DatabaseName:=FileNamefromPath($_t_DatabaseName)
//(Substring($_t_DatabaseName;Length($_t_MirrorStructureFolderpath)+1))


If (MIR_t_SOAP_tDatabaseName=$_t_DatabaseName)
	MIR_BackUpPreferences("Load"; ->$_t_MirrorLastBackupID; ->$_t_MirrorNumberBackups; ->$_t_MirrorBackupFolderPath)
	
	If (($_t_MirrorBackupFolderPath="") | ($_t_MirrorBackupFolderPath="/") | ($_t_MirrorBackupFolderPath=":"))
		$_t_MirrorBackupFolderPath:=$_t_MirrorStructureFolderpath
	End if 
	
	Case of 
		: (MIR_t_SOAP_tAction="VerifyPresent")
			If (Test semaphore:C652("$Mirror_BackupInProgress"))  // Check to see if a backup is in progress
				$_t_ErrorCode:=-17053
			Else 
				MIR_l_SOAP_LResult:=1  // The database is here
			End if 
			
		: (MIR_t_SOAP_tAction="IntegrateLog@")
			If (Test semaphore:C652("$Mirror_BackupInProgress"))  // Check to see if a backup is in progress
				$_t_ErrorCode:=-17053
			Else 
				READ WRITE:C146(*)  // Set tables to read write for mirror integration
				BLOB PROPERTIES:C536(MIR_Bl_SOAP_oBLOB; $_l_Compressed)
				If ($_l_Compressed#Is not compressed:K22:11)  // ??  ?- is this an error/ ?? †00:00:00†
					EXPAND BLOB:C535(MIR_Bl_SOAP_oBLOB)
				End if 
				$_l_CharPosition:=Position:C15("["; MIR_t_SOAP_tLogFile)
				$_t_LogFIleBackupID:=Substring:C12(MIR_t_SOAP_tLogFile; $_l_CharPosition+1; 4)
				
				$_l_DocumentNameLength:=Length:C16(MIR_t_SOAP_tLogFile)
				$_l_LogFIleID:=Num:C11(Substring:C12(MIR_t_SOAP_tLogFile; $_l_DocumentNameLength-8; 4))
				
				Case of 
					: ($_t_LogFIleBackupID=$_t_MirrorLastBackupID)  // Do nothing everything is OK
					: (Num:C11($_t_LogFIleBackupID)<Num:C11($_t_MirrorLastBackupID))
						// Backups are occurring on the mirror machine. The main database can not do backups.
						// In order to avoid confusion the integrated log files need to have their names changed to represent the correct name
						// in correspondence to the backup file names
						// This will also assist later in the deletion of these files when the corresponding backup files are purged
						MIR_t_SOAP_tLogFile:=Substring:C12(MIR_t_SOAP_tLogFile; 1; $_l_CharPosition)+$_t_MirrorLastBackupID+Substring:C12(MIR_t_SOAP_tLogFile; $_l_CharPosition+5)
				End case 
				
				ON ERR CALL:C155("MIR_OnErrHandler")
				BLOB TO DOCUMENT:C526($_t_MirrorBackupFolderPath+MIR_t_SOAP_tLogFile; MIR_Bl_SOAP_oBLOB)
				
				<>doneintegre:=False:C215
				$_l_Integrateprocess:=New process:C317("MIR_IntegrateLogFile"; 256000; "Mirror_Integrate"; $_t_MirrorBackupFolderPath+MIR_t_SOAP_tLogFile)
				If ($_l_Integrateprocess=0)
					$0:=-1
					MIR_l_SOAP_LResult:=0
				Else 
					MIR_l_SOAP_LResult:=2
				End if 
				
				
				ON ERR CALL:C155("")
				If (OK=1)
					$_t_ErrorCode:=0
				Else 
					$_t_ErrorCode:=MIR_l_SOAP_LErrorNumber
				End if 
				
				<>MIR_t_LastLogNumber:=MIR_t_SOAP_tLogFile
				MIR_MirrorPreferences("Save")
				If (MIR_t_SOAP_tAction="IntegrateLog&Backup")
					// The backup needs to take place in it's own process so not to tie down the main server waiting for a backup to complete
					$_l_MirrorProcess:=New process:C317("Mir_Backup"; 256000; "Mirror_Backup")
				End if 
			End if 
		: (MIR_t_SOAP_tAction="Statusintegration")
			MIR_l_SOAP_LResult:=2
			$0:=0
			For ($_l_Index; 1; 30)
				If (Not:C34(Test semaphore:C652("integrationinprogress")))
					MIR_l_SOAP_LResult:=1
					$_l_Index:=31
				Else 
					DELAY PROCESS:C323(Current process:C322; 200)
				End if 
			End for 
	End case 
	
Else 
	$_t_ErrorCode:=-17051
End if 

//MIR_l_SOAP_LResult:=$_t_ErrorCode
If ($_t_ErrorCode#0)
	MIR_SOAP_ErrorHandling($_t_ErrorCode)
End if 
//End of method
ERR_MethodTrackerReturn("MIR_SoapCallEvents"; $_t_oldMethodName)

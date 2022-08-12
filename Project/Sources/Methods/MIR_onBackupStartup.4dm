//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_onBackupStartup
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
	C_LONGINT:C283($0; $LErrorCode; $LProcessID)
	C_TEXT:C284(<>MIR_t_ServerType; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_onBackupStartup")


// Declare parameters

// Declare local variables

$0:=0  // Default allow backup to continue

Case of 
	: (Undefined:C82(<>MIR_t_ServerType))  // This can occur on launching a database with an unmatched log and backup.
		//Forcing a backup to occur before any code is run, therefore there is no defined variable in interprted mode
		
	: (<>MIR_t_ServerType="Mirror")  // OK to continue the Mirror machine is allowed to backup the datafile.
		If (Semaphore:C143("$Mirror_BackupInProgress"))  // Set the semaphore
			$0:=-17053
		End if 
		
	: (Length:C16(<>MIR_t_ServerType)>0)  // This database is part of a mirror
		Gen_Confirm("This database is part of a mirror. Continuing the backup will break the Mirror!"; "Abort Backup"; "Break the Mirror")
		If (OK=1)
			$0:=-17052
		End if 
		
End case 
//End of method
ERR_MethodTrackerReturn("MIR_onBackupStartup"; $_t_oldMethodName)
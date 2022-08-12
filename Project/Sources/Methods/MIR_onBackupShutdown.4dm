//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_onBackupShutdown
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
	ARRAY TEXT:C222($_at_MirrorDocuments; 0)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Index; $_l_ThisLogID; $_l_ThisLogIDOLD)
	C_TEXT:C284(<>MIR_t_LastLogNumber; <>MIR_t_ServerType; $_t_LastBackFolderPath; $_t_LastBackupID; $_t_LastBackupValue; $_t_LogFilePrefix; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_onBackupShutdown")


// Declare local variables

Case of 
	: (<>MIR_t_ServerType="Mirror")
		CLEAR SEMAPHORE:C144("$Mirror_BackupInProgress")
		
		// On the mirror machine integrated log files may be piling up and need to be deleted
		$_t_LastBackupID:=""
		$_t_LastBackupValue:=""
		$_t_LastBackFolderPath:=""
		MIR_BackUpPreferences("Load"; ->$_t_LastBackupID; ->$_t_LastBackupValue; ->$_t_LastBackFolderPath)
		
		If (Num:C11($_t_LastBackupID)>Num:C11($_t_LastBackupValue))
			$_l_ThisLogIDOLD:=Num:C11($_t_LastBackupID)-Num:C11($_t_LastBackupValue)
			ARRAY TEXT:C222($_at_MirrorDocuments; 0)
			
			DOCUMENT LIST:C474($_t_LastBackFolderPath; $_at_MirrorDocuments)  // Get the possible files
			
			$_l_CharacterPosition:=Position:C15("["; <>MIR_t_LastLogNumber)
			$_t_LogFilePrefix:=Substring:C12(<>MIR_t_LastLogNumber; 1; $_l_CharacterPosition)
			
			For ($_l_Index; 1; Size of array:C274($_at_MirrorDocuments))
				
				If ((Position:C15($_t_LogFilePrefix; $_at_MirrorDocuments{$_l_Index})>0) & (Position:C15(".4DL"; $_at_MirrorDocuments{$_l_Index})>0))  // Is this a log file segment for this database?
					$_l_CharacterPosition:=Position:C15("["; $_at_MirrorDocuments{$_l_Index})
					$_l_ThisLogID:=Num:C11(Substring:C12($_at_MirrorDocuments{$_l_Index}; $_l_CharacterPosition+1; 4))
					If ($_l_ThisLogID<=$_l_ThisLogIDOLD)  // This is an old log file that should be deleted
						DELETE DOCUMENT:C159($_t_LastBackFolderPath+$_at_MirrorDocuments{$_l_Index})
					End if 
				End if 
			End for 
			
		End if 
		
End case 
// End of method
ERR_MethodTrackerReturn("MIR_onBackupShutdown"; $_t_oldMethodName)

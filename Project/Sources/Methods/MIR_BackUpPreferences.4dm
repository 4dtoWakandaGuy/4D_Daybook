//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_BackUpPreferences
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($LNumberParameters; $LPosition)
	C_POINTER:C301($2; $3; $4; $5; $pBackupFolderPath; $pBackupVolumeSize; $pLastFileID; $pNumberBackupsValue)
	C_REAL:C285($rFree; $rSize; $rUsed)
	C_TEXT:C284($_t_oldMethodName; $1; $Mirror_tBackupFolderPath; $Mirror_tLastBackupID; $Mirror_tNumberBackupsValue; $sXML_ElementReference; $sXML_Reference; $tAction; $tFullPath; $tLogPath; $_t_DocumentPath)
	C_TEXT:C284($tPreferencesPath; $tSettingsFolderPath)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_BackUpPreferences")


// Declare parameters

// Declare local variables

// Reassign for readability
$tAction:=$1

$LNumberParameters:=Count parameters:C259
If ($LNumberParameters>1)
	$pLastFileID:=$2
	If ($LNumberParameters>2)
		$pNumberBackupsValue:=$3
		If ($LNumberParameters>3)
			$pBackupFolderPath:=$4
			If ($LNumberParameters>4)
				$pBackupVolumeSize:=$5
			End if 
		End if 
	End if 
End if 

// Declare default values
$tPreferencesPath:=MIR_MirrorPath("Backup")

Case of 
	: ($tAction="Load")
		$tSettingsFolderPath:=MIR_GetFolderpathName($tPreferencesPath)
		
		If (Test path name:C476($tSettingsFolderPath)#0)  // See if the directory exists
			MIR_SetFolderPath($tSettingsFolderPath)
		End if 
		
		If (Test path name:C476($tPreferencesPath)#1)  // Check to see if a valid file exists
			$tFullPath:=""
			$Mirror_tNumberBackupsValue:=""
		Else 
			$sXML_Reference:=DOM Parse XML source:C719($tPreferencesPath)
			$sXML_ElementReference:=DOM Find XML element:C864($sXML_Reference; "/Preferences4D/Backup/DataBase/LastBackupPath/Item1")
			DOM GET XML ELEMENT VALUE:C731($sXML_ElementReference; $tFullPath)
			$sXML_ElementReference:=DOM Find XML element:C864($sXML_Reference; "/Preferences4D/Backup/DataBase/LastBackupLogPath/Item1")
			DOM GET XML ELEMENT VALUE:C731($sXML_ElementReference; $tLogPath)
			$sXML_ElementReference:=DOM Find XML element:C864($sXML_Reference; "/Preferences4D/Backup/Settings/Advanced/SetNumber/Value")
			DOM GET XML ELEMENT VALUE:C731($sXML_ElementReference; $Mirror_tNumberBackupsValue)
			$sXML_ElementReference:=DOM Find XML element:C864($sXML_Reference; "/Preferences4D/Backup/Settings/General/DestinationFolder")
			DOM GET XML ELEMENT VALUE:C731($sXML_ElementReference; $Mirror_tBackupFolderPath)
			
			DOM CLOSE XML:C722($sXML_Reference)
			$_t_DocumentPath:=MIR_GetFolderpathName($tFullPath)
			$tFullPath:=Substring:C12($tFullPath; Length:C16($_t_DocumentPath)+1)
			$LPosition:=Position:C15("["; $tFullPath)
			$Mirror_tLastBackupID:=Substring:C12($tFullPath; $LPosition+1; 4)
		End if 
		
		If ($LNumberParameters>4)
			MIR_BackUpPreferences("GetBackupVolumeFreeSpace"; ->$tLogPath; $pBackupVolumeSize)
		End if 
		
		
	: ($tAction="GetBackupVolumeFreeSpace")
		$Mirror_tBackupFolderPath:=$pLastFileID->  // Folder path is the second parameter in reassign for readability
		If ($Mirror_tBackupFolderPath="")
			$Mirror_tBackupFolderPath:=Structure file:C489
		End if 
		
		If (Not:C34(Is macOS:C1572))
			$LPosition:=Position:C15("\\"; $Mirror_tBackupFolderPath)
		Else 
			$LPosition:=Position:C15(":"; $Mirror_tBackupFolderPath)
		End if 
		$Mirror_tBackupFolderPath:=Substring:C12($Mirror_tBackupFolderPath; 1; $LPosition-1)
		VOLUME ATTRIBUTES:C472($Mirror_tBackupFolderPath; $rSize; $rUsed; $rFree)
		$Mirror_tNumberBackupsValue:=String:C10(Round:C94($rFree/(1024*1024); 0))  // used second parameter to return value
End case 

If ($LNumberParameters>1)
	$pLastFileID->:=$Mirror_tLastBackupID
	If ($LNumberParameters>2)
		$pNumberBackupsValue->:=$Mirror_tNumberBackupsValue
		If ($LNumberParameters>3)
			$pBackupFolderPath->:=$Mirror_tBackupFolderPath
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("MIR_BackUpPreferences"; $_t_oldMethodName)
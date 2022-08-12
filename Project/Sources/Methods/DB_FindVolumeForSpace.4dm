//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_FindVolumeForSpace
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Volumes; 0)
	C_LONGINT:C283($_l_NumberofVolumes; $_l_VolumeIndex)
	C_REAL:C285($_l_VolumeFree; $_l_VolumeSize; $_l_VolumeUsed; $1; gError)
	C_TEXT:C284($_t_DocumentName; $_t_oldMethodName; $0)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_FindVolumeForSpace")

// Find volume for space Project Method
// Find volume for space ( Real ) -> String
// Find volume for space ( Space needed in bytes ) -> Volume name or Empty string


// Initialize function result
$0:=""
// Protect all I/O operations with an error interruption method
// Get the list of the volumes
ARRAY TEXT:C222($_at_Volumes; 0)
gError:=0
VOLUME LIST:C471($_at_Volumes)
If (gError=0)
	// If running on windows, skip the (usual) two floppy drives
	If (Is Windows:C1573)
		$_l_VolumeIndex:=Find in array:C230($_at_Volumes; "A:")
		If ($_l_VolumeIndex>0)
			DELETE FROM ARRAY:C228($_at_Volumes; $_l_VolumeIndex)
		End if 
		$_l_VolumeIndex:=Find in array:C230($_at_Volumes; "B:")
		If ($_l_VolumeIndex>0)
			DELETE FROM ARRAY:C228($_at_Volumes; $_l_VolumeIndex)
		End if 
	End if 
	$_l_NumberofVolumes:=Size of array:C274($_at_Volumes)
	// For each volume
	For ($_l_VolumeIndex; 1; $_l_NumberofVolumes)
		// Get the size, used space and free space
		gError:=0
		VOLUME ATTRIBUTES:C472($_at_Volumes{$_l_VolumeIndex}; $_l_VolumeSize; $_l_VolumeUsed; $_l_VolumeFree)
		If (gError=0)
			// Is the free space large enough (plus an extra 32K) ?
			If ($_l_VolumeFree>=($1+32768))
				// If so, check if the volume is unlocked...
				$_t_DocumentName:=$_at_Volumes{$_l_VolumeIndex}+Folder separator:K24:12+"XYZ"+String:C10(Random:C100)+".TXT"
				$_ti_DocumentRef:=DB_CreateDocument($_t_DocumentName)
				If (OK=1)
					CLOSE DOCUMENT:C267($_ti_DocumentRef)
					DELETE DOCUMENT:C159($_t_DocumentName)
					// If everything's fine, return the name of the volume
					$0:=$_at_Volumes{$_l_VolumeIndex}
					$_l_VolumeIndex:=$_l_NumberofVolumes+1
				End if 
			End if 
		End if 
	End for 
End if 
ON ERR CALL:C155("")
ERR_MethodTrackerReturn("DB_FindVolumeForSpace"; $_t_oldMethodName)
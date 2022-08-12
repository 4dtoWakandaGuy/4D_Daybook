//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_SOAP_HandleLogEvents
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
	ARRAY LONGINT:C221($_al_ErrorNumbers; 0)
	ARRAY TEXT:C222($_at_ErrorMessages; 0)
	ARRAY TEXT:C222($_at_LogFiles; 0)
	ARRAY TEXT:C222($_at_Mirrors; 0)
	C_BLOB:C604($_blb_MirrorLogFile)
	C_BOOLEAN:C305($_bo_BackupIncluded)
	C_LONGINT:C283($_l_Error; $_l_Index; $_l_LogFileIndex; $_l_SizeofArray; $0; MIR_l_SOAP_LErrorNumber; MIR_l_SOAP_LResult)
	C_TEXT:C284($_t_LastLogFile; $_t_LogFileName; $_t_LogFilePath; $_t_MirrorAction; $_t_MirrorDatabaseName; $_t_MirrorIPAddress; $_t_oldMethodName; $1; $2; $3; $4)
	C_TEXT:C284(MIR_T_SOAP_tErrorMessage; Mirror_t_SOAP_tErrorMessage; MIT_T_SOAP_tErrorMessage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_SOAP_HandleLogEvents")

// Based on Mirror_SOAP_LHandleEvents
// Purpose: Handles creating and sending the log file to mirroring server(s)

// Declare parameters

// Declare local variables
ARRAY TEXT:C222($_at_Mirrors; 0)
ARRAY TEXT:C222($_at_LogFiles; 0)

// Reassign for readability
$_t_MirrorDatabaseName:=$1
$_t_MirrorAction:=$2
$_t_MirrorIPAddress:=$3
If (Count parameters:C259>3)
	$_t_LastLogFile:=$4
End if 

// Set default values
$_l_Error:=0

MIR_TEXT2ARRAY($_t_MirrorIPAddress; ->$_at_Mirrors; ",")

$_l_SizeofArray:=Size of array:C274($_at_Mirrors)

Case of 
	: ($_t_MirrorAction="VerifyPresent")
		For ($_l_Index; 1; $_l_SizeofArray)
			$_l_Error:=MIR_Proxy_SOAP_HandleLogEvents($_t_MirrorDatabaseName; $_t_MirrorAction; $_at_Mirrors{$_l_Index})
			If (($_l_Error=0) & (MIR_l_SOAP_LResult#1))  // Mirror is present
				MIR_l_SOAP_LErrorNumber:=0
				MIR_T_SOAP_tErrorMessage:=""
				$_l_Index:=$_l_SizeofArray
			End if 
		End for 
		
	: ($_t_MirrorAction="IntegrateLog@")
		$_bo_BackupIncluded:=($_t_MirrorAction="IntegrateLog&Backup")
		If ($_l_SizeofArray>1)  // Save the log file to the text files
			For ($_l_Index; 1; $_l_SizeofArray)
				MIR_MultipleMirrorsXML("AddLog"; $_at_Mirrors{$_l_Index}; ->$_t_LastLogFile)
			End for 
			
			For ($_l_Index; 1; $_l_SizeofArray)
				MIR_MultipleMirrorsXML("Load"; $_at_Mirrors{$_l_Index}; ->$_t_LogFileName)
				ARRAY LONGINT:C221($_al_ErrorNumbers; 0)
				ARRAY TEXT:C222($_at_ErrorMessages; 0)
				ARRAY TEXT:C222($_at_LogFiles; 0)
				MIR_TEXT2ARRAY($_t_LogFileName; ->$_at_LogFiles; ",")
				
				For ($_l_LogFileIndex; 1; Size of array:C274($_at_LogFiles))
					Case of   // If there are more than one log file to be integrated and the backup is taking place place backup only when the last log file is sent
						: ($_bo_BackupIncluded & ($_l_LogFileIndex>1) & ($_l_LogFileIndex=Size of array:C274($_at_LogFiles)))
							$_t_MirrorAction:="IntegrateLog&Backup"
						: ($_bo_BackupIncluded & ($_l_LogFileIndex<Size of array:C274($_at_LogFiles)))
							$_t_MirrorAction:="IntegrateLog"
						Else   // The scheduled current action is correct
					End case 
					
					DOCUMENT TO BLOB:C525($_at_LogFiles{$_l_LogFileIndex}; $_blb_MirrorLogFile)
					If (BLOB size:C605($_blb_MirrorLogFile)>10000)  // If larger than10000 bytes compress the blob to reduce network bandwidth usage
						COMPRESS BLOB:C534($_blb_MirrorLogFile)
					End if 
					
					$_t_LogFilePath:=MIR_GetFolderpathName($_at_LogFiles{$_l_LogFileIndex})
					If ($_t_LogFilePath#$_t_LastLogFile)  // Strip off the full path name if present
						$_t_LastLogFile:=(Substring:C12($_at_LogFiles{$_l_LogFileIndex}; Length:C16($_t_LogFilePath)+1))
					End if 
					$_l_Error:=MIR_Proxy_SOAP_HandleLogEvents($_t_MirrorDatabaseName; $_t_MirrorAction; $_at_Mirrors{$_l_Index}; ->$_blb_MirrorLogFile; $_t_LastLogFile)  // Send the log file to the server
					If ($_l_Error=0)  // Success delete the file from the array
						$_at_LogFiles{$_l_LogFileIndex}:=""
					Else 
						APPEND TO ARRAY:C911($_al_ErrorNumbers; $_l_Error)  // Add any error numbers to the error array
						If (Length:C16(MIR_T_SOAP_tErrorMessage)=0)
							MIR_SOAP_ErrorHandling($_l_Error)
						End if 
						APPEND TO ARRAY:C911($_at_ErrorMessages; $_at_Mirrors{$_l_Index}+" - "+MIR_T_SOAP_tErrorMessage)  // Save the error message along with the server that generated the error
						Mirror_t_SOAP_tErrorMessage:=""
						$_l_LogFileIndex:=Size of array:C274($_at_LogFiles)  // There was an error we must abort trying this backup
					End if 
					
				End for 
				
				$_t_LogFileName:=""
				For ($_l_LogFileIndex; 1; Size of array:C274($_at_LogFiles))  // See if there were any log files NOT sent and integrated
					If (Length:C16($_at_LogFiles{$_l_LogFileIndex})>0)  // If so add them so they get sent next time
						If (Length:C16($_t_LogFileName)>0)
							$_t_LogFileName:=$_t_LogFileName+","
						End if 
						$_t_LogFileName:=$_t_LogFileName+$_at_LogFiles{$_l_LogFileIndex}
					End if 
				End for 
				// Save the log segments still to be sent or wipe and wipe out from the preferences the file that were sucessfully sent
				MIR_MultipleMirrorsXML("Save"; $_at_Mirrors{$_l_Index}; ->$_t_LogFileName)
				
			End for 
			
			$_l_SizeofArray:=Size of array:C274($_al_ErrorNumbers)  // Check for any errors that may have occurred
			If ($_l_SizeofArray>0)
				MIR_T_SOAP_tErrorMessage:=""
				For ($_l_Index; 1; $_l_SizeofArray)
					$_l_Error:=$_al_ErrorNumbers{$_l_Index}  // Any error number will do
					MIT_T_SOAP_tErrorMessage:=MIT_T_SOAP_tErrorMessage+$_at_ErrorMessages{$_l_Index}+Char:C90(Carriage return:K15:38)  // Combine all the error messages
				End for 
			End if 
			
		Else 
			DOCUMENT TO BLOB:C525($_t_LastLogFile; $_blb_MirrorLogFile)
			If (BLOB size:C605($_blb_MirrorLogFile)>10000)  // If larger than10000 bytes compress the blob to reduce network bandwidth usage
				COMPRESS BLOB:C534($_blb_MirrorLogFile)
			End if 
			
			$_t_LogFilePath:=MIR_GetFolderpathName($_t_LastLogFile)
			If ($_t_LogFilePath#$_t_LastLogFile)  // Strip off the full path name if present
				$_t_LastLogFile:=(Substring:C12($_t_LastLogFile; Length:C16($_t_LogFilePath)+1))
			End if 
			$_l_Error:=MIR_Proxy_SOAP_HandleLogEvents($_t_MirrorDatabaseName; $_t_MirrorAction; $_at_Mirrors{1}; ->$_blb_MirrorLogFile; $_t_LastLogFile)  // Send the log file to the server
			If ($_l_Error#0)
				MIR_SOAP_ErrorHandling($_l_Error)
			Else 
				Repeat 
					$_l_Error:=MIR_Proxy_SOAP_HandleLogEvents($_t_MirrorDatabaseName; "Statusintegration"; $_at_Mirrors{1})  // test is integration is over
					DELAY PROCESS:C323(Current process:C322; 500)
				Until (($_l_Error#0) | (MIR_l_SOAP_LResult#2))
			End if 
		End if 
		
End case 

$0:=$_l_Error
// End of method
ERR_MethodTrackerReturn("MIR_SOAP_HandleLogEvents"; $_t_oldMethodName)

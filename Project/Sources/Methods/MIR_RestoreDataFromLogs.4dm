//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_RestoreDataFromLogs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_logFiles; 0)
	ARRAY TEXT:C222($_at_MirrorDocuments; 0)
	C_BLOB:C604($_blb_MirrorLogFile)
	C_LONGINT:C283($_l_ApplicationType; $_l_CharacterPosition; $_l_Index; $_l_ServerSideProcess; $_l_SoapError)
	C_TEXT:C284($_t_DatabaseName; $_t_DatabasePath; $_t_DocumentPath; $_t_FileName; $_t_oldMethodName; MIR_t_SOAP_tDatabaseName; MIR_t_ThisServerIPAddress)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_RestoreDataFromLogs")

If (False:C215)
	// Purpose:  Integrates log files into a database restored from a backup  Not the mirror
	
End if 
// Declare local variables
ARRAY TEXT:C222($_at_MirrorDocuments; 0)
ARRAY TEXT:C222($_at_logFiles; 0)
$_l_ApplicationType:=Application type:C494
Case of 
	: ($_l_ApplicationType=4D Remote mode:K5:5)
		Gen_Alert("Please locate a log file to be integrated.")  //Modified NG to use daybook alert code
		$_ti_DocumentRef:=DB_OpenDocument(""; ""; Get pathname:K24:6)  // show all files, but if a log file is not chosen this will not work
		If (OK=1)
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
			$_t_DocumentPath:=MIR_GetFolderpathName(Document)
			$_t_FileName:=FileNamefromPath(Document)
			
			// Get necessary information from the server
			MIR_t_SOAP_tDatabaseName:=""
			MIR_t_ThisServerIPAddress:=""
			$_l_ServerSideProcess:=Execute on server:C373("MIR_RestoreDataFromLogs"; DB_ProcessMemoryinit(1); "Restoring Data")
			Repeat   //NG- need to add in here a way to do this without soap
				DelayTicks(2)  //` Wait for the server to get the information
				GET PROCESS VARIABLE:C371($_l_ServerSideProcess; MIR_t_SOAP_tDatabaseName; MIR_t_SOAP_tDatabaseName)
				GET PROCESS VARIABLE:C371($_l_ServerSideProcess; MIR_t_ThisServerIPAddress; MIR_t_ThisServerIPAddress)
			Until (Length:C16(MIR_t_SOAP_tDatabaseName)>0)
			//Log segements have a specific format [0000-0000]. If we are merging multiple segments we will look for that format and merge all files that match this pattern in their file name and have the correct main backup number.
			$_l_CharacterPosition:=Position:C15("["; $_t_FileName)
			If ($_l_CharacterPosition+10=Position:C15("]"; $_t_FileName))  // Make sure we are getting mirror log files for merging not regular log files
				// Now we need to find all corresponding log files
				DOCUMENT LIST:C474($_t_DocumentPath; $_at_MirrorDocuments)
				For ($_l_Index; 1; Size of array:C274($_at_MirrorDocuments))
					Case of 
						: (Length:C16($_t_FileName)#Length:C16($_at_MirrorDocuments{$_l_Index}))  // Not the same length, not a log file
						: (Substring:C12($_t_FileName; 1; $_l_CharacterPosition+5)#Substring:C12($_at_MirrorDocuments{$_l_Index}; 1; $_l_CharacterPosition+5))  // Not the same Datafile and backup number
						: (Substring:C12($_t_FileName; $_l_CharacterPosition+10)#Substring:C12($_at_MirrorDocuments{$_l_Index}; $_l_CharacterPosition+10))  // Not a log file
						Else 
							APPEND TO ARRAY:C911($_at_logFiles; $_at_MirrorDocuments{$_l_Index})
					End case 
				End for 
				If (Size of array:C274($_at_logFiles)>0)  // Integrate the log files
					SORT ARRAY:C229($_at_logFiles)
					For ($_l_Index; 1; Size of array:C274($_at_logFiles))
						DOCUMENT TO BLOB:C525($_t_DocumentPath+$_at_logFiles{$_l_Index}; $_blb_MirrorLogFile)
						If (BLOB size:C605($_blb_MirrorLogFile)<10000)  // If larger than10000 bytes compress the blob to reduce network bandwidth usage
							COMPRESS BLOB:C534($_blb_MirrorLogFile)
						End if 
						$_l_SoapError:=MIR_Proxy_SOAP_HandleLogEvents(MIR_t_SOAP_tDatabaseName; "IntegrateLog"; MIR_t_ThisServerIPAddress; ->$_blb_MirrorLogFile; $_at_logFiles{$_l_Index})  // Send the log file to the server
						If ($_l_SoapError#0)
							ALERT:C41("Big Problem!")
							$_l_Index:=Size of array:C274($_at_logFiles)
						End if 
						SET BLOB SIZE:C606($_blb_MirrorLogFile; 0)  // Clean up memory
					End for 
				End if 
			Else   // Merging single log file
				DOCUMENT TO BLOB:C525($_t_DocumentPath+$_t_FileName; $_blb_MirrorLogFile)
				If (BLOB size:C605($_blb_MirrorLogFile)<10000)  // If larger than10000 bytes compress the blob to reduce network bandwidth usage
					COMPRESS BLOB:C534($_blb_MirrorLogFile)
				End if 
				$_l_SoapError:=MIR_Proxy_SOAP_HandleLogEvents(MIR_t_SOAP_tDatabaseName; "IntegrateLog"; MIR_t_ThisServerIPAddress; ->$_blb_MirrorLogFile; $_t_FileName)
				// Send the log file to the server
				If ($_l_SoapError#0)
					ALERT:C41("Log file not merged!")
				End if 
				SET BLOB SIZE:C606($_blb_MirrorLogFile; 0)  // Clean up memory
			End if 
		End if 
	: ($_l_ApplicationType=4D Server:K5:6)
		MIR_t_SOAP_tDatabaseName:=""
		$_l_SoapError:=IT_MyTCPAddr(MIR_t_ThisServerIPAddress; $_t_FileName)
		$_t_DatabaseName:=Structure file:C489
		$_t_DatabasePath:=MIR_GetFolderpathName($_t_DatabaseName)
		MIR_t_SOAP_tDatabaseName:=(Substring:C12($_t_DatabaseName; Length:C16($_t_DatabasePath)+1))
		DelayTicks(300)  // Leave process alive long enough to get variable values
		//to the client
	Else 
		Gen_Alert("Log files can only be integrated from a 4D Client machine.")
End case 
ERR_MethodTrackerReturn("MIR_RestoreDataFromLogs"; $_t_oldMethodName)

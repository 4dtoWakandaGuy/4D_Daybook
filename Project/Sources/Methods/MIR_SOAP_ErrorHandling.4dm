//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_SOAP_ErrorHandling
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
	C_LONGINT:C283($1; $LErrorCode; MIR_l_SOAP_LErrorNumber)
	C_TEXT:C284($_t_oldMethodName; MIR_t_SOAP_tErrorMessage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_SOAP_ErrorHandling")



//Declare parameters

// Reassign for readability
$LErrorCode:=$1

Case of 
	: ($LErrorCode=1403)
		MIR_t_SOAP_tErrorMessage:="No log file. The mirror database is not configured to have a log file. "+"Integration can not take place."
	: ($LErrorCode=1404)
		MIR_t_SOAP_tErrorMessage:="A transaction is open in this process."
	: ($LErrorCode=1405)
		MIR_t_SOAP_tErrorMessage:="The maximum timeout for transactions to end in a concurrent process has been reac"+"hed."
	: ($LErrorCode=1406)
		MIR_t_SOAP_tErrorMessage:="Backup canceled by user/"
	: ($LErrorCode=1407)
		MIR_t_SOAP_tErrorMessage:="Destination folder is not valid."
	: ($LErrorCode=1408)
		MIR_t_SOAP_tErrorMessage:="Error during log file backup."
	: ($LErrorCode=1409)
		MIR_t_SOAP_tErrorMessage:="Transaction or other critical operation blocking mirroring. Error Code: "+String:C10(MIR_l_SOAP_LErrorNumber)
	: ($LErrorCode=1410)
		MIR_t_SOAP_tErrorMessage:="The log files are out of sync. Integration can not take place."+" You will need to rebuild the mirror server from scratch."
	: ($LErrorCode=1411)
		MIR_t_SOAP_tErrorMessage:="Transaction or other critical operation blocking mirroring. Error Code: "+String:C10(MIR_l_SOAP_LErrorNumber)
	: ($LErrorCode=1412)
		MIR_t_SOAP_tErrorMessage:="Cannot find the log backup file to be checked."
	: ($LErrorCode=1413)
		MIR_t_SOAP_tErrorMessage:="Error during log backup file check."
	: ($LErrorCode=1414)
		MIR_t_SOAP_tErrorMessage:="The mirror database is not running 4D Server.  Integration can only occur when us"+"ing 4D Server."
	: ($LErrorCode=1415)
		MIR_t_SOAP_tErrorMessage:="Cannot back up log file; a critical operation is in progress."
	: ($LErrorCode=1417)
		MIR_t_SOAP_tErrorMessage:="A log integration operation is already running. The backup cannot be launched."
	: ($LErrorCode=1420)
		MIR_t_SOAP_tErrorMessage:="Log file Integration aborted due to detection of locked records on the Mirrored S"+"erver."
	: ($LErrorCode=1422)
		MIR_t_SOAP_tErrorMessage:="Log file sent is incompatible with the current data file on the Mirror. It is pos"+"sible that the log file and the mirror are desynchronized."
	: ($LErrorCode=-17050)
		MIR_t_SOAP_tErrorMessage:="Mirror database is not available. Mirroring at "+String:C10(Current time:C178; HH MM:K7:2)+" on "+String:C10(Current date:C33; System date short:K1:1)+" did not take place."
	: ($LErrorCode=-17051)
		MIR_t_SOAP_tErrorMessage:="Invalid Database Name. Can not merge data into a database with this name. "+"Check mirror preference settings."
	: ($LErrorCode=-17052)
		MIR_t_SOAP_tErrorMessage:="No Web Access Allowed."
	: ($LErrorCode=-17053)
		MIR_t_SOAP_tErrorMessage:="Backup In Progress."
	: ($LErrorCode=-17054)
		MIR_t_SOAP_tErrorMessage:="Available Disk space on Main Database backup drive is running low."
End case 

If (SOAP Request:C783)
	SOAP SEND FAULT:C781(SOAP client fault:K46:5; String:C10($LErrorCode)+" - "+MIR_t_SOAP_tErrorMessage)  //desynchronised
End if 

//End of method
ERR_MethodTrackerReturn("MIR_SOAP_ErrorHandling"; $_t_oldMethodName)
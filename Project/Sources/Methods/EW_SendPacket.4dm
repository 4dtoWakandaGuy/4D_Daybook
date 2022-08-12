//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_SendPacket
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
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $_t_Text)
	C_TIME:C306(Doc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_SendPacket")
// EW_SendPacket
// prepares data for export
// 02/08/02 pb
// Parameters: $1 = Pointer to the text to send

$_t_Text:=$1->
Case of 
	: ([EW_ExportProjects:117]ConvertChars:11="Mac to Windows")
		///$_t_Text:=_O_Mac to Win($_t_Text)
	: ([EW_ExportProjects:117]ConvertChars:11="Windows to Mac")
		//$_t_Text:=_O_Win to Mac($_t_Text)
End case 

Case of 
		
End case 

SEND PACKET:C103(Doc; $_t_Text)
$1->:=""
ERR_MethodTrackerReturn("EW_SendPacket"; $_t_oldMethodName)
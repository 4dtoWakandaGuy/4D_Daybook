//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_TestEmailReceived
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
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_TestEmailReceived")

//Pass this message an Email ID and it will test if that is already created in the documents table
If (Count parameters:C259>=1)
	
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]EMail_ServerDocID:24=$1)
	$0:=(Records in selection:C76([DOCUMENTS:7])>0)
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("SD2_TestEmailReceived"; $_t_oldMethodName)

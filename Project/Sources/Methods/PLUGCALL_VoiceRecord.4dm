//%attributes = {}
If (False:C215)
	//Project Method Name:      PLUGCALL_VoiceRecord
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
	C_LONGINT:C283($0; $3)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PLUGCALL_VoiceRecord")
$0:=0

Case of 
	: ($1="RecordStop")
		//$0:=RecordStop ($3)
	: ($1="PlayStop")
		//$0:=PlayStop ($3)
	: ($1="PlayCancel")
		//$0:=PlayCancel($3)
	: ($1="Play")
		//PLAY($2;$3)
	: ($1="PlayResume")
		//$_l_Return:=PlayResume ($3)
	: ($1="PlayStart")
		//$_l_Return:=PlayStart ($4»;$3;0;0)
	: ($1="RecordResume")
		//$_l_Return:=RecordResume ($3)
	: ($1="RecordPause")
		//$_l_Return:=RecordPause (vPage)
	: ($1="PlayPause")
		//$_l_Return:=PlayPause ($3)
	: ($1="recordStart")
		//$_l_Return:=RecordStart ($4;$5;$6;$3)
End case 
ERR_MethodTrackerReturn("PLUGCALL_VoiceRecord"; $_t_oldMethodName)

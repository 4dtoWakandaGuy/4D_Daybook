//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Tel DTMFErr
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
	C_LONGINT:C283($0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel DTMFErr")
//tm_DTMFErr
Case of 
	: ($1=256)  //DTMF Occurred - this is NOT an Error
		$0:=0
	: ($1=257)  //we were stopped - maybe it IS an error
		$0:=$1
	: ($1=258)  //someone disconnected - we might as well abandon the rest
		$0:=$1
	: ($1=259)  //terminated by DTMF
		$0:=0
	: ($1=260)  //maximum dtmf digits entered
		$0:=0
	: ($1=261)  //timeout - maybe you want an error
		$0:=0
	Else 
		$0:=$1
End case 
ERR_MethodTrackerReturn("Tel DTMFErr"; $_t_oldMethodName)
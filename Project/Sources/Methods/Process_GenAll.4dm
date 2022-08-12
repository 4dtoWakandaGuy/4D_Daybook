//%attributes = {}
If (False:C215)
	//Project Method Name:      Process_GenAll
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
	//Array LONGINT(<>PRC_al_ProcessNum;0)
	//Array LONGINT(<>PRC_al_ProcessState;0)
	C_LONGINT:C283($2; $i)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Process_GenAll")
$i:=1
OK:=1
ON ERR CALL:C155("Remote_Err")
While ($i<=Size of array:C274(<>PRC_al_ProcessNum))
	If (<>PRC_al_ProcessState{$i}>=0)
		IDLE:C311  // 7/04/03 pb
		Case of 
			: ($1="Hide")
				HIDE PROCESS:C324(<>PRC_al_ProcessNum{$i})
			: ($1="Show")
				SHOW PROCESS:C325(<>PRC_al_ProcessNum{$i})
			: ($1="Sleep")
				DelayTicks($2)
			: ($1="Awaken")
				RESUME PROCESS:C320(<>PRC_al_ProcessNum{$i})
		End case 
	End if 
	$i:=$i+1
End while 
ON ERR CALL:C155("")
ERR_MethodTrackerReturn("Process_GenAll"; $_t_oldMethodName)
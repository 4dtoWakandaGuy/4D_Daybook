//%attributes = {}
If (False:C215)
	//Project Method Name:      BP_Timestamp2Time
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; $Timestamp)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BP_Timestamp2Time")

$Timestamp:=$1

$0:=Time:C179(Time string:C180(($Timestamp%86400)))
ERR_MethodTrackerReturn("BP_Timestamp2Time"; $_t_oldMethodName)

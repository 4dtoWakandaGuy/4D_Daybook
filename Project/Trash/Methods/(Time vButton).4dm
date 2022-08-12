//%attributes = {}
If (False:C215)
	//Project Method Name:      Time vButton
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
	C_LONGINT:C283($2)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(<>SYS_ti_DefaultTimeDayStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Time vButton")
If ($1->=?00:00:00?)
	If (<>SYS_ti_DefaultTimeDayStart>?00:00:00?)
		$1->:=<>SYS_ti_DefaultTimeDayStart
	Else 
		$1->:=?09:00:00?
	End if 
Else 
	$1->:=Time:C179(Time string:C180($1->+(?01:00:00?*$2)))
End if 
ERR_MethodTrackerReturn("Time vButton"; $_t_oldMethodName)

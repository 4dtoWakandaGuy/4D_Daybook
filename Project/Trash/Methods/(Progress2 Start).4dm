//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Progress2 Start
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
	C_LONGINT:C283($0)
	C_TEXT:C284(<>Progress2; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Progress2 Start")
//Progress2 Start
If (Process_No("$Progress2")=0)
	<>Progress2:="00:"+$1
	$0:=New process:C317("Progress2"; 128000; "$Progress2")
Else 
	$0:=-1
End if 
ERR_MethodTrackerReturn("Progress2 Start"; $_t_oldMethodName)
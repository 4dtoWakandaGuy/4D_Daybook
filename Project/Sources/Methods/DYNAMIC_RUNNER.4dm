//%attributes = {}
If (False:C215)
	//Project Method Name:      DYNAMIC_RUNNER
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
	C_LONGINT:C283($_l_Process)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DYNAMIC_RUNNER")

//DYNAMIC_RUNNER
DYNAMIC_SUITE
$_l_Process:=New process:C317("DYNAMIC_SUITE"; 256000; "DYN"; 13)
If (False:C215)
	$_l_Process:=New process:C317("DYNAMIC_SUITE"; 256000; "DYN"; 3)
	
	$_l_Process:=New process:C317("DYNAMIC_SUITE"; 256000; "DYN"; 1)
	$_l_Process:=New process:C317("DYNAMIC_SUITE"; 256000; "DYN"; 2)
	
	
End if 
ERR_MethodTrackerReturn("DYNAMIC_RUNNER"; $_t_oldMethodName)
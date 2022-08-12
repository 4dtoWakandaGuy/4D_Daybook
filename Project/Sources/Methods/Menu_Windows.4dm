//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_Windows
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
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	C_LONGINT:C283($_l_CurrentProcess; $1; $e)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_Windows")
$1:=$1%65536
If ($1>0)
	$_l_CurrentProcess:=Current process:C322
	If (<>PRC_al_ProcessNum{$1}#$_l_CurrentProcess)
		BRING TO FRONT:C326(<>PRC_al_ProcessNum{$1})
		RESUME PROCESS:C320(<>PRC_al_ProcessNum{$1})
		PAUSE PROCESS:C319($_l_CurrentProcess)
	End if 
End if 
ERR_MethodTrackerReturn("Menu_Windows"; $_t_oldMethodName)
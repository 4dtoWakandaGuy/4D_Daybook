//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_LaunchThermo
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
	C_LONGINT:C283($_l_WindowReference)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_LaunchThermo")
//SD_LaunchThermo: WT- 01/08/30
$_l_WindowReference:=Open form window:C675([USER:15]; "SD_Thermo")
DIALOG:C40([USER:15]; "SD_Thermo")
ERR_MethodTrackerReturn("SD_LaunchThermo"; $_t_oldMethodName)
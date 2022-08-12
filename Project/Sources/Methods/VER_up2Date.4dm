//%attributes = {}
If (False:C215)
	//Project Method Name:      VER_up2Date
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
	C_TEXT:C284($_t_DataVersionNumber; $_t_oldMethodName; $_t_StructureVersionNo)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("VER_up2Date")
//bsw 16/12/03 Version up2date method
//TRACE
DelayTicks(3600)

//$_t_DataVersionNumber:=VER_GetVersion (1)
$_t_StructureVersionNo:=VER_GetVersion
ERR_MethodTrackerReturn("VER_up2Date"; $_t_oldMethodName)

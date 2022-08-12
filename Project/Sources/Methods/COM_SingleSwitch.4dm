//%attributes = {}
If (False:C215)
	//Project Method Name:      COM_SingleSwitch
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("COM_SingleSwitch")
Single_Switch("Functions"; Current process:C322)
ERR_MethodTrackerReturn("COM_SingleSwitch"; $_t_oldMethodName)

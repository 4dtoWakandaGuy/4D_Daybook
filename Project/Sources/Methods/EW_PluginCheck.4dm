//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_PluginCheck
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_PluginCheck")
// EW_Plugincheck
// Checks to make sure that the Yapee plugin is installed
// 19/11/02 pb

ON ERR CALL:C155("EW_OnErr")
ERR_MethodTrackerReturn("EW_PluginCheck"; $_t_oldMethodName)
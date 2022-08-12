//%attributes = {}
If (False:C215)
	//Project Method Name:      JobStages_ItTop
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 19:15
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

$_t_oldMethodName:=ERR_MethodTracker("JobStages_ItTop")
If ((DB_GetModuleSettingByNUM(Module_Assemblies))>1)
	Menu_Record("JobStages_ItTop"; "Show Top Level Items")
	If (FORM Get current page:C276#1)
		If (FORM Get current page:C276=2)
			JobStages_InLOI("B")
		Else 
			JobStages_InLOI("A")
		End if 
	Else 
		Gen_Alert("Please use this Function from one of the Cost Items pages"; "Cancel")
	End if 
End if 
ERR_MethodTrackerReturn("JobStages_ItTop"; $_t_oldMethodName)
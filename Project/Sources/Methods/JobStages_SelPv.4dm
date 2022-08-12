//%attributes = {}
If (False:C215)
	//Project Method Name:      JobStages_SelPv
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
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vCompCode; vContName; vJobCode; vStage; vTitle13)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages_SelPv")
vContName:=""
vJobCode:=""
vStage:=""
vCompCode:=""
vFilePtr:=->[JOB_STAGES:47]
vTitle13:="vContName+vJobCode+vStage+vCompCode+"
ERR_MethodTrackerReturn("JobStages_SelPv"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      JobPers_SelPvs
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
	C_TEXT:C284($_t_oldMethodName; vJobCode; vPerson; vStage; vTitle13)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobPers_SelPvs")
vJobCode:=""
vStage:=""
vPerson:=""
vFilePtr:=->[JOB PERSONNEL:48]
vTitle13:="vJobCode+vStage+vPerson+"
ERR_MethodTrackerReturn("JobPers_SelPvs"; $_t_oldMethodName)
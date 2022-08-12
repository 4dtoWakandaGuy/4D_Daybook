//%attributes = {}
If (False:C215)
	//Project Method Name:      JobStages_GP
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
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vJobsTitle; vOrdTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages_GP")
Menu_Record("JobStages_GP"; "Add Product Items")
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
DB_t_CurrentFormUsage:="JobStage"
vOrdTitle:=vJobsTitle
Orders_GP
DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
ERR_MethodTrackerReturn("JobStages_GP"; $_t_oldMethodName)
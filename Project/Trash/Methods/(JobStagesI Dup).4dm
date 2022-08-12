//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobStagesI Dup
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
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStagesI Dup")
Menu_Record("JobsStagesI Dup"; "Duplicate an Item")
DB_t_CurrentFormUsage:="JobStages"
OrderI_Dup
ERR_MethodTrackerReturn("JobStagesI Dup"; $_t_oldMethodName)
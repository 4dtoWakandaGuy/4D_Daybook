If (False:C215)
	//object Name: [JOBS]dJobs_Sel.oProjectCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vContrCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].dJobs_Sel.oProjectCode"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vContrCode; ""; ->[PROJECTS:89]; ->[PROJECTS:89]Project_Code:1; ->[PROJECTS:89]Project_Name:2; "Project")
End if 
ERR_MethodTrackerReturn("OBJ [JOBS].dJobs_Sel.oProjectCode"; $_t_oldMethodName)

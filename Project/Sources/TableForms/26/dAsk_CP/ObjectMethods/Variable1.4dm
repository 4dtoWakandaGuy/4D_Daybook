If (False:C215)
	//object Name: [JOBS]dask_CP.Variable1
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
	C_TEXT:C284($_t_oldMethodName; vSolution)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].dask_CP.Variable1"; Form event code:C388)

//C_BOOLEAN(vInModalWindow)  `added kmw 30/01/07
//$OldvInModalWindow:=vInModalWindow  `added kmw 30/01/07
//vInModalWindow:=True  `added kmw 30/01/07
Check_MinorNC(->vSolution; ""; ->[JOBS:26]; ->[JOBS:26]Job_Code:1; ->[JOBS:26]Job_Name:2; "Job")
//vInModalWindow:=$OldvInModalWindow  `added kmw 30/01/07
ERR_MethodTrackerReturn("OBJ [JOBS].dask_CP.Variable1"; $_t_oldMethodName)
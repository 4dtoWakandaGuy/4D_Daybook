//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_ActionThermo
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
	C_LONGINT:C283($_l_Index; $_l_Process)
	C_REAL:C285(<>SD_Thermo)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_ActionThermo")
//SD_ActionThermo: WT - 01/08/30
$_l_Process:=New process:C317("SD_LaunchThermo"; 128*1024)
For ($_l_Index; 1; 5000)
	<>SD_Thermo:=($_l_Index/5000)*100
	If (Application type:C494#4D Server:K5:6)
		POST OUTSIDE CALL:C329(-1)
	End if 
	//do action code here
	
End for 
If (Application type:C494#4D Server:K5:6)
	POST OUTSIDE CALL:C329($_l_Process)
End if 
ERR_MethodTrackerReturn("SD_ActionThermo"; $_t_oldMethodName)

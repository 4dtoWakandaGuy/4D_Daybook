//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs Code
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
	C_LONGINT:C283($_l_IsUnique; $_l_JobCodeNumber)
	C_TEXT:C284($_t_JobCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs Code")
If ([JOBS:26]x_RecordClass:50=0)
	
	Repeat 
		$_t_JobCode:=Gen_CodePref(17; ->[JOBS:26]Job_Code:1)
		SET QUERY DESTINATION:C396(3; $_l_IsUnique)
		QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$_t_JobCode)
		SET QUERY DESTINATION:C396(0)
	Until ($_l_IsUnique=0)
	[JOBS:26]Job_Code:1:=$_t_JobCode
	
Else 
	Repeat 
		$_l_JobCodeNumber:=Gen_Code(17)  //from the same pot
		If ([JOBS:26]Job_Type:21#"")
			$_t_JobCode:=[JOBS:26]Job_Type:21+String:C10($_l_JobCodeNumber)
		Else 
			$_t_JobCode:="•TMP"+String:C10($_l_JobCodeNumber)
		End if 
		SET QUERY DESTINATION:C396(3; $_l_IsUnique)
		QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$_t_JobCode)
		SET QUERY DESTINATION:C396(0)
	Until ($_l_IsUnique=0)
	[JOBS:26]Job_Code:1:=$_t_JobCode
End if 
ERR_MethodTrackerReturn("Jobs Code"; $_t_oldMethodName)
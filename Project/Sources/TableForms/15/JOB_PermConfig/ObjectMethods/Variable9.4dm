If (False:C215)
	//object Name: [USER]JOB_PermConfig.Variable9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:24
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(JOB_al_PermJobInfoClass;0)
	//ARRAY LONGINT(JOB_al_PermJobInfoQuals;0)
	//ARRAY TEXT(JOB_at_PermJobInfos;0)
	C_TEXT:C284($_t_DataType; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].JOB_PermConfig.Variable9"; Form event code:C388)

$_t_DataType:=Gen_Request("Enter the name for the new Data type")
If ($_t_DataType#"")
	APPEND TO ARRAY:C911(JOB_at_PermJobInfos; $_t_DataType)
	INSERT IN ARRAY:C227(JOB_al_PermJobInfoClass; Size of array:C274(JOB_al_PermJobInfoClass)+1; 1)
	INSERT IN ARRAY:C227(JOB_al_PermJobInfoQuals; Size of array:C274(JOB_al_PermJobInfoQuals)+1; 1)
	JOB_LoadInformationGroupLinks(False:C215)
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].JOB_PermConfig.Variable9"; $_t_oldMethodName)

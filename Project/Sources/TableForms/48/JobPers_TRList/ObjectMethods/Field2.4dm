If (False:C215)
	//object Name: [JOB PERSONNEL]JobPers_TRLIst.Field2
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOB PERSONNEL].JobPers_TRLIst.Field2"; Form event code:C388)
RELATE ONE:C42([JOB PERSONNEL:48]Stage_Code:2)
ERR_MethodTrackerReturn("OBJ [JOB PERSONNEL].JobPers_TRLIst.Field2"; $_t_oldMethodName)
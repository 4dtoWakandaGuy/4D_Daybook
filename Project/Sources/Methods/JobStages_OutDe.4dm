//%attributes = {}
If (False:C215)
	//Project Method Name:      JobStages_OutDe
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 23:07
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

$_t_oldMethodName:=ERR_MethodTracker("JobStages_OutDe")
If (Records in set:C195("Userset")>0)
	CREATE SET:C116([JOB_STAGES:47]; "Master")
	USE SET:C118("Userset")
	Are_You_Sure
	If (OK=1)
		FIRST RECORD:C50([JOB_STAGES:47])
		While (Not:C34(End selection:C36([JOB_STAGES:47])))
			QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Code:1=[JOB_STAGES:47]Job_Code:1; *)
			QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Stage_Code:2=[JOB_STAGES:47]Stage_Code:2)
			DELETE SELECTION:C66([JOB PERSONNEL:48])
			NEXT RECORD:C51([JOB_STAGES:47])
		End while 
		DELETE SELECTION:C66([JOB_STAGES:47])
	End if 
	USE SET:C118("Master")
	Gen_OutNoF(->[JOB_STAGES:47])
End if 
ERR_MethodTrackerReturn("JobStages_OutDe"; $_t_oldMethodName)
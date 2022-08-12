//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs OutDel
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

$_t_oldMethodName:=ERR_MethodTracker("Jobs OutDel")
If (Records in set:C195("Userset")>0)
	Are_You_Sure
	If (OK=1)
		CREATE SET:C116([JOBS:26]; "JMaster")
		USE SET:C118("Userset")
		FIRST RECORD:C50([JOBS:26])
		While (Not:C34(End selection:C36([JOBS:26])))
			If ([JOBS:26]Job_Code:1#"")
				RELATE MANY:C262([JOBS:26]Job_Code:1)
				DELETE SELECTION:C66([ORDER_ITEMS:25])
				DELETE SELECTION:C66([JOB_STAGES:47])
				DELETE SELECTION:C66([JOB PERSONNEL:48])
				CustomFields_Delete(->[JOBS:26])
			End if 
			NEXT RECORD:C51([JOBS:26])
		End while 
		DELETE SELECTION:C66([JOBS:26])
		USE SET:C118("JMaster")
		Gen_OutNoF(->[JOBS:26])
	End if 
End if 
ERR_MethodTrackerReturn("Jobs OutDel"; $_t_oldMethodName)
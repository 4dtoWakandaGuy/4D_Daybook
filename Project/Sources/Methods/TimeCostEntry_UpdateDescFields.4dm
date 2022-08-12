//%attributes = {}
If (False:C215)
	//Project Method Name:      TimeCostEntry_UpdateDescFields
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
	C_TEXT:C284($_t_oldMethodName; vChargeTypeResultDescription; vJobName; vPersonName; vStageName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TimeCostEntry_UpdateDescFields")
//************************************ SET DESCRIPTION VARS-ADDED 29/1/7-KMW ******************************************
If ([ORDERS:24]Your_Order_Number:10#"")
	QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[ORDERS:24]Your_Order_Number:10)
	If (Records in selection:C76([JOBS:26])>0)
		vJobName:=[JOBS:26]Job_Name:2
	Else 
		vJobName:=""
	End if 
Else 
	vJobName:=""
End if 
If ([ORDERS:24]Source:18#"")
	QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Stage_Code:2=[ORDERS:24]Source:18; *)
	QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Job_Code:1=[ORDERS:24]Your_Order_Number:10)
	If (Records in selection:C76([JOB_STAGES:47])>0)
		vStageName:=[JOB_STAGES:47]Stage_Name:3
	Else 
		QUERY:C277([STAGES:45]; [STAGES:45]Stage_Code:1=[ORDERS:24]Source:18)
		If (Records in selection:C76([STAGES:45])>0)
			vStageName:=[STAGES:45]Stage_Name:2
		Else 
			vStageName:=""
		End if 
	End if 
Else 
	vStageName:=""
End if 
If ([ORDERS:24]Person:5#"")
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[ORDERS:24]Person:5)
	If (Records in selection:C76([PERSONNEL:11])>0)
		vPersonName:=[PERSONNEL:11]Name:2
	Else 
		vPersonName:=""
	End if 
Else 
	vPersonName:=""
End if 
If ([ORDERS:24]Taken_By:17#"")
	QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Code:1=[ORDERS:24]Taken_By:17)
	If (Records in selection:C76([RESULTS:14])>0)
		vChargeTypeResultDescription:=[RESULTS:14]Result_Name:2
	Else 
		vChargeTypeResultDescription:=""
	End if 
Else 
	vChargeTypeResultDescription:=""
End if 
//*************************************************************************************************************
ERR_MethodTrackerReturn("TimeCostEntry_UpdateDescFields"; $_t_oldMethodName)
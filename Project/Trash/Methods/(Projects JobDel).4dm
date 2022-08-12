//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Projects JobDel
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
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Projects JobDel")
$0:=False:C215
If ([JOBS:26]Project_Code:27#"")
	If (Modified record:C314([JOBS:26]))
		DB_SaveRecord(->[JOBS:26])
		AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
	End if 
	QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1)
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1)
	If ((Records in selection:C76([JOB_STAGES:47])>0) | (Records in selection:C76([ORDER_ITEMS:25])>0))
		Gen_Alert("You can't delete Jobs with Stages or Cost Items"; "Cancel")
		$0:=False:C215
	Else 
		Are_You_Sure
		If (OK=1)
			$0:=True:C214
			DELETE RECORD:C58([JOBS:26])
			QUERY:C277([JOBS:26]; [JOBS:26]Project_Code:27=[PROJECTS:89]Project_Code:1)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Projects JobDel"; $_t_oldMethodName)
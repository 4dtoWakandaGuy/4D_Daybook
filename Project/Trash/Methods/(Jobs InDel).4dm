//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs_InDel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 16:59
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

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InDel")
DB_SaveRecord(->[JOBS:26])
AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
RELATE MANY:C262([JOBS:26]Job_Code:1)
QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Allocated:28>0)
If (Records in selection:C76([ORDER_ITEMS:25])>0)
	Gen_Alert("Please unallocate items first."; "")
	RELATE MANY:C262([JOBS:26]Job_Code:1)
Else 
	Are_You_Sure
	If (OK=1)
		CREATE SET:C116([JOBS:26]; "Master")
		If ([JOBS:26]Job_Code:1#"")
			RELATE MANY:C262([JOBS:26]Job_Code:1)
			DELETE SELECTION:C66([ORDER_ITEMS:25])
			DELETE SELECTION:C66([JOB_STAGES:47])
			DELETE SELECTION:C66([JOB PERSONNEL:48])
			CustomFields_Delete(->[JOBS:26])
		End if 
		DB_DeletionControl(->[JOBS:26])
		
		DELETE RECORD:C58([JOBS:26])
		CANCEL:C270
		USE SET:C118("Master")
		Gen_InNoF(->[JOBS:26])
	End if 
End if 
ERR_MethodTrackerReturn("Jobs_InDel"; $_t_oldMethodName)
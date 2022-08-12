//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_AddJobAsResultOfOrderItem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(JC_bo_PostActualTime; JC_bo_PostBudgetTime; JC_bo_PostWIP)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_AddJobAsResultOfOrderItem")

//added 01/03/07 -kmw


$_t_oldMethodName:=ERR_MethodTracker("JC_AddJobAsResultOfOrderItem")


CREATE RECORD:C68([JOBS:26])

//Jobs_Code   `set job code
[JOBS:26]Job_Code:1:=[ORDER_ITEMS:25]Job_Code:34
//
JC_LoadPrefs  //added 07/03/07 -kmw
[JOBS:26]Budget_TR:28:=JC_bo_PostBudgetTime  //added 07/03/07 -kmw
[JOBS:26]Actual_TR:29:=JC_bo_PostActualTime  //added 07/03/07 -kmw
[JOBS:26]Use_WIP:47:=JC_bo_PostWIP  //added 07/03/07 -kmw
//
[JOBS:26]x_ID:49:=AA_GetNextID(->[JOBS:26]x_ID:49)  //should get done in trigger anyway but just in case

DB_SaveRecord(->[JOBS:26])  //added 07/03/07 kmw
ERR_MethodTrackerReturn("JC_AddJobAsResultOfOrderItem"; $_t_oldMethodName)
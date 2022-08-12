//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_AddJSAsResultOfOrderItem
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_AddJSAsResultOfOrderItem")

//added 01/03/07 -kmw

$_t_oldMethodName:=ERR_MethodTracker("JC_AddJSAsResultOfOrderItem")


CREATE RECORD:C68([JOB_STAGES:47])

[JOB_STAGES:47]x_ID:54:=AA_GetNextID(->[JOB_STAGES:47]x_ID:54)

[JOB_STAGES:47]Job_Code:1:=[ORDER_ITEMS:25]Job_Code:34
[JOB_STAGES:47]Stage_Code:2:=[ORDER_ITEMS:25]Job_Stage:35
[JOB_STAGES:47]Job_Stage_code:52:=[ORDER_ITEMS:25]Job_Stage_Code:60

DB_SaveRecord(->[JOB_STAGES:47])  //added 07/03/07 kmw
ERR_MethodTrackerReturn("JC_AddJSAsResultOfOrderItem"; $_t_oldMethodName)
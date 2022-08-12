//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_FindOrderItemsFromJS
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
	C_LONGINT:C283($_l_StageID; $1)
	C_TEXT:C284($_t_JobCode; $_t_JobStageCode; $_t_oldMethodName; $_t_StageCode; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_FindOrderItemsFromJS")

//JC_FindOrderItemsFromJS

//Added 28/02/07 -kmw

//Finds current Job Stage record's order Items records (or uses passed parameters to find Order Items records)

//Tries to find using Job Stage Code link and and also via 2 field query on job and stage "composite key".


$_t_oldMethodName:=ERR_MethodTracker("JC_FindOrderItemsFromJS")


//
If (Count parameters:C259>0)
	$_l_StageID:=$1
	QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]x_ID:54=$_l_StageID)
Else 
	$_l_StageID:=[JOB_STAGES:47]x_ID:54
End if 
If (Count parameters:C259>1)
	$_t_JobCode:=$2
Else 
	$_t_JobCode:=[JOB_STAGES:47]Job_Code:1
End if 
If (Count parameters:C259>2)
	$_t_StageCode:=$3
Else 
	$_t_StageCode:=[JOB_STAGES:47]Stage_Code:2
End if 
If (Count parameters:C259>3)
	$_t_JobStageCode:=$4
Else 
	$_t_JobStageCode:=[JOB_STAGES:47]Job_Stage_code:52
End if 
//
//******************************************************
If (Records in selection:C76([JOB_STAGES:47])>0)  //should only be 1 record found!
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Stage_Code:60=$_t_JobStageCode)
Else 
	REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
End if 
CREATE SET:C116([ORDER_ITEMS:25]; "OIRecsFromJSLink")
//******************************************************

//******************************************************
If (Records in selection:C76([JOB_STAGES:47])>0)  //should only be 1 record found!
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=$_t_JobCode; *)
	QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35=$_t_StageCode)
Else 
	REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
End if 
CREATE SET:C116([ORDER_ITEMS:25]; "OIRecsFromJSCK")
//******************************************************

UNION:C120("OIRecsFromJSLink"; "OIRecsFromJSCK"; "OIRecsFromJS")
//
USE SET:C118("OIRecsFromJS")
//
ERR_MethodTrackerReturn("JC_FindOrderItemsFromJS"; $_t_oldMethodName)
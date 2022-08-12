//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_FindJSFromOI
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
	C_LONGINT:C283($_l_OrderItemID; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_OrderJobCOde; $_t_OrderJobStage; $_t_OrderJobStageCOde; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_FindJSFromOI")

//JC_FindJSFromOI

//Added 28/02/07 -kmw

//Finds current Order Items record's Job Stage record (or uses passed parameters to find Job Stage record)

//Tries to find using Job Stage Code and also via the 2 field query on job and stage "composite key".


$_t_oldMethodName:=ERR_MethodTracker("JC_FindJSFromOI")


//
If (Count parameters:C259>0)
	$_l_OrderItemID:=$1
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ID:58=$_l_OrderItemID)
Else 
	$_l_OrderItemID:=[ORDER_ITEMS:25]x_ID:58
End if 
If (Count parameters:C259>1)
	$_t_OrderJobCOde:=$2
Else 
	$_t_OrderJobCOde:=[ORDER_ITEMS:25]Job_Code:34
End if 
If (Count parameters:C259>2)
	$_t_OrderJobStage:=$3
Else 
	$_t_OrderJobStage:=[ORDER_ITEMS:25]Job_Stage:35
End if 
If (Count parameters:C259>3)
	$_t_OrderJobStageCOde:=$4
Else 
	$_t_OrderJobStageCOde:=[ORDER_ITEMS:25]Job_Stage_Code:60
End if 
//
//******************************************************
//If (Records in selection([ORDER ITEMS])>0)  `should only be 1 record found!
If ($_t_OrderJobStageCOde#"")  //should only be 1 record found!
	QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Stage_code:52=$_t_OrderJobStageCOde)
Else 
	REDUCE SELECTION:C351([JOB_STAGES:47]; 0)
End if 
CREATE SET:C116([JOB_STAGES:47]; "JSRecsFromOILink")
//******************************************************

//******************************************************
//If (Records in selection([ORDER ITEMS])>0)  `should only be 1 record found!
If ($_t_OrderJobCOde#"") & ($_t_OrderJobStage#"")  //Changed to check for blank codes -21/03/07 -kmw
	QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=$_t_OrderJobCOde; *)
	QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Stage_Code:2=$_t_OrderJobStage)
Else 
	REDUCE SELECTION:C351([JOB_STAGES:47]; 0)
End if 
CREATE SET:C116([JOB_STAGES:47]; "JSRecsFromOICK")
//******************************************************

UNION:C120("JSRecsFromOILink"; "JSRecsFromOICK"; "JSRecsFromOI")
//
USE SET:C118("JSRecsFromOI")  //should only be one in set
ERR_MethodTrackerReturn("JC_FindJSFromOI"; $_t_oldMethodName)
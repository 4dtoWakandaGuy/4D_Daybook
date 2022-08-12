//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_FindJobFromOI
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
	C_TEXT:C284($_t_oldMethodName; $_t_OrderJobCode; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_FindJobFromOI")

//JC_FindJobFromOI

//Added 28/02/07 -kmw

//Finds current Order Items record's Job record (or uses passed parameters to find Job record)

//Simply queries Jobs based on current Order Items's Job Code or else uses passed parameters


$_t_oldMethodName:=ERR_MethodTracker("JC_FindJobFromOI")


//
If (Count parameters:C259>0)
	$_l_OrderItemID:=$1
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ID:58=$_l_OrderItemID)
Else 
	$_l_OrderItemID:=[ORDER_ITEMS:25]x_ID:58
End if 
//
If (Count parameters:C259>1)
	$_t_OrderJobCode:=$2
Else 
	$_t_OrderJobCode:=[ORDER_ITEMS:25]Job_Code:34
End if 
//
If ($_t_OrderJobCode#"")
	QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$_t_OrderJobCode)
Else 
	REDUCE SELECTION:C351([JOBS:26]; 0)
End if 
ERR_MethodTrackerReturn("JC_FindJobFromOI"; $_t_oldMethodName)
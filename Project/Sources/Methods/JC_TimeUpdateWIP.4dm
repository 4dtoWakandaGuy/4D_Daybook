//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_TimeUpdateWIP
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
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_DiaryID; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_RecordOperation; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_TimeUpdateWIP")

//not currently used -kmw


$_t_oldMethodName:=ERR_MethodTracker("JC_TimeUpdateWIP")

If (Count parameters:C259>=2)
	$_l_DiaryID:=$1
	$_t_RecordOperation:=$2
	
End if 



$0:=True:C214
ERR_MethodTrackerReturn("JC_TimeUpdateWIP"; $_t_oldMethodName)
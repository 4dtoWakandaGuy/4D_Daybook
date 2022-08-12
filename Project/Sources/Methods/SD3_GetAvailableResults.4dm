//%attributes = {}

If (False:C215)
	//Project Method Name:      SD3_GetAvailableResults
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  23/01/2020
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ResultresultRestrictions; 0)
	C_POINTER:C301($_Ptr_DiaryAttributes; $2; $3; $4)
	C_TEXT:C284($_t_actionCode; $_t_oldMethodName; $1)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD3_GetAvailableResults")

$_t_actionCode:=$1
$_Ptr_DiaryAttributes:=$2
ARRAY TEXT:C222($_at_ResultresultRestrictions; 0)
SD2_GetAttributeValue($_Ptr_DiaryAttributes->; "Result Codes"; ->$_at_ResultresultRestrictions)
If (Size of array:C274($_at_ResultresultRestrictions)=0)
	QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_t_actionCode)
	SD2_GetAttributeValue(->[ACTIONS:13]AttributesObject:42; "Result Codes"; ->$_at_ResultresultRestrictions)
End if 
If (Size of array:C274($_at_ResultresultRestrictions)=0)
	ALL RECORDS:C47([RESULTS:14])
Else 
	QUERY WITH ARRAY:C644([RESULTS:14]Result_Code:1; $_at_ResultresultRestrictions)
End if 
SELECTION TO ARRAY:C260([RESULTS:14]Result_Code:1; $3->; [RESULTS:14]Result_Name:2; $4->)
ERR_MethodTrackerReturn("SD3_GetAvailableResults"; $_t_oldMethodName)

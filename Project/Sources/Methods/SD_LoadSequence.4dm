//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_LoadSequence
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
	//ARRAY TEXT(SD_at_NAActionCodes;0)
	//ARRAY TEXT(SD_at_NASequenceCodes;0)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_LoadSequence")
QUERY:C277([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]Action_Code:1=$1; *)
QUERY:C277([WORKFLOW_CONTROL:51];  & ; [WORKFLOW_CONTROL:51]Result_Code:2=$2)
SELECTION TO ARRAY:C260([WORKFLOW_CONTROL:51]WFControl_Code:10; SD_at_NASequenceCodes; [WORKFLOW_CONTROL:51]Next_Action:3; SD_at_NAActionCodes)
SORT ARRAY:C229(SD_at_NASequenceCodes; SD_at_NAActionCodes; <)
If (Size of array:C274(SD_at_NASequenceCodes)>0)
	$0:=SD_at_NASequenceCodes{1}
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("SD_LoadSequence"; $_t_oldMethodName)

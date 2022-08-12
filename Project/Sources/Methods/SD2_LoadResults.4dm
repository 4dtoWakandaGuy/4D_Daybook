//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_LoadResults
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
	//ARRAY TEXT(SD2_at_AllResultCodes;0)
	//ARRAY TEXT(SD2_at_AllresultNames;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_LoadResults")
ALL RECORDS:C47([RESULTS:14])
ARRAY TEXT:C222(SD2_at_AllResultCodes; 0)
ARRAY TEXT:C222(SD2_at_AllresultNames; 0)
SELECTION TO ARRAY:C260([RESULTS:14]Result_Code:1; SD2_at_AllResultCodes; [RESULTS:14]Result_Name:2; SD2_at_AllresultNames)
SORT ARRAY:C229(SD2_at_AllresultNames; SD2_at_AllResultCodes)
ERR_MethodTrackerReturn("SD2_LoadResults"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_InLPSort
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2009 13:54
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

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InLPSort")
ORDER BY:C49([JOB_STAGES:47]; [JOB_STAGES:47]Stage_Code:2; >)
//SORT SELECTION([ORDER ITEMS]Sort Order;>)
ERR_MethodTrackerReturn("Jobs_InLPSort"; $_t_oldMethodName)
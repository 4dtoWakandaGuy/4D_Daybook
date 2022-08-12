//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs_InLPTot3
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
	C_LONGINT:C283(vAB)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InLPTot3")
If (False:C215)  //blanked out 12/03/07 -kmw (totals now updated using new JC methods called from List Box object)
	//*********************************************************************************
	
	If (vAB=0)
		[JOBS:26]AC_Actual_Cost_Amount:10:=Gen_Round((Sum:C1([JOB_STAGES:47]JC_Actual_Cost_Amount:32)+Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)); 2; 2)
		[JOBS:26]JC_Actual_Sales_Amount:32:=Gen_Round((Sum:C1([JOB_STAGES:47]JC_Actual_Sales_Amount:31)+Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)); 2; 2)
	End if 
	//*********************************************************************************
End if   //blanked out 12/03/07 -kmw (totals now updated using new JC methods called from List Box object)
ERR_MethodTrackerReturn("Jobs_InLPTot3"; $_t_oldMethodName)
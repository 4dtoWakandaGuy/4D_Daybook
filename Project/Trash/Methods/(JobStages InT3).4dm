//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobStages InT3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283(vAB)
	C_REAL:C285(vTot; vTot3)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages InT3")

If (False:C215)  //blanked out 12/03/07 -kmw (totals now updated using new JC methods called from List Box object)
	//*********************************************************************************
	If (vAB=0)
		If (((FORM Get current page:C276=2) | (DB_t_CurrentFormUsage3="JobB")) & (DB_GetModuleSettingByNUM(1)#5))
			[JOB_STAGES:47]JC_Budget_Cost_Amount:34:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)); 2; 2)
			[JOB_STAGES:47]JC_Budget_Sales_Amount:33:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)); 2; 2)
		Else 
			[JOB_STAGES:47]JC_Actual_Cost_Amount:32:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)); 2; 2)
			[JOB_STAGES:47]JC_Actual_Sales_Amount:31:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)); 2; 2)
		End if 
		JobStages_InT2
	End if 
	//*********************************************************************************
End if   //blanked out 12/03/07 -kmw (totals now updated using new JC methods called from List Box object)

vTot:=0
vTot3:=1
DB_bo_RecordModified:=True:C214
//See also OrderI_JSCopy
ERR_MethodTrackerReturn("JobStages InT3"; $_t_oldMethodName)
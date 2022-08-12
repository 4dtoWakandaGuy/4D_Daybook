//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_JobSetTimePostEnterability
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
	//ARRAY BOOLEAN(JOB_lb_Stages;0)
	//ARRAY POINTER(JOB_aptr_LBStageSettings;0)
	C_LONGINT:C283($_l_ColumnNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_JobSetTimePostEnterability")
//JC_JobSetTimePostEnterability

//Added 19/02/07 -kmw

//Called after any change to enterability of Job Stage list box area on Job input screen or any change to actual and budget tr checkboxes

//Forces budget and/or actual columns to be non-enterable if  Job has been set to have budget and/or actual values posted to it directly from time entry screens

If ([JOBS:26]Actual_TR:29)
	$_l_ColumnNumber:=LB_GetColumnNumFromField(->[JOB_STAGES:47]AT_Actual_Units:5; ->JOB_aptr_LBStageSettings)
	If ($_l_ColumnNumber>0)
		LB_SetEnterable(->JOB_lb_Stages; False:C215; $_l_ColumnNumber)
	End if 
	$_l_ColumnNumber:=LB_GetColumnNumFromField(->[JOB_STAGES:47]JT_Actual_Cost_Amount:29; ->JOB_aptr_LBStageSettings)
	If ($_l_ColumnNumber>0)
		LB_SetEnterable(->JOB_lb_Stages; False:C215; $_l_ColumnNumber)
	End if 
	$_l_ColumnNumber:=LB_GetColumnNumFromField(->[JOB_STAGES:47]JT_Actual_Sales_Amount:6; ->JOB_aptr_LBStageSettings)
	If ($_l_ColumnNumber>0)
		LB_SetEnterable(->JOB_lb_Stages; False:C215; $_l_ColumnNumber)
	End if 
End if 

If ([JOBS:26]Budget_TR:28)
	$_l_ColumnNumber:=LB_GetColumnNumFromField(->[JOB_STAGES:47]JT_Budget_Units:4; ->JOB_aptr_LBStageSettings)
	If ($_l_ColumnNumber>0)
		LB_SetEnterable(->JOB_lb_Stages; False:C215; $_l_ColumnNumber)
	End if 
	$_l_ColumnNumber:=LB_GetColumnNumFromField(->[JOB_STAGES:47]JT_Budget_Cost_Amount:30; ->JOB_aptr_LBStageSettings)
	If ($_l_ColumnNumber>0)
		LB_SetEnterable(->JOB_lb_Stages; False:C215; $_l_ColumnNumber)
	End if 
	$_l_ColumnNumber:=LB_GetColumnNumFromField(->[JOB_STAGES:47]AT_Budget_Sales_Amount:8; ->JOB_aptr_LBStageSettings)
	If ($_l_ColumnNumber>0)
		LB_SetEnterable(->JOB_lb_Stages; False:C215; $_l_ColumnNumber)
	End if 
End if 
ERR_MethodTrackerReturn("JC_JobSetTimePostEnterability"; $_t_oldMethodName)
//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_JSSetTimePostEnterability
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
	//ARRAY BOOLEAN(JST_LB_Persons;0)
	//ARRAY POINTER(JST_aptr_LBSettings;0)
	C_LONGINT:C283($_l_ColumnNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_JSSetTimePostEnterability")

//JC_JSSetTimePostEnterability

//Added 15/03/07 -kmw

//Called after any change to enterability of Job Stage Personnel list box area on Job Stage input screen

//Forces budget and/or actual columns to be non-enterable if Job Stage and it's Job has been set to have budget and/or actual values posted to it directly from time entry screens



$_t_oldMethodName:=ERR_MethodTracker("JC_JSSetTimePostEnterability")


JC_FindJobFromJS

If ([JOBS:26]Actual_TR:29)
	$_l_ColumnNumber:=LB_GetColumnNumFromField(->[JOB PERSONNEL:48]JT_Actual_Units:5; ->JST_aptr_LBSettings)
	If ($_l_ColumnNumber>0)
		LB_SetEnterable(->JST_LB_Persons; False:C215; $_l_ColumnNumber)
	End if 
	$_l_ColumnNumber:=LB_GetColumnNumFromField(->[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10; ->JST_aptr_LBSettings)
	If ($_l_ColumnNumber>0)
		LB_SetEnterable(->JST_LB_Persons; False:C215; $_l_ColumnNumber)
	End if 
	$_l_ColumnNumber:=LB_GetColumnNumFromField(->[JOB PERSONNEL:48]JT_Act_Sales_Amount:6; ->JST_aptr_LBSettings)
	If ($_l_ColumnNumber>0)
		LB_SetEnterable(->JST_LB_Persons; False:C215; $_l_ColumnNumber)
	End if 
End if 

If ([JOBS:26]Budget_TR:28)
	$_l_ColumnNumber:=LB_GetColumnNumFromField(->[JOB PERSONNEL:48]JT_Budget_Units:4; ->JST_aptr_LBSettings)
	If ($_l_ColumnNumber>0)
		LB_SetEnterable(->JST_LB_Persons; False:C215; $_l_ColumnNumber)
	End if 
	$_l_ColumnNumber:=LB_GetColumnNumFromField(->[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11; ->JST_aptr_LBSettings)
	If ($_l_ColumnNumber>0)
		LB_SetEnterable(->JST_LB_Persons; False:C215; $_l_ColumnNumber)
	End if 
	$_l_ColumnNumber:=LB_GetColumnNumFromField(->[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8; ->JST_aptr_LBSettings)
	If ($_l_ColumnNumber>0)
		LB_SetEnterable(->JST_LB_Persons; False:C215; $_l_ColumnNumber)
	End if 
End if 
ERR_MethodTrackerReturn("JC_JSSetTimePostEnterability"; $_t_oldMethodName)
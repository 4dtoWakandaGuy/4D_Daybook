If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.Variable9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SP_al_SalesProjectionID;0)
	//ARRAY LONGINT(SP_al_SalesRecordModified;0)
	//ARRAY TEXT(SP_at_SalesPipelineTabs;0)
	C_DATE:C307(SP_D_FilterFromDate; SP_D_FilterToDate; SP_D_TFilterFromDate; SP_D_TFilterToDate)
	C_LONGINT:C283($_l_event; $_l_Index; SP_l_GroupID; SP_l_PersonelID; SP_l_RelatedCompanyID; SP_l_SalesProjectionStateID; SP_l_tFilterType; SP_l_tGroupID; SP_l_tPersonelID; SP_l_tSalesProjectionStateID)
	C_REAL:C285(SP_R_FilterProbability)
	C_TEXT:C284($_t_oldMethodName; SP_t_AdHocName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.Variable9"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (SP_at_SalesPipelineTabs=1)
				SP_FindPipeline(SP_l_PersonelID; SP_D_FilterFromDate; SP_D_FilterToDate; SP_R_FilterProbability; ->SP_l_SalesProjectionStateID; SP_l_RelatedCompanyID; SP_l_GroupID)
				FORM GOTO PAGE:C247(1)
				
			: (SP_at_SalesPipelineTabs=2)
				If (Size of array:C274(SP_al_SalesProjectionID)>0)
					For ($_l_Index; 1; Size of array:C274(SP_al_SalesRecordModified))
						If (SP_al_SalesRecordModified{$_l_Index}>0)
							SP_UpdateProjectionfromPV($_l_Index)
						End if 
					End for 
				End if 
				SP_t_AdHocName:=[PERSONNEL:11]Name:2
				SP_FindTargets(SP_l_tPersonelID; SP_l_tGroupID; SP_t_AdHocName; SP_D_TFilterFromDate; SP_D_TFilterToDate; ->SP_l_tSalesProjectionStateID; SP_l_tFilterType)
				
				
				FORM GOTO PAGE:C247(2)
				
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.Variable9"; $_t_oldMethodName)

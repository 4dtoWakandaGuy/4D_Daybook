//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_SetValues
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
	C_DATE:C307(SP_D_SalesEnteredDate; SP_D_SalesProjectionDate)
	C_LONGINT:C283(SP_l_CurrencyID; SP_l_DIARYRELATEDID; SP_l_LoadSalesProjectionID; SP_l_ProjectionClassID; SP_l_ProjectionGroupID; SP_l_ProjectionLevelID; SP_l_ProjectionPersonID; SP_l_relatedCOmpanyID; SP_l_RelatedContactID; SP_l_RelatedRecordID; SP_l_relatedTableNUM)
	C_LONGINT:C283(SP_l_SalesProjectionStatusID)
	C_REAL:C285(SP_R_SalesProjectionACTUAL; SP_R_SalesProjectionCosts; SP_R_SalesProjectionPCT; SP_R_SalesProjectionValue)
	C_TEXT:C284($_t_oldMethodName; SP_t_SalesOrderNUM; SP_t_SalesOrderState; SP_t_SalesOrderTitle; SP_t_SalesProjectionCompany; SP_t_SalesProjectionContact; SP_T_SalesProjectionDesc; SP_t_SalesProjectionLevel; SP_t_SalesProjectionState; SP_t_SalesProjectionTitle; SP_t_SalesStatus)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_SetValues")
//this method will set the values that have been passed
//to the sales projection entry
SP_l_LoadSalesProjectionID:=0
SP_t_SalesProjectionContact:=""
SP_t_SalesProjectionCompany:=""
SP_t_SalesStatus:=""
SP_t_SalesOrderTitle:=""
SP_t_SalesOrderState:=""
SP_t_SalesProjectionState:=""
SP_t_SalesProjectionLevel:=""
//SP_t_SalesOrderNUM:=""
[SALES_PROJECTION:113]x_ID:1:=AA_GetNextIDinMethod(->[SALES_PROJECTION:113]x_ID:1)
[SALES_PROJECTION:113]RelatedDiaryID:27:=SP_l_DIARYRELATEDID
SP_l_DIARYRELATEDID:=0

If (SP_l_relatedTableNUM>0)
	
	
	
	[SALES_PROJECTION:113]RelatedSaleTableID:8:=SP_l_relatedTableNUM
	
	
End if 
If (SP_l_CurrencyID>0)
	[SALES_PROJECTION:113]CurrencyID:12:=SP_l_CurrencyID
End if 
If (SP_t_SalesOrderNUM#"")
	SP_LoadRelated(->[SALES_PROJECTION:113]RelatedSaleTableID:8; ->[SALES_PROJECTION:113]RelatedSaleRecordID:9; ->SP_t_SalesOrderNUM; ->[SALES_PROJECTION:113]CompanyID:6; ->[SALES_PROJECTION:113]ContactID:7; [SALES_PROJECTION:113]x_ID:1)
End if 
If (SP_R_SalesProjectionValue>0)
	[SALES_PROJECTION:113]GrossValue:13:=SP_R_SalesProjectionValue
End if 
If (SP_R_SalesProjectionCosts>0)
	[SALES_PROJECTION:113]GrossCosts:14:=SP_R_SalesProjectionCosts
End if 
If (SP_l_relatedCOmpanyID>0)
	[SALES_PROJECTION:113]CompanyID:6:=SP_l_relatedCOmpanyID
End if 
If (SP_l_relatedContactID>0)
	[SALES_PROJECTION:113]ContactID:7:=SP_l_relatedContactID
End if 
SP_l_relatedContactID:=0
SP_l_relatedCOmpanyID:=0
SP_R_SalesProjectionCosts:=0
SP_R_SalesProjectionValue:=0
SP_l_CurrencyID:=0
SP_l_relatedTableNUM:=0
ERR_MethodTrackerReturn("SP_SetValues"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_ModifyPipeline
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(SP_D_SalesEnteredDate; SP_D_SalesProjectionDate)
	C_LONGINT:C283($1; $2; $_l_CurrentWinRefOLD; SD_l_relatedTableNUM; SP_l_CurrencyID; SP_l_LoadSalesProjectionID; SP_l_ProjectionClassID; SP_l_ProjectionLevelID; SP_l_relatedCOmpanyID; SP_l_RelatedContactID; SP_l_RelatedRecordID)
	C_LONGINT:C283(SP_l_SalesProjectionStatusID; SP_l_ProjectionGroupID; SP_l_ProjectionPersonID; SP_l_Save; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285(SP_R_SalesProjectionACTUAL; SP_R_SalesProjectionCosts; SP_R_SalesProjectionPCT; SP_R_SalesProjectionValue)
	C_TEXT:C284($_t_oldMethodName; $3; $4; SP_t_SalesOrderNUM; SP_t_SalesOrderState; SP_t_SalesOrderTitle; SP_t_SalesProjectionLevel; SP_t_SalesProjectionState; SP_t_SalesStatus; SP_t_SalesProjectionCompany; SP_t_SalesProjectionContact)
	C_TEXT:C284(SP_t_SalesProjectionTitle; SP_T_SalesProjectionDesc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_ModifyPipeline")
SP_t_SalesProjectionContact:=""
SP_t_SalesProjectionCompany:=""
SP_t_SalesStatus:=""
SP_t_SalesOrderTitle:=""
SP_t_SalesOrderState:=""
SP_t_SalesProjectionState:=""
SP_t_SalesProjectionLevel:=""
SP_t_SalesOrderNUM:=""
READ WRITE:C146([SALES_PROJECTION:113])
If (Count parameters:C259>=1)
	If ([SALES_PROJECTION:113]x_ID:1#$1)
		QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1=$1)
		SP_l_LoadSalesProjectionID:=$1
	Else 
		SP_l_LoadSalesProjectionID:=$1
	End if 
	SP_l_ProjectionPersonID:=[SALES_PROJECTION:113]PersonnelOwnerID:4
	SP_l_ProjectionGroupID:=[SALES_PROJECTION:113]PersonnelGroupID:5
	SP_LoadLinkTypes
	SD_l_relatedTableNUM:=[SALES_PROJECTION:113]RelatedSaleTableID:8
	// SP_t_SalesOrderNUM:=[SALES_PROJECTION]RelatedSaleRecordID
	SP_l_CurrencyID:=[SALES_PROJECTION:113]CurrencyID:12
	SP_R_SalesProjectionValue:=[SALES_PROJECTION:113]GrossValue:13
	SP_R_SalesProjectionCosts:=[SALES_PROJECTION:113]GrossCosts:14
	SP_l_relatedCOmpanyID:=[SALES_PROJECTION:113]CompanyID:6
	SP_l_Save:=0
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 0)
	FORM SET INPUT:C55([SALES_PROJECTION:113]; "SalesProjectionEntry")
	MODIFY RECORD:C57([SALES_PROJECTION:113]; *)
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	UNLOAD RECORD:C212([SALES_PROJECTION:113])
	READ ONLY:C145([SALES_PROJECTION:113])
	
End if 
ERR_MethodTrackerReturn("SP_ModifyPipeline"; $_t_oldMethodName)
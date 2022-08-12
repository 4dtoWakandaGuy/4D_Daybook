If (False:C215)
	//object Name: [SALES_PROJECTION]SalesProjectionEntry.Variable18
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 17:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY LONGINT(SP_al_ListPipelineStatus;0)
	//ARRAY LONGINT(SP_al_SalesProjectionTYPEID;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	//ARRAY TEXT(SP_at_ListPipelineStatus;0)
	//ARRAY TEXT(SP_at_SalesProjectionTYPE;0)
	C_LONGINT:C283(<>newSetsProcess; $_l_event; $_l_FieldNumber; $_l_ProcessState; $_l_ProcessTime; $_l_ProjectionTypeRow; $_l_RestrictionListID; $_l_RestrictionRow; $_l_SetsProcess; $_l_SourceProcess; $_l_SourceRow)
	C_LONGINT:C283($_l_StatusRow; $_l_TableNumber; DB_l_OutCallBack; SM_l_MonitorCall; SM_l_TableNumber; SP_l_relatedTableNUM)
	C_POINTER:C301($_ptr_sourceObject; $_Ptr_Table)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $_t_TableName; $_t_TableName2; $_t_VariableName; SM_t_UseSetName; SP_t_SalesCurrency; SP_t_SalesOrderNUM; SP_t_SalesProjectionCompany; SP_t_SalesProjectionContact; SP_t_SalesProjectionState)
	C_TEXT:C284(SP_t_SalesProjectionType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].SalesProjectionEntry.Variable18"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		If (SP_t_SalesOrderNUM#"")
			//    C_POINTER($1;$2;$3)
			//$2=Pointer to variable containing related numeric record number(x_ID)
			//$3=pointer to Variable containing related STR(55) Alpha record number(code)
			[SALES_PROJECTION:113]RelatedSaleRecordID:9:=0
			$_l_RestrictionListID:=AA_GetListbyName("Table Restriction"; True:C214)
			ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
			ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
			AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
			
			SP_LoadRelated(->[SALES_PROJECTION:113]RelatedSaleTableID:8; ->[SALES_PROJECTION:113]RelatedSaleRecordID:9; ->SP_t_SalesOrderNUM; ->[SALES_PROJECTION:113]CompanyID:6; ->[SALES_PROJECTION:113]ContactID:7; [SALES_PROJECTION:113]x_ID:1)
			If ([SALES_PROJECTION:113]RelatedSaleRecordID:9>0)
				SP_GetOtherrelated(->[SALES_PROJECTION:113]RelatedSaleTableID:8; ->[SALES_PROJECTION:113]RelatedSaleRecordID:9; ->[SALES_PROJECTION:113]CurrencyID:12; ->[SALES_PROJECTION:113]CompanyID:6; ->[SALES_PROJECTION:113]ContactID:7)
				//now the screen values can be set
				SP_t_SalesProjectionCompany:=SP_LoadCompany([SALES_PROJECTION:113]CompanyID:6)
				SP_t_SalesProjectionContact:=SP_loadContact([SALES_PROJECTION:113]ContactID:7)
				SP_t_SalesCurrency:=SP_LoadCurrencyName([SALES_PROJECTION:113]CurrencyID:12)
				[SALES_PROJECTION:113]Class_ID:2:=SP_GetSaleType([SALES_PROJECTION:113]RelatedSaleTableID:8; [SALES_PROJECTION:113]RelatedSaleRecordID:9)
				If ([SALES_PROJECTION:113]Class_ID:2>0)
					$_l_ProjectionTypeRow:=Find in array:C230(SP_al_SalesProjectionTYPEID; [SALES_PROJECTION:113]Class_ID:2)
					If ($_l_ProjectionTypeRow>0)
						SP_t_SalesProjectionType:=SP_at_SalesProjectionTYPE{$_l_ProjectionTypeRow}
					End if 
				End if 
				//Get the related contacts etc
				[SALES_PROJECTION:113]Status:20:=SP_GetSalesOrderState([SALES_PROJECTION:113]RelatedSaleTableID:8; SP_t_SalesOrderNUM; [SALES_PROJECTION:113]Status:20)
				If ([SALES_PROJECTION:113]Status:20>0)
					$_l_StatusRow:=Find in array:C230(SP_al_ListPipelineStatus; [SALES_PROJECTION:113]Status:20)
					If ($_l_StatusRow>0)
						SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{$_l_StatusRow}
						//if this is a converted sale we can calculate the actual values.
					Else 
						SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{1}
						[SALES_PROJECTION:113]Status:20:=SP_al_ListPipelineStatus{1}
					End if 
				End if 
				[SALES_PROJECTION:113]GrossValue:13:=SP_GetSalesOrderValue([SALES_PROJECTION:113]RelatedSaleTableID:8; SP_t_SalesOrderNUM; ->[SALES_PROJECTION:113]ConvertedSaleValue:19; ->[SALES_PROJECTION:113]Probability:17; ->[SALES_PROJECTION:113]Expected_date:16; ->[SALES_PROJECTION:113]ConvertedSaleCosts:28)
				If ([SALES_PROJECTION:113]ConvertedSaleValue:19>0)
					OBJECT SET VISIBLE:C603([SALES_PROJECTION:113]ConvertedSaleValue:19; True:C214)
					OBJECT SET VISIBLE:C603(*; "Text_actual"; True:C214)
				Else 
					OBJECT SET ENTERABLE:C238([SALES_PROJECTION:113]ConvertedSaleValue:19; False:C215)
					OBJECT SET VISIBLE:C603([SALES_PROJECTION:113]ConvertedSaleValue:19; False:C215)
				End if 
				[SALES_PROJECTION:113]Expected_date:16:=SP_GetSalesOrderDate([SALES_PROJECTION:113]RelatedSaleTableID:8; SP_t_SalesOrderNUM; [SALES_PROJECTION:113]ConvertedSaleValue:19)
				
			End if 
		Else 
			[SALES_PROJECTION:113]RelatedSaleRecordID:9:=0
		End if 
		
	: ($_l_event=On Drop:K2:12)
		_O_DRAG AND DROP PROPERTIES:C607($_ptr_sourceObject; $_l_SourceRow; $_l_SourceProcess)
		RESOLVE POINTER:C394($_ptr_sourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		Case of 
			: ($_t_VariableName="BselectionDragger")
				//dragged from a list
				//because i wrote the sets thing to work with the set manager
				//the form method calls back to the sets process
				//here I want it to answer the sales Process_Manager
				//so need to 'fool' it
				If (<>newSetsProcess>0)
					$_l_SetsProcess:=<>newSetsProcess
				End if 
				SM_l_TableNumber:=0
				SM_t_UseSetName:=""
				//here need to check
				//table matches the relationship
				PROCESS PROPERTIES:C336($_l_SourceProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
				If ($_l_ProcessState>=0)  // 29/05/02
					SET PROCESS VARIABLE:C370($_l_SourceProcess; DB_l_OutCallBack; Current process:C322)
					SET PROCESS VARIABLE:C370($_l_SourceProcess; SM_l_MonitorCall; 9)
					Repeat 
						SET PROCESS VARIABLE:C370($_l_SourceProcess; DB_l_OutCallBack; Current process:C322)
						SET PROCESS VARIABLE:C370($_l_SourceProcess; SM_l_MonitorCall; 9)
						POST OUTSIDE CALL:C329($_l_SourceProcess)
						DelayTicks(10)
					Until (SM_l_TableNumber>0)
					$_t_TableName:=Table name:C256(SM_l_TableNumber)
					
					
					If (SM_l_TableNumber=[SALES_PROJECTION:113]RelatedSaleTableID:8)
						SET PROCESS VARIABLE:C370($_l_SourceProcess; DB_l_OutCallBack; Current process:C322)
						SET PROCESS VARIABLE:C370($_l_SourceProcess; SM_l_MonitorCall; 1)
						POST OUTSIDE CALL:C329($_l_SourceProcess)
						Repeat 
							DelayTicks(2)
						Until (SM_t_UseSetName#"")
						
						
						USE SET:C118(SM_t_UseSetName)
						//need to know what table
						$_l_RestrictionRow:=Find in array:C230(QV_al_TableRestrictionIDs; SP_l_relatedTableNUM)
						$_t_TableName2:=QV_at_TableRestrictionNMs{$_l_RestrictionRow}
						$_Ptr_Table:=Table:C252(Num:C11(SM_t_UseSetName))
						If (Records in selection:C76($_Ptr_Table->)=1)
							Case of 
								: ([SALES_PROJECTION:113]RelatedSaleTableID:8=Table:C252(->[ORDERS:24]))
									
									SP_t_SalesOrderNUM:=[ORDERS:24]Order_Code:3
								: ([SALES_PROJECTION:113]RelatedSaleTableID:8=Table:C252(->[PROJECTS:89]))
									
									SP_t_SalesOrderNUM:=[PROJECTS:89]Project_Code:1
								: ([SALES_PROJECTION:113]RelatedSaleTableID:8=Table:C252(->[JOBS:26]))
									
									SP_t_SalesOrderNUM:=[JOBS:26]Job_Code:1
									
									
									
							End case 
							[SALES_PROJECTION:113]RelatedSaleRecordID:9:=0
							SP_LoadRelated(->[SALES_PROJECTION:113]RelatedSaleTableID:8; ->[SALES_PROJECTION:113]RelatedSaleRecordID:9; ->SP_t_SalesOrderNUM; ->[SALES_PROJECTION:113]CompanyID:6; ->[SALES_PROJECTION:113]ContactID:7)
							If ([SALES_PROJECTION:113]RelatedSaleRecordID:9>0)
								SP_GetOtherrelated(->[SALES_PROJECTION:113]RelatedSaleTableID:8; ->[SALES_PROJECTION:113]RelatedSaleRecordID:9; ->[SALES_PROJECTION:113]CurrencyID:12; ->[SALES_PROJECTION:113]CompanyID:6; ->[SALES_PROJECTION:113]ContactID:7)
								//now the screen values can be set
								SP_t_SalesProjectionCompany:=SP_LoadCompany([SALES_PROJECTION:113]CompanyID:6)
								SP_t_SalesProjectionContact:=SP_loadContact([SALES_PROJECTION:113]ContactID:7)
								SP_t_SalesCurrency:=SP_LoadCurrencyName([SALES_PROJECTION:113]CurrencyID:12)
								If ([SALES_PROJECTION:113]Class_ID:2=0)
									[SALES_PROJECTION:113]Class_ID:2:=SP_GetSaleType([SALES_PROJECTION:113]RelatedSaleTableID:8; [SALES_PROJECTION:113]RelatedSaleRecordID:9)  //<------------------
									If ([SALES_PROJECTION:113]Class_ID:2>0)
										$_l_ProjectionTypeRow:=Find in array:C230(SP_al_SalesProjectionTYPEID; [SALES_PROJECTION:113]Class_ID:2)
										If ($_l_ProjectionTypeRow>0)
											SP_t_SalesProjectionType:=SP_at_SalesProjectionTYPE{$_l_ProjectionTypeRow}
										End if 
									End if 
								End if 
								//Get the related contacts etc
								[SALES_PROJECTION:113]Status:20:=SP_GetSalesOrderState([SALES_PROJECTION:113]RelatedSaleTableID:8; SP_t_SalesOrderNUM; [SALES_PROJECTION:113]Status:20)
								If ([SALES_PROJECTION:113]Status:20>0)
									$_l_StatusRow:=Find in array:C230(SP_al_ListPipelineStatus; [SALES_PROJECTION:113]Status:20)
									If ($_l_StatusRow>0)
										SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{$_l_StatusRow}
										//if this is a converted sale we can calculate the actual values.
									Else 
										SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{1}
										[SALES_PROJECTION:113]Status:20:=SP_al_ListPipelineStatus{1}
									End if 
								End if 
								[SALES_PROJECTION:113]GrossValue:13:=SP_GetSalesOrderValue([SALES_PROJECTION:113]RelatedSaleTableID:8; SP_t_SalesOrderNUM; ->[SALES_PROJECTION:113]ConvertedSaleValue:19; ->[SALES_PROJECTION:113]Probability:17; ->[SALES_PROJECTION:113]Expected_date:16; ->[SALES_PROJECTION:113]ConvertedSaleCosts:28)
								If ([SALES_PROJECTION:113]ConvertedSaleValue:19>0)
									OBJECT SET VISIBLE:C603([SALES_PROJECTION:113]ConvertedSaleValue:19; True:C214)
									OBJECT SET VISIBLE:C603(*; "Text_actual"; True:C214)
								Else 
									OBJECT SET ENTERABLE:C238([SALES_PROJECTION:113]ConvertedSaleValue:19; False:C215)
								End if 
								[SALES_PROJECTION:113]Expected_date:16:=SP_GetSalesOrderDate([SALES_PROJECTION:113]RelatedSaleTableID:8; SP_t_SalesOrderNUM; [SALES_PROJECTION:113]ConvertedSaleValue:19)
							End if 
						Else 
							[SALES_PROJECTION:113]RelatedSaleRecordID:9:=0
						End if 
					End if 
				End if 
				
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [SALES_PROJECTION].SalesProjectionEntry.Variable18"; $_t_oldMethodName)

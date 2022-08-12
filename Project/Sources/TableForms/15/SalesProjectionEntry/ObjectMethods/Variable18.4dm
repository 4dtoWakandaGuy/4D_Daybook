If (False:C215)
	//object Name: [USER]SalesProjectionEntry.Variable18
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 16:37
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
	C_DATE:C307(SP_D_SalesProjectionDate)
	C_LONGINT:C283(<>newSetsProcess; $_l_event; $_l_FieldNumber; $_l_ProcessState; $_l_ProcessTime; $_l_ProjectionTypeRow; $_l_RestrictedTableRow; $_l_RestrictionListID; $_l_RestrictionTableRow; $_l_SetsProcess; $_l_SourceProcess)
	C_LONGINT:C283($_l_SourceRow; $_l_StatusRow; $_l_TableNumber; DB_l_OutCallBack; SM_l_MonitorCall; SM_l_TableNumber; SP_l_CurrencyID; SP_l_ProjectionClassID; SP_l_relatedCOmpanyID; SP_l_relatedCOntactID; SP_l_RelatedRecordID)
	C_LONGINT:C283(SP_l_relatedTableNUM; SP_l_SalesProjectionStateID)
	C_POINTER:C301($_ptr_SourceObject; $_Ptr_Table)
	C_REAL:C285(SP_R_SalesProjectionACTUAL; SP_R_SalesProjectionPCT; SP_R_SalesProjectionValue)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $_t_TableName; $_t_TableName2; $_t_VariableName; SM_t_UseSetName; SP_t_SalesCurrency; SP_t_SalesOrderNUM; SP_t_SalesProjectionCompany; SP_t_SalesProjectionContact; SP_t_SalesProjectionState)
	C_TEXT:C284(SP_t_SalesProjectionType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SalesProjectionEntry.Variable18"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		If (SP_t_SalesOrderNUM#"")
			
			//$2=Pointer to variable containing related numeric record number(x_ID)
			//$3=pointer to Variable containing related STR(55) Alpha record number(code)
			SP_l_RelatedRecordID:=0
			$_l_RestrictionListID:=AA_GetListbyName("Table Restriction"; True:C214)
			ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
			ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
			AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
			SP_LoadRelated(->SP_l_relatedTableNUM; ->SP_l_RelatedRecordID; ->SP_t_SalesOrderNUM; ->SP_l_relatedCOmpanyID; ->SP_l_relatedCOntactID)
			If (SP_l_RelatedRecordID>0)
				SP_GetOtherrelated(->SP_l_relatedTableNUM; ->SP_l_RelatedRecordID; ->SP_l_CurrencyID; ->SP_l_relatedCOmpanyID; ->SP_l_relatedCOntactID)
				//now the screen values can be set
				SP_t_SalesProjectionCompany:=SP_LoadCompany(SP_l_RelatedCompanyID)
				SP_t_SalesProjectionContact:=SP_loadContact(SP_l_RelatedContactID)
				SP_t_SalesCurrency:=SP_LoadCurrencyName(SP_l_CurrencyID)
				
				If (SP_l_ProjectionClassID=0)
					SP_l_ProjectionClassID:=SP_GetSaleType(SP_l_relatedTableNUM; SP_l_RelatedRecordID)  //<------------------
					If (SP_l_ProjectionClassID>0)
						$_l_ProjectionTypeRow:=Find in array:C230(SP_al_SalesProjectionTYPEID; SP_l_ProjectionClassID)
						If ($_l_ProjectionTypeRow>0)
							SP_t_SalesProjectionType:=SP_at_SalesProjectionTYPE{$_l_ProjectionTypeRow}
						End if 
					End if 
				End if 
				//Get the related contacts etc
				
				
				
				SP_l_SalesProjectionStateID:=SP_GetSalesOrderState(SP_l_relatedTableNUM; SP_t_SalesOrderNUM; [SALES_PROJECTION:113]Status:20)
				If (SP_l_SalesProjectionStateID>0)
					$_l_StatusRow:=Find in array:C230(SP_al_ListPipelineStatus; SP_l_SalesProjectionStateID)
					If ($_l_StatusRow>0)
						SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{$_l_StatusRow}
						//if this is a converted sale we can calculate the actual values.
					Else 
						SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{1}
						SP_l_SalesProjectionStateID:=SP_al_ListPipelineStatus{1}
					End if 
				End if 
				SP_R_SalesProjectionValue:=SP_GetSalesOrderValue(SP_l_relatedTableNUM; SP_t_SalesOrderNUM; ->SP_R_SalesProjectionACTUAL; ->SP_R_SalesProjectionPCT; ->SP_D_SalesProjectionDate)
				If (SP_R_SalesProjectionACTUAL>0)
					OBJECT SET VISIBLE:C603(SP_R_SalesProjectionACTUAL; True:C214)
					OBJECT SET VISIBLE:C603(*; "Text_actual"; True:C214)
					
					OBJECT SET ENTERABLE:C238(SP_R_SalesProjectionACTUAL; False:C215)
					SP_R_SalesProjectionPCT:=100
					OBJECT SET ENTERABLE:C238(SP_R_SalesProjectionPCT; False:C215)
					
				End if 
				
				SP_D_SalesProjectionDate:=SP_GetSalesOrderDate(SP_l_relatedTableNUM; SP_t_SalesOrderNUM)
			End if 
		Else 
			SP_l_RelatedRecordID:=0
		End if 
		
	: ($_l_event=On Drag Over:K2:13)
		_O_DRAG AND DROP PROPERTIES:C607($_ptr_SourceObject; $_l_SourceRow; $_l_SourceProcess)
		RESOLVE POINTER:C394($_ptr_SourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
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
					// SM_l_TableNumber
					$_l_RestrictionTableRow:=Find in array:C230(QV_al_TableRestrictionIDs; SP_l_relatedTableNUM)
					$_t_TableName2:=QV_at_TableRestrictionNMs{$_l_RestrictionTableRow}
					If ($_t_TableName2=$_t_TableName)
						SET PROCESS VARIABLE:C370($_l_SourceProcess; DB_l_OutCallBack; Current process:C322)
						SET PROCESS VARIABLE:C370($_l_SourceProcess; SM_l_MonitorCall; 1)
						POST OUTSIDE CALL:C329($_l_SourceProcess)
						Repeat 
							DelayTicks(2)
						Until (SM_t_UseSetName#"")
						
						
						USE SET:C118(SM_t_UseSetName)
						//need to know what table
						$_l_RestrictedTableRow:=Find in array:C230(QV_al_TableRestrictionIDs; SP_l_relatedTableNUM)
						$_t_TableName2:=QV_at_TableRestrictionNMs{$_l_RestrictedTableRow}
						$_Ptr_Table:=Table:C252(Num:C11(SM_t_UseSetName))
						If (Records in selection:C76($_Ptr_Table->)=1)
							Case of 
								: ($_t_TableName2="ORDERS")
									SP_t_SalesOrderNUM:=[ORDERS:24]Order_Code:3
									
							End case 
							//````````
							SP_l_RelatedRecordID:=0
							$_l_RestrictionListID:=AA_GetListbyName("Table Restriction"; True:C214)
							ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
							ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
							AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
							SP_LoadRelated(->SP_l_relatedTableNUM; ->SP_l_RelatedRecordID; ->SP_t_SalesOrderNUM)
							SP_GetOtherrelated(->SP_l_relatedTableNUM; ->SP_l_RelatedRecordID; ->SP_l_CurrencyID; ->SP_l_relatedCOmpanyID; ->SP_l_relatedCOntactID)
							//now the screen values can be set
							SP_t_SalesProjectionCompany:=SP_LoadCompany(SP_l_RelatedCompanyID)
							SP_t_SalesProjectionContact:=SP_loadContact(SP_l_RelatedContactID)
							SP_t_SalesCurrency:=SP_LoadCurrencyName(SP_l_CurrencyID)
							
							If (SP_l_ProjectionClassID=0)
								SP_l_ProjectionClassID:=SP_GetSaleType(SP_l_relatedTableNUM; SP_l_RelatedRecordID)  //<------------------
								If (SP_l_ProjectionClassID>0)
									$_l_ProjectionTypeRow:=Find in array:C230(SP_al_SalesProjectionTYPEID; SP_l_ProjectionClassID)
									If ($_l_ProjectionTypeRow>0)
										SP_t_SalesProjectionType:=SP_at_SalesProjectionTYPE{$_l_ProjectionTypeRow}
									End if 
								End if 
							End if 
							//Get the related contacts etc
							
							
							
							SP_l_SalesProjectionStateID:=SP_GetSalesOrderState(SP_l_relatedTableNUM; SP_t_SalesOrderNUM; [SALES_PROJECTION:113]Status:20)
							If (SP_l_SalesProjectionStateID>0)
								$_l_StatusRow:=Find in array:C230(SP_al_ListPipelineStatus; SP_l_SalesProjectionStateID)
								If ($_l_StatusRow>0)
									SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{$_l_StatusRow}
									//if this is a converted sale we can calculate the actual values.
								Else 
									SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{1}
									SP_l_SalesProjectionStateID:=SP_al_ListPipelineStatus{1}
								End if 
							End if 
							SP_R_SalesProjectionValue:=SP_GetSalesOrderValue(SP_l_relatedTableNUM; SP_t_SalesOrderNUM; ->SP_R_SalesProjectionACTUAL)
							If (SP_R_SalesProjectionACTUAL>0)
								OBJECT SET VISIBLE:C603(SP_R_SalesProjectionACTUAL; True:C214)
								OBJECT SET VISIBLE:C603(*; "Text_actual"; True:C214)
								
								OBJECT SET ENTERABLE:C238(SP_R_SalesProjectionACTUAL; False:C215)
								SP_R_SalesProjectionPCT:=100
								OBJECT SET ENTERABLE:C238(SP_R_SalesProjectionPCT; False:C215)
								
							End if 
							
							SP_D_SalesProjectionDate:=SP_GetSalesOrderDate(SP_l_relatedTableNUM; SP_t_SalesOrderNUM)
							
							//``
						End if 
						
					Else 
					End if 
					
				End if 
				
				
				
				
				// ◊newSetsProcess:=$_l_SetsProcess
				
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SalesProjectionEntry.Variable18"; $_t_oldMethodName)

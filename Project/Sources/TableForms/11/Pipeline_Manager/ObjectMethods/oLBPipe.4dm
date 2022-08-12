If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.oLBPipe
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
	//ARRAY DATE(SP_ad_ExpectedDate;0)
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY LONGINT(SP_al_CompanyID;0)
	//ARRAY LONGINT(SP_al_CurrencyID;0)
	//ARRAY LONGINT(SP_al_LinkedTable;0)
	//ARRAY LONGINT(SP_al_ListPipelineStatus;0)
	//ARRAY LONGINT(SP_al_POPCurrencyIDs;0)
	//ARRAY LONGINT(SP_al_RealTableNums;0)
	//ARRAY LONGINT(SP_al_RelatedSaleTypeID;0)
	//ARRAY LONGINT(SP_al_SalesContactID;0)
	//ARRAY LONGINT(SP_al_SalesPipelineStatus;0)
	//ARRAY LONGINT(SP_al_SalesProjectionID;0)
	//ARRAY LONGINT(SP_al_SalesProjectionTYPEID;0)
	//ARRAY LONGINT(SP_al_SalesRecordModified;0)
	//ARRAY LONGINT(SP_al_SalesRelatedRecordID;0)
	//ARRAY LONGINT(SP_al_SalesRelatedTableID;0)
	//ARRAY REAL(SP_ar_Probability;0)
	//ARRAY REAL(SP_ar_SalesActual;0)
	//ARRAY REAL(SP_ar_SalesCosts;0)
	//ARRAY REAL(SP_ar_SalesMargin;0)
	//ARRAY REAL(SP_ar_SalesValue;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	//ARRAY TEXT(SP_at_CurrencyCode;0)
	//ARRAY TEXT(SP_at_ListPipelineStatus;0)
	//ARRAY TEXT(SP_at_PipelineStatus;0)
	//ARRAY TEXT(SP_at_PopCurrencyCodes;0)
	//ARRAY TEXT(SP_at_RealTableNames;0)
	//ARRAY TEXT(SP_at_RelatedRecordCode;0)
	//ARRAY TEXT(SP_at_RelatedSaleTypeNM;0)
	//ARRAY TEXT(SP_at_SalesCustomerName;0)
	//ARRAY TEXT(SP_at_SalesProjectionContact;0)
	//ARRAY TEXT(SP_at_SalesProjectionTYPE;0)
	//ARRAY TEXT(SP_at_SalesTitle;0)
	C_BOOLEAN:C305(<>SYS_bo_ContactDuplicateCheck; QV_bo_Drop)
	C_LONGINT:C283($_l_CompanyID; $_l_CurrencyRow; $_l_event; $_l_FieldNumber; $_l_PipelineStatusRow; $_l_ProjectionTypeRow; $_l_Row; $_l_SublistID; $_l_TableNumber; LB_l_ColumnNumber; LB_l_RowNumber)
	C_LONGINT:C283(QV_l_SourceElement; QV_l_SourceProcess; SP_l_ExitCalled)
	C_POINTER:C301(QV_Ptr_SourceObject)
	C_TEXT:C284(<>DefRole; $_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.oLBPipe"; Form event code:C388)
$_l_event:=Form event code:C388

RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)

$_l_Row:=Self:C308->
LB_l_RowNumber:=$_l_Row


Case of 
	: ($_l_event=On Drag Over:K2:13)
		// NOTE: This event was not selected on the old ALP area so I don;t kbnow if it ever worked! pb 07/07/06
		QV_bo_Drop:=False:C215
		_O_DRAG AND DROP PROPERTIES:C607(QV_Ptr_SourceObject; QV_l_SourceElement; QV_l_SourceProcess)
		RESOLVE POINTER:C394(QV_Ptr_SourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		
	: ($_l_event=On Drop:K2:12)
		If (QV_bo_Drop)
			_O_DRAG AND DROP PROPERTIES:C607(QV_Ptr_SourceObject; QV_l_SourceElement; QV_l_SourceProcess)
			RESOLVE POINTER:C394(QV_Ptr_SourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			
		End if 
		
	: ($_l_event=On Double Clicked:K2:5)
		//$_l_Row:=AL_GetLine (SP_PowerviewPIPE)
		
		If ($_l_Row>0)
			If (SP_al_SalesProjectionID{$_l_Row}>0)
				SP_ModifyPipeline(SP_al_SalesProjectionID{$_l_Row})
				
			Else 
				//not saved yet so save it
				//then open it
				SP_UpdateProjectionfromPV($_l_Row)
				SP_ModifyPipeline(SP_al_SalesProjectionID{$_l_Row})
			End if 
		End if 
		
	: ($_l_event=On Data Change:K2:15)  // used to be ALP callback
		
		//this is the cell we are leaving
		//If ($_t_VariableName>0) & ($_l_Row>0)
		Case of 
			: ($_t_VariableName="SP_at_SalesTitle")  //Title
				//capitalize
				If (SP_at_SalesTitle{$_l_Row}#SP_at_SalesTitle{0})
					SP_al_SalesRecordModified{$_l_Row}:=1
				End if 
				
			: ($_t_VariableName="SP_at_SalesCustomerName")  //company
				If (SP_l_ExitCalled=0)
					If (SP_at_SalesCustomerName{$_l_Row}#SP_at_SalesCustomerName{0})  //1
						SP_l_ExitCalled:=1
						//if the company ID is not known
						//look up the company
						$_l_CompanyID:=Check_CompanyID(->SP_at_SalesCustomerName{$_l_Row}; ->SP_al_SalesContactID{$_l_Row}; ->[SALES_PROJECTION:113])
						If ($_l_CompanyID>0)  //2
							SP_al_CompanyID{$_l_Row}:=$_l_CompanyID
							SP_at_SalesCustomerName{$_l_Row}:=SP_LoadCompany(SP_al_CompanyID{$_l_Row})
							If (SP_al_SalesContactID{$_l_Row}>0)  //3
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=SP_al_SalesContactID{$_l_Row}; *)
								QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
								If (Records in selection:C76([CONTACTS:1])=0)
									//the person is not at that company
									SP_al_SalesContactID{$_l_Row}:=0
									SP_at_SalesProjectionContact{$_l_Row}:=""
								End if   //3
							End if   //2
							
							
							//is there only one person
							If (SP_al_SalesContactID{$_l_Row}=0)  //4
								If ([COMPANIES:2]Private:37)  //5
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
									SP_al_SalesContactID{$_l_Row}:=[CONTACTS:1]x_ID:33
									SP_at_SalesProjectionContact{$_l_Row}:=[CONTACTS:1]Contact_Name:31
								Else   //5
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
									QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32#1)
									Case of   //6
										: (Records in selection:C76([CONTACTS:1])=1)
											SP_al_SalesContactID{$_l_Row}:=[CONTACTS:1]x_ID:33
											SP_at_SalesProjectionContact{$_l_Row}:=[CONTACTS:1]Contact_Name:31
										: (Records in selection:C76([CONTACTS:1])>1)
											If (<>DefRole#"")  //7
												If ([CONTACTS:1]Role:11#<>DefRole)  //8
													QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Role:11=<>DefRole; *)
													QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32#1)
													If (Records in selection:C76([CONTACTS:1])=0)  //9
														
														QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
														
														QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32#1)
													End if   //9
												Else   //8
													REDUCE SELECTION:C351([CONTACTS:1]; 1)
												End if   //8
											End if   //7
											If (<>SYS_bo_ContactDuplicateCheck) & (Records in selection:C76([CONTACTS:1])>1)  //10
												QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Duplicate_State:26#""; *)
												QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Duplicate_State:26#"U@"; *)
												QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Duplicate_State:26#"D@"; *)
												QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32#1)
											End if   //10
											If (Records in selection:C76([CONTACTS:1])=1)  //11
												SP_al_SalesContactID{$_l_Row}:=[CONTACTS:1]x_ID:33
												SP_at_SalesProjectionContact{$_l_Row}:=[CONTACTS:1]Contact_Name:31
											End if   //11
											
										Else 
											SP_al_SalesContactID{$_l_Row}:=0
											SP_at_SalesProjectionContact{$_l_Row}:=""
									End case   //6
									
									
								End if   //5
								
							End if   //4
							
							
						Else 
							SP_al_CompanyID{$_l_Row}:=0
							SP_at_SalesCustomerName{$_l_Row}:=""
							
						End if   //1
						//````
						SP_l_ExitCalled:=0
					End if 
					
					
					If (SP_al_CompanyID{$_l_Row}#SP_al_CompanyID{0})
						SP_al_SalesRecordModified{$_l_Row}:=1
					End if 
				End if 
				
			: ($_t_VariableName="SP_at_CurrencyCode")  //currency
				If (SP_ar_SalesActual{$_l_Row}>0)
					
					SP_at_CurrencyCode{$_l_Row}:=SP_at_CurrencyCode{0}
					//AL_UpdateArrays (SP_PowerviewPIPE;-2)
				Else 
					$_l_CurrencyRow:=Find in array:C230(SP_at_PopCurrencyCodes; SP_at_CurrencyCode{$_l_Row})
					If ($_l_CurrencyRow>0)
						SP_al_CurrencyID{$_l_Row}:=SP_al_POPCurrencyIDs{$_l_CurrencyRow}
						
					End if 
				End if 
				If (SP_at_CurrencyCode{$_l_Row}#SP_at_CurrencyCode{0})
					SP_al_SalesRecordModified{$_l_Row}:=1
				End if 
				
			: ($_t_VariableName="SP_ar_SalesValue")  //value
				SP_ar_SalesMargin{$_l_Row}:=SP_CalcMargin(SP_ar_SalesValue{$_l_Row}; SP_ar_SalesCosts{$_l_Row})
				If (SP_ar_SalesValue{$_l_Row}#SP_ar_SalesValue{0})
					SP_al_SalesRecordModified{$_l_Row}:=1
				End if 
				//AL_UpdateArrays (SP_PowerviewPIPE;-2)
				
			: ($_t_VariableName="SP_ar_SalesCosts")  //costs
				SP_ar_SalesMargin{$_l_Row}:=SP_CalcMargin(SP_ar_SalesValue{$_l_Row}; SP_ar_SalesCosts{$_l_Row})
				If (SP_ar_SalesCosts{$_l_Row}#SP_ar_SalesCosts{0})
					SP_al_SalesRecordModified{$_l_Row}:=1
				End if 
				//AL_UpdateArrays (SP_PowerviewPIPE;-2)
				
			: ($_t_VariableName="SP_ar_SalesMargin")  //margin(Not enterable anyway!!!)
				If (SP_ar_SalesMargin{$_l_Row}#SP_ar_SalesMargin{0})
					SP_al_SalesRecordModified{$_l_Row}:=1
				End if 
				
			: ($_t_VariableName="SP_ar_SalesActual")  //Actual
				//only enterable if not an order
				If (SP_al_SalesRelatedTableID{$_l_Row}>0)
					If (SP_al_SalesRelatedTableID{$_l_Row}=Table:C252(->[ORDERS:24]))
						
						SP_ar_SalesActual{$_l_Row}:=SP_ar_SalesActual{0}
						//AL_UpdateArrays (SP_PowerviewPIPE;-2)
					End if 
					
					
				Else 
				End if 
				
				If (SP_ar_SalesActual{$_l_Row}#SP_ar_SalesActual{0})
					SP_al_SalesRecordModified{$_l_Row}:=1
				End if 
				
			: ($_t_VariableName="SP_ad_ExpectedDate")  //ExpectedDate
				If (SP_ad_ExpectedDate{$_l_Row}#SP_ad_ExpectedDate{0})
					SP_al_SalesRecordModified{$_l_Row}:=1
				End if 
				
			: ($_t_VariableName="SP_at_RelatedSaleTypeNM")  //type
				If (SP_at_RelatedSaleTypeNM{$_l_Row}#"")
					SP_at_SalesProjectionTYPE:=Find in array:C230(SP_at_SalesProjectionTYPE; SP_at_RelatedSaleTypeNM{$_l_Row})
					SP_al_RelatedSaleTypeID{$_l_Row}:=SP_al_SalesProjectionTYPEID{SP_at_SalesProjectionTYPE}
					SP_al_SalesRelatedTableID{$_l_Row}:=SP_al_RealTableNums{Find in array:C230(SP_at_RealTableNames; QV_at_TableRestrictionNMs{Find in array:C230(QV_al_TableRestrictionIDs; SP_al_LinkedTable{SP_at_SalesProjectionTYPE})})}
					If (SP_at_RelatedSaleTypeNM{$_l_Row}#SP_at_RelatedSaleTypeNM{0})
						SP_al_SalesRecordModified{$_l_Row}:=1
					End if 
				End if 
				
			: ($_t_VariableName="SP_at_RelatedRecordCode")  //related record number
				If (SP_l_ExitCalled=0)
					If (SP_at_RelatedRecordCode{$_l_Row}#SP_at_RelatedRecordCode{0})
						//````
						SP_l_ExitCalled:=1
						
						SP_al_SalesRelatedRecordID{$_l_Row}:=0
						
						SP_LoadRelated(->SP_al_SalesRelatedTableID{$_l_Row}; ->SP_al_SalesRelatedRecordID{$_l_Row}; ->SP_at_RelatedRecordCode{$_l_Row}; ->SP_al_CompanyID{$_l_Row}; ->SP_al_SalesContactID{$_l_Row}; SP_al_SalesProjectionID{$_l_Row})
						If (SP_al_SalesRelatedRecordID{$_l_Row}>0)  //1
							
							SP_GetOtherrelated(->SP_al_SalesRelatedTableID{$_l_Row}; ->SP_al_SalesRelatedRecordID{$_l_Row}; ->SP_al_CurrencyID{$_l_Row}; ->SP_al_CompanyID{$_l_Row}; ->SP_al_SalesContactID{$_l_Row})
							//now the screen values can be set
							SP_at_SalesCustomerName{$_l_Row}:=SP_LoadCompany(SP_al_CompanyID{$_l_Row})
							SP_at_SalesProjectionContact{$_l_Row}:=SP_loadContact(SP_al_SalesContactID{$_l_Row})
							SP_at_CurrencyCode{$_l_Row}:=SP_LoadCurrencyName(SP_al_CurrencyID{$_l_Row})
							SP_al_RelatedSaleTypeID{$_l_Row}:=SP_GetSaleType(SP_al_SalesRelatedTableID{$_l_Row}; SP_al_SalesRelatedRecordID{$_l_Row})
							If (SP_al_RelatedSaleTypeID{$_l_Row}>0)  //2
								$_l_ProjectionTypeRow:=Find in array:C230(SP_al_SalesProjectionTYPEID; SP_al_RelatedSaleTypeID{$_l_Row})
								If ($_l_ProjectionTypeRow>0)  //3
									SP_at_RelatedSaleTypeNM{$_l_Row}:=SP_at_SalesProjectionTYPE{$_l_ProjectionTypeRow}
								End if   //3
							End if   //2
							//Get the related contacts etc
							SP_al_SalesPipelineStatus{$_l_Row}:=SP_GetSalesOrderState(SP_al_SalesRelatedTableID{$_l_Row}; SP_at_RelatedRecordCode{$_l_Row}; SP_al_SalesPipelineStatus{$_l_Row})
							If (SP_al_SalesPipelineStatus{$_l_Row}>0)  //4
								$_l_PipelineStatusRow:=Find in array:C230(SP_al_ListPipelineStatus; SP_al_SalesPipelineStatus{$_l_Row})
								If ($_l_PipelineStatusRow>0)  //5
									SP_at_PipelineStatus{$_l_Row}:=SP_at_ListPipelineStatus{$_l_PipelineStatusRow}
									//if this is a converted sale we can calculate the actual values.
								Else   //5
									SP_at_PipelineStatus{$_l_Row}:=SP_at_ListPipelineStatus{1}
									SP_al_SalesPipelineStatus{$_l_Row}:=SP_al_ListPipelineStatus{1}
								End if   //5
							End if   //4
							SP_ar_SalesValue{$_l_Row}:=SP_GetSalesOrderValue(SP_al_SalesRelatedTableID{$_l_Row}; SP_at_RelatedRecordCode{$_l_Row}; ->SP_ar_SalesActual{$_l_Row}; ->SP_ar_Probability{$_l_Row}; ->SP_ad_ExpectedDate{$_l_Row})
							
							SP_ad_ExpectedDate{$_l_Row}:=SP_GetSalesOrderDate(SP_al_SalesRelatedTableID{$_l_Row}; SP_at_RelatedRecordCode{$_l_Row}; SP_ar_SalesValue{$_l_Row})
							
							
						Else 
							SP_al_SalesRelatedRecordID{$_l_Row}:=0
						End if 
						SP_l_ExitCalled:=0
					End if 
					
					If (SP_at_RelatedRecordCode{$_l_Row}#SP_at_RelatedRecordCode{0})
						SP_al_SalesRecordModified{$_l_Row}:=1
					End if 
				End if 
				
				//````
			: ($_t_VariableName="SP_ar_Probability")  //Probability
				If (SP_ar_SalesActual{$_l_Row}>0)
					
					SP_ar_Probability{$_l_Row}:=SP_ar_Probability{0}
					//AL_UpdateArrays (SP_PowerviewPIPE;-2)
					
				End if 
				
			: ($_t_VariableName="SP_at_PipelineStatus")  //status
				If (SP_l_ExitCalled=0)
					If (SP_ar_SalesActual{$_l_Row}>0)
						SP_l_ExitCalled:=1
						
						SP_at_PipelineStatus{$_l_Row}:=SP_at_PipelineStatus{0}
						//AL_UpdateArrays (SP_PowerviewPIPE;-2)
					Else 
						If (SP_al_SalesRelatedRecordID{$_l_Row}>0)
							SP_al_SalesPipelineStatus{$_l_Row}:=SP_GetSalesOrderState(SP_al_SalesRelatedTableID{$_l_Row}; SP_at_RelatedRecordCode{$_l_Row}; SP_al_SalesPipelineStatus{$_l_Row})
							If (SP_al_SalesPipelineStatus{$_l_Row}>0)  //4
								$_l_PipelineStatusRow:=Find in array:C230(SP_al_ListPipelineStatus; SP_al_SalesPipelineStatus{$_l_Row})
								If ($_l_PipelineStatusRow>0)  //5
									SP_at_PipelineStatus{$_l_Row}:=SP_at_ListPipelineStatus{$_l_PipelineStatusRow}
									//if this is a converted sale we can calculate the actual values.
								Else   //5
									SP_at_PipelineStatus{$_l_Row}:=SP_at_ListPipelineStatus{1}
									SP_al_SalesPipelineStatus{$_l_Row}:=SP_al_ListPipelineStatus{1}
								End if   //5
							End if   //4
							
						End if 
						SP_l_ExitCalled:=0
					End if 
				End if 
				
		End case 
		//End if
		
		//: ($_l_event=On Plug in Area )$_l_ProjectionTypeRow
		//Case of
		//: (ALProEvt=-1)  `did user sort button
		//SP_PVProjectionSetSort
		//AL_UpdateArrays (SP_PowerviewPIPE;-2)
		
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.oLBPipe"; $_t_oldMethodName)

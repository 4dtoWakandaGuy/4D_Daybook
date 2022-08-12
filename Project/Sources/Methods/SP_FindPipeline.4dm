//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_FindPipeline
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SP_FindPipeline
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_ExpectedDate; 0)
	//ARRAY DATE(SP_ad_ExpectedDate;0)
	ARRAY LONGINT:C221($_al_CurrencyID; 0)
	ARRAY LONGINT:C221($_al_PersonIDS; 0)
	ARRAY LONGINT:C221($_al_SalesPipelineStatus; 0)
	ARRAY LONGINT:C221($_al_SalesProjectionID; 0)
	//ARRAY LONGINT(SP_al_CompanyID;0)
	//ARRAY LONGINT(SP_al_CurrencyID;0)
	//ARRAY LONGINT(SP_al_ListPipelineStatus;0)
	//ARRAY LONGINT(SP_al_POPCurrencyIDs;0)
	//ARRAY LONGINT(SP_al_RelatedSaleTypeID;0)
	//ARRAY LONGINT(SP_al_SalesContactID;0)
	//ARRAY LONGINT(SP_al_SalesPipelineStatus;0)
	//ARRAY LONGINT(SP_al_SalesProjectionID;0)
	//ARRAY LONGINT(SP_al_SalesProjectionTYPEID;0)
	//ARRAY LONGINT(SP_al_SalesRecordModified;0)
	//ARRAY LONGINT(SP_al_SalesRelatedRecordID;0)
	//ARRAY LONGINT(SP_al_SalesRelatedTableID;0)
	ARRAY REAL:C219($_ar_SalesCosts; 0)
	ARRAY REAL:C219($_ar_SalesMargin; 0)
	ARRAY REAL:C219($_ar_SalesValue; 0)
	//ARRAY REAL(SP_ar_Probability;0)
	//ARRAY REAL(SP_ar_SalesActual;0)
	//ARRAY REAL(SP_ar_SalesActualCosts;0)
	//ARRAY REAL(SP_ar_SalesCosts;0)
	//ARRAY REAL(SP_ar_SalesMargin;0)
	//ARRAY REAL(SP_ar_SalesValue;0)
	ARRAY TEXT:C222($_at_CompanyCode; 0)
	ARRAY TEXT:C222($_at_CurrencyCode; 0)
	ARRAY TEXT:C222($_at_PersonCodes; 0)
	ARRAY TEXT:C222($_at_PipelineStatus; 0)
	ARRAY TEXT:C222($_at_SalesCustomerName; 0)
	ARRAY TEXT:C222($_at_SalesTitle; 0)
	ARRAY TEXT:C222($_at_StatesRefs; 0)
	//ARRAY TEXT(SP_at_CurrencyCode;0)
	//ARRAY TEXT(SP_at_ListPipelineStatus;0)
	//ARRAY TEXT(SP_at_PipelineStatus;0)
	//ARRAY TEXT(SP_at_PopCurrencyCodes;0)
	//ARRAY TEXT(SP_at_RelatedRecordCode;0)
	//ARRAY TEXT(SP_at_RelatedSaleTypeNM;0)
	//ARRAY TEXT(SP_at_SalesCustomerName;0)
	//ARRAY TEXT(SP_at_SalesProjectionContact;0)
	//ARRAY TEXT(SP_at_SalesProjectionTYPE;0)
	//ARRAY TEXT(SP_at_SalesTitle;0)
	C_BOOLEAN:C305(<>NoUpdate)
	C_DATE:C307($2; $3)
	C_LONGINT:C283($_l_CurrencyRow; $_l_Index; $_l_ProjectionTypeRow; $_l_StatusRow; SP_NEXTPIPELINE)
	C_POINTER:C301($5)
	C_REAL:C285($1; $4; $6; $7)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_GroupCode; $_t_oldMethodName; $_t_PersonCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_FindPipeline")
//Sales can be related to
//JOBS
//ORDERS
//ATTENDEES?
ARRAY TEXT:C222($_at_StatesRefs; 0)

If (Not:C34(<>NoUpdate))
	ARRAY LONGINT:C221($_al_PersonIDS; 0)
	ARRAY TEXT:C222($_at_PersonCodes; 0)
	
	If ($1>0)
		READ ONLY:C145([PERSONNEL:11])
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$1)
		$_t_PersonCode:=[PERSONNEL:11]Initials:1
	Else 
		If (Count parameters:C259>=7)
			If ($7>0)
				READ ONLY:C145([PERSONNEL_GROUPS:92])
				QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]x_ID:12=$7)
				$_t_GroupCode:=[PERSONNEL_GROUPS:92]Group_Code:1
				UNLOAD RECORD:C212([PERSONNEL_GROUPS:92])
				READ ONLY:C145([PERSONNEL:11])
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28=$_t_GroupCode; *)
				QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38=0)
				SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; $_al_PersonIDS; [PERSONNEL:11]Initials:1; $_at_PersonCodes)
				UNLOAD RECORD:C212([PERSONNEL:11])
			End if 
			
		End if 
	End if 
	
	SP_LoadStates
	
	If (Count parameters:C259>=4)
		
		If (Size of array:C274($_al_PersonIDS)=0)
			If ($1>0)
				QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]PersonnelOwnerID:4=$1)
				CREATE SET:C116([SALES_PROJECTION:113]; "OwnerMatch")
			Else 
				ALL RECORDS:C47([SALES_PROJECTION:113])
				CREATE SET:C116([SALES_PROJECTION:113]; "OwnerMatch")
				CREATE EMPTY SET:C140([ORDERS:24]; "O_OwnerMatch")
				CREATE EMPTY SET:C140([JOBS:26]; "J_OwnerMatch")
				
			End if 
			
		Else 
			CREATE EMPTY SET:C140([SALES_PROJECTION:113]; "OwnerMatch")
			For ($_l_Index; 1; Size of array:C274($_al_PersonIDS))
				QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]PersonnelOwnerID:4=$_al_PersonIDS{$_l_Index})
				CREATE SET:C116([SALES_PROJECTION:113]; "OwnerMatch_T")
				UNION:C120("OwnerMatch"; "OwnerMatch_T"; "OwnerMatch")
			End for 
		End if 
		
		If (False:C215)
			//$_t_PersonCode:=SP_GetPersonCode($1)
			QUERY:C277([ORDERS:24]; [ORDERS:24]Person:5=$_t_PersonCode)
			CREATE SET:C116([ORDERS:24]; "O_OwnerMatch")
			QUERY:C277([JOBS:26]; [JOBS:26]Person:19=$_t_PersonCode)
			CREATE SET:C116([JOBS:26]; "J_OwnerMatch")
			
		End if 
		
		
		
		If ($2#!00-00-00!)
			QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Expected_date:16>=$2)
			CREATE SET:C116([SALES_PROJECTION:113]; "DateMatch")
			QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Date:4>=$2)
			CREATE SET:C116([ORDERS:24]; "O_DateMatch")
		Else 
			USE SET:C118("OwnerMatch")
			CREATE SET:C116([SALES_PROJECTION:113]; "DateMatch")
			If (False:C215)
				USE SET:C118("O_OwnerMatch")
				CREATE SET:C116([ORDERS:24]; "O_DateMatch")
			End if 
			
		End if 
		If ($3#!00-00-00!)
			QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Expected_date:16<=$3)
			CREATE SET:C116([SALES_PROJECTION:113]; "DateMatch2")
			QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Date:4<=$3)
			CREATE SET:C116([ORDERS:24]; "O_DateMatch2")
		Else 
			USE SET:C118("OwnerMatch")
			CREATE SET:C116([SALES_PROJECTION:113]; "DateMatch2")
			If (False:C215)
				USE SET:C118("O_OwnerMatch")
				CREATE SET:C116([ORDERS:24]; "O_DateMatch2")
			End if 
			
		End if 
		If ($4>0)
			QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Probability:17=$4)
			CREATE SET:C116([SALES_PROJECTION:113]; "ProbabilityMatch")
		Else 
			USE SET:C118("OwnerMatch")
			CREATE SET:C116([SALES_PROJECTION:113]; "ProbabilityMatch")
		End if 
		//just add any more filters in here
		
		If (Count parameters:C259>=5)
			Case of 
				: (Type:C295($5->)=LongInt array:K8:19)  //longint arr
					//pointer to array of statuses(stati)!
				: (Type:C295($5->)=Is longint:K8:6)
					If ($5->>0)
						QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Status:20=$5->)
						CREATE SET:C116([SALES_PROJECTION:113]; "StatusMatch")
						//find which file states =that state
						QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]xPipeStateID:7=$5->; *)
						QUERY:C277([TABLE_RECORD_STATES:90];  & ; [TABLE_RECORD_STATES:90]Table_number:3=Table:C252(->[ORDERS:24]))
						ARRAY TEXT:C222($_at_StatesRefs; 0)
						
						SELECTION TO ARRAY:C260([TABLE_RECORD_STATES:90]State_Reference:4; $_at_StatesRefs)
						CREATE EMPTY SET:C140([ORDERS:24]; "O_StatusMatch")
						For ($_l_Index; 1; Size of array:C274($_at_StatesRefs))
							QUERY:C277([ORDERS:24]; [ORDERS:24]State:15=$_at_StatesRefs{$_l_Index})
							CREATE SET:C116([ORDERS:24]; "Temp")
							UNION:C120("Temp"; "O_StatusMatch"; "O_StatusMatch")
						End for 
						CLEAR SET:C117("Temp")
					Else 
						USE SET:C118("OwnerMatch")
						CREATE SET:C116([SALES_PROJECTION:113]; "StatusMatch")
						
					End if 
				Else 
					USE SET:C118("OwnerMatch")
					CREATE SET:C116([SALES_PROJECTION:113]; "StatusMatch")
			End case 
		End if 
		
		If (Count parameters:C259>=6)
			If ($6>0)
				QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]CompanyID:6=$6)
				CREATE SET:C116([SALES_PROJECTION:113]; "CompanyMatch")
			Else 
				USE SET:C118("OwnerMatch")
				
				CREATE SET:C116([SALES_PROJECTION:113]; "CompanyMatch")
			End if 
		Else 
			
			USE SET:C118("OwnerMatch")
			
			CREATE SET:C116([SALES_PROJECTION:113]; "CompanyMatch")
		End if 
		
		
		
		INTERSECTION:C121("OwnerMatch"; "DateMatch"; "OwnerMatch")
		INTERSECTION:C121("OwnerMatch"; "DateMatch2"; "OwnerMatch")
		INTERSECTION:C121("OwnerMatch"; "ProbabilityMatch"; "OwnerMatch")
		INTERSECTION:C121("OwnerMatch"; "CompanyMatch"; "OwnerMatch")
		If (Count parameters:C259>=5)
			INTERSECTION:C121("OwnerMatch"; "StatusMatch"; "OwnerMatch")
		End if 
		READ ONLY:C145([CURRENCIES:71])
		ALL RECORDS:C47([CURRENCIES:71])
		QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1#"")
		SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; SP_at_PopCurrencyCodes; [CURRENCIES:71]X_ID:3; SP_al_POPCurrencyIDs)
		If (Size of array:C274(SP_al_SalesProjectionID)>0)
			For ($_l_Index; 1; Size of array:C274(SP_al_SalesRecordModified))
				If (SP_al_SalesRecordModified{$_l_Index}>0)
					SP_UpdateProjectionfromPV($_l_Index)
				End if 
			End for 
			<>NoUpdate:=False:C215
		End if 
		
		
		ARRAY LONGINT:C221(SP_al_SalesProjectionID; 0)
		ARRAY TEXT:C222(SP_at_SalesTitle; 0)
		ARRAY LONGINT:C221(SP_al_CompanyID; 0)
		ARRAY TEXT:C222(SP_at_SalesCustomerName; 0)
		ARRAY LONGINT:C221(SP_al_CurrencyID; 0)
		ARRAY TEXT:C222(SP_at_CurrencyCode; 0)
		ARRAY REAL:C219(SP_ar_SalesValue; 0)
		ARRAY REAL:C219(SP_ar_SalesCosts; 0)
		ARRAY REAL:C219(SP_ar_SalesMargin; 0)
		ARRAY DATE:C224(SP_ad_ExpectedDate; 0)
		ARRAY REAL:C219(SP_ar_Probability; 0)
		ARRAY LONGINT:C221(SP_al_SalesPipelineStatus; 0)
		ARRAY TEXT:C222(SP_at_PipelineStatus; 0)
		ARRAY LONGINT:C221(SP_al_RelatedSaleTypeID; 0)
		ARRAY TEXT:C222(SP_at_RelatedSaleTypeNM; 0)
		ARRAY REAL:C219(SP_ar_SalesActual; 0)
		ARRAY REAL:C219(SP_ar_SalesActualCosts; 0)
		ARRAY TEXT:C222(SP_at_SalesProjectionContact; 0)
		ARRAY LONGINT:C221(SP_al_SalesContactID; 0)
		ARRAY LONGINT:C221(SP_al_SalesRelatedTableID; 0)
		ARRAY LONGINT:C221(SP_al_SalesRelatedRecordID; 0)
		ARRAY LONGINT:C221(SP_al_SalesRecordModified; 0)
		ARRAY TEXT:C222(SP_at_RelatedRecordCode; 0)
		SP_NEXTPIPELINE:=1
		USE SET:C118("OwnerMatch")
		QUERY SELECTION:C341([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Forcast_LevelID:3<=1)
		
		SELECTION TO ARRAY:C260([SALES_PROJECTION:113]x_ID:1; SP_al_SalesProjectionID; [SALES_PROJECTION:113]Title:21; SP_at_SalesTitle; [SALES_PROJECTION:113]CompanyID:6; SP_al_CompanyID; [SALES_PROJECTION:113]CurrencyID:12; SP_al_CurrencyID; [SALES_PROJECTION:113]ContactID:7; SP_al_SalesContactID; [SALES_PROJECTION:113]GrossValue:13; SP_ar_SalesValue; [SALES_PROJECTION:113]GrossCosts:14; SP_ar_SalesCosts; [SALES_PROJECTION:113]GrossMargin:15; SP_ar_SalesMargin; [SALES_PROJECTION:113]Expected_date:16; SP_ad_ExpectedDate; [SALES_PROJECTION:113]Probability:17; SP_ar_Probability; [SALES_PROJECTION:113]Status:20; SP_al_SalesPipelineStatus)
		SELECTION TO ARRAY:C260([SALES_PROJECTION:113]ConvertedSaleValue:19; SP_ar_SalesActual; [SALES_PROJECTION:113]RelatedSaleTableID:8; SP_al_SalesRelatedTableID; [SALES_PROJECTION:113]RelatedSaleRecordID:9; SP_al_SalesRelatedRecordID; [SALES_PROJECTION:113]Class_ID:2; SP_al_RelatedSaleTypeID; [SALES_PROJECTION:113]ConvertedSaleCosts:28; SP_ar_SalesActualCosts)
		ARRAY LONGINT:C221(SP_al_SalesRecordModified; Size of array:C274(SP_al_CompanyID))
		ARRAY TEXT:C222(SP_at_SalesCustomerName; Size of array:C274(SP_al_CompanyID))
		ARRAY TEXT:C222(SP_at_CurrencyCode; Size of array:C274(SP_al_CurrencyID))
		ARRAY TEXT:C222(SP_at_PipelineStatus; Size of array:C274(SP_al_SalesPipelineStatus))
		ARRAY TEXT:C222(SP_at_RelatedSaleTypeNM; Size of array:C274(SP_al_SalesPipelineStatus))
		ARRAY TEXT:C222(SP_at_RelatedRecordCode; Size of array:C274(SP_al_SalesPipelineStatus))
		ARRAY TEXT:C222(SP_at_SalesProjectionContact; Size of array:C274(SP_al_SalesPipelineStatus))
		READ ONLY:C145([COMPANIES:2])
		For ($_l_Index; 1; Size of array:C274(SP_al_CompanyID))
			If (SP_al_RelatedSaleTypeID{$_l_Index}>0)
				$_l_ProjectionTypeRow:=Find in array:C230(SP_al_SalesProjectionTYPEID; SP_al_RelatedSaleTypeID{$_l_Index})
				If ($_l_ProjectionTypeRow>0)
					SP_at_RelatedSaleTypeNM{$_l_Index}:=SP_at_SalesProjectionTYPE{$_l_ProjectionTypeRow}
				Else 
					SP_at_RelatedSaleTypeNM{$_l_Index}:="Not identified"
				End if 
			Else 
				SP_at_RelatedSaleTypeNM{$_l_Index}:="Not identified"
			End if 
			
			Case of 
				: (SP_al_SalesRelatedTableID{$_l_Index}=Table:C252(->[ORDERS:24]))
					If (SP_al_SalesRelatedRecordID{$_l_Index}>0)
						QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=SP_al_SalesRelatedRecordID{$_l_Index})
						SP_at_RelatedRecordCode{$_l_Index}:=[ORDERS:24]Order_Code:3
						SP_al_SalesPipelineStatus{$_l_Index}:=SP_GetSalesOrderState(SP_al_SalesRelatedTableID{$_l_Index}; SP_at_RelatedRecordCode{$_l_Index}; SP_al_SalesPipelineStatus{$_l_Index}; False:C215)
						If (SP_al_SalesPipelineStatus{$_l_Index}>0)  //4
							$_l_StatusRow:=Find in array:C230(SP_al_ListPipelineStatus; SP_al_SalesPipelineStatus{$_l_Index})
							If ($_l_StatusRow>0)  //5
								SP_at_PipelineStatus{$_l_Index}:=SP_at_ListPipelineStatus{$_l_StatusRow}
								//if this is a converted sale we can calculate the actual values.
							Else   //5
								SP_at_PipelineStatus{$_l_Index}:=SP_at_ListPipelineStatus{1}
								SP_al_SalesPipelineStatus{$_l_Index}:=SP_al_ListPipelineStatus{1}
							End if 
						Else 
							SP_at_PipelineStatus{$_l_Index}:=SP_at_ListPipelineStatus{1}
							SP_al_SalesPipelineStatus{$_l_Index}:=SP_al_ListPipelineStatus{1}  //5
						End if   //4
					Else 
						SP_at_RelatedRecordCode{$_l_Index}:="Not Identified"
						If (SP_al_SalesPipelineStatus{$_l_Index}>0)
							$_l_StatusRow:=Find in array:C230(SP_al_ListPipelineStatus; SP_al_SalesPipelineStatus{$_l_Index})
							If ($_l_StatusRow>0)
								SP_at_PipelineStatus{$_l_Index}:=SP_at_ListPipelineStatus{$_l_StatusRow}
								SP_al_SalesPipelineStatus{$_l_Index}:=SP_al_ListPipelineStatus{$_l_StatusRow}
							Else 
								SP_at_PipelineStatus{$_l_Index}:=SP_at_ListPipelineStatus{1}
								SP_al_SalesPipelineStatus{$_l_Index}:=SP_al_ListPipelineStatus{1}
							End if 
						End if 
						
					End if 
				: (SP_al_SalesRelatedTableID{$_l_Index}=Table:C252(->[JOBS:26]))
					If (SP_al_SalesRelatedRecordID{$_l_Index}>0)
						QUERY:C277([JOBS:26]; [JOBS:26]x_ID:49=SP_al_SalesRelatedRecordID{$_l_Index})
						SP_at_RelatedRecordCode{$_l_Index}:=[JOBS:26]Job_Code:1
						SP_al_SalesPipelineStatus{$_l_Index}:=SP_GetSalesOrderState(SP_al_SalesRelatedTableID{$_l_Index}; SP_at_RelatedRecordCode{$_l_Index}; SP_al_SalesPipelineStatus{$_l_Index}; False:C215)
						If (SP_al_SalesPipelineStatus{$_l_Index}>0)  //4
							$_l_StatusRow:=Find in array:C230(SP_al_ListPipelineStatus; SP_al_SalesPipelineStatus{$_l_Index})
							If ($_l_StatusRow>0)  //5
								SP_at_PipelineStatus{$_l_Index}:=SP_at_ListPipelineStatus{$_l_StatusRow}
								//if this is a converted sale we can calculate the actual values.
							Else   //5
								SP_at_PipelineStatus{$_l_Index}:=SP_at_ListPipelineStatus{1}
								SP_al_SalesPipelineStatus{$_l_Index}:=SP_al_ListPipelineStatus{1}
							End if 
						Else 
							SP_at_PipelineStatus{$_l_Index}:=SP_at_ListPipelineStatus{1}
							SP_al_SalesPipelineStatus{$_l_Index}:=SP_al_ListPipelineStatus{1}  //5
						End if   //4
					Else 
						SP_at_RelatedRecordCode{$_l_Index}:="Not Identified"
						If (SP_al_SalesPipelineStatus{$_l_Index}>0)
							$_l_StatusRow:=Find in array:C230(SP_al_ListPipelineStatus; SP_al_SalesPipelineStatus{$_l_Index})
							If ($_l_StatusRow>0)
								SP_at_PipelineStatus{$_l_Index}:=SP_at_ListPipelineStatus{$_l_StatusRow}
								SP_al_SalesPipelineStatus{$_l_Index}:=SP_al_ListPipelineStatus{$_l_StatusRow}
							Else 
								SP_at_PipelineStatus{$_l_Index}:=SP_at_ListPipelineStatus{1}
								SP_al_SalesPipelineStatus{$_l_Index}:=SP_al_ListPipelineStatus{1}
							End if 
						End if 
						
					End if 
					
					
					
				Else 
					If (SP_al_SalesPipelineStatus{$_l_Index}>0)
						$_l_StatusRow:=Find in array:C230(SP_al_ListPipelineStatus; SP_al_SalesPipelineStatus{$_l_Index})
						If ($_l_StatusRow>0)
							SP_at_PipelineStatus{$_l_Index}:=SP_at_ListPipelineStatus{$_l_StatusRow}
							SP_al_SalesPipelineStatus{$_l_Index}:=SP_al_ListPipelineStatus{$_l_StatusRow}
						Else 
							SP_at_PipelineStatus{$_l_Index}:=SP_at_ListPipelineStatus{1}
							SP_al_SalesPipelineStatus{$_l_Index}:=SP_al_ListPipelineStatus{1}
						End if 
					End if 
					
			End case 
			
			//the table number is stored too!
			If (SP_al_CompanyID{$_l_Index}>0)
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=SP_al_CompanyID{$_l_Index})
				SP_at_SalesCustomerName{$_l_Index}:=[COMPANIES:2]Company_Name:2
			Else 
				SP_at_SalesCustomerName{$_l_Index}:=""
			End if 
			
			If (SP_al_CurrencyID{$_l_Index}>0)
				$_l_CurrencyRow:=Find in array:C230(SP_al_POPCurrencyIDs; SP_al_CurrencyID{$_l_Index})
				If ($_l_CurrencyRow>0)
					SP_at_CurrencyCode{$_l_Index}:=SP_at_PopCurrencyCodes{$_l_Index}
				Else 
					$_l_CurrencyRow:=Find in array:C230(SP_at_PopCurrencyCodes; <>SYS_t_BaseCurrency)
					If ($_l_CurrencyRow>0)
						SP_al_CurrencyID{$_l_Index}:=SP_al_POPCurrencyIDs{$_l_CurrencyRow}
					End if 
					
					SP_at_CurrencyCode{$_l_Index}:=<>SYS_t_BaseCurrency
				End if 
			Else 
				$_l_CurrencyRow:=Find in array:C230(SP_at_PopCurrencyCodes; <>SYS_t_BaseCurrency)
				If ($_l_CurrencyRow>0)
					SP_al_CurrencyID{$_l_Index}:=SP_al_POPCurrencyIDs{$_l_CurrencyRow}
				End if 
				SP_at_CurrencyCode{$_l_Index}:=<>SYS_t_BaseCurrency
			End if 
			$_l_CurrencyRow:=Find in array:C230(SP_al_ListPipelineStatus; SP_al_SalesPipelineStatus{$_l_Index})
			If ($_l_CurrencyRow>0)
				SP_at_PipelineStatus{$_l_Index}:=SP_at_ListPipelineStatus{$_l_CurrencyRow}
			Else 
				SP_at_PipelineStatus{$_l_Index}:="Unknown"
			End if 
		End for 
		
		//````
		CLEAR SET:C117("DateMatch2")
		CLEAR SET:C117("DateMatch")
		CLEAR SET:C117("ProbabilityMatch")
		
		
		CLEAR SET:C117("OwnerMatch")
		
	Else 
		REDUCE SELECTION:C351([SALES_PROJECTION:113]; 0)
	End if 
	SP_SetUpPowerviewPipeline
End if 
ERR_MethodTrackerReturn("SP_FindPipeline"; $_t_oldMethodName)

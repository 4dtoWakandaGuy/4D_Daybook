//%attributes = {}

If (False:C215)
	//Database Method Name:      SRCH_StandardSearch
	//------------------ Method Notes ------------------
	If (False:C215)
		
		
		// ----------------------------------------------------
		// Creator: Nigel Greenlee
		//Date & time: 23/11/2009`Method: SRCH_StandardSearch
		//Description
		
		//Parameters
		// ----------------------------------------------------
		//Project method Amendments
		//End Project method Amendments
		
	End if 
	
	//------------------ Revision Control ----------------
	//Date Created:  19/09/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	ARRAY TEXT:C222($_at_OrderStates; 0)
	ARRAY TEXT:C222($_at_ValidOrderStates; 0)
	C_BOOLEAN:C305($_bo_Filtered; $_bo_True)
	C_LONGINT:C283($_l_FoundTable; $_l_GetFieldNames; $_l_Invoicable; $_l_LastField; $_l_position; $_l_SearchFieldNumber; $_l_SearchTable; $_l_TableNumber; $_l_TypePosition; $1; $4)
	C_LONGINT:C283(VNo)
	C_POINTER:C301($_Ptr_Field; $_Ptr_Table)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_After; $_t_Before; $_t_CurrentViewContext; $_t_FieldName; $_t_FieldName2; $_t_OldMethodName; $_t_OrderState; $_t_OrderType; $_t_Search; $_t_SearchwithAt)
	C_TEXT:C284($_t_SearchWithWIldCard; $_t_StateCode; $2; $3; SD2_t_SearchCriteria; vSelPrev)
End if 
//Code Starts Here
$_t_OldMethodName:=ERR_MethodTracker("SRCH_StandardSearch"; Form event code:C388)

If (Count parameters:C259>=4)  //this too allow searching on a field in another table...
	$_l_SearchTable:=$4
	//in each search below then we can redirect the search to a different table(Table in $1 would not be the table of field in $2  if $4 has a value
	//so we would re-call this method to the other table(the one of the field) and then get the selection back in this table..($1)
End if 
If (Count parameters:C259>=3)
	$_t_CurrentViewContext:=$3
Else 
	$_t_CurrentViewContext:=""
End if 

If (Count parameters:C259>=2)
	Case of 
		: ($1=Table:C252(->[COMPANIES:2]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				
				Case of 
					: (SD2_t_SearchCriteria="Company:@")
						Comp_Sel2(SD2_t_SearchCriteria+$2)
					: (SD2_t_SearchCriteria="Company Code:@")
						Comp_Sel2(SD2_t_SearchCriteria+$2)
					Else 
						Comp_Sel2($2)
				End case 
			End if 
			Case of 
				: ($_t_CurrentViewContext="Renumber")
					QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Exported:45=False:C215)
			End case 
			
			//FS_SetFormSort (WIN_t_CurrentOutputform;Table(->[COMPANIES]))
			VNo:=Records in selection:C76([COMPANIES:2])
		: ($1=Table:C252(->[CONTACTS:1]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Case of 
					: (SD2_t_SearchCriteria#"")
						Cont_Sel2(SD2_t_SearchCriteria+" "+$2)
					Else 
						Cont_Sel2($2)
				End case 
			End if 
			Case of 
					
				: ($_t_CurrentViewContext="Renumber")
					QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Exported:23=False:C215)
			End case 
			
		: ($1=Table:C252(->[DIARY:12]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				
				Case of 
					: (SD2_t_SearchCriteria#"")
						Diary_Sel2(SD2_t_SearchCriteria+" "+$2; False:C215; False:C215)
					Else 
						Diary_Sel2($2; False:C215; False:C215)
						
				End case 
			End if 
			If ($_t_CurrentViewContext="Documents")
				QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15#"")
			End if 
			CREATE SET:C116([DIARY:12]; "SearchResults")  //added kmw - 02/07/08
			
			
		: ($1=Table:C252(->[ORDERS:24]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				If (SD2_t_SearchCriteria#"")
					Orders_Sel2(SD2_t_SearchCriteria+" "+$2)
				Else 
					Orders_Sel2($2)
				End if 
			End if 
			//Here apply any filers...
			If ($_t_CurrentViewContext#"")
				$_t_OrderType:=Replace string:C233($_t_CurrentViewContext; Get localized string:C991("MenuItem_View")+" "; "")
				$_l_TypePosition:=Find in array:C230(<>SYS_at_RecStateNames{24}; $_t_OrderType)
				If ($_l_TypePosition>0)
					//TRACE
					$_t_OrderState:=<>SYS_at_RecStateCodes{24}{$_l_TypePosition}
					$_t_OrderState:="024"+$_t_OrderState
					QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15=$_t_OrderState)
				Else 
					Case of 
						: ($_t_CurrentViewContext="Batch Invoice Orders")
							If (Records in selection:C76([ORDERS:24])<Records in table:C83([ORDERS:24]))
								DISTINCT VALUES:C339([ORDERS:24]State:15; $_at_OrderStates)
								ARRAY TEXT:C222($_at_ValidOrderStates; 0)
								For ($_l_Invoicable; 1; Size of array:C274($_at_OrderStates))
									$_t_OrderState:=$_at_OrderStates{$_l_Invoicable}
									$_t_StateCode:="090"+$_t_OrderState
									QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_StateCode; *)
									QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=2)
									If (Records in selection:C76([CODE_USES:91])>0)
										APPEND TO ARRAY:C911($_at_ValidOrderStates; $_at_OrderStates{$_l_Invoicable})
										
									End if 
								End for 
								QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]State:15; $_at_ValidOrderStates)
								
								RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
								QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=""; *)
								QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Invoice_Number:17="N")
								RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
								QUERY SELECTION BY FORMULA:C207([ORDERS:24]; Orders_InvSrch(False:C215))
							Else 
								QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1#"")
								QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=""; *)
								QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Invoice_Number:17="N")
								RELATE ONE SELECTION:C349([ORDER_ITEMS:25]; [ORDERS:24])
								DISTINCT VALUES:C339([ORDERS:24]State:15; $_at_OrderStates)
								ARRAY TEXT:C222($_at_ValidOrderStates; 0)
								For ($_l_Invoicable; 1; Size of array:C274($_at_OrderStates))
									$_t_OrderState:=$_at_OrderStates{$_l_Invoicable}
									$_t_StateCode:="090"+$_t_OrderState
									QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_StateCode; *)
									QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=2)
									If (Records in selection:C76([CODE_USES:91])>0)
										APPEND TO ARRAY:C911($_at_ValidOrderStates; $_at_OrderStates{$_l_Invoicable})
										
									End if 
								End for 
								QUERY SELECTION WITH ARRAY:C1050([ORDERS:24]State:15; $_at_ValidOrderStates)
								QUERY SELECTION BY FORMULA:C207([ORDERS:24]; Orders_InvSrch(False:C215))
							End if 
							
					End case 
				End if 
			End if 
		: ($1=Table:C252(->[PRODUCTS:9]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				If (SD2_t_SearchCriteria#"")
					Prod_Sel2(SD2_t_SearchCriteria+" "+$2)
				Else 
					Prod_Sel2($2)
				End if 
			End if 
		: ($1=Table:C252(->[ORDER_ITEMS:25]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				
				If (SD2_t_SearchCriteria#"")
					
					OrderI_Sel(SD2_t_SearchCriteria+" "+$2)
					
				Else 
					
					OrderI_Sel($2)
					
				End if 
			End if 
			Case of 
				: ($_t_CurrentViewContext="Subscription Billing")
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp")
					RELATE MANY SELECTION:C340([SUBSCRIPTIONS:93]Order_Item_Number:4)
					QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="B@")
					RELATE ONE SELECTION:C349([SUBSCRIPTIONS:93]; [ORDER_ITEMS:25])
					QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17="")
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp2")
					INTERSECTION:C121("$Temp2"; "$Temp"; "$Temp")
					USE SET:C118("$Temp")
					
				: ($_t_CurrentViewContext="Subscription Delivery")
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp")
					RELATE MANY SELECTION:C340([SUBSCRIPTIONS:93]Order_Item_Number:4)
					QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="ISS")
					RELATE ONE SELECTION:C349([SUBSCRIPTIONS:93]; [ORDER_ITEMS:25])
					
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp2")
					INTERSECTION:C121("$Temp2"; "$Temp"; "$Temp")
					USE SET:C118("$Temp")
					
				: ($_t_CurrentViewContext="Subscription Renewals")
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp")
					RELATE MANY SELECTION:C340([SUBSCRIPTIONS:93]Order_Item_Number:4)
					QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Type:7="REN")
					RELATE ONE SELECTION:C349([SUBSCRIPTIONS:93]; [ORDER_ITEMS:25])
					CREATE SET:C116([ORDER_ITEMS:25]; "$Temp2")
					INTERSECTION:C121("$Temp2"; "$Temp"; "$Temp")
					USE SET:C118("$Temp")
					
					
			End case 
			
		: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[ACCOUNT_BALANCES:34]; ->[ACCOUNT_BALANCES:34]Account_Code:2; ->[ACCOUNT_BALANCES:34]Period_Code:4; ->[ACCOUNT_BALANCES:34]Currency_Code:6; ->[ACCOUNT_BALANCES:34]Layer_Code:5; ->[ACCOUNT_BALANCES:34]Analysis_Code:1)
			End if 
			
			
		: ($1=Table:C252(->[ACCOUNTS:32]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3)
				
			End if 
		: ($1=Table:C252(->[ACCOUNTS_ANALYSES:157]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				
			End if 
		: ($1=Table:C252(->[ACCOUNTS_LAYERS:156]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[ACTIONS:13]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[ACTIONS:13]; ->[ACTIONS:13]Action_Code:1; ->[ACTIONS:13]Action_Name:2)
			End if 
			
		: ($1=Table:C252(->[ADDRESS_FORMATS:74]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[ADDRESS_FORMATS:74]; ->[ADDRESS_FORMATS:74]Format_Code:1; ->[ADDRESS_FORMATS:74]Format_Name:2)
			End if 
			
		: ($1=Table:C252(->[ANALYSES:36]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				
				Minor_Sel2($2; ->[ANALYSES:36]; ->[ANALYSES:36]Analysis_Code:1; ->[ANALYSES:36]Analysis_Name:2)
			End if 
			
		: ($1=Table:C252(->[AREAS:3]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[AREAS:3]; ->[AREAS:3]Area_Code:1; ->[AREAS:3]Area_Name:2)
			End if 
			
		: ($1=Table:C252(->[PRODUCT_BRANDS:8]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[PRODUCT_BRANDS:8]; ->[PRODUCT_BRANDS:8]Brand_Code:1; ->[PRODUCT_BRANDS:8]Brand_Name:2)
			End if 
			
		: ($1=Table:C252(->[X_URL_LInks:101]))
			//dont show this table
		: ($1=Table:C252(->[CATALOGUE:108]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[CATALOGUE:108]; ->[CATALOGUE:108]Catalogue_Name:2; ->[CATALOGUE:108]Catalogue_Name:2)
			End if 
		: ($1=Table:C252(->[Catalogue_Availability:110]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
			
		: ($1=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[TIME_BILLING_CATEGORIES:46]; ->[TIME_BILLING_CATEGORIES:46]Category_Code:1; ->[TIME_BILLING_CATEGORIES:46]Category_Name:2)
			End if 
		: ($1=Table:C252(->[CC_OrderAuths:133]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[CCM_PSPTransaction:136]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[CLIENT_SERVERMESSAGES:123]))
		: ($1=Table:C252(->[CODE_USES:91]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[COMPANIES_RECORD_ANALYSIS:146]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[CONTACTS_RECORD_ANALYSIS:144]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
			
		: ($1=Table:C252(->[CONTRACT_TYPES:19]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[CONTRACT_TYPES:19]; ->[CONTRACT_TYPES:19]Contract_Type_Code:1; ->[CONTRACT_TYPES:19]Contract_Type_Name:2)
			End if 
		: ($1=Table:C252(->[CONTRACTS:17]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				
				Case of 
					: (SD2_t_SearchCriteria#"")
						Contracts_Sel2(SD2_t_SearchCriteria+" "+$2)
					Else 
						Contracts_Sel2($2)
				End case 
			End if 
			
		: ($1=Table:C252(->[CONTRACTS_CONTACTS:151]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[COUNTRIES:73]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[COUNTRIES:73]; ->[COUNTRIES:73]COUNTRY_CODE:1; ->[COUNTRIES:73]COUNTRY_CODE:1)
			End if 
		: ($1=Table:C252(->[CREDIT_STAGES:54]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[CREDIT_STAGES:54]; ->[CREDIT_STAGES:54]Stage_Code:1; ->[CREDIT_STAGES:54]Stage_Name:2)
			End if 
			
		: ($1=Table:C252(->[CURRENCIES:71]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[CURRENCY_RATES:72]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
			
		: ($1=Table:C252(->[CURRENT_STOCK:62]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				
				Case of 
					: (SD2_t_SearchCriteria#"")
						StockCurrent_Sel2(SD2_t_SearchCriteria+" "+$2)
					Else 
						StockCurrent_Sel2($2)
				End case 
			End if 
			
		: ($1=Table:C252(->[DATA_AUDITS:102]))
			
		: ($1=Table:C252(->[DELETIONS:66]))
		: ($1=Table:C252(->[DIARY:12]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				//if the viewed context is letters records the filters will handle the filtering
				Case of 
					: (SD2_t_SearchCriteria#"")
						Diary_Sel2(SD2_t_SearchCriteria+" "+$2)
					Else 
						Diary_Sel2($2)
				End case 
				
			End if 
		: ($1=Table:C252(->[DIARY_ITEMOWNERS:106]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[DOCUMENTS:7]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				
				vSelPrev:=$_t_Search
				Case of 
					: (SD2_t_SearchCriteria#"")
						Letters_Sel2(SD2_t_SearchCriteria+" "+$2)
					Else 
						Letters_Sel2($2)
				End case 
			End if 
			
			//the filters will take care of the document type filtering
			
			//several types of doc window
			//if we are viewing the context of templates then this should allow naviagation to the letters-this usage of the template
			//if it is a letter view then we can nav to related companies/contacts etc because that is really the diary.
			Case of 
				: ($_t_CurrentViewContext="Letters")
					QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=4D Write Letter Template)
					
				: ($_t_CurrentViewContext="Reports")
					QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=SuperReportReport Template)
					
				: ($_t_CurrentViewContext="Emails")
					QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=Text Email Template)
					
			End case 
			//
		: ($1=Table:C252(->[EMAIL_ATTACHMENTS:103]))
		: ($1=Table:C252(->[EMAIL_RECIPIENTS:104]))
			
		: ($1=Table:C252(->[EW_BK_FieldMap:121]))
		: ($1=Table:C252(->[EW_BKFields:122]))
		: ($1=Table:C252(->[EW_ExportProjects:117]))
		: ($1=Table:C252(->[EW_ExportSteps:118]))
		: ($1=Table:C252(->[EW_ExportTables:120]))
		: ($1=Table:C252(->[EW_StepActions:119]))
		: ($1=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
			
		: ($1=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
		: ($1=Table:C252(->[TABLE_RECORD_STATES:90]))
		: ($1=Table:C252(->[IDENTIFIERS:16]))
		: ($1=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
		: ($1=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[CUSTOM_FIELDS:98]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[ADDITIONAL_RECORD_ANALYSIS:53]; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2)
			End if 
		: ($1=Table:C252(->[PRODUCT_GROUPS:10]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[PRODUCT_GROUPS:10]; ->[PRODUCT_GROUPS:10]Group_Code:1; ->[PRODUCT_GROUPS:10]Group_Name:2)
			End if 
		: ($1=Table:C252(->[HEADINGS:84]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[HEADINGS:84]; ->[HEADINGS:84]Heading_Code:1; ->[HEADINGS:84]Heading_Name:2)
			End if 
			
			
		: ($1=Table:C252(->[INFORMATION:55]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[INVOICES:39]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Case of 
					: (SD2_t_SearchCriteria#"")
						$_bo_Filtered:=Invoices_Sel2(SD2_t_SearchCriteria+" "+$2)
					Else 
						$_bo_Filtered:=Invoices_Sel2($2)
				End case 
			End if 
			Case of 
				: ($_t_CurrentViewContext="ViewCreditnotes") | ($_t_CurrentViewContext="View Credit notes")
					If (Records in selection:C76([INVOICES:39])<Records in table:C83([INVOICES:39]))
						If (Records in selection:C76([INVOICES:39])>0)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10>=0; *)
							QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Total_Invoiced:5<0)
						End if 
					Else 
						QUERY:C277([INVOICES:39]; [INVOICES:39]State:10>=0; *)
						QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Invoiced:5<0)
					End if 
				: ($_t_CurrentViewContext="ViewReceipts") | ($_t_CurrentViewContext="View Receipts")
					If (Records in selection:C76([INVOICES:39])<Records in table:C83([INVOICES:39]))
						If (Records in selection:C76([INVOICES:39])>0)
							
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10=-3)
						End if 
					Else 
						QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=-3)
					End if 
				: ($_t_CurrentViewContext="ViewDeposits") | ($_t_CurrentViewContext="View Deposits")
					If (Records in selection:C76([INVOICES:39])<Records in table:C83([INVOICES:39]))
						If (Records in selection:C76([INVOICES:39])>0)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10=-2)
						End if 
					Else 
						QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=-2)
					End if 
				: ($_t_CurrentViewContext="Proformas") | ($_t_CurrentViewContext="View Proformas")
					If (Records in selection:C76([INVOICES:39])<Records in table:C83([INVOICES:39]))
						If (Records in selection:C76([INVOICES:39])>0)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10=-1)
						End if 
					Else 
						QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=-1)
					End if 
				: ($_t_CurrentViewContext="Invoices") | ($_t_CurrentViewContext="View Invoices")
					If (Records in selection:C76([INVOICES:39])<Records in table:C83([INVOICES:39]))
						If (Records in selection:C76([INVOICES:39])>0)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10>=0)
						End if 
					Else 
						QUERY:C277([INVOICES:39]; [INVOICES:39]State:10>=0)
					End if 
				: ($_t_CurrentViewContext="Refund Deposit")
					If (Records in selection:C76([INVOICES:39])<Records in table:C83([INVOICES:39]))
						If (Records in selection:C76([INVOICES:39])>0)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Paid:6#0; *)
							QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*D"+"@"; *)
							QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0; *)
							QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
						End if 
					Else 
						QUERY:C277([INVOICES:39]; [INVOICES:39]Total_Paid:6#0; *)
						QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*D"+"@"; *)
						QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0; *)
						QUERY:C277([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
					End if 
				: ($_t_CurrentViewContext="Invoice Receipt")
					If (Records in selection:C76([INVOICES:39])<Records in table:C83([INVOICES:39]))
						If (Records in selection:C76([INVOICES:39])>0)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10=2; *)  //Deposits
							
							QUERY SELECTION:C341([INVOICES:39];  | ; [INVOICES:39]State:10=-2)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7#0)
						End if 
					Else 
						QUERY:C277([INVOICES:39]; [INVOICES:39]State:10=2; *)  //Deposits
						
						QUERY:C277([INVOICES:39];  | ; [INVOICES:39]State:10=-2)
						QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7#0)
						
					End if 
				: ($_t_CurrentViewContext="Undo Receipt")
					If (Records in selection:C76([INVOICES:39])<Records in table:C83([INVOICES:39]))
						If (Records in selection:C76([INVOICES:39])>0)
							QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Paid:6#0; *)  // Modified NG 3/8/2006
							
							QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*R"+"@"; *)
							QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
						End if 
					Else 
						QUERY:C277([INVOICES:39]; [INVOICES:39]Total_Paid:6#0; *)  // Modified NG 3/8/2006
						
						QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*R"+"@"; *)
						QUERY:C277([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)
					End if 
				Else 
					//ALL RECORDS([INVOICES])
			End case 
			
			
		: ($1=Table:C252(->[INVOICES_ALLOCATIONS:162]))
			$_l_position:=Position:C15(":"; $2)
			If ($_l_Position>0)
				$_t_Before:=Substring:C12($2; 1; $_l_position-1)
				$_t_After:=Substring:C12($2; $_l_position+1)
				$_l_TableNumber:=$1
				$_l_LastField:=Get last field number:C255($_l_TableNumber)
				For ($_l_GetFieldNames; 1; $_l_LastField)
					If (Is field number valid:C1000($_l_TableNumber; $_l_GetFieldNames))
						$_t_FieldName:=Field name:C257($_l_TableNumber; $_l_GetFieldNames)
						$_t_FieldName2:=Replace string:C233($_t_FieldName; "_"; " ")
						If ($_t_FieldName=$_t_Before) | ($_t_FieldName2=$_t_Before)
							$_l_SearchFieldNumber:=$_l_GetFieldNames
							$_l_GetFieldNames:=$_l_LastField
						End if 
					End if 
				End for 
			End if 
			$_t_SearchWithWIldCard:=Sel_AtSign($_t_after)
			$_Ptr_Table:=Table:C252($_l_TableNumber)
			$_Ptr_Field:=Field:C253($_l_TableNumber; $_l_SearchFieldNumber)
			
			Case of 
				: (Type:C295($_Ptr_Field->)=Is text:K8:3) | (Type:C295($_Ptr_Field->)=Is alpha field:K8:1)
					QUERY:C277($_Ptr_Table->; $_Ptr_Field->=$_t_after)
				: (Type:C295($_Ptr_Field->)=Is longint:K8:6) | (Type:C295($_Ptr_Field->)=Is integer:K8:5) | (Type:C295($_Ptr_Field->)=Is real:K8:4)
					QUERY:C277($_Ptr_Table->; $_Ptr_Field->=Num:C11($_t_after))
				: (Type:C295($_Ptr_Field->)=Is boolean:K8:9)
					$_bo_True:=($_t_after="1") | ($_t_after="TRUE")
					QUERY:C277($_Ptr_Table->; $_Ptr_Field->=$_bo_True)
				: (Type:C295($_Ptr_Field->)=Is date:K8:7)
					QUERY:C277($_Ptr_Table->; $_Ptr_Field->=Date:C102($_t_after))
				: (Type:C295($_Ptr_Field->)=Is time:K8:8)
					QUERY:C277($_Ptr_Table->; $_Ptr_Field->=Time:C179($_t_after))
			End case 
			
			If (Records in selection:C76($_Ptr_Table->)=0)
				Case of 
					: (Type:C295($_Ptr_Field->)=Is text:K8:3) | (Type:C295($_Ptr_Field->)=Is alpha field:K8:1)
						QUERY:C277($_Ptr_Table->; $_Ptr_Field->=$_t_SearchWithWIldCard)
				End case 
			End if 
			
			
			
		: ($1=Table:C252(->[INVOICES_ITEMS:161]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Case of 
					: (SD2_t_SearchCriteria#"")
						InvoiceItems_Sel2(SD2_t_SearchCriteria+" "+$2)
					Else 
						InvoiceItems_Sel2($2)
				End case 
			End if 
		: ($1=Table:C252(->[JOB PERSONNEL:48]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Case of 
					: (SD2_t_SearchCriteria#"")
						JobPersonnel_Sel2(SD2_t_SearchCriteria+" "+$2)
					Else 
						JobPersonnel_Sel2($2)
				End case 
			End if 
		: ($1=Table:C252(->[JOB_STAGES:47]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Case of 
					: (SD2_t_SearchCriteria#"")
						JobStages_Sel2(SD2_t_SearchCriteria+" "+$2)
					Else 
						JobStages_Sel2($2)
				End case 
			End if 
		: ($1=Table:C252(->[JOB_TYPES:65]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[JOB_TYPES:65]; ->[JOB_TYPES:65]Type_Code:1; ->[JOB_TYPES:65]Type_Name:2)
			End if 
			//Jobs
		: ($1=Table:C252(->[JOBS:26]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Case of 
					: (SD2_t_SearchCriteria#"")
						Jobs_Sel2(SD2_t_SearchCriteria+" "+$2)
					Else 
						Jobs_Sel2($2)
				End case 
			End if 
		: ($1=Table:C252(->[LAYERS:76]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2)
			End if 
		: ($1=Table:C252(->[LICENCE_UPDATES:97]))
		: ($1=Table:C252(->[LIST_LAYOUTS:96]))
			
		: ($1=Table:C252(->[LIST_ITEMS:95]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[LOCATIONS:61]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[LOCATIONS:61]; ->[LOCATIONS:61]Location_Code:1; ->[LOCATIONS:61]Location_Name:2)
			End if 
		: ($1=Table:C252(->[SCRIPTS:80]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				
				Case of 
					: (SD2_t_SearchCriteria#"")
						$_t_Search:=SD2_t_SearchCriteria+" "+$2
					Else 
						$_t_Search:=$2
				End case 
				
				If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
					ALL RECORDS:C47([SCRIPTS:80])
					
				Else 
					If ($_t_Search="Macro: @")
						$_t_Search:=Substring:C12($_t_Search; 8; 51)
						QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_Search)
						If (Records in selection:C76([SCRIPTS:80])=0)
							QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="IMA "+$_t_Search; *)
							QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="ITX "+$_t_Search; *)
							QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="ITO "+$_t_Search)
						End if 
					Else 
						$_t_SearchwithAt:=Sel_AtSign($_t_Search)
						Sel_NoAtAt(->[SCRIPTS:80]; ->[SCRIPTS:80]Script_Code:1; $_t_Search; $_t_SearchwithAt)
						If (Records in selection:C76([SCRIPTS:80])=0)
							QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="IMA "+$_t_SearchwithAt; *)
							QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="ITX "+$_t_SearchwithAt; *)
							QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="ITO "+$_t_SearchwithAt)
						End if 
						If (Records in selection:C76([SCRIPTS:80])=0)
							QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Group:9=$_t_SearchwithAt)
							If (Records in selection:C76([SCRIPTS:80])=0)
								QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Person:5=$_t_SearchwithAt)
								If (Records in selection:C76([SCRIPTS:80])=0)
									QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Keystroke:3=$_t_Search; *)
									QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Person:5=<>PER_t_CurrentUserInitials)
									If (Records in selection:C76([SCRIPTS:80])=0)
										QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Keystroke:3=$_t_Search)
										If (Records in selection:C76([SCRIPTS:80])=0)
											If ($_t_Search="Unspecified")
												$_l_FoundTable:=0
											Else 
												$_l_FoundTable:=DB_GetTableNumFromNameString($_t_Search)
											End if 
											If ($_l_FoundTable>=0)
												QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8=$_l_FoundTable)
											Else 
												QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Name:2=$_t_SearchwithAt)
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		: ($1=Table:C252(->[MAILSORT_A:77]))
		: ($1=Table:C252(->[MAILSORT_B:78]))
		: ($1=Table:C252(->[MAILSORT_C:79]))
		: ($1=Table:C252(->[MAILSORT_D5:81]))
		: ($1=Table:C252(->[MAILSORT_D6:82]))
		: ($1=Table:C252(->[MAILSORT_MAIL:83]))
			
		: ($1=Table:C252(->[MODULES:63]))
		: ($1=Table:C252(->[MOVEMENT_TYPES:60]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[MOVEMENT_TYPES:60]; ->[MOVEMENT_TYPES:60]Type_Code:1; ->[MOVEMENT_TYPES:60]Type_Name:2)
			End if 
		: ($1=Table:C252(->[PERIODS:33]))
			//There is no output form for this. there is a special interface for years and periords/ However i want to modify that form tp use a list box for the periods. And in a period input form to display account balances as at that period
			
		: ($1=Table:C252(->[PERSONNEL_GROUPS:92]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[PERSONNEL_GROUPS:92]; ->[PERSONNEL_GROUPS:92]Group_Code:1; ->[PERSONNEL_GROUPS:92]Group_Name:2)
			End if 
		: ($1=Table:C252(->[PERSONNEL:11]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2)
			End if 
			//Personel groups
			
		: ($1=Table:C252(->[PERSONNEL_DIARY_ACCESS:149]))
			
		: ($1=Table:C252(->[PICTURES:85]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[POSTAL_CODES:50]))
		: ($1=Table:C252(->[PREFERENCES:116]))
		: ($1=Table:C252(->[PRICE_GROUPS:18]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Price_Name:2)
			End if 
			
		: ($1=Table:C252(->[PRICE_TABLE:28]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Case of 
					: (SD2_t_SearchCriteria#"")
						PriceTable_Sel2(SD2_t_SearchCriteria+" "+$2)
					Else 
						PriceTable_Sel2($2)
				End case 
				//
			End if 
		: ($1=Table:C252(->[PROBLEMS:22]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[PROBLEMS:22]; ->[PROBLEMS:22]Problem_Code:1; ->[PROBLEMS:22]Problem_Name:2)
			End if 
		: ($1=Table:C252(->[PROCESSES_TO_HANDLE:115]))
			
		: ($1=Table:C252(->[PRODUCTS_SUPPLIERS:148]))
		: ($1=Table:C252(->[PROJECTS:89]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Case of 
					: (SD2_t_SearchCriteria#"")
						Projects_Sel2(SD2_t_SearchCriteria+" "+$2)
					Else 
						Projects_Sel2($2)
				End case 
			End if 
		: ($1=Table:C252(->[PUBLICATIONS:52]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
			
		: ($1=Table:C252(->[PURCHASE_ORDERS:57]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				
				Case of 
					: (SD2_t_SearchCriteria#"")
						PurchaseOrders_Sel2(SD2_t_SearchCriteria+" "+$2)
					Else 
						PurchaseOrders_Sel2($2)
				End case 
			End if 
			
		: ($1=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				//no current search for purchases items
				Case of 
					: (SD2_t_SearchCriteria#"")
						PurchaseOrderItemsSel2(SD2_t_SearchCriteria+" "+$2)
					Else 
						PurchaseOrderItemsSel2($2)
				End case 
			End if 
		: ($1=Table:C252(->[PURCHASE_INVOICES:37]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Case of 
					: (SD2_t_SearchCriteria#"")
						$_bo_Filtered:=Purchases_sel2(SD2_t_SearchCriteria+" "+$2)
					Else 
						$_bo_Filtered:=Purchases_sel2($2)
				End case 
			End if 
			Case of 
				: ($_t_CurrentViewContext="Post Purchase Invoices")
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=1)
				: ($_t_CurrentViewContext="Purchase Payment")
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=2; *)
					QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=-2)
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Total_Due:9#0)
				: ($_t_CurrentViewContext="Purchase Undo Payment")
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=-3)
				: ($_t_CurrentViewContext="Print Cheques")
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=-3; *)
					QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=-2)
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Cheque_Number:26="")
				: ($_t_CurrentViewContext="Autopay List")
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=-3; *)
					QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=-2)
					QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Due_Date:17=!00-00-00!)
					
			End case 
			
			//The filters in the above are because in the old mechanism the search itself would filter based on the form..we are using a context in a similar way but the filters are applied AFTER the search(so  filter can be turned off and the selection does not change-although in some contexts there may be filters that cannot be turned off for consistency i want the filters down this way)
		: ($1=Table:C252(->[PURCHASE_INVOICE_ALLOCATIONS:159]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
			
			//no current search for purchases items
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
			
		: ($1=Table:C252(->[QUALITY_GROUPS:56]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[RECURRING_JOURNALS:38]; ->[RECURRING_JOURNALS:38]Transaction_Type_Code:2; ->[RECURRING_JOURNALS:38]Company_Code:1)
			End if 
		: ($1=Table:C252(->[REC_JOURNALS_DATES:160]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[RESULTS:14]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[RESULTS:14]; ->[RESULTS:14]Result_Code:1; ->[RESULTS:14]Result_Name:2)
			End if 
		: ($1=Table:C252(->[ROLES:87]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[ROLES:87]; ->[ROLES:87]Role_Code:1; ->[ROLES:87]Role_Name:2)
			End if 
		: ($1=Table:C252(->[SALES_PROJECTION:113]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[SALES_ProjectionLinks:114]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[SD_Settings:107]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[SERVICE_CALLS:20]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Case of 
					: (SD2_t_SearchCriteria#"")
						Calls_Sel2(SD2_t_SearchCriteria+" "+$2)
					Else 
						Calls_Sel2($2)
				End case 
			End if 
			Case of 
				: ($_t_CurrentViewContext="Outstanding Calls")
					QUERY SELECTION:C341([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Resolved:9=False:C215)
			End case 
		: ($1=Table:C252(->[SERVICE_CALLS_PRODUCTS:152]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[SMS_Log:124]))
		: ($1=Table:C252(->[SOLUTIONS:23]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[SOLUTIONS:23]; ->[SOLUTIONS:23]Solution_Code:1; ->[SOLUTIONS:23]Solution_Name:2)
			End if 
		: ($1=Table:C252(->[SOURCES:6]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[SOURCES:6]; ->[SOURCES:6]Source_Code:1; ->[SOURCES:6]Source_Name:2)
			End if 
		: ($1=Table:C252(->[STAGES:45]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[STAGES:45]; ->[STAGES:45]Stage_Code:1; ->[STAGES:45]Stage_Name:2)
			End if 
		: ($1=Table:C252(->[STATUS:4]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
			End if 
		: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				StockItems_Sel2($2)
			End if 
			//here handle Stock_History if that is the view
			
		: ($1=Table:C252(->[STOCK_LEVELS:58]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				StockLev_Sel2($2)
			End if 
		: ($1=Table:C252(->[STOCK_MOVEMENTS:40]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Movements_Sel2($2)
			End if 
		: ($1=Table:C252(->[STOCK_TYPES:59]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[STOCK_TYPES:59]; ->[STOCK_TYPES:59]Type_Code:1; ->[STOCK_TYPES:59]Type_Name:2)
			End if 
		: ($1=Table:C252(->[Stock_Thread:143]))
		: ($1=Table:C252(->[SUBSCRIPTIONS:93]))
			//There is a subs more choices search--but no method calls it these is no sub search
			
		: ($1=Table:C252(->[SYS_LISTS:167]))
		: ($1=Table:C252(->[TAX_CODES:35]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[TAX_CODES:35]; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Name:2)
			End if 
		: ($1=Table:C252(->[TERMINOLOGY:75]))
		: ($1=Table:C252(->[TIME_BUDGETS:49]))
		: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				TransB_Sel2($2)
			End if 
			Case of 
				: ($_t_CurrentViewContext="Post Transaction Batches")
					QUERY SELECTION:C341([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]State:15=1)
				: ($_t_CurrentViewContext="Reverse Transaction Batches")
					QUERY SELECTION:C341([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Reverse:14=True:C214)
					
			End case 
			
		: ($1=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
			//no current search for this
			
		: ($1=Table:C252(->[TRANSACTION_TYPES:31]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[TRANSACTION_TYPES:31]; ->[TRANSACTION_TYPES:31]Transaction_Type_Code:1; ->[TRANSACTION_TYPES:31]Transaction_Type_Name:2)
			End if 
		: ($1=Table:C252(->[TRANS_MULTI:128]))
		: ($1=Table:C252(->[TRANSACTIONS:29]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				//Trans_Sel2
				Case of 
					: ($_t_CurrentViewContext="Check")
						
					: ($_t_CurrentViewContext="Reconcile Transactions")
						
						If (SD2_t_SearchCriteria#"")
							Transactions_Sel2(SD2_t_SearchCriteria+" "+$2)
						Else 
							Transactions_Sel2($2)
						End if 
						If (DB_GetSalesLedgerBankFrom#"")
							QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3>=DB_GetSalesLedgerBankFrom; *)
							
							If (DB_GetSalesLedgerBankTo#"")
								QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3<=DB_GetSalesLedgerBankTo)
								
							Else 
								QUERY SELECTION:C341([TRANSACTIONS:29])
								//z
							End if 
						Else 
							QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=DB_GetSalesLedgerBankTo)
						End if 
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=False:C215)
						
						
					Else 
						If (SD2_t_SearchCriteria#"")
							Transactions_Sel2(SD2_t_SearchCriteria+" "+$2)
						Else 
							Transactions_Sel2($2)
						End if 
				End case 
			End if 
		: ($1=Table:C252(->[TYPES:5]))  //
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[TYPES:5]; ->[TYPES:5]Type_Code:1; ->[TYPES:5]Type_Name:2)
			End if 
		: ($1=Table:C252(->[USER_SETS:105]))
			//not shown
		: ($1=Table:C252(->[WEB_ACCESS:130]))
			
			//not shown
		: ($1=Table:C252(->[WORKFLOW_CONTROL:51]))
			If ($_l_SearchTable>0) & ($_l_SearchTable#$1)
				//field to search is on a different table
				SRCH_StandardSearch($_l_SearchTable; $2)
				//
				DB_GetRelatedRecords($_l_SearchTable; $1; True:C214)
			Else 
				Minor_Sel2($2; ->[WORKFLOW_CONTROL:51]; ->[WORKFLOW_CONTROL:51]WFControl_Code:10; ->[WORKFLOW_CONTROL:51]Workflow_name:18)
			End if 
	End case 
	
	
	
End if   //

//FS_SetFormSort (WIN_t_CurrentOutputform;$1)
ERR_MethodTrackerReturn("SRCH_StandardSearch"; $_t_OldMethodName)

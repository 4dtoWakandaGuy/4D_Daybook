//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_IMportFindRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2009 12:09:49If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldNumber; $1)
	C_POINTER:C301($_ptr_Field; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_IMportFindRecord")
If (Count parameters:C259>=2)
	Case of 
		: ($1=Table:C252(->[CONTACTS:1])) | ($1=Table:C252(->[ACCOUNTS:32])) | ($1=Table:C252(->[JOB_STAGES:47])) | ($1=Table:C252(->[PURCHASE_ORDERS:57]))  //
			$_l_FieldNumber:=2
		: ($1=Table:C252(->[DIARY:12])) | ($1=Table:C252(->[CONTRACTS:17])) | ($1=Table:C252(->[ORDERS:24]))
			$_l_FieldNumber:=3
		: ($1=Table:C252(->[USER:15])) | ($1=Table:C252(->[IDENTIFIERS:16])) | ($1=Table:C252(->[CURRENCY_RATES:72]))
			$_l_FieldNumber:=0
		: ($1=Table:C252(->[SERVICE_CALLS:20]))
			$_l_FieldNumber:=4
		: ($1=Table:C252(->[ORDER_ITEMS:25]))
			$_l_FieldNumber:=Field:C253(->[ORDER_ITEMS:25]x_ID:58)
		: ($1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
			$_l_FieldNumber:=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
		: ($1=Table:C252(->[PRICE_TABLE:28])) | ($1=Table:C252(->[TRANSACTIONS:29]))
			$_l_FieldNumber:=0
		: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))  //
			$_l_FieldNumber:=Field:C253(->[TRANSACTION_BATCHES:30]Batch_Number:10)
		: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))  //
			$_l_FieldNumber:=Field:C253(->[TRANSACTION_BATCHES:30]Batch_Number:10)
		: ($1=Table:C252(->[ACCOUNT_BALANCES:34])) | ($1=Table:C252(->[RECURRING_JOURNALS:38])) | ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
			
			//
			$_l_FieldNumber:=0
			
		: ($1=Table:C252(->[JOB PERSONNEL:48])) | ($1=Table:C252(->[TIME_BUDGETS:49])) | ($1=Table:C252(->[POSTAL_CODES:50])) | ($1=Table:C252(->[DELETIONS:66]))
			$_l_FieldNumber:=0
		: ($1=Table:C252(->[WORKFLOW_CONTROL:51])) | ($1=Table:C252(->[INFORMATION:55])) | ($1=Table:C252(->[QUALITY_GROUPS:56])) | ($1=Table:C252(->[STOCK_LEVELS:58]))
			$_l_FieldNumber:=0
		: ($1=Table:C252(->[CURRENT_STOCK:62]))  //
			$_l_FieldNumber:=Field:C253(->[CURRENT_STOCK:62]Item_Number:5)
		: ($1=Table:C252(->[MAILSORT_A:77])) | ($1=Table:C252(->[MAILSORT_B:78])) | ($1=Table:C252(->[MAILSORT_C:79])) | ($1=Table:C252(->[MAILSORT_D5:81])) | ($1=Table:C252(->[MAILSORT_D6:82])) | ($1=Table:C252(->[COMPONENTS:86])) | ($1=Table:C252(->[CODE_USES:91]))
			$_l_FieldNumber:=0
		: ($1=Table:C252(->[SUBSCRIPTIONS:93])) | ($1=Table:C252(->[LIST_ITEMS:95])) | ($1=Table:C252(->[LICENCE_UPDATES:97])) | ($1=Table:C252(->[LIST_ITEMS:95]))
			$_l_FieldNumber:=0
		: ($1=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99])) | ($1=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100])) | ($1=Table:C252(->[X_URL_LInks:101])) | ($1=Table:C252(->[EMAIL_ATTACHMENTS:103])) | ($1=Table:C252(->[EMAIL_RECIPIENTS:104])) | ($1=Table:C252(->[DIARY_ITEMOWNERS:106])) | ($1=Table:C252(->[CLIENT_SERVERMESSAGES:123]))
			$_l_FieldNumber:=0
		: ($1=Table:C252(->[SD_Settings:107])) | ($1=Table:C252(->[PROCESSES_TO_HANDLE:115])) | ($1=Table:C252(->[PREFERENCES:116])) | ($1=Table:C252(->[EW_ExportProjects:117])) | ($1=Table:C252(->[EW_ExportSteps:118])) | ($1=Table:C252(->[EW_StepActions:119])) | ($1=Table:C252(->[EW_ExportTables:120])) | ($1=Table:C252(->[EW_BK_FieldMap:121])) | ($1=Table:C252(->[EW_BKFields:122]))
			
			$_l_FieldNumber:=0
		: ($1=Table:C252(->[SMS_Log:124]))  //
			$_l_FieldNumber:=Field:C253(->[SMS_Log:124]X_ID:8)
		Else   //Companies `status  `area` types`sources`documents`brands`products
			//groups`personnel`   action`result`price groups`contract types
			
			$_l_FieldNumber:=1
	End case 
	
	REDUCE SELECTION:C351(Table:C252($1)->; 0)
	If ($_l_FieldNumber>0)
		$_ptr_Field:=Field:C253($1; $_l_FieldNumber)
		Case of 
			: (Type:C295($_ptr_Field->)=Is text:K8:3)
				QUERY:C277(Table:C252($1)->; $_ptr_Field->=$2->{$_l_FieldNumber})
			: (Type:C295($_ptr_Field->)=Is alpha field:K8:1)
				QUERY:C277(Table:C252($1)->; $_ptr_Field->=$2->{$_l_FieldNumber})
			: (Type:C295($_ptr_Field->)=Is longint:K8:6) | (Type:C295($_ptr_Field->)=Is integer:K8:5) | (Type:C295($_ptr_Field->)=Is real:K8:4)
				QUERY:C277(Table:C252($1)->; $_ptr_Field->=Num:C11($2->{$_l_FieldNumber}))
			: (Type:C295($_ptr_Field->)=Is boolean:K8:9)
				QUERY:C277(Table:C252($1)->; $_ptr_Field->=(($2->{$_l_FieldNumber}="TRUE")); *)
				QUERY:C277(Table:C252($1)->;  | ; $_ptr_Field->=($2->{$_l_FieldNumber}="1"))
				
				
			: (Type:C295($_ptr_Field->)=Is date:K8:7)
				QUERY:C277(Table:C252($1)->; $_ptr_Field->=Date:C102($2->{$_l_FieldNumber}))
		End case 
	Else 
		//field num is 0 because cant use a single field to check
		Case of 
			: ($1=Table:C252(->[USER:15]))
				QUERY:C277([USER:15]; [USER:15]Organisation:1=$2->{1}; *)
				QUERY:C277([USER:15];  & ; [USER:15]Path Name:12=$2->{12})
			: ($1=Table:C252(->[IDENTIFIERS:16]))
				Case of 
					: ($2->{1}#"")
						QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=Num:C11($2->{1}))
					: ($2->{8}#"")
						QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]XRef_FIELD:8=Num:C11($2->{8}))
					: ($2->{9}#"")
						QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]XRef_Contextual:9=$2->{9})
				End case 
			: ($1=Table:C252(->[CURRENCY_RATES:72]))
				QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Currency_From:1=$2->{1}; *)
				QUERY:C277([CURRENCY_RATES:72];  & ; [CURRENCY_RATES:72]Currency_To:2=$2->{2}; *)
				QUERY:C277([CURRENCY_RATES:72]; [CURRENCY_RATES:72]Date:4=Date:C102($2->{4}))
				
			: ($1=Table:C252(->[PRICE_TABLE:28]))
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=$2->{1}; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Price_Code:2=$2->{2}; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Price_Discount:3=Num:C11($2->{3}); *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Field_Value_F:4=$2->{3}; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Field_Value_T:5=$2->{4}; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Group_Code:6=$2->{5}; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Brand_Code:7=$2->{6}; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Company_Code:8=$2->{7}; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_From:9=Num:C11($2->{8}); *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10=Num:C11($2->{9}); *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Export:11=$2->{10}; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Table_Code:12=$2->{11}; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Currency_Code:13=$2->{12})
				
			: ($1=Table:C252(->[TRANSACTIONS:29]))
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_Type_Code:1=$2->{1}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=$2->{2}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=$2->{3}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Invoice_Number:4=$2->{4}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5=Date:C102($2->{5}); *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Amount:6=Num:C11($2->{6}); *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Batch_Number:7=Num:C11($2->{7}); *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Description:8=$2->{8}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Company_Code:9=$2->{9}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]DC:10=$2->{10}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Entry_Date:11=Date:C102($2->{11}); *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12=$2->{12}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Cheque_Number:13=$2->{13}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Reconciled:14=($2->{14}="True"); *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Other_Side:15=$2->{15}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Amount:16=Num:C11($2->{16}); *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Total:17=Num:C11($2->{17}); *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18=$2->{18}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Purchase_invoice_number:19=$2->{19}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Code:20=$2->{20}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]UK_EC:21=$2->{21}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=$2->{22}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=$2->{23}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Purchase_Code:24=$2->{24}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Job_Code:25=$2->{25}; *)
				
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Period:27=$2->{27}; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Unique_StringIdent:28=$2->{28}; *)
				
				QUERY:C277([TRANSACTIONS:29])
				
				
			: ($1=Table:C252(->[MAILSORT_A:77]))
				QUERY:C277([MAILSORT_A:77]; [MAILSORT_A:77]Record_Type:1=$2->{1}; *)
				QUERY:C277([MAILSORT_A:77];  & ; [MAILSORT_A:77]District:2=$2->{2}; *)
				QUERY:C277([MAILSORT_A:77];  & ; [MAILSORT_A:77]Sector:3=$2->{3}; *)
				QUERY:C277([MAILSORT_A:77];  & ; [MAILSORT_A:77]SSC:4=$2->{4})
			: ($1=Table:C252(->[MAILSORT_B:78]))
				QUERY:C277([MAILSORT_B:78]; [MAILSORT_B:78]Record_Type:1=$2->{1}; *)
				QUERY:C277([MAILSORT_B:78];  & ; [MAILSORT_B:78]SSC:2=$2->{2}; *)
				QUERY:C277([MAILSORT_B:78];  & ; [MAILSORT_B:78]Label:3=$2->{3}; *)
				QUERY:C277([MAILSORT_B:78];  & ; [MAILSORT_B:78]Sort_Sequence:4=$2->{4}; *)
				QUERY:C277([MAILSORT_B:78];  & ; [MAILSORT_B:78]No:5=Num:C11($2->{5}))
				
			: ($1=Table:C252(->[MAILSORT_C:79]))
				QUERY:C277([MAILSORT_C:79]; [MAILSORT_C:79]Post_Town:1=$2->{1}; *)
				QUERY:C277([MAILSORT_C:79];  & ; [MAILSORT_C:79]Residue_Code:2=$2->{2})
			: ($1=Table:C252(->[MAILSORT_D5:81]))
				QUERY:C277([MAILSORT_D5:81]; [MAILSORT_D5:81]Area_Code:1=$2->{1}; *)
				QUERY:C277([MAILSORT_D5:81];  & ; [MAILSORT_D5:81]Area_Name:2=$2->{2})
			: ($1=Table:C252(->[MAILSORT_D6:82]))
				QUERY:C277([MAILSORT_D6:82]; [MAILSORT_D6:82]Area_Code:1=$2->{1}; *)
				QUERY:C277([MAILSORT_D6:82];  & ; [MAILSORT_D6:82]Residue_Code:2=$2->{2})
			: ($1=Table:C252(->[COMPONENTS:86]))
				QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=$2->{1}; *)
				QUERY:C277([COMPONENTS:86];  & ; [COMPONENTS:86]Component_Code:2=$2->{2}; *)
				QUERY:C277([COMPONENTS:86];  & ; [COMPONENTS:86]Quantity:3=$2->{3}; *)
				QUERY:C277([COMPONENTS:86];  & ; [COMPONENTS:86]UniqueValue:4=$2->{4})
			: ($1=Table:C252(->[CODE_USES:91]))
				QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$2->{1}; *)
				QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=$2->{2})
			: ($1=Table:C252(->[SUBSCRIPTIONS:93]))
				QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=$2->{1}; *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Product_Name:2=$2->{2}; *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Subscription_Date:3=Date:C102($2->{3}); *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=Num:C11($2->{4}); *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]After_Number:5=Num:C11($2->{5}); *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Unit_Number:6=Num:C11($2->{6}); *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7=$2->{7}; *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Amount_Excluding_Tax:8=Num:C11($2->{8}); *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Date_Done:9=Date:C102($2->{9}); *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Invoice_Number:10=$2->{2})
			: ($1=Table:C252(->[LIST_ITEMS:95]))
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1=$2->{1}; *)
				QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2=$2->{2}; *)
				If ([LIST_ITEMS:95]X_ListID:4>0)
					QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]X_ListID:4=$2->{4})
				Else 
					QUERY:C277([LIST_ITEMS:95])
				End if 
				
			: ($1=Table:C252(->[LICENCE_UPDATES:97]))
				QUERY:C277([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Licence:1=$2->{1}; *)
				QUERY:C277([LICENCE_UPDATES:97];  & ; [LICENCE_UPDATES:97]Update_Date:2=Date:C102($2->{1}); *)
				QUERY:C277([LICENCE_UPDATES:97];  & ; [LICENCE_UPDATES:97]User:3=$2->{3}; *)
				QUERY:C277([LICENCE_UPDATES:97];  & ; [LICENCE_UPDATES:97]Version_Number:4=Num:C11($2->{4}))
			: ($1=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
				QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1=$2->{1}; *)
				QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99];  & ; [CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2=$2->{2}; *)
				QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99];  & ; [CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3=Num:C11($2->{3}); *)
				QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99];  & ; [CUSTOM_FIELD_DEFINITiONS:99]Sort_Order:4=Num:C11($2->{4}); *)
				QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99];  & ; [CUSTOM_FIELD_DEFINITiONS:99]List_Name:5=$2->{5}; *)
				QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99];  & ; [CUSTOM_FIELD_DEFINITiONS:99]Type:6=$2->{6})
			: ($1=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
				QUERY:C277([CUSTOM_FIELDS_PERSONNEL:100]; [CUSTOM_FIELDS_PERSONNEL:100]Table_Personnel_Access:1=$2->{1}; *)
				QUERY:C277([CUSTOM_FIELDS_PERSONNEL:100];  & ; [CUSTOM_FIELDS_PERSONNEL:100]FD_Code:2=$2->{2})
			: ($1=Table:C252(->[X_URL_LInks:101]))
				QUERY:C277([X_URL_LInks:101]; [X_URL_LInks:101]Parent_Context:1=$2->{1}; *)
				QUERY:C277([X_URL_LInks:101];  & ; [X_URL_LInks:101]Parent_RecordCode:2=$2->{2}; *)
				QUERY:C277([X_URL_LInks:101];  & ; [X_URL_LInks:101]URL:3=$2->{3}; *)
				QUERY:C277([X_URL_LInks:101];  & ; [X_URL_LInks:101]x_UUID:4=$2->{4}; *)
				QUERY:C277([X_URL_LInks:101];  & ; [X_URL_LInks:101]Nul_2:5=$2->{5})
				
				
			: ($1=Table:C252(->[EMAIL_ATTACHMENTS:103]))
				QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]DiaryID:1=$2->{1}; *)
				QUERY:C277([EMAIL_ATTACHMENTS:103];  & ; [EMAIL_ATTACHMENTS:103]Email_ID:2=Num:C11($2->{2}); *)
				QUERY:C277([EMAIL_ATTACHMENTS:103];  & ; [EMAIL_ATTACHMENTS:103]Attachment_Path:3=$2->{3}; *)
				QUERY:C277([EMAIL_ATTACHMENTS:103];  & ; [EMAIL_ATTACHMENTS:103]Attachment_Name:4=$2->{4}; *)
				QUERY:C277([EMAIL_ATTACHMENTS:103];  & ; [EMAIL_ATTACHMENTS:103]FileNo:5=Num:C11($2->{5}); *)
				QUERY:C277([EMAIL_ATTACHMENTS:103];  & ; [EMAIL_ATTACHMENTS:103]Location:6=$2->{6}; *)
				QUERY:C277([EMAIL_ATTACHMENTS:103];  & ; [EMAIL_ATTACHMENTS:103]Document_Type:7=$2->{7}; *)
				QUERY:C277([EMAIL_ATTACHMENTS:103];  & ; [EMAIL_ATTACHMENTS:103]Document_Creator:8=$2->{8})
			: ($1=Table:C252(->[EMAIL_RECIPIENTS:104]))
				QUERY:C277([EMAIL_RECIPIENTS:104]; [EMAIL_RECIPIENTS:104]DiaryID:1=$2->{1}; *)
				QUERY:C277([EMAIL_RECIPIENTS:104];  & ; [EMAIL_RECIPIENTS:104]Classification:2=$2->{2}; *)
				QUERY:C277([EMAIL_RECIPIENTS:104];  & ; [EMAIL_RECIPIENTS:104]Email_Address:3=$2->{3}; *)
				QUERY:C277([EMAIL_RECIPIENTS:104];  & ; [EMAIL_RECIPIENTS:104]ContactID:4=$2->{4}; *)
				QUERY:C277([EMAIL_RECIPIENTS:104];  & ; [EMAIL_RECIPIENTS:104]Result:5=$2->{5})
			: ($1=Table:C252(->[DIARY_ITEMOWNERS:106]))
				QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]DIARY_CODE:1=$2->{1}; *)
				QUERY:C277([DIARY_ITEMOWNERS:106];  & ; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=Num:C11($2->{2}); *)
				QUERY:C277([DIARY_ITEMOWNERS:106];  & ; [DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3=Num:C11($2->{3}); *)
				QUERY:C277([DIARY_ITEMOWNERS:106];  & ; [DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSNAME:4=$2->{4})
			: ($1=Table:C252(->[CLIENT_SERVERMESSAGES:123]))
				//BECAUSE THESE CREATE AUTO NO POINT IN IMPORTING
			: ($1=Table:C252(->[SD_Settings:107]))
				QUERY:C277([SD_Settings:107]; [SD_Settings:107]x_OwnerID:1=Num:C11($2->{1}))
				
			: ($1=Table:C252(->[PROCESSES_TO_HANDLE:115]))
				QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]TableNumber:1=$2->{1}; *)
				QUERY:C277([PROCESSES_TO_HANDLE:115];  & ; [PROCESSES_TO_HANDLE:115]RecordNumber:7=Num:C11($2->{7}); *)
				QUERY:C277([PROCESSES_TO_HANDLE:115];  & ; [PROCESSES_TO_HANDLE:115]Data1Longint:8=Num:C11($2->{8}); *)
				QUERY:C277([PROCESSES_TO_HANDLE:115];  & ; [PROCESSES_TO_HANDLE:115]Data2Longint:9=Num:C11($2->{9}); *)
				QUERY:C277([PROCESSES_TO_HANDLE:115];  & ; [PROCESSES_TO_HANDLE:115]Data3Longint:10=Num:C11($2->{10}); *)
				QUERY:C277([PROCESSES_TO_HANDLE:115];  & ; [PROCESSES_TO_HANDLE:115]Data4Boolean:11=($2->{8}="TRUE"))
			: ($1=Table:C252(->[PREFERENCES:116]))
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=Num:C11($2->{1}); *)
				QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerTable:3=Num:C11($2->{3}); *)
				QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=Num:C11($2->{4}))
				
			: ($1=Table:C252(->[EW_ExportProjects:117]))
				QUERY:C277([EW_ExportProjects:117]; [EW_ExportProjects:117]RecordNumber:2=Num:C11($2->{2}))
				
			: ($1=Table:C252(->[EW_ExportSteps:118]))
				QUERY:C277([EW_ExportSteps:118]; [EW_ExportSteps:118]ProjectNumber:1=Num:C11($2->{1}); *)
				QUERY:C277([EW_ExportSteps:118];  & ; [EW_ExportSteps:118]RecordNumber:6=Num:C11($2->{6}))
			: ($1=Table:C252(->[EW_StepActions:119]))
				QUERY:C277([EW_StepActions:119]; [EW_StepActions:119]RecordNumber:2=Num:C11($2->{2}))
				
			: ($1=Table:C252(->[EW_ExportTables:120]))
				QUERY:C277([EW_ExportTables:120]; [EW_ExportTables:120]RecordNumber:2=Num:C11($2->{2}))
			: ($1=Table:C252(->[EW_BK_FieldMap:121]))
				QUERY:C277([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]DayBookTableNumber:1=Num:C11($2->{1}); *)
				QUERY:C277([EW_BK_FieldMap:121];  & ; [EW_BK_FieldMap:121]DayBookFieldNumber:2=Num:C11($2->{2}); *)
				If (Num:C11($2->{7})>0)
					QUERY:C277([EW_BK_FieldMap:121];  & ; [EW_BK_FieldMap:121]x_MapSetID:7=Num:C11($2->{7}); *)
				End if 
				If (Num:C11($2->{9})>0)
					QUERY:C277([EW_BK_FieldMap:121];  & ; [EW_BK_FieldMap:121]x_RecID:9=Num:C11($2->{9}); *)
				Else 
					QUERY:C277([EW_BK_FieldMap:121])
				End if 
			: ($1=Table:C252(->[EW_BKFields:122]))
				QUERY:C277([EW_BKFields:122]; [EW_BKFields:122]FieldName:1=$2->{1}; *)
				QUERY:C277([EW_BKFields:122];  & ; [EW_BKFields:122]Description:2=$2->{2}; *)
				QUERY:C277([EW_BKFields:122];  & ; [EW_BKFields:122]Type:3=Num:C11($2->{3}); *)
				QUERY:C277([EW_BKFields:122];  & ; [EW_BKFields:122]Group:4=$2->{4}; *)
				QUERY:C277([EW_BKFields:122];  & ; [EW_BKFields:122]FieldLength:5=Num:C11($2->{1}))
			: ($1=Table:C252(->[JOB PERSONNEL:48]))
				QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Code:1=$2->{1}; *)
				QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Stage_Code:2=$2->{2}; *)
				QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Person:3=$2->{3})
			: ($1=Table:C252(->[TIME_BUDGETS:49]))
				QUERY:C277([TIME_BUDGETS:49]; [TIME_BUDGETS:49]Person:1=$2->{1}; *)
				QUERY:C277([TIME_BUDGETS:49];  & ; [TIME_BUDGETS:49]Category_Code:2=$2->{2}; *)
				QUERY:C277([TIME_BUDGETS:49];  & ; [TIME_BUDGETS:49]Result_Code:3=$2->{3})
			: ($1=Table:C252(->[POSTAL_CODES:50]))
				QUERY:C277([POSTAL_CODES:50]; [POSTAL_CODES:50]Postal_Code_From:1=$2->{1}; *)
				QUERY:C277([POSTAL_CODES:50];  & ; [POSTAL_CODES:50]Area_Code:2=$2->{2}; *)
				QUERY:C277([POSTAL_CODES:50];  & ; [POSTAL_CODES:50]Export:3=$2->{3}; *)
				QUERY:C277([POSTAL_CODES:50];  & ; [POSTAL_CODES:50]Postal_Code_To:4=$2->{4})
				
				
			: ($1=Table:C252(->[DELETIONS:66]))
				QUERY:C277([DELETIONS:66]; [DELETIONS:66]Text:1=$2->{1}; *)
				QUERY:C277([DELETIONS:66];  & ; [DELETIONS:66]Export:2=$2->{2})
				
			: ($1=Table:C252(->[WORKFLOW_CONTROL:51]))
				QUERY:C277([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]Action_Code:1=$2->{1}; *)
				QUERY:C277([WORKFLOW_CONTROL:51];  & ; [WORKFLOW_CONTROL:51]Result_Code:2=$2->{2}; *)
			: ($1=Table:C252(->[INFORMATION:55]))
				If (Num:C11($2->{16})>0)
					QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityRecordID:16=Num:C11($2->{16}))
				Else 
					QUERY:C277([INFORMATION:55]; [INFORMATION:55]Group:2=$2->{2}; *)
					QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]SubGroup:6=$2->{6})
				End if 
				
			: ($1=Table:C252(->[QUALITY_GROUPS:56]))
				QUERY:C277([QUALITY_GROUPS:56]; [QUALITY_GROUPS:56]Group:1=$2->{1}; *)
				QUERY:C277([QUALITY_GROUPS:56];  & ; [QUALITY_GROUPS:56]SubGroup:2=$2->{2})
			: ($1=Table:C252(->[STOCK_LEVELS:58]))
				If (Num:C11($2->{10})>0)
					QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]X_ID:10=Num:C11($2->{10}); *)
				Else 
					QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$2->{1}; *)
					QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$2->{2}; *)
					QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Free_Level:3=Num:C11($2->{3}); *)
					QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Allocated_Level:4=Num:C11($2->{4}); *)
					QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Free_Cost:5=Num:C11($2->{5}); *)
					QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Allocated_Cost:6=Num:C11($2->{6}); *)
					QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=Num:C11($2->{7}); *)
					QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Currency_Code:8=$2->{8}; *)
					QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Layer_Code:9=$2->{9})
				End if 
				
			: ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
				If ($2->{8}#"")
					QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Unique_StringIdent:8=$2->{8})
				End if 
				
			: ($1=Table:C252(->[RECURRING_JOURNALS:38]))
				
				
		End case 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("Gen_IMportFindRecord"; $_t_oldMethodName)
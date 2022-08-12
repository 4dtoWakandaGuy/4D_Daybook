//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetOutFiltersAnalysis
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/05/2013 12:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(dbFilterText)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(ANAL_abo_Exclude;0)
	//ARRAY BOOLEAN(ANAL_abo_Include;0)
	//ARRAY BOOLEAN(LAY_lb_AnalysisCodes;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aPtr_ColumnVars; 0)
	ARRAY POINTER:C280($_aPtr_HeaderVars; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(ANAL_at_analcode;0)
	//ARRAY TEXT(ANAL_at_AnalName;0)
	C_BOOLEAN:C305($_bo_analysisSetup; $_bo_ObjectExists; $_bo_SetReturnObjects; LAY_bo_AnalSetup; LAY_bo_BCAnalSetup; LAY_bo_CSAnalSetup; LAY_bo_INVAnalSetup; LAY_bo_JBAnalSetup; LAY_bo_PIAnalSetup; LAY_bo_POAnalSetup; LAY_bo_SLAnalSetup)
	C_BOOLEAN:C305(LAY_bo_SMAnalSetup; LAY_bo_TRAnalSetup)
	C_LONGINT:C283($_l_AnalysesUsedcount; $_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_FindBlank; $_l_index; $_l_Longest; $_l_Longest2; $_l_MaxLabelWidth; $_l_MaxLBWidth)
	C_LONGINT:C283($_l_ObjectExists; $_l_Ref; $_l_TotalWidth; $0; DB_l_CurrentDisplayedForm; USER_l_BUT1; USER_l_But2; USER_l_BUT3; USER_l_BUT4; USER_l_BUT5; USER_l_BUT6)
	C_LONGINT:C283(USER_l_BUT7; USER_l_BUT8; USER_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $_Ptr_TableForStyle)
	C_POINTER:C301($1; $10; $11; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_Label; $_t_oldMethodName; $_t_SalesPersonLabel; USER_t_COL9; USER_t_HED1; USER_t_HED2; USER_t_HED3; USER_t_HED4; USER_t_HED5; USER_t_HED6; USER_t_HED7)
	C_TEXT:C284(USER_t_HED8; USER_t_HED9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetOutFiltersAnalysis")
If (Count parameters:C259>=1)
	$_Ptr_TableForStyle:=$1
	If (Count parameters:C259>=11)
		$_bo_SetReturnObjects:=True:C214
		$_ptr_objectNamedArray:=$2
		$_ptr_ObjectExists:=$3
		$_ptr_ObjectNameArray:=$4
		$_Ptr_ObjectsToDisplay:=$5  //pointer to array of object to display
		$_Ptr_DisplayThisObject:=$6  //pointer to boolean indicating if this object is displayed
		
		$_ptr_MaxLBWidth:=$7  //
		$_l_MaxLBWidth:=$7->
		$_Ptr_CountListboxesToDisplay:=$8
		$_Ptr_AllListBoxPhySize:=$9
		$_Ptr_ListBoxRowCountArray:=$10
		$_ptr_MaxLabelWidth:=$11
		$_l_MaxLabelWidth:=$11->
		/////
		$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Analysis")  //this is not the name of the on screen object just a reference for this method
		If ($_l_ObjectExists<0)
			APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
			APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Analysis")
			APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oAccAnal")
		End if 
		/////
		$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oAccAnal")
		If ($_l_Ref>0)
			$_bo_ObjectExists:=$_ptr_ObjectExists->{$_l_Ref}
			
		Else 
			$_bo_ObjectExists:=False:C215
		End if 
	Else 
		$_l_Ref:=-1
		$_bo_ObjectExists:=False:C215
	End if 
	
	Case of 
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ACCOUNT_BALANCES:34]))
			$_bo_analysisSetup:=LAY_bo_AnalSetup
			
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[TRANSACTIONS:29]))
			
			
			$_bo_analysisSetup:=LAY_bo_TRAnalSetup
			
			
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[TRANSACTION_BATCH_ITEMS:155])) | (Table:C252($_Ptr_TableForStyle)=Table:C252(->[TRANSACTION_BATCHES:30]))
			
			
			
			$_bo_analysisSetup:=LAY_bo_BCAnalSetup
			
			
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])) | (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_MOVEMENTS:40]))
			
			
			$_bo_analysisSetup:=LAY_bo_SMAnalSetup
			
			
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_LEVELS:58]))
			
			$_bo_analysisSetup:=LAY_bo_SLAnalSetup
			
			
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_INVOICES:37]))
			$_bo_analysisSetup:=LAY_bo_PIAnalSetup
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_ORDERS:57]))
			$_bo_analysisSetup:=LAY_bo_POAnalSetup
			
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[JOBS:26]))
			$_bo_analysisSetup:=LAY_bo_JBAnalSetup
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[INVOICES:39]))
			$_bo_analysisSetup:=LAY_bo_INVAnalSetup
			
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[CURRENT_STOCK:62]))
			$_bo_analysisSetup:=LAY_bo_CSAnalSetup
			
			
	End case 
	If (Records in table:C83([ANALYSES:36])>0)
		If (Not:C34($_bo_analysisSetup))
			
			
			If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
				ARRAY BOOLEAN:C223(LAY_lb_AnalysisCodes; 0)
				OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oAccAnal"; ->LAY_lb_AnalysisCodes)
				OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oAccAnalLabel")
				$_t_Label:=Get localized string:C991("AccountBalancesFieldNames_AnalysisCode")
				If (Position:C15(":"; $_t_Label)=0)
					$_t_Label:=$_t_Label+" :"
				End if 
				OBJECT SET TITLE:C194(*; "oAccAnalLabel"; $_t_Label)
			End if 
			
			
			ALL RECORDS:C47([ANALYSES:36])
			SELECTION TO ARRAY:C260([ANALYSES:36]Analysis_Code:1; ANAL_at_analcode; [ANALYSES:36]Analysis_Name:2; ANAL_at_AnalName)
			$_l_FindBlank:=Find in array:C230(ANAL_at_analcode; "")
			If ($_l_FindBlank>0)
				DELETE FROM ARRAY:C228(ANAL_at_analcode; $_l_FindBlank)
				DELETE FROM ARRAY:C228(ANAL_at_AnalName; $_l_FindBlank)
			End if 
			ARRAY BOOLEAN:C223(ANAL_abo_Include; Size of array:C274(ANAL_at_analcode))
			ARRAY BOOLEAN:C223(ANAL_abo_Exclude; Size of array:C274(ANAL_at_analcode))
			Case of 
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ACCOUNT_BALANCES:34]))
					For ($_l_index; Size of array:C274(ANAL_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Analysis_Code:1=ANAL_at_analcode{$_l_index})
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							ANAL_abo_Include{$_l_index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(ANAL_at_analcode; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_at_AnalName; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Include; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Exclude; $_l_index)
						End if 
					End for 
					SORT ARRAY:C229(ANAL_at_AnalName; ANAL_at_analcode)
					If (Size of array:C274(ANAL_at_AnalName)>0)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Analysis_Code:1="")
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							INSERT IN ARRAY:C227(ANAL_at_analcode; 1; 1)
							INSERT IN ARRAY:C227(ANAL_at_AnalName; 1; 1)
							INSERT IN ARRAY:C227(ANAL_abo_Include; 1; 1)
							INSERT IN ARRAY:C227(ANAL_abo_Exclude; 1; 1)
							ANAL_abo_Exclude{1}:=False:C215
							ANAL_abo_Include{1}:=True:C214
							ANAL_at_analcode{1}:=""
							ANAL_at_AnalName{1}:="No Analysis"
						End if 
					End if 
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ORDERS:24]))
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[TRANSACTIONS:29]))
					
					For ($_l_index; Size of array:C274(ANAL_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=ANAL_at_analcode{$_l_index})
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							ANAL_abo_Include{$_l_index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(ANAL_at_analcode; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_at_AnalName; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Include; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Exclude; $_l_index)
						End if 
					End for 
					SORT ARRAY:C229(ANAL_at_AnalName; ANAL_at_analcode)
					If (Size of array:C274(ANAL_at_AnalName)>0)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2="")
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							INSERT IN ARRAY:C227(ANAL_at_analcode; 1; 1)
							INSERT IN ARRAY:C227(ANAL_at_AnalName; 1; 1)
							INSERT IN ARRAY:C227(ANAL_abo_Include; 1; 1)
							INSERT IN ARRAY:C227(ANAL_abo_Exclude; 1; 1)
							ANAL_abo_Exclude{1}:=False:C215
							ANAL_abo_Include{1}:=True:C214
							ANAL_at_analcode{1}:=""
							ANAL_at_AnalName{1}:="No Analysis"
						End if 
					End if 
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[TRANSACTION_BATCHES:30])) | (Table:C252($_Ptr_TableForStyle)=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
					
					
					For ($_l_index; Size of array:C274(ANAL_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2=ANAL_at_analcode{$_l_index})
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							ANAL_abo_Include{$_l_index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(ANAL_at_analcode; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_at_AnalName; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Include; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Exclude; $_l_index)
						End if 
					End for 
					SORT ARRAY:C229(ANAL_at_AnalName; ANAL_at_analcode)
					If (Size of array:C274(ANAL_at_AnalName)>0)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2="")
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							INSERT IN ARRAY:C227(ANAL_at_analcode; 1; 1)
							INSERT IN ARRAY:C227(ANAL_at_AnalName; 1; 1)
							INSERT IN ARRAY:C227(ANAL_abo_Include; 1; 1)
							INSERT IN ARRAY:C227(ANAL_abo_Exclude; 1; 1)
							ANAL_abo_Exclude{1}:=False:C215
							ANAL_abo_Include{1}:=True:C214
							ANAL_at_analcode{1}:=""
							ANAL_at_AnalName{1}:="No Analysis"
						End if 
					End if 
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_MOVEMENTS:40]))
					For ($_l_index; Size of array:C274(ANAL_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Analysis_Code:9=ANAL_at_analcode{$_l_index})
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							ANAL_abo_Include{$_l_index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(ANAL_at_analcode; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_at_AnalName; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Include; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Exclude; $_l_index)
						End if 
					End for 
					SORT ARRAY:C229(ANAL_at_AnalName; ANAL_at_analcode)
					If (Size of array:C274(ANAL_at_AnalName)>0)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Analysis_Code:9="")
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							INSERT IN ARRAY:C227(ANAL_at_analcode; 1; 1)
							INSERT IN ARRAY:C227(ANAL_at_AnalName; 1; 1)
							INSERT IN ARRAY:C227(ANAL_abo_Include; 1; 1)
							INSERT IN ARRAY:C227(ANAL_abo_Exclude; 1; 1)
							ANAL_abo_Exclude{1}:=False:C215
							ANAL_abo_Include{1}:=True:C214
							ANAL_at_analcode{1}:=""
							ANAL_at_AnalName{1}:="No Analysis"
						End if 
					End if 
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
					For ($_l_index; Size of array:C274(ANAL_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Analysis_Code:9=ANAL_at_analcode{$_l_index})
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							ANAL_abo_Include{$_l_index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(ANAL_at_analcode; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_at_AnalName; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Include; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Exclude; $_l_index)
						End if 
					End for 
					SORT ARRAY:C229(ANAL_at_AnalName; ANAL_at_analcode)
					If (Size of array:C274(ANAL_at_AnalName)>0)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Analysis_Code:9="")
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							INSERT IN ARRAY:C227(ANAL_at_analcode; 1; 1)
							INSERT IN ARRAY:C227(ANAL_at_AnalName; 1; 1)
							INSERT IN ARRAY:C227(ANAL_abo_Include; 1; 1)
							INSERT IN ARRAY:C227(ANAL_abo_Exclude; 1; 1)
							ANAL_abo_Exclude{1}:=False:C215
							ANAL_abo_Include{1}:=True:C214
							ANAL_at_analcode{1}:=""
							ANAL_at_AnalName{1}:="No Analysis"
						End if 
					End if 
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[INVOICES:39]))
					For ($_l_index; Size of array:C274(ANAL_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						If (DB_l_CurrentDisplayedForm=Table:C252(->[INVOICES:39]))
							QUERY:C277([INVOICES:39]; [INVOICES:39]Analysis_Code:17=ANAL_at_analcode{$_l_index})
						Else 
							QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Analysis_Code:10=ANAL_at_analcode{$_l_index})
						End if 
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							ANAL_abo_Include{$_l_index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(ANAL_at_analcode; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_at_AnalName; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Include; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Exclude; $_l_index)
						End if 
					End for 
					
					
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_ORDERS:57]))
					For ($_l_index; Size of array:C274(ANAL_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Analysis_Code:15=ANAL_at_analcode{$_l_index})
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							ANAL_abo_Include{$_l_index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(ANAL_at_analcode; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_at_AnalName; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Include; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Exclude; $_l_index)
						End if 
					End for 
					SORT ARRAY:C229(ANAL_at_AnalName; ANAL_at_analcode)
					If (Size of array:C274(ANAL_at_AnalName)>0)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Analysis_Code:15="")
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							INSERT IN ARRAY:C227(ANAL_at_analcode; 1; 1)
							INSERT IN ARRAY:C227(ANAL_at_AnalName; 1; 1)
							INSERT IN ARRAY:C227(ANAL_abo_Include; 1; 1)
							INSERT IN ARRAY:C227(ANAL_abo_Exclude; 1; 1)
							ANAL_abo_Exclude{1}:=False:C215
							ANAL_abo_Include{1}:=True:C214
							ANAL_at_analcode{1}:=""
							ANAL_at_AnalName{1}:="No Analysis"
						End if 
					End if 
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_INVOICES:37]))
					For ($_l_index; Size of array:C274(ANAL_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						If (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_INVOICES:37]))
							QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Analysis_Code:15=ANAL_at_analcode{$_l_index})
						Else 
							QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9=ANAL_at_analcode{$_l_index})
						End if 
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							ANAL_abo_Include{$_l_index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(ANAL_at_analcode; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_at_AnalName; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Include; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Exclude; $_l_index)
						End if 
					End for 
					SORT ARRAY:C229(ANAL_at_AnalName; ANAL_at_analcode)
					If (Size of array:C274(ANAL_at_AnalName)>0)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						If (DB_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_INVOICES:37]))
							QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Analysis_Code:15="")
						Else 
							QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9="")
						End if 
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							INSERT IN ARRAY:C227(ANAL_at_analcode; 1; 1)
							INSERT IN ARRAY:C227(ANAL_at_AnalName; 1; 1)
							INSERT IN ARRAY:C227(ANAL_abo_Include; 1; 1)
							INSERT IN ARRAY:C227(ANAL_abo_Exclude; 1; 1)
							ANAL_abo_Exclude{1}:=False:C215
							ANAL_abo_Include{1}:=True:C214
							ANAL_at_analcode{1}:=""
							ANAL_at_AnalName{1}:="No Analysis"
						End if 
					End if 
					
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[JOBS:26]))
					
					For ($_l_index; Size of array:C274(ANAL_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						QUERY:C277([JOBS:26]; [JOBS:26]Analysis_Code:24=ANAL_at_analcode{$_l_index})
						
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							ANAL_abo_Include{$_l_index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(ANAL_at_analcode; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_at_AnalName; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Include; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Exclude; $_l_index)
						End if 
					End for 
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[CURRENT_STOCK:62]))
					For ($_l_index; Size of array:C274(ANAL_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Analysis_Code:10=ANAL_at_analcode{$_l_index})
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							ANAL_abo_Include{$_l_index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(ANAL_at_analcode; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_at_AnalName; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Include; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Exclude; $_l_index)
						End if 
					End for 
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_LEVELS:58]))
					For ($_l_index; Size of array:C274(ANAL_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Analysis_Code:7=ANAL_at_analcode{$_l_index})
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							ANAL_abo_Include{$_l_index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(ANAL_at_analcode; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_at_AnalName; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Include; $_l_index)
							DELETE FROM ARRAY:C228(ANAL_abo_Exclude; $_l_index)
						End if 
					End for 
					SORT ARRAY:C229(ANAL_at_AnalName; ANAL_at_analcode)
					If (Size of array:C274(ANAL_at_AnalName)>0)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_AnalysesUsedcount)
						QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Analysis_Code:7="")
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_AnalysesUsedcount>0)
							INSERT IN ARRAY:C227(ANAL_at_analcode; 1; 1)
							INSERT IN ARRAY:C227(ANAL_at_AnalName; 1; 1)
							INSERT IN ARRAY:C227(ANAL_abo_Include; 1; 1)
							INSERT IN ARRAY:C227(ANAL_abo_Exclude; 1; 1)
							ANAL_abo_Exclude{1}:=False:C215
							ANAL_abo_Include{1}:=True:C214
							ANAL_at_analcode{1}:=""
							ANAL_at_AnalName{1}:="No Analysis"
						End if 
					End if 
					
			End case 
			
			$_l_Longest:=0
			$_l_Longest2:=0
			For ($_l_index; 1; Size of array:C274(ANAL_at_AnalName))
				dbFilterText:=ANAL_at_AnalName{$_l_index}
				OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
				If ($_l_BestWidth>$_l_Longest)
					$_l_Longest:=$_l_BestWidth
				End if 
				dbFilterText:=ANAL_at_analcode{$_l_index}
				OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
				If ($_l_BestWidth>$_l_Longest2)
					$_l_Longest2:=$_l_BestWidth
				End if 
			End for 
			$_l_Longest:=$_l_Longest+2
			$_l_Longest2:=$_l_Longest2+2
			Case of 
				: ($_l_Longest>(118))
					$_l_Longest:=(118)
				: ($_l_Longest<(60))
					$_l_Longest:=(60)
			End case 
			Case of 
				: ($_l_Longest2>(118))
					$_l_Longest2:=(118)
				: ($_l_Longest2<(40))
					$_l_Longest2:=(40)
			End case 
			LB_SetupListboxByObjectName("oAccAnal"; "USER_t"; "USER_L"; 1; ->ANAL_at_AnalName; ->ANAL_at_analcode; ->ANAL_abo_Include; ->ANAL_abo_Exclude)
			LB_SetColumnHeadersByObjectName("oAccAnal"; "USER_L"; 1; "Name"; "Code"; "Inc."; "Exc.")
			LB_SetEnterablebyObjectName("oAccAnal"; False:C215; 0)
			LB_SetEnterablebyObjectName("oAccAnal"; True:C214; 3)
			LB_SetEnterablebyObjectName("oAccAnal"; True:C214; 4)
			LB_SetColumnWIdthsByObjectName("oAccAnal"; "USER_t"; 1; $_l_Longest; $_l_Longest2; 35; 35)
			LB_SetScrollByObjectName("oAccAnal"; -3; -2)
			
			LB_StyleSettingsByObjectName("oAccAnal"; "Black"; 9; "USER_t"; $_Ptr_TableForStyle)
			LAY_bo_AnalSetup:=False:C215
			LAY_bo_TRAnalSetup:=False:C215
			LAY_bo_BCAnalSetup:=False:C215
			LAY_bo_SMAnalSetup:=False:C215
			LAY_bo_SLAnalSetup:=False:C215
			LAY_bo_PIAnalSetup:=False:C215
			LAY_bo_POAnalSetup:=False:C215
			LAY_bo_JBAnalSetup:=False:C215
			LAY_bo_INVAnalSetup:=False:C215
			LAY_bo_CSAnalSetup:=False:C215
			Case of 
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ACCOUNT_BALANCES:34]))
					LAY_bo_AnalSetup:=True:C214
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[TRANSACTIONS:29]))
					
					
					LAY_bo_TRAnalSetup:=True:C214
					
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[TRANSACTION_BATCH_ITEMS:155])) | (Table:C252($_Ptr_TableForStyle)=Table:C252(->[TRANSACTION_BATCHES:30]))
					
					
					LAY_bo_BCAnalSetup:=True:C214
					
					
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_MOVEMENT_ITEMS:27])) | (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_MOVEMENTS:40]))
					
					LAY_bo_SMAnalSetup:=True:C214
					
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_LEVELS:58]))
					
					
					LAY_bo_SLAnalSetup:=True:C214
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_INVOICES:37]))
					
					LAY_bo_PIAnalSetup:=True:C214
					
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_ORDERS:57]))
					
					LAY_bo_POAnalSetup:=True:C214
					
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[JOBS:26]))
					
					LAY_bo_JBAnalSetup:=True:C214
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[INVOICES:39]))
					
					LAY_bo_INVAnalSetup:=True:C214
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[CURRENT_STOCK:62]))
					
					LAY_bo_CSAnalSetup:=True:C214
					
					
			End case 
		End if 
		
		//$0:=$_l_Longest2+$_l_Longest+35+35
		OBJECT GET BEST SIZE:C717(*; "oAccAnalLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
		If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
			$_l_MaxLabelWidth:=$_l_BestLabelWidth
		End if 
		$_l_TotalWidth:=LB_GetTotalColumnWIdths("oAccAnal")
		$0:=$_l_TotalWidth
		If ($_bo_SetReturnObjects)
			If (Size of array:C274(ANAL_at_AnalName)>1)  //so we actually only show the area if there are some items in it
				If ($_l_TotalWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_TotalWidth
				End if 
				$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
				$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(ANAL_at_AnalName)*20)+20
				APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(ANAL_at_AnalName))
				$_Ptr_DisplayThisObject->:=True:C214
				APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Analysis")
				$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
				$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
			End if 
		End if 
	Else 
		ARRAY TEXT:C222(ANAL_at_analcode; 0)
		ARRAY TEXT:C222(ANAL_at_AnalName; 0)
		ARRAY BOOLEAN:C223(ANAL_abo_Include; 0)
		ARRAY BOOLEAN:C223(ANAL_abo_Exclude; 0)
		$0:=0
	End if 
End if 
ERR_MethodTrackerReturn("DB_SetOutFiltersAnalysis"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetoutFilterLayers
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/05/2013 14:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(CUR_lb_CurCodes;0)
	//ARRAY BOOLEAN(LAY_abo_Exclude;0)
	//ARRAY BOOLEAN(LAY_abo_Include;0)
	//ARRAY BOOLEAN(LAY_lb_LayerCodes;0)
	//ARRAY BOOLEAN(LAY_lb_SPCodes;0)
	//ARRAY TEXT(LAY_at_laycode;0)
	//ARRAY TEXT(LAY_at_layName;0)
	//ARRAY TEXT(LAY_at_SPName;0)
	C_BOOLEAN:C305($_bo_AreaSetup; $_bo_ObjectExists; $_bo_SetReturnObjects; LAY_bo_BCLayerSetup; LAY_bo_CSLayerSetup; LAY_bo_INVLayerSetup; LAY_bo_LayerSetup; LAY_bo_PILayerSetup; LAY_bo_POLayerSetup; LAY_bo_SLLayerSetup; LAY_bo_SMLayerSetup)
	C_BOOLEAN:C305(LAY_bo_TRLayerSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_FindBlank; $_l_Index; $_l_LayerUsed; $_l_Longest; $_l_Longest2; $_l_MaxLabelWidth; $_l_MaxLBWidth)
	C_LONGINT:C283($_l_ObjectExists; $_l_Ref; $_l_TotalWidth; $0; L_l_BUT1; L_l_But2; L_l_BUT3; L_l_BUT4; L_l_BUT5; L_l_BUT6; L_l_BUT7)
	C_LONGINT:C283(L_l_BUT8; L_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $_Ptr_TableForStyle)
	C_POINTER:C301($1; $10; $11; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_Label; $_t_OldMethodName; $_t_SalesPersonLabel; dbFilterText; L_t_COL1; L_t_COL2; L_t_COL3; L_t_COL4; L_t_COL5; L_t_COL6; L_t_COL7)
	C_TEXT:C284(L_t_COL8; L_t_COL9; L_t_HED1; L_t_HED2; L_t_HED3; L_t_HED4; L_t_HED5; L_t_HED6; L_t_HED7; L_t_HED8; L_t_HED9)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_SetoutFilterLayers")
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
		
		$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Layers")  //this is not the name of the on screen object just a reference for this method
		If ($_l_ObjectExists<0)
			APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
			APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Layers")
			APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oAccLayersCodes")
		End if 
		/////
		$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oAccLayersCodes")
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
			$_bo_AreaSetup:=LAY_bo_LayerSetup
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[TRANSACTIONS:29]))
			$_bo_AreaSetup:=LAY_bo_TRLayerSetup
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[TRANSACTION_BATCHES:30]))
			$_bo_AreaSetup:=LAY_bo_BCLayerSetup
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_LEVELS:58]))
			$_bo_AreaSetup:=LAY_bo_SLLayerSetup
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_MOVEMENTS:40]))
			$_bo_AreaSetup:=LAY_bo_SMLayerSetup
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_INVOICES:37]))
			$_bo_AreaSetup:=LAY_bo_PILayerSetup
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_ORDERS:57]))
			$_bo_AreaSetup:=LAY_bo_POLayerSetup
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[INVOICES:39]))
			$_bo_AreaSetup:=LAY_bo_INVLayerSetup
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[CURRENT_STOCK:62]))
			$_bo_AreaSetup:=LAY_bo_CSLayerSetup
	End case 
	If (Records in table:C83([LAYERS:76])>0) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>=2)  //
		
		If (Not:C34($_bo_AreaSetup))
			If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
				ARRAY BOOLEAN:C223(LAY_lb_LayerCodes; 0)
				OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oAccLayersCodes"; ->LAY_lb_LayerCodes)
				OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oAccLayersLabel")
				$_t_Label:=Get localized string:C991("LayersFieldNames_LayerName")
				If (Position:C15(":"; $_t_Label)=0)
					$_t_Label:=$_t_Label+" :"
				End if 
				OBJECT SET TITLE:C194(*; "oAccLayersLabel"; $_t_Label)
			End if 
			
			ALL RECORDS:C47([LAYERS:76])
			SELECTION TO ARRAY:C260([LAYERS:76]Layer_Code:1; LAY_at_laycode; [LAYERS:76]Layer_Name:2; LAY_at_layName)
			$_l_FindBlank:=Find in array:C230(LAY_at_laycode; "")
			If ($_l_FindBlank>0)
				DELETE FROM ARRAY:C228(LAY_at_laycode; $_l_FindBlank)
				DELETE FROM ARRAY:C228(LAY_at_layName; $_l_FindBlank)
			End if 
			ARRAY BOOLEAN:C223(LAY_abo_Include; Size of array:C274(LAY_at_laycode))
			ARRAY BOOLEAN:C223(LAY_abo_Exclude; Size of array:C274(LAY_at_laycode))
			Case of 
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ACCOUNT_BALANCES:34]))
					For ($_l_Index; Size of array:C274(LAY_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_LayerUsed)
						QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Layer_Code:5=LAY_at_laycode{$_l_Index})
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_LayerUsed>0)
							LAY_abo_Include{$_l_Index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(LAY_at_laycode; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_at_layName; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Include; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Exclude; $_l_Index)
						End if 
					End for 
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[TRANSACTIONS:29]))
					For ($_l_Index; Size of array:C274(LAY_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_LayerUsed)
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23=LAY_at_laycode{$_l_Index})
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_LayerUsed>0)
							LAY_abo_Include{$_l_Index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(LAY_at_laycode; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_at_layName; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Include; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Exclude; $_l_Index)
						End if 
					End for 
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[TRANSACTION_BATCHES:30]))
					For ($_l_Index; Size of array:C274(LAY_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_LayerUsed)
						QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20=LAY_at_laycode{$_l_Index})
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_LayerUsed>0)
							LAY_abo_Include{$_l_Index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(LAY_at_laycode; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_at_layName; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Include; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Exclude; $_l_Index)
						End if 
					End for 
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_LEVELS:58]))
					For ($_l_Index; Size of array:C274(LAY_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_LayerUsed)
						QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=LAY_at_laycode{$_l_Index})
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_LayerUsed>0)
							LAY_abo_Include{$_l_Index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(LAY_at_laycode; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_at_layName; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Include; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Exclude; $_l_Index)
						End if 
					End for 
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_MOVEMENTS:40]))
					For ($_l_Index; Size of array:C274(LAY_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_LayerUsed)
						QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Layer_Code:11=LAY_at_laycode{$_l_Index})
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_LayerUsed>0)
							LAY_abo_Include{$_l_Index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(LAY_at_laycode; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_at_layName; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Include; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Exclude; $_l_Index)
						End if 
					End for 
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_INVOICES:37]))
					For ($_l_Index; Size of array:C274(LAY_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_LayerUsed)
						QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Layer_Code:28=LAY_at_laycode{$_l_Index})
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_LayerUsed>0)
							LAY_abo_Include{$_l_Index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(LAY_at_laycode; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_at_layName; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Include; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Exclude; $_l_Index)
						End if 
					End for 
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_ORDERS:57]))
					For ($_l_Index; Size of array:C274(LAY_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_LayerUsed)
						QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Layer_Code:17=LAY_at_laycode{$_l_Index})
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_LayerUsed>0)
							LAY_abo_Include{$_l_Index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(LAY_at_laycode; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_at_layName; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Include; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Exclude; $_l_Index)
						End if 
					End for 
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[INVOICES:39]))
					For ($_l_Index; Size of array:C274(LAY_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_LayerUsed)
						QUERY:C277([INVOICES:39]; [INVOICES:39]Layer_Code:38=LAY_at_laycode{$_l_Index})
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_LayerUsed>0)
							LAY_abo_Include{$_l_Index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(LAY_at_laycode; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_at_layName; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Include; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Exclude; $_l_Index)
						End if 
					End for 
					
				: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[CURRENT_STOCK:62]))
					For ($_l_Index; Size of array:C274(LAY_abo_Include); 1; -1)
						SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_LayerUsed)
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Layer_Code:12=LAY_at_laycode{$_l_Index})
						SET QUERY DESTINATION:C396(Into current selection:K19:1)
						If ($_l_LayerUsed>0)
							LAY_abo_Include{$_l_Index}:=True:C214
						Else 
							DELETE FROM ARRAY:C228(LAY_at_laycode; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_at_layName; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Include; $_l_Index)
							DELETE FROM ARRAY:C228(LAY_abo_Exclude; $_l_Index)
						End if 
					End for 
					
			End case 
			
			SORT ARRAY:C229(LAY_at_LayName; LAY_at_laycode)
			$_l_Longest:=0
			$_l_Longest2:=0
			For ($_l_Index; 1; Size of array:C274(LAY_at_layName))
				dbFilterText:=LAY_at_layName{$_l_Index}
				OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
				If ($_l_BestWidth>$_l_Longest)
					$_l_Longest:=$_l_BestWidth
				End if 
				dbFilterText:=LAY_at_laycode{$_l_Index}
				OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
				If ($_l_BestWidth>$_l_Longest2)
					$_l_Longest2:=$_l_BestWidth
				End if 
			End for 
			$_l_Longest:=$_l_Longest+2
			$_l_Longest2:=$_l_Longest2+2
			Case of 
				: ($_l_Longest>(108))
					$_l_Longest:=(108)
				: ($_l_Longest<(60))
					$_l_Longest:=(60)
			End case 
			Case of 
				: ($_l_Longest2>(108))
					$_l_Longest2:=(108)
				: ($_l_Longest2<(40))
					$_l_Longest2:=(40)
			End case 
			LB_SetupListboxByObjectName("oAccLayersCodes"; "L_t"; "L_L"; 1; ->LAY_at_layName; ->LAY_at_laycode; ->LAY_abo_Include; ->LAY_abo_Exclude)
			LB_SetColumnHeadersByObjectName("oAccLayersCodes"; "L_L"; 1; "Name"; "Code"; "Include"; "Exclude")
			LB_SetEnterablebyObjectName("oAccLayersCodes"; False:C215; 0)
			LB_SetEnterablebyObjectName("oAccLayersCodes"; True:C214; 3)
			LB_SetEnterablebyObjectName("oAccLayersCodes"; True:C214; 4)
			LB_SetColumnWIdthsByObjectName("oAccLayersCodes"; "L_t"; 1; $_l_Longest; $_l_Longest2; 35; 35)
			LB_SetScrollByObjectName("oAccLayersCodes"; -3; -2)
		End if 
		OBJECT GET BEST SIZE:C717(*; "oAccLayersLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
		If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
			$_l_MaxLabelWidth:=$_l_BestLabelWidth
		End if 
		
		LB_StyleSettingsByObjectName("oAccLayersCodes"; "Black"; 9; "USER_t"; $_Ptr_TableForStyle)
		LAY_bo_LayerSetup:=False:C215
		LAY_bo_TRLayerSetup:=False:C215
		LAY_bo_BCLayerSetup:=False:C215
		LAY_bo_SLLayerSetup:=False:C215
		LAY_bo_SMLayerSetup:=False:C215
		LAY_bo_PILayerSetup:=False:C215
		LAY_bo_POLayerSetup:=False:C215
		LAY_bo_INVLayerSetup:=False:C215
		LAY_bo_INVLayerSetup:=False:C215
		Case of 
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ACCOUNT_BALANCES:34]))
				LAY_bo_LayerSetup:=True:C214
				
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[TRANSACTIONS:29]))
				
				LAY_bo_TRLayerSetup:=True:C214
				
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[TRANSACTION_BATCHES:30]))
				
				LAY_bo_BCLayerSetup:=True:C214
				
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_LEVELS:58]))
				
				LAY_bo_SLLayerSetup:=True:C214
				
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[STOCK_MOVEMENTS:40]))
				
				LAY_bo_SMLayerSetup:=True:C214
				
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_INVOICES:37]))
				
				LAY_bo_PILayerSetup:=True:C214
				
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_ORDERS:57]))
				
				LAY_bo_POLayerSetup:=True:C214
				
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[INVOICES:39]))
				
				LAY_bo_INVLayerSetup:=True:C214
				
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[CURRENT_STOCK:62]))
				LAY_bo_CSLayerSetup:=True:C214
		End case 
		$_l_TotalWidth:=LB_GetTotalColumnWIdths("oAccLayersCodes")
		$0:=$_l_TotalWidth
		If ($_bo_SetReturnObjects)
			If (Size of array:C274(LAY_at_layName)>1)  //so we actually only show the area if there are some items in it
				If ($_l_TotalWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_TotalWidth
				End if 
				$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
				$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(LAY_at_layName)*20)+20
				APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(LAY_at_layName))
				$_Ptr_DisplayThisObject->:=True:C214
				APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Layers")
				$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
				$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
				
			End if 
		End if 
	Else 
		ARRAY TEXT:C222(LAY_at_laycode; 0)
		ARRAY TEXT:C222(LAY_at_layName; 0)
		ARRAY BOOLEAN:C223(LAY_abo_Include; 0)
		ARRAY BOOLEAN:C223(LAY_abo_Exclude; 0)
		LAY_bo_LayerSetup:=False:C215
		LAY_bo_TRLayerSetup:=False:C215
		LAY_bo_BCLayerSetup:=False:C215
		LAY_bo_SLLayerSetup:=False:C215
		LAY_bo_SMLayerSetup:=False:C215
		LAY_bo_PILayerSetup:=False:C215
		LAY_bo_POLayerSetup:=False:C215
		LAY_bo_INVLayerSetup:=False:C215
		LAY_bo_INVLayerSetup:=False:C215
		$0:=0
	End if 
	
End if 
ERR_MethodTrackerReturn("DB_SetoutFilterLayers"; $_t_OldMethodName)
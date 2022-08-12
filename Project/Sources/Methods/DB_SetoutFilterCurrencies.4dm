//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetoutFilterCurrencies
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/05/2013 19:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CUR_abo_Exclude;0)
	//ARRAY BOOLEAN(CUR_abo_Include;0)
	//ARRAY BOOLEAN(CUR_lb_CurCodes;0)
	//ARRAY BOOLEAN(LAY_lb_SPCodes;0)
	//ARRAY TEXT(CUR_at_curcode;0)
	//ARRAY TEXT(CUR_at_CurName;0)
	C_BOOLEAN:C305($_bo_ObjectExists; $_bo_SetReturnObjects; LAY_bo_CurrenciesSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_CurrentlyUsed; $_l_FindBlank; $_l_Index; $_l_Longest; $_l_Longest2; $_l_MaxLabelWidth; $_l_MaxLBWidth)
	C_LONGINT:C283($_l_ObjectExists; $_l_Ref; $_l_TotalWidth; $0; $Bottom; $left; $MaxHeight; $MaxPortrait; $MaxRows; $Right; $Top)
	C_LONGINT:C283(C_l_BUT1; C_l_But2; C_l_BUT3; C_l_BUT4; C_l_BUT5; C_l_BUT6; C_l_BUT7; C_l_BUT8; C_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $_Ptr_TableForStyle)
	C_POINTER:C301($1; $10; $11; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_Label; $_t_OldMethodName; C_t_COL1; C_t_COL2; C_t_COL3; C_t_COL4; C_t_COL5; C_t_COL6; C_t_COL7; C_t_COL8; C_t_COL9)
	C_TEXT:C284(C_t_HED1; C_t_HED2; C_t_HED3; C_t_HED4; C_t_HED5; C_t_HED6; C_t_HED7; C_t_HED8; C_t_HED9; dbFilterText)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_SetoutFilterCurrencies")
If (Count parameters:C259>=1)
	$_Ptr_TableForStyle:=$1
	If (Count parameters:C259>=10)
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
		
		$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Currencies")  //this is not the name of the on screen object just a reference for this method
		If ($_l_ObjectExists<0)
			APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
			APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Currencies")
			APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oAccCur")
		End if 
		/////
		$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oAccCur")
		If ($_l_Ref>0)
			$_bo_ObjectExists:=$_ptr_ObjectExists->{$_l_Ref}
			
		Else 
			$_bo_ObjectExists:=False:C215
		End if 
	Else 
		$_l_Ref:=-1
		$_bo_ObjectExists:=False:C215
	End if 
	If (Records in table:C83([CURRENCIES:71])>0) & ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>=2)  //multi currency
		
		If (Not:C34(LAY_bo_CurrenciesSetup))
			If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
				ARRAY BOOLEAN:C223(CUR_lb_CurCodes; 0)
				OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oAccCur"; ->CUR_lb_CurCodes)
				OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oAccCurLabel")
				$_t_Label:="Currencies :"  //Get localized string("CurrenciesFieldNames_CurrencyName")
				If (Position:C15(":"; $_t_Label)=0)
					$_t_Label:=$_t_Label+" :"
				End if 
				OBJECT SET TITLE:C194(*; "oAccCurLabel"; $_t_Label)
			End if 
			
			ALL RECORDS:C47([CURRENCIES:71])
			SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; CUR_at_curcode; [CURRENCIES:71]Currency_Name:2; CUR_at_CurName)
			$_l_FindBlank:=Find in array:C230(CUR_at_curcode; "")
			If ($_l_FindBlank>0)
				DELETE FROM ARRAY:C228(CUR_at_curcode; $_l_FindBlank)
				DELETE FROM ARRAY:C228(CUR_at_CurName; $_l_FindBlank)
			End if 
			ARRAY BOOLEAN:C223(CUR_abo_Include; Size of array:C274(CUR_at_curcode))
			ARRAY BOOLEAN:C223(CUR_abo_Exclude; Size of array:C274(CUR_at_curcode))
			For ($_l_Index; Size of array:C274(CUR_abo_Include); 1; -1)
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CurrentlyUsed)
				Case of 
					: ($1=(->[ORDERS:24])) | ($1=(->[ORDER_ITEMS:25]))
						QUERY:C277([ORDERS:24]; [ORDERS:24]Currency_Code:32=CUR_at_curcode{$_l_Index})
					: ($1=(->[STOCK_MOVEMENTS:40])) | ($1=(->[STOCK_MOVEMENT_ITEMS:27])) | ($1=(->[STOCK_LEVELS:58])) | ($1=(->[CURRENT_STOCK:62]))
						QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Currency_Code:10=CUR_at_curcode{$_l_Index})
					: ($1=(->[PURCHASE_ORDERS:57])) | ($1=(->[PURCHASE_ORDERS_ITEMS:169]))
						QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Currency_Code:16=CUR_at_curcode{$_l_Index})
					: ($1=(->[PURCHASE_INVOICES:37])) | ($1=(->[PURCHASE_INVOICE_ITEMS:158]))
						QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Currency_Code:23=CUR_at_curcode{$_l_Index})
					: ($1=(->[INVOICES:39])) | ($1=(->[INVOICES_ITEMS:161]))
						QUERY:C277([INVOICES:39]; [INVOICES:39]Currency_Code:27=CUR_at_curcode{$_l_Index})
						
					Else 
						
						QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Currency_Code:6=CUR_at_curcode{$_l_Index})
						
				End case 
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_CurrentlyUsed>0)
					CUR_abo_Include{$_l_Index}:=True:C214
				Else 
					DELETE FROM ARRAY:C228(CUR_at_curcode; $_l_Index)
					DELETE FROM ARRAY:C228(CUR_at_CurName; $_l_Index)
					DELETE FROM ARRAY:C228(CUR_abo_Include; $_l_Index)
					DELETE FROM ARRAY:C228(CUR_abo_Exclude; $_l_Index)
				End if 
			End for 
			SORT ARRAY:C229(CUR_at_CurName; CUR_at_curcode)
			
			$_l_Longest:=0
			For ($_l_Index; 1; Size of array:C274(CUR_at_CurName))
				dbFilterText:=CUR_at_CurName{$_l_Index}
				OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
				If ($_l_BestWidth>$_l_Longest)
					$_l_Longest:=$_l_BestWidth
				End if 
				dbFilterText:=CUR_at_CurName{$_l_Index}
				//CUR_at_curcode
				dbFilterText:=CUR_at_curcode{$_l_Index}
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
				Else 
					
			End case 
			Case of 
				: ($_l_Longest2>(118))
					$_l_Longest2:=(118)
				: ($_l_Longest2<(40))
					$_l_Longest2:=(40)
			End case 
			LB_SetupListboxByObjectName("oAccCur"; "C_t"; "C_L"; 1; ->CUR_at_CurName; ->CUR_at_curcode; ->CUR_abo_Include; ->CUR_abo_Exclude)
			LB_SetColumnHeadersByObjectName("oAccCur"; "C_L"; 1; "Name"; "Code"; "Include"; "Exclude")
			LB_SetEnterablebyObjectName("oAccCur"; False:C215; 0)
			LB_SetEnterablebyObjectName("oAccCur"; True:C214; 3)
			LB_SetEnterablebyObjectName("oAccCur"; True:C214; 4)
			LB_SetColumnWIdthsByObjectName("oAccCur"; "L_S55"; 1; $_l_Longest; $_l_Longest2; 35; 35)
			LB_SetScrollByObjectName("oAccCur"; -3; -2)
		End if 
		OBJECT GET BEST SIZE:C717(*; "oAccCurLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
		If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
			$_l_MaxLabelWidth:=$_l_BestLabelWidth
		End if 
		LB_StyleSettingsByObjectName("oAccCur"; "Black"; 9; "USER_t"; $_Ptr_TableForStyle)
		LAY_bo_CurrenciesSetup:=True:C214
		$_l_TotalWidth:=LB_GetTotalColumnWIdths("oAccCur")
		$0:=$_l_TotalWidth
		If ($_bo_SetReturnObjects)
			If (Size of array:C274(CUR_at_CurName)>1)  //so we actually only show the area if there are some items in it
				If ($_l_TotalWidth>$_l_MaxLBWidth)
					$_l_MaxLBWidth:=$_l_TotalWidth
				End if 
				$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
				$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(CUR_at_CurName)*20)+20
				APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(CUR_at_CurName))
				$_Ptr_DisplayThisObject->:=True:C214
				APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Currencies")
				$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
				$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
			End if 
		End if 
	Else 
		ARRAY TEXT:C222(CUR_at_curcode; 0)
		ARRAY TEXT:C222(CUR_at_CurName; 0)
		ARRAY BOOLEAN:C223(CUR_abo_Include; 0)
		ARRAY BOOLEAN:C223(CUR_abo_Exclude; 0)
		$0:=0
		
	End if 
Else 
End if 
ERR_MethodTrackerReturn("DB_SetoutFilterCurrencies"; $_t_OldMethodName)
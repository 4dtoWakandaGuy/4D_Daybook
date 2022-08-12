//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetOutFilterStockTypes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/05/2013 12:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(LAY_abo_StockTypeExclude;0)
	//ARRAY BOOLEAN(LAY_abo_StockTypeInclude;0)
	//ARRAY BOOLEAN(LAY_lb_stktCodes;0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY TEXT:C222($_at_ColumNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(DB_at_StockTypesCodes;0)
	//ARRAY TEXT(DB_at_StockTypesNames;0)
	C_BOOLEAN:C305($_bo_ObjectExists; $_bo_SetReturnObjects; DB_bo_StockTypesReady; LAY_bo_StockTypesSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_GetStockTypes; $_l_Index; $_l_Longest; $_l_Longest2; $_l_MaxLabelWidth; $_l_MaxLBWidth; $_l_ObjectExists)
	C_LONGINT:C283($_l_Ref; $_l_TotalWidth; $0; Stk_l_BUT1; Stk_l_But2; Stk_l_BUT3; Stk_l_BUT4; Stk_l_BUT5; Stk_l_BUT6; Stk_l_BUT7; Stk_l_BUT8)
	C_LONGINT:C283(Stk_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $_Ptr_TableForStyle)
	C_POINTER:C301($1; $10; $11; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_Label; $_t_LabelPrefix; $_t_OldMethodName; dbFilterText; STK_t_COL1; STK_t_COL2; STK_t_COL3; STK_t_COL4; STK_t_COL5; STK_t_COL6; STK_t_COL7)
	C_TEXT:C284(STK_t_COL8; STK_t_COL9; STK_t_HED1; STK_t_HED2; STK_t_HED3; STK_t_HED4; STK_t_HED5; STK_t_HED6; STK_t_HED7; STK_t_HED8; STK_t_HED9)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_SetOutFilterStockTypes")
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
		
		$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Stock Types")  //this is not the name of the on screen object just a reference for this method
		If ($_l_ObjectExists<0)
			APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
			APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Stock Types")
			APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oStockTypes")
		End if 
		/////
		$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oStockTypes")
		If ($_l_Ref>0)
			$_bo_ObjectExists:=$_ptr_ObjectExists->{$_l_Ref}
			
		Else 
			$_bo_ObjectExists:=False:C215
		End if 
	Else 
		$_l_Ref:=-1
		$_bo_ObjectExists:=False:C215
	End if 
	
	If (Not:C34(LAY_bo_StockTypesSetup))
		If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
			ARRAY BOOLEAN:C223(LAY_lb_stktCodes; 0)
			OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oStockTypes"; ->LAY_lb_stktCodes)
			OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oStockTypesLabel")
			$_t_Label:=$_t_LabelPrefix+"Stock Types :"
			If (Position:C15(":"; $_t_Label)=0)
				$_t_Label:=$_t_Label+" :"
			End if 
			OBJECT SET TITLE:C194(*; "oStockTypesLabel"; $_t_Label)
		End if 
		DB_bo_StockTypesReady:=False:C215
		ARRAY TEXT:C222(DB_at_StockTypesNames; 0)
		ARRAY TEXT:C222(DB_at_StockTypesCodes; 0)
		$_l_GetStockTypes:=New process:C317("DB_GetStockTypes"; 128000; "Get StockTypes"; Current process:C322)
		While (Not:C34(DB_bo_StockTypesReady))
			DelayTicks(2)
		End while 
		
		
		SORT ARRAY:C229(DB_at_StockTypesNames; DB_at_StockTypesCodes)
		ARRAY BOOLEAN:C223(LAY_abo_StockTypeInclude; 0)
		ARRAY BOOLEAN:C223(LAY_abo_StockTypeExclude; 0)
		ARRAY BOOLEAN:C223(LAY_abo_StockTypeInclude; Size of array:C274(DB_at_StockTypesNames))
		ARRAY BOOLEAN:C223(LAY_abo_StockTypeExclude; Size of array:C274(DB_at_StockTypesNames))
		For ($_l_Index; 1; Size of array:C274(LAY_abo_StockTypeInclude))
			LAY_abo_StockTypeInclude{$_l_Index}:=True:C214
		End for 
		$_l_Longest:=0
		$_l_Longest2:=0
		For ($_l_Index; 1; Size of array:C274(DB_at_StockTypesNames))
			dbFilterText:=DB_at_StockTypesNames{$_l_Index}
			OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_Longest)
				$_l_Longest:=$_l_BestWidth
			End if 
			dbFilterText:=DB_at_StockTypesCodes{$_l_Index}
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
		LB_SetupListboxByObjectName("oStockTypes"; "STK_t"; "Stk_L"; 1; ->DB_at_StockTypesNames; ->DB_at_StockTypesCodes; ->LAY_abo_StockTypeInclude; ->LAY_abo_StockTypeExclude)
		LB_SetColumnHeadersByObjectName("oStockTypes"; "Stk_L"; 1; "Type"; "Code"; "Include"; "Exclude")
		LB_SetEnterablebyObjectName("oStockTypes"; False:C215; 0)
		LB_SetEnterablebyObjectName("oStockTypes"; True:C214; 3)
		LB_SetEnterablebyObjectName("oStockTypes"; True:C214; 4)
		LB_SetColumnWIdthsByObjectName("oStockTypes"; "STK_t"; 1; $_l_Longest; 40; 35; 35)
		LB_SetScrollByObjectName("oStockTypes"; -3; -2)
		LB_StyleSettingsByObjectName("oStockTypes"; "Black"; 9; "STK_t"; ->[CURRENT_STOCK:62])
		LAY_bo_StockTypesSetup:=True:C214
		$0:=$_l_Longest2+$_l_Longest+35+35
	End if 
	OBJECT GET BEST SIZE:C717(*; "oStockTypesLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
	If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
		$_l_MaxLabelWidth:=$_l_BestLabelWidth
	End if 
	$_l_TotalWidth:=LB_GetTotalColumnWIdths("oStockTypes")
	$0:=$_l_TotalWidth
	If ($_bo_SetReturnObjects)
		If (Size of array:C274(DB_at_StockTypesNames)>1)  //so we actually only show the area if there are some items in it
			If ($_l_TotalWidth>$_l_MaxLBWidth)
				$_l_MaxLBWidth:=$_l_TotalWidth
			End if 
			$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
			$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(DB_at_StockTypesNames)*20)+20
			APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(DB_at_StockTypesNames))
			$_Ptr_DisplayThisObject->:=True:C214
			APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Stock Types")
			$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
			$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
			
		End if 
	End if 
	
	
End if 
ERR_MethodTrackerReturn("DB_SetOutFilterStockTypes"; $_t_OldMethodName)
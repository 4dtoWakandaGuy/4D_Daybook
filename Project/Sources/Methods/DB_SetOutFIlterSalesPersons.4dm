//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetOutFIlterSalesPersons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/05/2013 16:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_HeaderVars; 0)
	//ARRAY BOOLEAN(LAY_abo_SPExclude;0)
	//ARRAY BOOLEAN(LAY_abo_SPInclude;0)
	//ARRAY BOOLEAN(LAY_lb_SPCodes;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVars; 0)
	ARRAY POINTER:C280($_aptr_HeaderVars; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY TEXT:C222($_at_SPinitials; 0)
	ARRAY TEXT:C222($_at_SPName; 0)
	//ARRAY TEXT(DB_at_SPInitials;0)
	//ARRAY TEXT(LAY_at_SPinitials;0)
	//ARRAY TEXT(LAY_at_SPName;0)
	C_BOOLEAN:C305($_bo_ObjectExists; $_bo_SetReturnObjects; DB_bo_SPReady; LAY_bo_SalesPersonSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_BlankPosition; $_l_GetSalesPersions; $_l_Index; $_l_Longest; $_l_Longest2; $_l_MaxLabelWidth; $_l_MaxLBWidth)
	C_LONGINT:C283($_l_ObjectExists; $_l_Ref; $_l_TableNumber; $_l_TotalWidth; $0; $Right; SPers_l_BUT1; SPers_l_But2; SPers_l_BUT3; SPers_l_BUT4; SPers_l_BUT5)
	C_LONGINT:C283(SPers_l_BUT6; SPers_l_BUT7; SPers_l_BUT8; SPers_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $_Ptr_TableForStyle)
	C_POINTER:C301($_ptr_VarName; $1; $10; $11; $2; $3; $4; $5; $6; $7; $8)
	C_POINTER:C301($9)
	C_TEXT:C284($_t_oldMethodName; $_t_SalesPersonLabel; dbFilterText; SPers_t_COL1; SPers_t_COL2; SPers_t_COL3; SPers_t_COL4; SPers_t_COL5; SPers_t_COL6; SPers_t_COL7; SPers_t_COL8)
	C_TEXT:C284(SPers_t_COL9; SPers_t_HED1; SPers_t_HED2; SPers_t_HED3; SPers_t_HED4; SPers_t_HED5; SPers_t_HED6; SPers_t_HED7; SPers_t_HED8; SPers_t_HED9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetOutFIlterSalesPersons")
If (Count parameters:C259>=1)
	$_Ptr_TableForStyle:=$1
	$_l_TableNumber:=Table:C252($1)
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
		$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Sales Person")  //this is not the name of the on screen object just a reference for this method
		If ($_l_ObjectExists<0)
			APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
			If ($_l_TableNumber=Table:C252(->[DIARY:12]))
				APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Item Owner")
			Else 
				APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Sales Person")
			End if 
			APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oSalesPerson")
		End if 
		/////
		$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oSalesPerson")
		If ($_l_Ref>0)
			$_bo_ObjectExists:=$_ptr_ObjectExists->{$_l_Ref}
			
		Else 
			$_bo_ObjectExists:=False:C215
		End if 
	Else 
		$_l_Ref:=-1
		$_bo_ObjectExists:=False:C215
	End if 
	If (Not:C34(LAY_bo_SalesPersonSetup))
		
		ARRAY BOOLEAN:C223(LAY_lb_SPCodes; 0)
		
		If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
			ARRAY BOOLEAN:C223(LAY_lb_SPCodes; 0)
			OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oSalesPerson"; ->LAY_lb_SPCodes)
			OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oSalesPersonLabel")
			If ($_l_TableNumber=Table:C252(->[DIARY:12]))
				$_t_SalesPersonLabel:="Item Owner"
			Else 
				$_t_SalesPersonLabel:=Get localized string:C991("CompanyFieldNames_SalesPerson")
				If (Position:C15(":"; $_t_SalesPersonLabel)=0)
					$_t_SalesPersonLabel:=$_t_SalesPersonLabel+" :"
				End if 
			End if 
			OBJECT SET TITLE:C194(*; "oSalesPersonLabel"; $_t_SalesPersonLabel)
		End if 
		
		
		//$_ptr_VarName:=OBJECT Get data source(*;"oSalesPerson")
		
		//oWASSalesPersonLabel
		ALL RECORDS:C47([PERSONNEL:11])
		ARRAY TEXT:C222($_at_SPinitials; 0)
		ARRAY TEXT:C222($_at_SPName; 0)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; $_at_SPinitials; [PERSONNEL:11]Name:2; $_at_SPName)
		$_l_BlankPosition:=Find in array:C230($_at_SPinitials; "")
		If ($_l_BlankPosition>0)
			DELETE FROM ARRAY:C228($_at_SPinitials; $_l_BlankPosition)
			DELETE FROM ARRAY:C228($_at_SPName; $_l_BlankPosition)
		End if 
		
		DB_bo_SPReady:=False:C215
		ARRAY TEXT:C222(DB_at_SPInitials; 0)
		//ALERT("SIZE6")
		$_l_GetSalesPersions:=New process:C317("DB_SalesPersonsUsed"; 128000; "Get Sales Persons"; Current process:C322; $_l_TableNumber)
		While (Not:C34(DB_bo_SPReady))
			DelayTicks(2)
		End while 
		//ALERT("SIZE7")
		ARRAY TEXT:C222(LAY_at_SPinitials; 0)
		ARRAY TEXT:C222(LAY_at_SPName; 0)
		For ($_l_Index; 1; Size of array:C274(DB_at_SPInitials))
			$_l_BlankPosition:=Find in array:C230($_at_SPinitials; DB_at_SPInitials{$_l_Index})
			If ($_l_BlankPosition>0)
				APPEND TO ARRAY:C911(LAY_at_SPinitials; DB_at_SPInitials{$_l_Index})
				APPEND TO ARRAY:C911(LAY_at_SPName; $_at_SPName{$_l_BlankPosition})
			End if 
		End for 
		SORT ARRAY:C229(LAY_at_SPName; LAY_at_SPinitials)
		If (Size of array:C274(LAY_at_SPinitials)>0)
			INSERT IN ARRAY:C227(LAY_at_SPName; 1; 1)
			INSERT IN ARRAY:C227(LAY_at_SPinitials; 1; 1)
			LAY_at_SPinitials{1}:=""
			If ($_l_TableNumber=Table:C252(->[DIARY:12]))
				LAY_at_SPName{1}:="No Owner"
			Else 
				LAY_at_SPName{1}:="No Sales Person"
			End if 
		End if 
		
		
		//ALERT("SIZE8")
		ARRAY BOOLEAN:C223(LAY_abo_SPInclude; 0)
		ARRAY BOOLEAN:C223(LAY_abo_SPExclude; 0)
		
		ARRAY BOOLEAN:C223(LAY_abo_SPInclude; Size of array:C274(LAY_at_SPName))
		ARRAY BOOLEAN:C223(LAY_abo_SPExclude; Size of array:C274(LAY_at_SPName))
		For ($_l_Index; 1; Size of array:C274(LAY_abo_SPInclude))
			LAY_abo_SPInclude{$_l_Index}:=True:C214
		End for 
		LB_SetupListboxByObjectName("oSalesPerson"; "SPers_t"; "SPers_L"; 1; ->LAY_at_SPName; ->LAY_at_SPinitials; ->LAY_abo_SPInclude; ->LAY_abo_SPExclude)
		//OBJECT GET BEST SIZE(*;"OcsFilterZeros";$_l_BestWidth;$_l_BestHeight)
		$_l_Longest:=0
		$_l_Longest2:=0
		//TRACE
		For ($_l_Index; 1; Size of array:C274(LAY_at_SPName))
			dbFilterText:=LAY_at_SPName{$_l_Index}
			OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_Longest)
				$_l_Longest:=$_l_BestWidth
			End if 
			dbFilterText:=LAY_at_SPinitials{$_l_Index}
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
		If ($_l_TableNumber=Table:C252(->[DIARY:12]))
			LB_SetColumnHeadersByObjectName("oSalesPerson"; "SPers_L"; 1; "Item Owner"; "ID"; "Inc."; "Exc.")
			
		Else 
			LB_SetColumnHeadersByObjectName("oSalesPerson"; "SPers_L"; 1; Get localized string:C991("CompanyFieldNames_SalesPerson"); "ID"; "Inc."; "Exc.")
		End if 
		LB_SetEnterablebyObjectName("oSalesPerson"; False:C215; 0)
		LB_SetEnterablebyObjectName("oSalesPerson"; True:C214; 3)
		LB_SetEnterablebyObjectName("oSalesPerson"; True:C214; 4)
		LB_SetColumnWIdthsByObjectName("oSalesPerson"; "SPers_t"; 1; $_l_Longest; $_l_Longest2; 35; 35)
		LB_SetScrollByObjectName("oSalesPerson"; -3; -2)
		//oBrand
		$0:=$_l_Longest2+$_l_Longest+35+35
		///
		//
	End if 
	OBJECT GET BEST SIZE:C717(*; "oSalesPersonLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
	If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
		$_l_MaxLabelWidth:=$_l_BestLabelWidth
	End if 
	LB_StyleSettingsByObjectName("oSalesPerson"; "Black"; 9; "SPers_t"; $1)
	LAY_bo_SalesPersonSetup:=True:C214
	LISTBOX GET ARRAYS:C832(*; "oSalesPerson"; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVars; $_aptr_HeaderVars; $_abo_HeaderVars; $_aptr_ColumnStyles)
	
	
	$_l_TotalWidth:=LB_GetTotalColumnWIdths("oSalesPerson")
	$0:=$_l_TotalWidth
	If ($_bo_SetReturnObjects)
		If (Size of array:C274(LAY_at_SPName)>1)  //so we actually only show the area if there are some items in it
			If ($_l_TotalWidth>$_l_MaxLBWidth)
				$_l_MaxLBWidth:=$_l_TotalWidth
			End if 
			$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
			$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(LAY_at_SPName)*20)+20
			APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(LAY_at_SPName))
			$_Ptr_DisplayThisObject->:=True:C214
			If ($_l_TableNumber=Table:C252(->[DIARY:12]))
				APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Item Owner")
			Else 
				APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Sales Person")
			End if 
			$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
			$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DB_SetOutFIlterSalesPersons"; $_t_oldMethodName)
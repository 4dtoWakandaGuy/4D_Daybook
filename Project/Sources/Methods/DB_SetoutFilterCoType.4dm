//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_SetoutFilterCoType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/08/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnVisible; 0)
	//ARRAY BOOLEAN(LAY_abo_TypesExclude;0)
	//ARRAY BOOLEAN(LAY_abo_TypesInclude;0)
	//ARRAY BOOLEAN(LAY_lb_TPCodes;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aPtr_ColumnVars; 0)
	ARRAY POINTER:C280($_aPtr_HeaderVars; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(DB_at_TypesCodes;0)
	//ARRAY TEXT(DB_at_TypesNames;0)
	C_BOOLEAN:C305($_bo_AreaSetup; $_bo_ObjectExists; $_bo_SetReturnObjects; DB_bo_TypesReady; LAY_bo_ConTypeSetup; LAY_bo_CoTypesSetup; LAY_bo_OrdTypeSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWIdth; $_l_GetTypes; $_l_Index; $_l_Longest; $_l_Longest2; $_l_MaxLabelWidth; $_l_MaxLBWidth; $_l_ObjectExists)
	C_LONGINT:C283($_l_Ref; $_l_TableNumber; $_l_TotalWIdth; $0; type_l_BUT1; type_l_But2; type_l_BUT3; type_l_BUT4; type_l_BUT5; type_l_BUT6; type_l_BUT7)
	C_LONGINT:C283(type_l_BUT8; type_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $_Ptr_TableForStyle)
	C_POINTER:C301($1; $10; $11; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_OldMethodName; $_t_TypeLabel; dbFilterText; Type_t_COL1; Type_t_COL2; Type_t_COL3; Type_t_COL4; Type_t_COL5; Type_t_COL6; Type_t_COL7; Type_t_COL8)
	C_TEXT:C284(Type_t_COL9; Type_t_HED1; Type_t_HED2; Type_t_HED3; Type_t_HED4; Type_t_HED5; Type_t_HED6; Type_t_HED7; Type_t_HED8; Type_t_HED9)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_SetoutFilterCoType")
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
		$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "CompanyTypes")  //this is not the name of the on screen object just a reference for this method
		If ($_l_ObjectExists<0)
			APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
			APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "CompanyTypes")
			APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oType")
		End if 
		
		
		$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oType")
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
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[COMPANIES:2]))
			$_bo_AreaSetup:=LAY_bo_CoTypesSetup
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[CONTACTS:1]))
			$_bo_AreaSetup:=LAY_bo_ConTypeSetup
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ORDERS:24]))
			$_bo_AreaSetup:=LAY_bo_OrdTypeSetup
	End case 
	If (Not:C34($_bo_AreaSetup))
		If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
			ARRAY BOOLEAN:C223(LAY_lb_TPCodes; 0)
			OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oType"; ->LAY_lb_TPCodes)
			OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oTypeLabel")
			$_t_TypeLabel:=Get localized string:C991("CompanyFieldNames_Type")
			If (Position:C15(":"; $_t_TypeLabel)=0)
				$_t_TypeLabel:=$_t_TypeLabel+" :"
			End if 
			OBJECT SET TITLE:C194(*; "oTypeLabel"; $_t_TypeLabel)
		End if 
		
		//LAY_bo_OrdTypeSetup:=False
		//LAY_bo_ConTypeSetup:=False
		DB_bo_TypesReady:=False:C215
		ARRAY TEXT:C222(DB_at_TypesNames; 0)
		ARRAY TEXT:C222(DB_at_TypesCodes; 0)
		$_l_TableNumber:=Table:C252($_Ptr_TableForStyle)
		If ($_l_TableNumber=Table:C252(->[ORDERS:24]))
			$_l_GetTypes:=New process:C317("DB_GetOrderTypes"; 128000; "Get Data"; Current process:C322; Table:C252(->[ORDERS:24]); "1")
			
		Else 
			$_l_GetTypes:=New process:C317("DB_GetTypes"; 128000; "Get Data"; Current process:C322; $_l_TableNumber; "2"; False:C215)
		End if 
		While (Not:C34(DB_bo_TypesReady))
			DelayTicks(2)
		End while 
		SORT ARRAY:C229(DB_at_TypesNames; DB_at_TypesCodes)
		If (Size of array:C274(DB_at_TypesNames)>0)
			INSERT IN ARRAY:C227(DB_at_TypesNames; 1; 1)
			INSERT IN ARRAY:C227(DB_at_TypesCodes; 1; 1)
			DB_at_TypesCodes{1}:=""
			DB_at_TypesNames{1}:="No Type Set"
		End if 
		//ALERT("SIZE18")
		ARRAY BOOLEAN:C223(LAY_abo_TypesInclude; 0)
		ARRAY BOOLEAN:C223(LAY_abo_TypesExclude; 0)
		ARRAY BOOLEAN:C223(LAY_abo_TypesInclude; Size of array:C274(DB_at_TypesCodes))
		ARRAY BOOLEAN:C223(LAY_abo_TypesExclude; Size of array:C274(DB_at_TypesCodes))
		For ($_l_Index; 1; Size of array:C274(LAY_abo_TypesInclude))
			LAY_abo_TypesInclude{$_l_Index}:=True:C214
		End for 
		$_l_Longest:=0
		$_l_Longest2:=0
		For ($_l_Index; 1; Size of array:C274(DB_at_TypesNames))
			dbFilterText:=DB_at_TypesNames{$_l_Index}
			OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWIdth; $_l_BestHeight)
			If ($_l_BestWIdth>$_l_Longest)
				$_l_Longest:=$_l_BestWIdth
			End if 
			dbFilterText:=DB_at_TypesCodes{$_l_Index}
			OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWIdth; $_l_BestHeight)
			If ($_l_BestWIdth>$_l_Longest2)
				$_l_Longest2:=$_l_BestWIdth
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
			: ($_l_Longest2<(50))
				$_l_Longest2:=(50)
		End case 
		LB_SetupListboxByObjectName("oType"; "Type_t"; "type_L"; 1; ->DB_at_TypesNames; ->DB_at_TypesCodes; ->LAY_abo_TypesInclude; ->LAY_abo_TypesExclude)
		LB_SetColumnHeadersByObjectName("oType"; "type_L"; 1; Get localized string:C991("CompanyFieldNames_Type"); Get localized string:C991("CompanyFieldNames_Code"); "Inc."; "Exc.")
		LB_SetEnterablebyObjectName("oType"; False:C215; 0)
		LB_SetEnterablebyObjectName("oType"; True:C214; 3)
		LB_SetEnterablebyObjectName("oType"; True:C214; 4)
		LB_SetColumnWIdthsByObjectName("oType"; "Type_t"; 1; $_l_Longest; $_l_Longest2; 35; 35)
		LB_SetScrollByObjectName("oType"; -3; -2)
		$0:=$_l_Longest+$_l_Longest2+35+35
	End if 
	OBJECT GET BEST SIZE:C717(*; "oTypeLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
	If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
		$_l_MaxLabelWidth:=$_l_BestLabelWidth
	End if 
	LB_StyleSettingsByObjectName("oType"; "Black"; 9; "Type_t"; $_Ptr_TableForStyle)
	LAY_bo_CoTypesSetup:=False:C215
	LAY_bo_ConTypeSetup:=False:C215
	LAY_bo_OrdTypeSetup:=False:C215
	Case of 
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[COMPANIES:2]))
			LAY_bo_CoTypesSetup:=True:C214
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[CONTACTS:1]))
			LAY_bo_ConTypeSetup:=True:C214
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ORDERS:24]))
			LAY_bo_OrdTypeSetup:=True:C214
	End case 
	
	
	$_l_TotalWidth:=LB_GetTotalColumnWIdths("oType")
	
	$0:=$_l_TotalWidth
	If ($_bo_SetReturnObjects)
		If (Size of array:C274(DB_at_TypesNames)>1)  //so we actually only show the area if there are some items in it
			If ($_l_TotalWidth>$_l_MaxLBWidth)
				$_l_MaxLBWidth:=$_l_TotalWidth
			End if 
			$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
			$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(DB_at_TypesNames)*20)+20
			APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(DB_at_TypesNames))
			$_Ptr_DisplayThisObject->:=True:C214
			APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "CompanyTypes")
			$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
			$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("DB_SetoutFilterCoType"; $_t_OldMethodName)
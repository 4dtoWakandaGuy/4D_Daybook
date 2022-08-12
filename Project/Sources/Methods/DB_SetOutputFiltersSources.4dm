//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_SetOutputFiltersSources
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
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(LAY_abo_SourcesExclude;0)
	//ARRAY BOOLEAN(LAY_abo_SourcesInclude;0)
	//ARRAY BOOLEAN(LAY_lb_CNCodes;0)
	//ARRAY BOOLEAN(LAY_lb_SoCodes;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVars; 0)
	ARRAY POINTER:C280($_aptr_HeaderVars; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(DB_at_SourceCodes;0)
	//ARRAY TEXT(DB_at_SourceNames;0)
	C_BOOLEAN:C305($_bo_AreaSetup; $_bo_ObjectExists; $_bo_SetReturnObjects; DB_bo_SourcesReady; LAY_bo_CONsourcesSetup; LAY_bo_COsourcesSetup; LAY_bo_ORDsourcesSetup)
	C_LONGINT:C283($_l_BestLabelHeight; $_l_BestLabelWidth; $_l_GetSources; $_l_index; $_l_Longest2; $_l_MaxLabelWidth; $_l_MaxLBWidth; $_l_ObjectExists; $_l_Ref; $_l_TotalWidth; $0)
	C_LONGINT:C283($Bottom; $left; $MaxHeight; $MaxPortrait; $MaxRows; $Right; $Top; sou_l_BUT1; sou_l_But2; sou_l_BUT3; sou_l_BUT4)
	C_LONGINT:C283(sou_l_BUT5; sou_l_BUT6; sou_l_BUT7; sou_l_BUT8; sou_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $_Ptr_TableForStyle)
	C_POINTER:C301($1; $10; $11; $2; $3; $4; $5; $6; $7; $8; $9)
	C_REAL:C285($_l_BestHeight; $_l_BestWidth; $_l_Longest)
	C_TEXT:C284($_t_OldMethodName; $_t_SourcesLabel; dbFilterText; sou_t_COL1; sou_t_COL2; sou_t_COL3; sou_t_COL4; sou_t_COL5; sou_t_COL6; sou_t_COL7; sou_t_COL8)
	C_TEXT:C284(sou_t_COL9; sou_t_HED1; sou_t_HED2; sou_t_HED3; sou_t_HED4; sou_t_HED5; sou_t_HED6; sou_t_HED7; sou_t_HED8; sou_t_HED9)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_SetOutputFiltersSources")
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
		$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Sources")  //this is not the name of the on screen object just a reference for this method
		If ($_l_ObjectExists<0)
			APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
			APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Sources")
			APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oSources")
		End if 
		
		$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oSources")
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
			$_bo_AreaSetup:=LAY_bo_COsourcesSetup
			
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[CONTACTS:1]))
			
			$_bo_AreaSetup:=LAY_bo_CONsourcesSetup
			
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ORDERS:24]))
			
			$_bo_AreaSetup:=LAY_bo_ORDsourcesSetup
		Else 
	End case 
	If (Not:C34($_bo_AreaSetup))
		If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
			ARRAY BOOLEAN:C223(LAY_lb_SoCodes; 0)
			OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oSources"; ->LAY_lb_SoCodes)
			OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oSourcesLabel")
			$_t_SourcesLabel:=Get localized string:C991("CompanyFieldNames_Source")
			If (Position:C15(":"; $_t_SourcesLabel)=0)
				$_t_SourcesLabel:=$_t_SourcesLabel+" :"
			End if 
			OBJECT SET TITLE:C194(*; "oSourcesLabel"; $_t_SourcesLabel)
		End if 
		
		DB_bo_SourcesReady:=False:C215
		ARRAY TEXT:C222(DB_at_SourceNames; 0)
		ARRAY TEXT:C222(DB_at_SourceCodes; 0)
		//zALERT("SIZE19")
		$_l_GetSources:=New process:C317("DB_GetSources"; 128000; "Get Data"; Current process:C322; Table:C252($_Ptr_TableForStyle))
		
		While (Not:C34(DB_bo_SourcesReady))
			DelayTicks(2)
		End while 
		SORT ARRAY:C229(DB_at_SourceNames; DB_at_SourceCodes)
		If (Size of array:C274(DB_at_SourceNames)>0)
			INSERT IN ARRAY:C227(DB_at_SourceNames; 1; 1)
			INSERT IN ARRAY:C227(DB_at_SourceCodes; 1; 1)
			DB_at_SourceCodes{1}:=""
			DB_at_SourceNames{1}:="No Source Set"
		End if 
		ARRAY BOOLEAN:C223(LAY_abo_SourcesInclude; 0)
		ARRAY BOOLEAN:C223(LAY_abo_SourcesExclude; 0)
		
		ARRAY BOOLEAN:C223(LAY_abo_SourcesInclude; Size of array:C274(DB_at_SourceCodes))
		ARRAY BOOLEAN:C223(LAY_abo_SourcesExclude; Size of array:C274(DB_at_SourceCodes))
		For ($_l_index; 1; Size of array:C274(DB_at_SourceCodes))
			LAY_abo_SourcesInclude{$_l_index}:=True:C214
		End for 
		$_l_Longest:=0
		$_l_Longest2:=0
		For ($_l_index; 1; Size of array:C274(DB_at_SourceNames))
			//OBJECT SET TITLE
			dbFilterText:=DB_at_SourceNames{$_l_index}
			OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_Longest)
				$_l_Longest:=$_l_BestWidth
			End if 
			dbFilterText:=DB_at_SourceCodes{$_l_index}
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
			: ($_l_Longest2<(35))
				$_l_Longest2:=(35)
		End case 
		LB_SetupListboxByObjectName("oSources"; "sou_t"; "sou_L"; 1; ->DB_at_SourceNames; ->DB_at_SourceCodes; ->LAY_abo_SourcesInclude; ->LAY_abo_SourcesExclude)
		LB_SetColumnHeadersByObjectName("oSources"; "sou_L"; 1; Get localized string:C991("CompanyFieldNames_Source"); Get localized string:C991("CompanyFieldNames_Code"); "Inc."; "Exc.")
		
		
		
		LB_SetEnterablebyObjectName("oSources"; False:C215; 0)
		
		LB_SetEnterablebyObjectName("oSources"; True:C214; 3)
		LB_SetEnterablebyObjectName("oSources"; True:C214; 4)
		LB_SetColumnWIdthsByObjectName("oSources"; "sou_t"; 1; $_l_Longest; $_l_Longest2; 35; 35)
		LB_SetScrollByObjectName("oSources"; -3; -2)
	End if 
	OBJECT GET BEST SIZE:C717(*; "oSourcesLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
	If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
		$_l_MaxLabelWidth:=$_l_BestLabelWidth
	End if 
	
	LB_StyleSettingsByObjectName("oSources"; "Black"; 9; "sou_t"; $_Ptr_TableForStyle)
	LAY_bo_COsourcesSetup:=False:C215
	LAY_bo_CONsourcesSetup:=False:C215
	LAY_bo_ORDsourcesSetup:=False:C215
	Case of 
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[COMPANIES:2]))
			LAY_bo_COsourcesSetup:=True:C214
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[CONTACTS:1]))
			LAY_bo_CONsourcesSetup:=True:C214
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ORDERS:24]))
			LAY_bo_ORDsourcesSetup:=True:C214
		Else 
	End case 
	
	$_l_TotalWidth:=LB_GetTotalColumnWIdths("oSources")
	$0:=$_l_TotalWidth
	If ($_bo_SetReturnObjects)
		If (Size of array:C274(DB_at_SourceNames)>1)  //so we actually only show the area if there are some items in it
			If ($_l_TotalWidth>$_l_MaxLBWidth)
				$_l_MaxLBWidth:=$_l_TotalWidth
			End if 
			$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
			$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(DB_at_SourceNames)*20)+20
			APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(DB_at_SourceNames))
			$_Ptr_DisplayThisObject->:=True:C214
			APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Sources")
			$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
			$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
		End if 
	End if 
Else 
	
	
End if 
ERR_MethodTrackerReturn("DB_SetOutputFiltersSources"; $_t_OldMethodName)
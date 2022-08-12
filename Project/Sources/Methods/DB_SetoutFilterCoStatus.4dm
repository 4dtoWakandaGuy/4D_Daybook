//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetoutFilterCoStatus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/05/2013 06:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY BOOLEAN:C223($_abo_ColumnVisible; 0)
	//ARRAY BOOLEAN(LAY_abo_StatusExclude;0)
	//ARRAY BOOLEAN(LAY_abo_StatusInclude;0)
	//ARRAY BOOLEAN(LAY_lb_CNCodes;0)
	//ARRAY BOOLEAN(LAY_lb_STCodes;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVars; 0)
	ARRAY POINTER:C280($_aptr_HeaderVars; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(DB_at_StatusCodes;0)
	//ARRAY TEXT(DB_at_StatusNames;0)
	C_BOOLEAN:C305($_bo_AreaSetup; $_bo_ObjectExists; $_bo_SetReturnObjects; DB_bo_StatusReady; LAY_bo_CONStatusSetup; LAY_bo_COStatusSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_GetStatus; $_l_Index; $_l_Longes2; $_l_Longest; $_l_Longest2; $_l_MaxLabelWidth; $_l_MaxLBWidth)
	C_LONGINT:C283($_l_ObjectExists; $_l_Ref; $_l_TotalWIdth; $0; sta_l_BUT1; sta_l_But2; sta_l_BUT3; sta_l_BUT4; sta_l_BUT5; sta_l_BUT6; sta_l_BUT7)
	C_LONGINT:C283(sta_l_BUT8; sta_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $_Ptr_TableForStyle)
	C_POINTER:C301($1; $10; $11; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_OldMethodName; $_t_StatusLabel; dbFilterText; sta_t_COL1; sta_t_COL2; sta_t_COL3; sta_t_COL4; sta_t_COL5; sta_t_COL6; sta_t_COL7; sta_t_COL8)
	C_TEXT:C284(sta_t_COL9; sta_t_HED1; sta_t_HED2; sta_t_HED3; sta_t_HED4; sta_t_HED5; sta_t_HED6; sta_t_HED7; sta_t_HED8; sta_t_HED9)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_SetoutFilterCoStatus")
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
		$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Status")  //this is not the name of the on screen object just a reference for this method
		If ($_l_ObjectExists<0)
			APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
			APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Status")
			APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oStatus")
		End if 
		
		
		$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oStatus")
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
			$_bo_AreaSetup:=LAY_bo_COStatusSetup
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[CONTACTS:1]))
			$_bo_AreaSetup:=LAY_bo_CONStatusSetup
	End case 
	If (Not:C34($_bo_AreaSetup))
		If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
			ARRAY BOOLEAN:C223(LAY_lb_STCodes; 0)
			OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oStatus"; ->LAY_lb_STCodes)
			OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oStatusLabel")
			$_t_StatusLabel:=Get localized string:C991("CompanyFieldNames_Status")
			If (Position:C15(":"; $_t_StatusLabel)=0)
				$_t_StatusLabel:=$_t_StatusLabel+" :"
			End if 
			OBJECT SET TITLE:C194(*; "oStatusLabel"; $_t_StatusLabel)
		End if 
		
		DB_bo_StatusReady:=False:C215
		ARRAY TEXT:C222(DB_at_StatusNames; 0)
		ARRAY TEXT:C222(DB_at_StatusCodes; 0)
		//zALERT("SIZE19")
		$_l_GetStatus:=New process:C317("DB_GetStatus"; 128000; "Get Data"; Current process:C322; True:C214; Table:C252($_Ptr_TableForStyle))
		
		While (Not:C34(DB_bo_StatusReady))
			DelayTicks(2)
		End while 
		SORT ARRAY:C229(DB_at_StatusNames; DB_at_StatusCodes)
		If (Size of array:C274(DB_at_StatusNames)>0)
			INSERT IN ARRAY:C227(DB_at_StatusNames; 1; 1)
			INSERT IN ARRAY:C227(DB_at_StatusCodes; 1; 1)
			DB_at_StatusCodes{1}:=""
			DB_at_StatusNames{1}:="No Status Set"
		End if 
		ARRAY BOOLEAN:C223(LAY_abo_StatusInclude; 0)
		ARRAY BOOLEAN:C223(LAY_abo_StatusExclude; 0)
		
		ARRAY BOOLEAN:C223(LAY_abo_StatusInclude; Size of array:C274(DB_at_StatusCodes))
		ARRAY BOOLEAN:C223(LAY_abo_StatusExclude; Size of array:C274(DB_at_StatusCodes))
		For ($_l_Index; 1; Size of array:C274(LAY_abo_StatusInclude))
			LAY_abo_StatusInclude{$_l_Index}:=True:C214
		End for 
		LB_SetupListboxByObjectName("oStatus"; "sta_t"; "sta_L"; 1; ->DB_at_StatusNames; ->DB_at_StatusCodes; ->LAY_abo_StatusInclude; ->LAY_abo_StatusExclude)
		$_l_Longest:=0
		$_l_Longest2:=0
		For ($_l_Index; 1; Size of array:C274(DB_at_StatusNames))
			dbFilterText:=DB_at_StatusNames{$_l_Index}
			OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_Longest)
				$_l_Longest:=$_l_BestWidth
			End if 
			dbFilterText:=DB_at_StatusCodes{$_l_Index}
			OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_Longest2)
				$_l_Longest2:=$_l_BestWidth
			End if 
		End for 
		$_l_Longest:=$_l_Longest+2
		Case of 
			: ($_l_Longest>(108))
				$_l_Longest:=(108)
			: ($_l_Longest<(50))
				$_l_Longest:=(50)
		End case 
		Case of 
			: ($_l_Longest2>(108))
				$_l_Longest2:=(108)
			: ($_l_Longes2<(35))
				$_l_Longest2:=(35)
		End case 
		LB_SetColumnHeadersByObjectName("oStatus"; "sta_L"; 1; Get localized string:C991("CompanyFieldNames_Status"); Get localized string:C991("CompanyFieldNames_Code"); "Inc."; "Exc.")
		LB_SetEnterablebyObjectName("oStatus"; False:C215; 0)
		LB_SetEnterablebyObjectName("oStatus"; True:C214; 3)
		LB_SetEnterablebyObjectName("oStatus"; True:C214; 4)
		LB_SetColumnWIdthsByObjectName("oStatus"; "sta_t"; 1; $_l_Longest; $_l_Longest2; 35; 35)
		LB_SetScrollByObjectName("oStatus"; -3; -2)
		$0:=$_l_Longest2+$_l_Longest+35+35
	End if 
	OBJECT GET BEST SIZE:C717(*; "oStatusLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
	If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
		$_l_MaxLabelWidth:=$_l_BestLabelWidth
	End if 
	LB_StyleSettingsByObjectName("oStatus"; "Black"; 9; "sta_t"; $_Ptr_TableForStyle)
	LAY_bo_COStatusSetup:=False:C215
	LAY_bo_CONStatusSetup:=False:C215
	
	Case of 
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[COMPANIES:2]))
			LAY_bo_COStatusSetup:=True:C214
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[CONTACTS:1]))
			
			LAY_bo_CONStatusSetup:=True:C214
	End case 
	$_l_TotalWIdth:=0
	$_l_TotalWidth:=LB_GetTotalColumnWIdths("oStatus")
	$0:=$_l_TotalWidth
	If ($_bo_SetReturnObjects)
		If (Size of array:C274(DB_at_StatusNames)>1)  //so we actually only show the area if there are some items in it
			If ($_l_TotalWidth>$_l_MaxLBWidth)
				$_l_MaxLBWidth:=$_l_TotalWidth
			End if 
			$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
			$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(DB_at_StatusNames)*20)+20
			APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(DB_at_StatusNames))
			$_Ptr_DisplayThisObject->:=True:C214
			APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Status")
			$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
			$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DB_SetoutFilterCoStatus"; $_t_OldMethodName)
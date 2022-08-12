//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_SetoutFilterAreas
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
	//ARRAY BOOLEAN(LAY_abo_AreasExclude;0)
	//ARRAY BOOLEAN(LAY_abo_AreasInclude;0)
	//ARRAY BOOLEAN(LAY_lb_ARCodes;0)
	//ARRAY BOOLEAN(LAY_lb_CNCodes;0)
	//ARRAY BOOLEAN(LAY_lb_CountyCodes;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVars; 0)
	ARRAY POINTER:C280($_aptr_HeaderVars; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(DB_at_AreaCodes;0)
	//ARRAY TEXT(DB_at_AreaNames;0)
	C_BOOLEAN:C305($_bo_areaSetup; $_bo_ObjectExists; $_bo_ReturnData; DB_bo_AreasReady; LAY_bo_AreasSetup; LAY_bo_OrderAreasSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_GetAreas; $_l_Index; $_l_Longest; $_l_Longest2; $_l_MaxLabelWidth; $_l_MaxLBWidth; $_l_ObjectExists)
	C_LONGINT:C283($_l_Ref; $_l_TotalWidth; $0; Area_l_BUT1; Area_l_But2; Area_l_BUT3; Area_l_BUT4; Area_l_BUT5; Area_l_BUT6; Area_l_BUT7; Area_l_BUT8)
	C_LONGINT:C283(Area_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $_Ptr_TableForStyle)
	C_POINTER:C301($_ptr_VarName; $1; $10; $11; $2; $3; $4; $5; $6; $7; $8)
	C_POINTER:C301($9)
	C_TEXT:C284($_t_AreasLabel; $_t_oldMethodName; $_t_OldMethodNames; Area_t_COL1; Area_t_COL2; Area_t_COL3; Area_t_COL4; Area_t_COL5; Area_t_COL6; Area_t_COL7; Area_t_COL8)
	C_TEXT:C284(Area_t_COL9; Area_t_HED1; Area_t_HED2; Area_t_HED3; Area_t_HED4; Area_t_HED5; Area_t_HED6; Area_t_HED7; Area_t_HED8; Area_t_HED9; dbFilterText)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_SetoutFilterAreas")

$_t_OldMethodNames:=ERR_MethodTracker("DB_SetoutFilterAreas")
If (Count parameters:C259>=1)
	$_Ptr_TableForStyle:=$1
	If (Count parameters:C259>=11)
		$_bo_ReturnData:=True:C214
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
		$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Areas")  //this is not the name of the on screen object just a reference for this method
		If ($_l_ObjectExists<0)
			APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
			APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Areas")
			APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oAreas")
		End if 
		
		
		$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oAreas")
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
			$_bo_areaSetup:=LAY_bo_AreasSetup
		Else 
			$_bo_areaSetup:=LAY_bo_OrderAreasSetup
			
			
	End case 
	If (Not:C34($_bo_areaSetup))
		
		If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
			ARRAY BOOLEAN:C223(LAY_lb_ARCodes; 0)
			OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oAreas"; ->LAY_lb_ARCodes)
			OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oAreasLabel")
			$_t_AreasLabel:=Get localized string:C991("CompanyFieldNames_Area")
			If (Position:C15(":"; $_t_AreasLabel)=0)
				$_t_AreasLabel:=$_t_AreasLabel+" :"
			End if 
			OBJECT SET TITLE:C194(*; "oAreasLabel"; $_t_AreasLabel)
		End if 
		
		//$_ptr_VarName:=OBJECT Get data source(*;"oAreas")
		//OBJECT SET DATA SOURCE(*;"oAreas";->LAY_lb_ARCodes)
		//NEW OBJECT
		DB_bo_AreasReady:=False:C215
		ARRAY TEXT:C222(DB_at_AreaNames; 0)
		ARRAY TEXT:C222(DB_at_AreaCodes; 0)
		//ALERT("SIZE15")
		$_l_GetAreas:=New process:C317("DB_GetAreas"; 128000; "Get Data"; Current process:C322; True:C214; Table:C252($1))
		
		While (Not:C34(DB_bo_AreasReady))
			DelayTicks(2)
		End while 
		//ALERT("SIZE16")
		SORT ARRAY:C229(DB_at_AreaNames; DB_at_AreaCodes)
		If (Size of array:C274(DB_at_AreaNames)>0)
			INSERT IN ARRAY:C227(DB_at_AreaNames; 1; 1)
			INSERT IN ARRAY:C227(DB_at_AreaCodes; 1; 1)
			DB_at_AreaCodes{1}:=""
			DB_at_AreaNames{1}:="No Area Set"
		End if 
		ARRAY BOOLEAN:C223(LAY_abo_AreasInclude; 0)
		ARRAY BOOLEAN:C223(LAY_abo_AreasExclude; 0)
		
		ARRAY BOOLEAN:C223(LAY_abo_AreasInclude; Size of array:C274(DB_at_AreaNames))
		ARRAY BOOLEAN:C223(LAY_abo_AreasExclude; Size of array:C274(DB_at_AreaNames))
		For ($_l_Index; 1; Size of array:C274(LAY_abo_AreasInclude))
			LAY_abo_AreasInclude{$_l_Index}:=True:C214
			LAY_abo_AreasExclude{$_l_Index}:=False:C215
		End for 
		$_l_Longest:=0
		$_l_Longest2:=0
		For ($_l_Index; 1; Size of array:C274(DB_at_AreaNames))
			dbFilterText:=DB_at_AreaNames{$_l_Index}
			OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_Longest)
				$_l_Longest:=$_l_BestWidth
			End if 
			dbFilterText:=DB_at_AreaCodes{$_l_Index}
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
			: ($_l_Longest2<(50))
				$_l_Longest2:=(50)
		End case 
		LB_SetupListboxByObjectName("oAreas"; "Area_t"; "Area_L"; 1; ->DB_at_AreaNames; ->DB_at_AreaCodes; ->LAY_abo_AreasInclude; ->LAY_abo_AreasExclude)
		
		LB_SetColumnHeadersByObjectName("oAreas"; "Area_L"; 1; Get localized string:C991("CompanyFieldNames_Area"); Get localized string:C991("CompanyFieldNames_Code"); "Inc."; "Exc.")
		LB_SetEnterablebyObjectName("oAreas"; False:C215; 0)
		LB_SetEnterablebyObjectName("oAreas"; True:C214; 3)
		LB_SetEnterablebyObjectName("oAreas"; True:C214; 4)
		LB_SetColumnWIdthsByObjectName("oAreas"; "Area_t"; 1; $_l_Longest; $_l_Longest2; 35; 35)
		LB_SetScrollByObjectName("oAreas"; -3; -2)
		$0:=$_l_Longest+$_l_Longest2+35+35
		
	End if 
	OBJECT GET BEST SIZE:C717(*; "oAreasLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
	If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
		$_l_MaxLabelWidth:=$_l_BestLabelWidth
	End if 
	
	LB_StyleSettingsByObjectName("oAreas"; "Black"; 9; "Area_t"; $1)
	Case of 
		: (Table:C252($1)=Table:C252(->[COMPANIES:2]))
			LAY_bo_OrderAreasSetup:=False:C215
			LAY_bo_AreasSetup:=True:C214
		Else 
			LAY_bo_OrderAreasSetup:=True:C214
			LAY_bo_AreasSetup:=False:C215
			
	End case 
	$_l_TotalWidth:=LB_GetTotalColumnWIdths("oAreas")
	$0:=$_l_TotalWidth
	If ($_bo_ReturnData)
		If (Size of array:C274(DB_at_AreaNames)>1)  //so we actually only show the area if there are some items in it
			If ($_l_TotalWidth>$_l_MaxLBWidth)
				$_l_MaxLBWidth:=$_l_TotalWidth
			End if 
			$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
			$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(DB_at_AreaNames)*20)+20
			APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(DB_at_AreaNames))
			$_Ptr_DisplayThisObject->:=True:C214
			APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Areas")
			$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
			$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DB_SetoutFilterAreas"; $_t_OldMethodNames)
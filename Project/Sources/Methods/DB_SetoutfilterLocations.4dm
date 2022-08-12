//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetoutfilterLocations
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/05/2013 15:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(LAY_abo_LocationExclude;0)
	//ARRAY BOOLEAN(LAY_abo_LocationInclude;0)
	//ARRAY BOOLEAN(LAY_lb_CrdStgCodes;0)
	//ARRAY BOOLEAN(LAY_lb_LOCtCodes;0)
	//ARRAY TEXT(DB_at_StockLocCodes;0)
	//ARRAY TEXT(DB_at_StockLocNames;0)
	C_BOOLEAN:C305($_bo_ObjectExists; $_bo_SetReturnObjects; DB_bo_StockLocationsReady; LAY_bo_StockLocationsSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_GetStockLocations; $_l_Index; $_l_Longest; $_l_MaxLabelWidth; $_l_MaxLBWidth; $_l_ObjectExists; $_l_Ref)
	C_LONGINT:C283($_l_TotalWidth; $0; LOC_l_BUT1; LOC_l_But2; LOC_l_BUT3; LOC_l_BUT4; LOC_l_BUT5; LOC_l_BUT6; LOC_l_BUT7; LOC_l_BUT8; LOC_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $1)
	C_POINTER:C301($10; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_Label; $_t_OldMethodName; dbFilterText; LOC_t_COL1; LOC_t_COL2; LOC_t_COL3; LOC_t_COL4; LOC_t_COL5; LOC_t_COL6; LOC_t_COL7; LOC_t_COL8)
	C_TEXT:C284(LOC_t_COL9; LOC_t_HED1; LOC_t_HED2; LOC_t_HED3; LOC_t_HED4; LOC_t_HED5; LOC_t_HED6; LOC_t_HED7; LOC_t_HED8; LOC_t_HED9)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_SetoutfilterLocations")
If (Count parameters:C259>=10)
	$_bo_SetReturnObjects:=True:C214
	
	$_ptr_objectNamedArray:=$1
	$_ptr_ObjectExists:=$2
	$_ptr_ObjectNameArray:=$3
	$_Ptr_ObjectsToDisplay:=$4  //pointer to array of object to display
	$_Ptr_DisplayThisObject:=$5  //pointer to boolean indicating if this object is displayed
	
	$_ptr_MaxLBWidth:=$6  //
	$_l_MaxLBWidth:=$6->
	$_Ptr_CountListboxesToDisplay:=$7
	$_Ptr_AllListBoxPhySize:=$8
	$_Ptr_ListBoxRowCountArray:=$9
	$_ptr_MaxLabelWidth:=$10
	$_l_MaxLabelWidth:=$10->
	/////
	
	$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Locations")  //this is not the name of the on screen object just a reference for this method
	If ($_l_ObjectExists<0)
		APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
		APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Locations")
		APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oStockLocs")
	End if 
	/////
	$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oStockLocs")
	If ($_l_Ref>0)
		$_bo_ObjectExists:=$_ptr_ObjectExists->{$_l_Ref}
		
	Else 
		$_bo_ObjectExists:=False:C215
	End if 
Else 
	$_l_Ref:=-1
	$_bo_ObjectExists:=False:C215
End if 

If (Not:C34(LAY_bo_StockLocationsSetup))
	
	If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
		ARRAY BOOLEAN:C223(LAY_lb_LOCtCodes; 0)
		OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oStockLocs"; ->LAY_lb_LOCtCodes)
		OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oStockLocsLabel")
		$_t_Label:="Locations :"
		If (Position:C15(":"; $_t_Label)=0)
			$_t_Label:=$_t_Label+" :"
		End if 
		OBJECT SET TITLE:C194(*; "oStockLocsLabel"; $_t_Label)
	End if 
	
	DB_bo_StockLocationsReady:=False:C215
	ARRAY TEXT:C222(DB_at_StockLocNames; 0)
	ARRAY TEXT:C222(DB_at_StockLocCodes; 0)
	$_l_GetStockLocations:=New process:C317("DB_GetLocations"; 128000; "Get Stock Locations"; Current process:C322)
	While (Not:C34(DB_bo_StockLocationsReady))
		DelayTicks(2)
	End while 
	
	
	SORT ARRAY:C229(DB_at_StockLocNames; DB_at_StockLocCodes)
	If (Size of array:C274(DB_at_StockLocNames)>0)
		INSERT IN ARRAY:C227(DB_at_StockLocNames; 1; 1)
		INSERT IN ARRAY:C227(DB_at_StockLocCodes; 1; 1)
		DB_at_StockLocCodes{1}:=""
		DB_at_StockLocNames{1}:="No Location Set"
	End if 
	ARRAY BOOLEAN:C223(LAY_abo_LocationInclude; 0)
	ARRAY BOOLEAN:C223(LAY_abo_LocationExclude; 0)
	ARRAY BOOLEAN:C223(LAY_abo_LocationInclude; Size of array:C274(DB_at_StockLocNames))
	ARRAY BOOLEAN:C223(LAY_abo_LocationExclude; Size of array:C274(DB_at_StockLocNames))
	For ($_l_Index; 1; Size of array:C274(LAY_abo_LocationInclude))
		LAY_abo_LocationInclude{$_l_Index}:=True:C214
	End for 
	$_l_Longest:=0
	For ($_l_Index; 1; Size of array:C274(DB_at_StockLocNames))
		dbFilterText:=DB_at_StockLocNames{$_l_Index}
		OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
		If ($_l_BestWidth>$_l_Longest)
			$_l_Longest:=$_l_BestWidth
		End if 
	End for 
	$_l_Longest:=$_l_Longest+2
	Case of 
		: ($_l_Longest>(118))
			$_l_Longest:=(118)
		: ($_l_Longest<(60))
			$_l_Longest:=(60)
	End case 
	LB_SetupListboxByObjectName("oStockLocs"; "LOC_t"; "LOC_L"; 1; ->DB_at_StockLocNames; ->DB_at_StockLocCodes; ->LAY_abo_LocationInclude; ->LAY_abo_LocationExclude)
	LB_SetColumnHeadersByObjectName("oStockLocs"; "LOC_L"; 1; "Location"; "Code"; "Include"; "Exclude")
	LB_SetEnterablebyObjectName("oStockLocs"; False:C215; 0)
	LB_SetEnterablebyObjectName("oStockLocs"; True:C214; 3)
	LB_SetEnterablebyObjectName("oStockLocs"; True:C214; 4)
	LB_SetColumnWIdthsByObjectName("oStockLocs"; "LOC_t"; 1; $_l_Longest; 40; 35; 35)
	LB_SetScrollByObjectName("oStockLocs"; -3; -2)
	LB_StyleSettingsByObjectName("oStockLocs"; "Black"; 9; "LOC_t"; ->[PRODUCTS:9])
	LAY_bo_StockLocationsSetup:=True:C214
	$0:=$_l_Longest+40+35+35
End if 
OBJECT GET BEST SIZE:C717(*; "oStockLocsLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
	$_l_MaxLabelWidth:=$_l_BestLabelWidth
End if 

$_l_TotalWidth:=LB_GetTotalColumnWIdths(""; ->LAY_lb_CrdStgCodes)
$0:=$_l_TotalWidth
If ($_bo_SetReturnObjects)
	If (Size of array:C274(DB_at_StockLocNames)>1)  //so we actually only show the area if there are some items in it
		If ($_l_TotalWidth>$_l_MaxLBWidth)
			$_l_MaxLBWidth:=$_l_TotalWidth
		End if 
		$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
		$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(DB_at_StockLocNames)*20)+20
		APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(DB_at_StockLocNames))
		$_Ptr_DisplayThisObject->:=True:C214
		APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Locations")
		$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
		$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
		
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_SetoutfilterLocations"; $_t_OldMethodName)
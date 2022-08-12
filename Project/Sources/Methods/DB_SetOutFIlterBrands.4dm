//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetOutFIlterBrands
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/05/2013 07:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(HED_lb_HedCodes;0)
	//ARRAY BOOLEAN(LAY_abo_BrandsExclude;0)
	//ARRAY BOOLEAN(LAY_abo_BrandsInclude;0)
	//ARRAY BOOLEAN(LAY_lb_BRDCodes;0)
	//ARRAY BOOLEAN(LAY_lb_GPCodes;0)
	//ARRAY TEXT(DB_at_BrandCodes;0)
	//ARRAY TEXT(DB_at_BrandNames;0)
	C_BOOLEAN:C305($_bo_ObjectExists; $_bo_SetReturnObjects; DB_bo_BrandsReady; LAY_bo_pBrandsSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_GetBrands; $_l_Index; $_l_Longest; $_l_Longest2; $_l_MaxLabelWidth; $_l_MaxLBWidth; $_l_ObjectExists)
	C_LONGINT:C283($_l_Ref; $_l_TotalWidth; $0; Brand_l_BUT1; Brand_l_But2; Brand_l_BUT3; Brand_l_BUT4; Brand_l_BUT5; Brand_l_BUT6; Brand_l_BUT7; Brand_l_BUT8)
	C_LONGINT:C283(Brand_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $1)
	C_POINTER:C301($10; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_Label; $_t_OldMethodName; Area_Brand_t_HED7; Brand_t_COL1; Brand_t_COL2; Brand_t_COL3; Brand_t_COL4; Brand_t_COL5; Brand_t_COL6; Brand_t_COL7; Brand_t_COL8)
	C_TEXT:C284(Brand_t_COL9; Brand_t_HED1; Brand_t_HED2; Brand_t_HED3; Brand_t_HED4; Brand_t_HED5; Brand_t_HED6; Brand_t_HED8; Brand_t_HED9; dbFilterText)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_SetOutFIlterBrands")
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
	
	$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Brands")  //this is not the name of the on screen object just a reference for this method
	If ($_l_ObjectExists<0)
		APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
		APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Brands")
		APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oBrand")
	End if 
	/////
	$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oBrand")
	If ($_l_Ref>0)
		$_bo_ObjectExists:=$_ptr_ObjectExists->{$_l_Ref}
		
	Else 
		$_bo_ObjectExists:=False:C215
	End if 
Else 
	$_l_Ref:=-1
	$_bo_ObjectExists:=False:C215
End if 
If (Not:C34(LAY_bo_pBrandsSetup))
	If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
		OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oBrand"; ->HED_lb_HedCodes)
		OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oBrandLabel")
		$_t_Label:="Brands :"
		If (Position:C15(":"; $_t_Label)=0)
			$_t_Label:=$_t_Label+" :"
		End if 
		OBJECT SET TITLE:C194(*; "oBrandLabel"; $_t_Label)
	End if 
	
	
	DB_bo_BrandsReady:=False:C215
	ARRAY TEXT:C222(DB_at_BrandNames; 0)
	ARRAY TEXT:C222(DB_at_BrandCodes; 0)
	$_l_GetBrands:=New process:C317("DB_GetBrands"; 128000; "Get Data"; Current process:C322)
	While (Not:C34(DB_bo_BrandsReady))
		DelayTicks(2)
	End while 
	SORT ARRAY:C229(DB_at_BrandNames; DB_at_BrandCodes)
	If (Size of array:C274(DB_at_BrandNames)>0)
		INSERT IN ARRAY:C227(DB_at_BrandNames; 1; 1)
		INSERT IN ARRAY:C227(DB_at_BrandCodes; 1; 1)
		DB_at_BrandCodes{1}:=""
		DB_at_BrandNames{1}:="No Brand Set"
	End if 
	ARRAY BOOLEAN:C223(LAY_abo_BrandsInclude; 0)
	ARRAY BOOLEAN:C223(LAY_abo_BrandsExclude; 0)
	
	ARRAY BOOLEAN:C223(LAY_abo_BrandsInclude; Size of array:C274(DB_at_BrandNames))
	ARRAY BOOLEAN:C223(LAY_abo_BrandsExclude; Size of array:C274(DB_at_BrandNames))
	For ($_l_Index; 1; Size of array:C274(LAY_abo_BrandsInclude))
		LAY_abo_BrandsInclude{$_l_Index}:=True:C214
	End for 
	$_l_Longest:=0
	$_l_Longest2:=0
	For ($_l_Index; 1; Size of array:C274(DB_at_BrandNames))
		dbFilterText:=DB_at_BrandNames{$_l_Index}
		OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestWidth)
		If ($_l_BestWidth>$_l_Longest)
			$_l_Longest:=$_l_BestWidth
		End if 
		dbFilterText:=DB_at_BrandCodes{$_l_Index}
		OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
		If ($_l_BestWidth>$_l_Longest2)
			$_l_Longest2:=$_l_BestWidth
		End if 
	End for 
	$_l_Longest:=$_l_Longest+2
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
	LB_SetupListboxByObjectName("oBrand"; "Brand_t"; "Brand_L"; 1; ->DB_at_BrandNames; ->DB_at_BrandCodes; ->LAY_abo_BrandsInclude; ->LAY_abo_BrandsExclude)
	LB_SetColumnHeadersByObjectName("oBrand"; "Brand_L"; 1; "Brand"; "Code"; "Include"; "Exclude")
	LB_SetEnterablebyObjectName("oBrand"; False:C215; 0)
	LB_SetEnterablebyObjectName("oBrand"; True:C214; 3)
	LB_SetEnterablebyObjectName("oBrand"; True:C214; 4)
	LB_SetColumnWIdthsByObjectName("oBrand"; "Brand_t"; 1; $_l_Longest; $_l_Longest2; 35; 35)
	LB_SetScrollByObjectName("oBrand"; -3; -2)
	LB_StyleSettingsByObjectName("oBrand"; "Black"; 9; "Brand_t"; ->[PRODUCTS:9])
	$0:=$_l_Longest2+$_l_Longest+35+35
	LAY_bo_pBrandsSetup:=True:C214
End if 
OBJECT GET BEST SIZE:C717(*; "oBrandLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
	$_l_MaxLabelWidth:=$_l_BestLabelWidth
End if 

$_l_TotalWidth:=LB_GetTotalColumnWIdths(""; ->LAY_lb_BRDCodes)
$0:=$_l_TotalWidth
If ($_bo_SetReturnObjects)
	If (Size of array:C274(DB_at_BrandNames)>1)  //so we actually only show the area if there are some items in it
		If ($_l_TotalWidth>$_l_MaxLBWidth)
			$_l_MaxLBWidth:=$_l_TotalWidth
		End if 
		$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
		$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(DB_at_BrandNames)*20)+20
		APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(DB_at_BrandNames))
		$_Ptr_DisplayThisObject->:=True:C214
		APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Brands")
		$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
		$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_SetOutFIlterBrands"; $_t_OldMethodName)
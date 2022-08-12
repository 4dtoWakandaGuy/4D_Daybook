//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_setOutFilterCollections
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/05/2013 07:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(LAY_abo_CollectionsExclude;0)
	//ARRAY BOOLEAN(LAY_abo_CollectionsInclude;0)
	//ARRAY BOOLEAN(LAY_lb_CATCodes;0)
	//ARRAY LONGINT(DB_al_CollectionIDS;0)
	//ARRAY TEXT(DB_at_CollectionNames;0)
	C_BOOLEAN:C305($_bo_ObjectExists; $_bo_SetReturnObjects; DB_bo_CollectionsReady; LAY_bo_pCollectionsSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_GetCollections; $_l_Index; $_l_Longest; $_l_Longest2; $_l_MaxLabelWidth; $_l_MaxLBWidth; $_l_ObjectExists)
	C_LONGINT:C283($_l_Ref; $_l_TotalWidth; $0; Col_l_BUT1; Col_l_But2; Col_l_BUT3; Col_l_BUT4; Col_l_BUT5; Col_l_BUT6; Col_l_BUT7; Col_l_BUT8)
	C_LONGINT:C283(Col_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $1)
	C_POINTER:C301($10; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_Label; $_t_OldMethodName; Area_Col_t_HED7; Col_t_COL1; Col_t_COL2; Col_t_COL3; Col_t_COL4; Col_t_COL5; Col_t_COL6; Col_t_COL7; Col_t_COL8)
	C_TEXT:C284(Col_t_COL9; Col_t_HED1; Col_t_HED2; Col_t_HED3; Col_t_HED4; Col_t_HED5; Col_t_HED6; Col_t_HED8; Col_t_HED9; dbFilterText)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_setOutFilterCollections")
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
	
	$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Collections")  //this is not the name of the on screen object just a reference for this method
	If ($_l_ObjectExists<0)
		APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
		APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Collections")
		APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oCollection")
	End if 
	/////
	$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oCollection")
	If ($_l_Ref>0)
		$_bo_ObjectExists:=$_ptr_ObjectExists->{$_l_Ref}
		
	Else 
		$_bo_ObjectExists:=False:C215
	End if 
Else 
	$_l_Ref:=-1
	$_bo_ObjectExists:=False:C215
End if 

If (Not:C34(LAY_bo_pCollectionsSetup))
	If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
		OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oCollection"; ->LAY_lb_CATCodes)
		OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oCollectionLabel")
		$_t_Label:="Collections :"
		If (Position:C15(":"; $_t_Label)=0)
			$_t_Label:=$_t_Label+" :"
		End if 
		OBJECT SET TITLE:C194(*; "oCollectionLabel"; $_t_Label)
	End if 
	DB_bo_CollectionsReady:=False:C215
	ARRAY TEXT:C222(DB_at_CollectionNames; 0)
	ARRAY LONGINT:C221(DB_al_CollectionIDS; 0)
	$_l_GetCollections:=New process:C317("DB_GetCollections"; 128000; "Get Data"; Current process:C322)
	While (Not:C34(DB_bo_CollectionsReady))
		DelayTicks(2)
	End while 
	SORT ARRAY:C229(DB_at_CollectionNames; DB_al_CollectionIDS)
	ARRAY BOOLEAN:C223(LAY_abo_CollectionsInclude; 0)
	ARRAY BOOLEAN:C223(LAY_abo_CollectionsExclude; 0)
	ARRAY BOOLEAN:C223(LAY_abo_CollectionsInclude; Size of array:C274(DB_at_CollectionNames))
	ARRAY BOOLEAN:C223(LAY_abo_CollectionsExclude; Size of array:C274(DB_at_CollectionNames))
	For ($_l_Index; 1; Size of array:C274(DB_at_CollectionNames))
		LAY_abo_CollectionsInclude{$_l_Index}:=True:C214
	End for 
	
	$_l_Longest:=0
	$_l_Longest2:=0
	For ($_l_Index; 1; Size of array:C274(DB_at_CollectionNames))
		dbFilterText:=DB_at_CollectionNames{$_l_Index}
		OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
		If ($_l_BestWidth>$_l_Longest)
			$_l_Longest:=$_l_BestWidth
		End if 
		dbFilterText:=String:C10(DB_al_CollectionIDS{$_l_Index})
		OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
		If ($_l_BestWidth>$_l_Longest2)
			$_l_Longest2:=$_l_BestWidth
		End if 
	End for 
	$_l_Longest:=$_l_Longest+2
	$_l_Longest2:=$_l_Longest2+2
	Case of 
		: ($_l_Longest>(118+40))
			$_l_Longest:=(118+40)
		: ($_l_Longest<(60))
			$_l_Longest:=(60)
	End case 
	
	LB_SetupListboxByObjectName("oCollection"; "Col_t"; "Col_L"; 1; ->DB_at_CollectionNames; ->DB_al_CollectionIDS; ->LAY_abo_CollectionsInclude; ->LAY_abo_CollectionsExclude)
	LB_SetColumnHeadersByObjectName("oCollection"; "Col_L"; 1; "Collection"; "Code"; "Include"; "Exclude")
	LB_SetEnterablebyObjectName("oCollection"; False:C215; 0)
	LB_SetEnterablebyObjectName("oCollection"; True:C214; 3)
	LB_SetEnterablebyObjectName("oCollection"; True:C214; 4)
	LB_SetColumnWIdthsByObjectName("oCollection"; "Col_t"; 1; $_l_Longest; 0; 35; 35)
	LB_SetScrollByObjectName("oCollection"; -3; -2)
	LB_StyleSettingsByObjectName("oCollection"; "Black"; 9; "Col_t"; ->[PRODUCTS:9])
	
	LAY_bo_pCollectionsSetup:=True:C214
	$0:=$_l_Longest+35+35
End if 
OBJECT GET BEST SIZE:C717(*; "oCollectionLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
	$_l_MaxLabelWidth:=$_l_BestLabelWidth
End if 
$_l_TotalWidth:=LB_GetTotalColumnWIdths("oCollection")
$0:=$_l_TotalWidth
If ($_bo_SetReturnObjects)
	If (Size of array:C274(DB_at_CollectionNames)>1)  //so we actually only show the area if there are some items in it
		If ($_l_TotalWidth>$_l_MaxLBWidth)
			$_l_MaxLBWidth:=$_l_TotalWidth
		End if 
		$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
		$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(DB_at_CollectionNames)*20)+20
		APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(DB_at_CollectionNames))
		$_Ptr_DisplayThisObject->:=True:C214
		APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Collections")
		$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
		$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_setOutFilterCollections"; $_t_OldMethodName)
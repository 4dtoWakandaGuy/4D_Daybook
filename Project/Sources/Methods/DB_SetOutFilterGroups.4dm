//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetOutFilterGroups
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/05/2013 07:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(HED_lb_HedCodes;0)
	//ARRAY BOOLEAN(LAY_abo_GroupsExclude;0)
	//ARRAY BOOLEAN(LAY_abo_GroupsInclude;0)
	//ARRAY BOOLEAN(LAY_lb_GPCodes;0)
	//ARRAY TEXT(DB_at_GroupCodes;0)
	//ARRAY TEXT(DB_at_GroupNames;0)
	C_BOOLEAN:C305($_bo_ObjectExists; $_bo_SetReturnObjects; DB_bo_GroupsReady; LAY_bo_pGroupsSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_GetGroups; $_l_Index; $_l_Longest; $_l_Longest2; $_l_MaxLabelWidth; $_l_MaxLBWidth; $_l_ObjectExists)
	C_LONGINT:C283($_l_Ref; $_l_TotalWidth; $0; Group_l_BUT1; Group_l_But2; Group_l_BUT3; Group_l_BUT4; Group_l_BUT5; Group_l_BUT6; Group_l_BUT7; Group_l_BUT8)
	C_LONGINT:C283(Group_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $1)
	C_POINTER:C301($10; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_Label; $_t_OldMethodName; Area_Group_t_HED7; dbFilterText; Group_t_COL1; Group_t_COL2; Group_t_COL3; Group_t_COL4; Group_t_COL5; Group_t_COL6; Group_t_COL7)
	C_TEXT:C284(Group_t_COL8; Group_t_COL9; Group_t_HED1; Group_t_HED2; Group_t_HED3; Group_t_HED4; Group_t_HED5; Group_t_HED6; Group_t_HED8; Group_t_HED9)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_SetOutFilterGroups")
If (Count parameters:C259>=9)
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
	
	$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Product Groups")  //this is not the name of the on screen object just a reference for this method
	If ($_l_ObjectExists<0)
		APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
		APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Product Groups")
		APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oGroup")
	End if 
	/////
	$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oGroup")
	If ($_l_Ref>0)
		$_bo_ObjectExists:=$_ptr_ObjectExists->{$_l_Ref}
		
	Else 
		$_bo_ObjectExists:=False:C215
	End if 
Else 
	$_l_Ref:=-1
	$_bo_ObjectExists:=False:C215
End if 

If (Not:C34(LAY_bo_pGroupsSetup))
	If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
		ARRAY BOOLEAN:C223(LAY_lb_GPCodes; 0)
		OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oGroup"; ->LAY_lb_GPCodes)
		OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oGroupLabel")
		$_t_Label:="Groups :"
		If (Position:C15(":"; $_t_Label)=0)
			$_t_Label:=$_t_Label+" :"
		End if 
		OBJECT SET TITLE:C194(*; "oGroupLabel"; $_t_Label)
	End if 
	DB_bo_GroupsReady:=False:C215
	ARRAY TEXT:C222(DB_at_GroupNames; 0)
	ARRAY TEXT:C222(DB_at_GroupCodes; 0)
	$_l_GetGroups:=New process:C317("DB_GetGroups"; 128000; "Get Data"; Current process:C322)
	While (Not:C34(DB_bo_GroupsReady))
		DelayTicks(2)
	End while 
	SORT ARRAY:C229(DB_at_GroupNames; DB_at_GroupCodes)
	If (Size of array:C274(DB_at_GroupNames)>0)
		INSERT IN ARRAY:C227(DB_at_GroupNames; 1; 1)
		INSERT IN ARRAY:C227(DB_at_GroupCodes; 1; 1)
		DB_at_GroupCodes{1}:=""
		DB_at_GroupNames{1}:="No Group Set"
	End if 
	ARRAY BOOLEAN:C223(LAY_abo_GroupsInclude; 0)
	ARRAY BOOLEAN:C223(LAY_abo_GroupsExclude; 0)
	ARRAY BOOLEAN:C223(LAY_abo_GroupsInclude; Size of array:C274(DB_at_GroupNames))
	ARRAY BOOLEAN:C223(LAY_abo_GroupsExclude; Size of array:C274(DB_at_GroupNames))
	For ($_l_Index; 1; Size of array:C274(LAY_abo_GroupsInclude))
		LAY_abo_GroupsInclude{$_l_Index}:=True:C214
	End for 
	$_l_Longest:=0
	$_l_Longest2:=0
	For ($_l_Index; 1; Size of array:C274(DB_at_GroupNames))
		dbFilterText:=DB_at_GroupNames{$_l_Index}
		OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
		If ($_l_BestWidth>$_l_Longest)
			$_l_Longest:=$_l_BestWidth
		End if 
		dbFilterText:=DB_at_GroupCodes{$_l_Index}
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
	LB_SetupListboxByObjectName("oGroup"; "Group_t"; "Group_L"; 1; ->DB_at_GroupNames; ->DB_at_GroupCodes; ->LAY_abo_GroupsInclude; ->LAY_abo_GroupsExclude)
	LB_SetColumnHeadersByObjectName("oGroup"; "Group_L"; 1; "Group"; "Code"; "Include"; "Exclude")
	LB_SetEnterablebyObjectName("oGroup"; False:C215; 0)
	LB_SetEnterablebyObjectName("oGroup"; True:C214; 3)
	LB_SetEnterablebyObjectName("oGroup"; True:C214; 4)
	LB_SetColumnWIdthsByObjectName("oGroup"; "Group_t"; 1; $_l_Longest; $_l_Longest2; 35; 35)
	LB_SetScrollByObjectName("oGroup"; -3; -2)
	LB_StyleSettingsByObjectName("oGroup"; "Black"; 9; "Group_t"; ->[PRODUCTS:9])
	
	LAY_bo_pGroupsSetup:=True:C214
	
End if 

OBJECT GET BEST SIZE:C717(*; "oGroupLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
	$_l_MaxLabelWidth:=$_l_BestLabelWidth
End if 
LB_StyleSettingsByObjectName("oGroup"; "Black"; 9; "Group_t"; ->[PRODUCTS:9])
$_l_TotalWidth:=LB_GetTotalColumnWIdths("oGroup")
$0:=$_l_TotalWidth
If ($_bo_SetReturnObjects)
	If (Size of array:C274(DB_at_GroupNames)>1)  //so we actually only show the area if there are some items in it
		If ($_l_TotalWidth>$_l_MaxLBWidth)
			$_l_MaxLBWidth:=$_l_TotalWidth
		End if 
		$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
		$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(DB_at_GroupNames)*20)+20
		APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(DB_at_GroupNames))
		$_Ptr_DisplayThisObject->:=True:C214
		APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Product Groups")
		$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
		$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_SetOutFilterGroups"; $_t_OldMethodName)
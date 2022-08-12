//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_SetOutFilterContractTypes
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
	//ARRAY BOOLEAN(LAY_abo_ContrTypeExclude;0)
	//ARRAY BOOLEAN(LAY_abo_ContrTypeInclude;0)
	//ARRAY BOOLEAN(LAY_lb_ConttCodes;0)
	//ARRAY TEXT(DB_at_ContractTypesCodes;0)
	//ARRAY TEXT(DB_at_ContractTypesNames;0)
	C_BOOLEAN:C305($_bo_ObjectExists; $_bo_SetReturnObjects; DB_bo_ContractTypesReady; LAY_bo_ContractTypesSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_GetContractTypes; $_l_Index; $_l_Longest; $_l_Longest2; $_l_MaxLabelWidth; $_l_MaxLBWidth; $_l_ObjectExists)
	C_LONGINT:C283($_l_Ref; $_l_TotalWidth; $0; Cont_l_BUT1; Cont_l_But2; Cont_l_BUT3; Cont_l_BUT4; Cont_l_BUT5; Cont_l_BUT6; Cont_l_BUT7; Cont_l_BUT8)
	C_LONGINT:C283(Cont_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $1)
	C_POINTER:C301($10; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_Label; $_t_OldMethodName; Cont_t_COL1; Cont_t_COL2; Cont_t_COL3; Cont_t_COL4; Cont_t_COL5; Cont_t_COL6; Cont_t_COL7; Cont_t_COL8; Cont_t_COL9)
	C_TEXT:C284(Cont_t_HED1; Cont_t_HED2; Cont_t_HED3; Cont_t_HED4; Cont_t_HED5; Cont_t_HED6; Cont_t_HED7; Cont_t_HED8; Cont_t_HED9; dbFilterText)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_SetOutFilterContractTypes")
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
	
	$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Contract Types")  //this is not the name of the on screen object just a reference for this method
	If ($_l_ObjectExists<0)
		APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
		APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Contract Types")
		APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oContrTypes")
	End if 
	/////
	$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oContrTypes")
	If ($_l_Ref>0)
		$_bo_ObjectExists:=$_ptr_ObjectExists->{$_l_Ref}
		
	Else 
		$_bo_ObjectExists:=False:C215
	End if 
Else 
	$_l_Ref:=-1
	$_bo_ObjectExists:=False:C215
End if 


If (Not:C34(LAY_bo_ContractTypesSetup))
	If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
		ARRAY BOOLEAN:C223(LAY_lb_ConttCodes; 0)
		OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oContrTypes"; ->LAY_lb_ConttCodes)
		OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oContrTypesLabel")
		$_t_Label:="Contract Types :"
		If (Position:C15(":"; $_t_Label)=0)
			$_t_Label:=$_t_Label+" :"
		End if 
		OBJECT SET TITLE:C194(*; "oContrTypes"; $_t_Label)
	End if 
	DB_bo_ContractTypesReady:=False:C215
	ARRAY TEXT:C222(DB_at_ContractTypesNames; 0)
	ARRAY TEXT:C222(DB_at_ContractTypesCodes; 0)
	$_l_GetContractTypes:=New process:C317("DB_GetContractTypes"; 128000; "Get ContractTypes"; Current process:C322)
	While (Not:C34(DB_bo_ContractTypesReady))
		DelayTicks(2)
	End while 
	
	
	SORT ARRAY:C229(DB_at_ContractTypesNames; DB_at_ContractTypesCodes)
	ARRAY BOOLEAN:C223(LAY_abo_ContrTypeInclude; 0)
	ARRAY BOOLEAN:C223(LAY_abo_ContrTypeExclude; 0)
	ARRAY BOOLEAN:C223(LAY_abo_ContrTypeInclude; Size of array:C274(DB_at_ContractTypesNames))
	ARRAY BOOLEAN:C223(LAY_abo_ContrTypeExclude; Size of array:C274(DB_at_ContractTypesNames))
	For ($_l_Index; 1; Size of array:C274(LAY_abo_ContrTypeInclude))
		LAY_abo_ContrTypeInclude{$_l_Index}:=True:C214
	End for 
	
	$_l_Longest:=0
	$_l_Longest2:=0
	For ($_l_Index; 1; Size of array:C274(DB_at_ContractTypesNames))
		dbFilterText:=DB_at_ContractTypesNames{$_l_Index}
		OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
		If ($_l_BestWidth>$_l_Longest)
			$_l_Longest:=$_l_BestWidth
		End if 
		dbFilterText:=DB_at_ContractTypesNames{$_l_Index}
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
	LB_SetupListboxByObjectName("oContrTypes"; "Cont_t"; "Cont_L"; 1; ->DB_at_ContractTypesNames; ->DB_at_ContractTypesCodes; ->LAY_abo_ContrTypeInclude; ->LAY_abo_ContrTypeExclude)
	LB_SetColumnHeadersByObjectName("oContrTypes"; "Cont_L"; 1; "Name"; "ID"; "Include"; "Exclude")
	LB_SetEnterablebyObjectName("oContrTypes"; False:C215; 0)
	LB_SetEnterablebyObjectName("oContrTypes"; True:C214; 3)
	LB_SetEnterablebyObjectName("oContrTypes"; True:C214; 4)
	LB_SetColumnWIdthsByObjectName("oContrTypes"; "Cont_t"; 1; $_l_Longest; $_l_Longest2; 35; 35)
	LB_SetScrollByObjectName("oContrTypes"; -3; -2)
	LB_StyleSettingsByObjectName("oContrTypes"; "Black"; 9; "Cont_t"; ->[CONTRACTS:17])
	LAY_bo_ContractTypesSetup:=True:C214
	$0:=$_l_Longest2+$_l_Longest+35+35
End if 
OBJECT GET BEST SIZE:C717(*; "oContrTypesLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
	$_l_MaxLabelWidth:=$_l_BestLabelWidth
End if 
$_l_TotalWidth:=LB_GetTotalColumnWIdths(""; ->LAY_lb_ConttCodes)
$0:=$_l_TotalWidth



If ($_bo_SetReturnObjects)
	If (Size of array:C274(DB_at_ContractTypesNames)>1)  //so we actually only show the area if there are some items in it
		If ($_l_TotalWidth>$_l_MaxLBWidth)
			$_l_MaxLBWidth:=$_l_TotalWidth
		End if 
		$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
		$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(DB_at_ContractTypesNames)*20)+20
		APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(DB_at_ContractTypesNames))
		$_Ptr_DisplayThisObject->:=True:C214
		APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Contract Types")
		$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
		$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_SetOutFilterContractTypes"; $_t_OldMethodName)
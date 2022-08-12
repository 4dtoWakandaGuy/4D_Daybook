//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetOutFilterRecordStates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/05/2013 12:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(LAY_abo_StatesExclude;0)
	//ARRAY BOOLEAN(LAY_abo_StatesInclude;0)
	//ARRAY BOOLEAN(LAY_lb_LayerCodes;0)
	//ARRAY BOOLEAN(LAY_lb_sttCodes;0)
	//ARRAY TEXT(DB_at_StatesCodes;0)
	//ARRAY TEXT(DB_at_StatesNames;0)
	C_BOOLEAN:C305($_bo_ObjectExists; $_bo_SetReturnObjects; $_bo_StatesSetup; DB_bo_StatesReady; LAY_bo_OrdStatesSetup; LAY_bo_POStatesSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_GetStates; $_l_Index; $_l_Longest; $_l_Longest2; $_l_MaxLabelWidth; $_l_MaxLBWidth; $_l_ObjectExists)
	C_LONGINT:C283($_l_Ref; $_l_TotalWidth; $0; State_l_BUT1; State_l_But2; State_l_BUT3; State_l_BUT4; State_l_BUT5; State_l_BUT6; State_l_BUT7; State_l_BUT8)
	C_LONGINT:C283(State_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $_Ptr_TableForStyle)
	C_POINTER:C301($1; $10; $11; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_Label; $_t_LabelPrefix; $_t_OldMethodName; dbFilterText; State_t_COL1; State_t_COL2; State_t_COL3; State_t_COL4; State_t_COL5; State_t_COL6; State_t_COL7)
	C_TEXT:C284(State_t_COL8; State_t_COL9; State_t_HED1; State_t_HED2; State_t_HED3; State_t_HED4; State_t_HED5; State_t_HED6; State_t_HED7; State_t_HED8; State_t_HED9)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_SetOutFilterRecordStates")
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
		
		$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Record States")  //this is not the name of the on screen object just a reference for this method
		If ($_l_ObjectExists<0)
			APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
			APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Record States")
			APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oStates")
		End if 
		/////
		$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oStates")
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
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ORDERS:24]))
			$_bo_StatesSetup:=LAY_bo_OrdStatesSetup
			$_t_LabelPrefix:="Order "
		: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_ORDERS:57]))
			$_bo_StatesSetup:=LAY_bo_POStatesSetup
			$_t_LabelPrefix:="Purchase Order "
	End case 
	
	If (Not:C34($_bo_StatesSetup))
		If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
			ARRAY BOOLEAN:C223(LAY_lb_sttCodes; 0)
			OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oStates"; ->LAY_lb_sttCodes)
			OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oStatesLabel")
			$_t_Label:=$_t_LabelPrefix+"State :"
			If (Position:C15(":"; $_t_Label)=0)
				$_t_Label:=$_t_Label+" :"
			End if 
			OBJECT SET TITLE:C194(*; "oStatesLabel"; $_t_Label)
		End if 
		
		DB_bo_StatesReady:=False:C215
		ARRAY TEXT:C222(DB_at_StatesNames; 0)
		ARRAY TEXT:C222(DB_at_StatesCodes; 0)
		$_l_GetStates:=New process:C317("DB_GetStates"; 128000; "Get Data"; Current process:C322; Table:C252($_Ptr_TableForStyle))
		While (Not:C34(DB_bo_StatesReady))
			DelayTicks(2)
		End while 
		//SORT ARRAY(DB_at_StatesCodes;DB_at_StatesNames)
		ARRAY BOOLEAN:C223(LAY_abo_StatesInclude; 0)
		ARRAY BOOLEAN:C223(LAY_abo_StatesExclude; 0)
		ARRAY BOOLEAN:C223(LAY_abo_StatesInclude; Size of array:C274(DB_at_StatesNames))
		ARRAY BOOLEAN:C223(LAY_abo_StatesExclude; Size of array:C274(DB_at_StatesNames))
		For ($_l_Index; 1; Size of array:C274(LAY_abo_StatesInclude))
			LAY_abo_StatesInclude{$_l_Index}:=True:C214
		End for 
		$_l_Longest:=0
		$_l_Longest2:=0
		For ($_l_Index; 1; Size of array:C274(DB_at_StatesNames))
			dbFilterText:=DB_at_StatesNames{$_l_Index}
			OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_Longest)
				$_l_Longest:=$_l_BestWidth
			End if 
			dbFilterText:=DB_at_StatesCodes{$_l_Index}
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
		LB_SetupListboxByObjectName("oStates"; "State_t"; "State_L"; 1; ->DB_at_StatesNames; ->DB_at_StatesCodes; ->LAY_abo_StatesInclude; ->LAY_abo_StatesExclude)
		LB_SetColumnHeadersByObjectName("oStates"; "State_L"; 1; "Status"; "Code"; "Include"; "Exclude")
		LB_SetEnterablebyObjectName("oStates"; False:C215; 0)
		LB_SetEnterablebyObjectName("oStates"; True:C214; 3)
		LB_SetEnterablebyObjectName("oStates"; True:C214; 4)
		LB_SetColumnWIdthsByObjectName("oStates"; "State_t"; 1; $_l_Longest; $_l_Longest2; 35; 35)
		LB_SetScroll(->LAY_lb_sttCodes; -3; -2)
		
		LB_StyleSettingsByObjectName("oStates"; "Black"; 9; "State_t"; $_Ptr_TableForStyle)
		LAY_bo_POStatesSetup:=False:C215
		LAY_bo_OrdStatesSetup:=False:C215
		Case of 
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[ORDERS:24]))
				LAY_bo_OrdStatesSetup:=True:C214
			: (Table:C252($_Ptr_TableForStyle)=Table:C252(->[PURCHASE_ORDERS:57]))
				LAY_bo_POStatesSetup:=True:C214
		End case 
		//$0:=$_l_Longest+$_l_Longest2+35+35
	End if 
	OBJECT GET BEST SIZE:C717(*; "oStatesLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
	If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
		$_l_MaxLabelWidth:=$_l_BestLabelWidth
	End if 
	
	$_l_TotalWidth:=LB_GetTotalColumnWIdths("oStates")
	$0:=$_l_TotalWidth
	If ($_bo_SetReturnObjects)
		If (Size of array:C274(DB_at_StatesCodes)>1)  //so we actually only show the area if there are some items in it
			If ($_l_TotalWidth>$_l_MaxLBWidth)
				$_l_MaxLBWidth:=$_l_TotalWidth
			End if 
			$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
			$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(DB_at_StatesCodes)*20)+20
			APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(DB_at_StatesCodes))
			$_Ptr_DisplayThisObject->:=True:C214
			APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Record States")
			$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
			$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
			
		End if 
	End if 
	
	
	
End if 
ERR_MethodTrackerReturn("DB_SetOutFilterRecordStates"; $_t_OldMethodName)
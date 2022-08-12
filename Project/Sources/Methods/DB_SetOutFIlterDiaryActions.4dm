//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_SetOutFIlterDiaryActions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  23/01/2020
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(dbFilterText)
	ARRAY BOOLEAN:C223($_abo_HeaderVars; 0)
	//ARRAY BOOLEAN(LAY_ab_ActionExclude;0)
	//ARRAY BOOLEAN(LAY_ab_ActionInclude;0)
	//ARRAY BOOLEAN(LAY_ab_Actionnclude;0)
	//ARRAY BOOLEAN(LAY_lb_ActionCodes;0)
	//ARRAY BOOLEAN(LAY_lb_SPCodes;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVars; 0)
	ARRAY POINTER:C280($_aptr_HeaderVars; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY TEXT:C222($_at_ActionCodes; 0)
	ARRAY TEXT:C222($_at_ActionNames; 0)
	//ARRAY TEXT(DB_at_ActionCodes;0)
	//ARRAY TEXT(DB_at_ActionNames;0)
	//ARRAY TEXT(LAY_at_ActionCodes;0)
	//ARRAY TEXT(LAY_at_ActionNames;0)
	//ARRAY TEXT(LAY_at_SPName;0)
	C_BOOLEAN:C305($_bo_ObjectExists; $_bo_SetReturnObjects; DB_bo_ActionsReady; LAY_bo_ActionsSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_BlankPosition; $_l_GetActions; $_l_GetSalesPersions; $_l_Index; $_l_Longest; $_l_Longest2; $_l_MaxLabelWidth)
	C_LONGINT:C283($_l_MaxLBWidth; $_l_ObjectExists; $_l_Ref; $_l_TableNumber; $_l_TotalWidth; $0)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $_Ptr_TableForStyle)
	C_POINTER:C301($1; $10; $11; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_SetOutFIlterDiaryActions")
If (Count parameters:C259>=1)
	$_Ptr_TableForStyle:=$1
	$_l_TableNumber:=Table:C252($1)
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
		$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Actions")  //this is not the name of the on screen object just a reference for this method
		If ($_l_ObjectExists<0)
			APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
			
			APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Actions")
			
			APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oActions")
		End if 
		/////
		$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oActions")
		If ($_l_Ref>0)
			$_bo_ObjectExists:=$_ptr_ObjectExists->{$_l_Ref}
			
		Else 
			$_bo_ObjectExists:=False:C215
		End if 
	Else 
		$_l_Ref:=-1
		$_bo_ObjectExists:=False:C215
	End if 
	If (Not:C34(LAY_bo_ActionsSetup))
		
		ARRAY BOOLEAN:C223(LAY_lb_ActionCodes; 0)
		
		If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
			ARRAY BOOLEAN:C223(LAY_lb_ActionCodes; 0)
			OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oActions"; ->LAY_lb_ActionCodes)
			OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oActionsLabel")
			
			OBJECT SET TITLE:C194(*; "oActionsLabel"; "Actions :")
		End if 
		
		
		//$_ptr_VarName:=OBJECT Get data source(*;"oSalesPerson")
		
		//oWASSalesPersonLabel
		CREATE SET:C116([ACTIONS:13]; "$Temp")
		ALL RECORDS:C47([ACTIONS:13])
		ARRAY TEXT:C222($_at_ActionCodes; 0)
		ARRAY TEXT:C222($_at_ActionNames; 0)
		SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_ActionCodes; [ACTIONS:13]Action_Name:2; $_at_ActionNames)
		$_l_BlankPosition:=Find in array:C230($_at_ActionCodes; "")
		If ($_l_BlankPosition>0)
			DELETE FROM ARRAY:C228($_at_ActionCodes; $_l_BlankPosition)
			DELETE FROM ARRAY:C228($_at_ActionNames; $_l_BlankPosition)
		End if 
		
		DB_bo_ActionsReady:=False:C215
		ARRAY TEXT:C222(DB_at_ActionCodes; 0)
		//ARRAY TEXT(DB_at_ActionNames;0)
		
		//ALERT("SIZE6")
		$_l_GetActions:=New process:C317("DB_GetActionsUsed"; 128000; "Get Diary Actions"; Current process:C322)
		While (Not:C34(DB_bo_ActionsReady))
			DelayTicks(2)
		End while 
		//ALERT("SIZE7")
		ARRAY TEXT:C222(LAY_at_ActionCodes; 0)
		ARRAY TEXT:C222(LAY_at_ActionNames; 0)
		For ($_l_Index; 1; Size of array:C274(DB_at_ActionCodes))
			$_l_BlankPosition:=Find in array:C230($_at_ActionCodes; DB_at_ActionCodes{$_l_Index})
			If ($_l_BlankPosition>0)
				APPEND TO ARRAY:C911(LAY_at_ActionCodes; DB_at_ActionCodes{$_l_Index})
				APPEND TO ARRAY:C911(LAY_at_ActionNames; $_at_ActionNames{$_l_BlankPosition})
			End if 
		End for 
		SORT ARRAY:C229(LAY_at_ActionCodes; LAY_at_ActionNames)
		
		
		
		//ALERT("SIZE8")
		ARRAY BOOLEAN:C223(LAY_ab_ActionInclude; 0)
		ARRAY BOOLEAN:C223(LAY_ab_ActionExclude; 0)
		
		ARRAY BOOLEAN:C223(LAY_ab_ActionInclude; Size of array:C274(LAY_at_ActionCodes))
		ARRAY BOOLEAN:C223(LAY_ab_ActionExclude; Size of array:C274(LAY_at_ActionCodes))
		For ($_l_Index; 1; Size of array:C274(LAY_ab_ActionInclude))
			LAY_ab_ActionInclude{$_l_Index}:=True:C214
		End for 
		LB_SetupListboxByObjectName("oActions"; "action_S55"; "action_L"; 1; ->LAY_at_ActionNames; ->LAY_at_ActionCodes; ->LAY_ab_ActionInclude; ->LAY_ab_ActionExclude)
		//OBJECT GET BEST SIZE(*;"OcsFilterZeros";$_l_BestWidth;$_l_BestHeight)
		$_l_Longest:=0
		$_l_Longest2:=0
		//TRACE
		For ($_l_Index; 1; Size of array:C274(LAY_at_ActionNames))
			dbFilterText:=LAY_at_ActionNames{$_l_Index}
			OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_Longest)
				$_l_Longest:=$_l_BestWidth
			End if 
			dbFilterText:=LAY_at_ActionCodes{$_l_Index}
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
		LB_SetColumnHeadersByObjectName("oActions"; "action_L"; 1; "Action Name"; "Code"; "Inc."; "Exc.")
		LB_SetEnterablebyObjectName("oActions"; False:C215; 0)
		LB_SetEnterablebyObjectName("oActions"; True:C214; 3)
		LB_SetEnterablebyObjectName("oActions"; True:C214; 4)
		LB_SetColumnWIdthsByObjectName("oActions"; "action_S55"; 1; $_l_Longest; $_l_Longest2; 35; 35)
		LB_SetScrollByObjectName("oActions"; -3; -2)
		//oBrand
		$0:=$_l_Longest2+$_l_Longest+35+35
		///
		//
	End if 
	OBJECT GET BEST SIZE:C717(*; "oActionsLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
	If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
		$_l_MaxLabelWidth:=$_l_BestLabelWidth
	End if 
	LB_StyleSettingsByObjectName("oActions"; "Black"; 9; "action_S55"; $1)
	LAY_bo_ActionsSetup:=True:C214
	LISTBOX GET ARRAYS:C832(*; "oActionsLabel"; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVars; $_aptr_HeaderVars; $_abo_HeaderVars; $_aptr_ColumnStyles)
	
	
	$_l_TotalWidth:=LB_GetTotalColumnWIdths("oActions")
	$0:=$_l_TotalWidth
	If ($_bo_SetReturnObjects)
		If (Size of array:C274(LAY_at_ActionNames)>1)  //so we actually only show the area if there are some items in it
			If ($_l_TotalWidth>$_l_MaxLBWidth)
				$_l_MaxLBWidth:=$_l_TotalWidth
			End if 
			$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
			$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(LAY_at_SPName)*20)+20
			APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(LAY_at_SPName))
			$_Ptr_DisplayThisObject->:=True:C214
			APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Actions")
			
			$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
			$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DB_SetOutFIlterDiaryActions"; $_t_oldMethodName)
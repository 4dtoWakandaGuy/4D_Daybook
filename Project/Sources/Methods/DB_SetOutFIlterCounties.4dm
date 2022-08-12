//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_SetOutFIlterCounties
	//------------------ Method Notes ------------------
	//----------------------------------------------------
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
	//------------------ Revision Control ----------------
	//Date Created:  22/08/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_aBo_ColumnsVIsible; 0)
	//ARRAY BOOLEAN(LAY_abo_CountyExclude;0)
	//ARRAY BOOLEAN(LAY_abo_CountyInclude;0)
	//ARRAY BOOLEAN(LAY_lb_CountyCodes;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVars; 0)
	ARRAY POINTER:C280($_aptr_HeaderVars; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(DB_at_CountyNames;0)
	C_BOOLEAN:C305($_bo_ObjectExists; $_bo_SetReturnObjects; DB_bo_CountiesReady; LAY_bo_CountiesSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_GetCounties; $_l_Index; $_l_Longest; $_l_MaxLabelWidth; $_l_MaxLBWidth; $_l_ObjectExists; $_l_Ref)
	C_LONGINT:C283($_l_TotalWidth; $0; CTY_l_BUT1; CTY_l_But2; CTY_l_BUT3; CTY_l_BUT4; CTY_l_BUT5; CTY_l_BUT6; CTY_l_BUT7; CTY_l_BUT8; CTY_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $_Ptr_TableForStyle)
	C_POINTER:C301($1; $10; $11; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284(<>DB_t_CountyLabel; $_t_CountyLabel; $_t_OldMethodName; CTY_t_COL1; CTY_t_COL2; CTY_t_COL3; CTY_t_COL4; CTY_t_COL5; CTY_t_COL6; CTY_t_COL7; CTY_t_COL8)
	C_TEXT:C284(CTY_t_COL9; CTY_t_HED1; CTY_t_HED2; CTY_t_HED3; CTY_t_HED4; CTY_t_HED5; CTY_t_HED6; CTY_t_HED7; CTY_t_HED8; CTY_t_HED9; dbFilterText)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_SetOutFIlterCounties")

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
		$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Counties")  //this is not the name of the on screen object just a reference for this method
		If ($_l_ObjectExists<0)
			APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
			APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Counties")
			APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oCounty")
		End if 
		
		$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oCounty")
		If ($_l_Ref>0)
			$_bo_ObjectExists:=$_ptr_ObjectExists->{$_l_Ref}
			
		Else 
			$_bo_ObjectExists:=False:C215
		End if 
	Else 
		$_l_Ref:=-1
		$_bo_ObjectExists:=False:C215
	End if 
	If (Not:C34(LAY_bo_CountiesSetup))
		If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
			ARRAY BOOLEAN:C223(LAY_lb_CountyCodes; 0)
			OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oCounty"; ->LAY_lb_CountyCodes)
			OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oCountyLabel")
			$_t_CountyLabel:=<>DB_t_CountyLabel
			If (Position:C15(":"; $_t_CountyLabel)=0)
				$_t_CountyLabel:=$_t_CountyLabel+" :"
			End if 
			OBJECT SET TITLE:C194(*; "oCountyLabel"; $_t_CountyLabel)
		End if 
		
		DB_bo_CountiesReady:=False:C215
		ARRAY TEXT:C222(DB_at_CountyNames; 0)
		$_l_GetCounties:=New process:C317("DB_GetCountiesUsed"; 128000; "Get Data"; Current process:C322)
		While (Not:C34(DB_bo_CountiesReady))
			DelayTicks(2)
		End while 
		//ALERT("SIZE14")
		ARRAY BOOLEAN:C223(LAY_abo_CountyInclude; 0)
		ARRAY BOOLEAN:C223(LAY_abo_CountyExclude; 0)
		ARRAY BOOLEAN:C223(LAY_abo_CountyInclude; Size of array:C274(DB_at_CountyNames))
		ARRAY BOOLEAN:C223(LAY_abo_CountyExclude; Size of array:C274(DB_at_CountyNames))
		For ($_l_Index; 1; Size of array:C274(LAY_abo_CountyInclude))
			LAY_abo_CountyInclude{$_l_Index}:=True:C214
		End for 
		LB_SetupListboxByObjectName("oCounty"; "CTY_t"; "CTY_L"; 1; ->DB_at_CountyNames; ->LAY_abo_CountyInclude; ->LAY_abo_CountyExclude)
		$_l_Longest:=0
		For ($_l_Index; 1; Size of array:C274(DB_at_CountyNames))
			dbFilterText:=DB_at_CountyNames{$_l_Index}
			OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_Longest)
				$_l_Longest:=$_l_BestWidth
			End if 
		End for 
		$_l_Longest:=$_l_Longest+2
		Case of 
			: ($_l_Longest>(108))
				$_l_Longest:=(108)
			: ($_l_Longest<(60))
				$_l_Longest:=(60)
		End case 
		$_t_CountyLabel:=<>DB_t_CountyLabel
		LB_SetColumnHeadersByObjectName("oCounty"; "CTY_L"; 1; $_t_CountyLabel; "Inc."; "Exc.")
		LB_SetEnterablebyObjectName("oCounty"; False:C215; 0)
		LB_SetEnterablebyObjectName("oCounty"; True:C214; 2)
		LB_SetEnterablebyObjectName("oCounty"; True:C214; 3)
		LB_SetColumnWIdthsByObjectName("oCounty"; "CTY_t"; 1; $_l_Longest; 35; 35)
		LB_SetScrollByObjectName("oCounty"; -3; -2)
	End if 
	OBJECT GET BEST SIZE:C717(*; "oCountyLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
	If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
		$_l_MaxLabelWidth:=$_l_BestLabelWidth
	End if 
	LB_StyleSettingsByObjectName("oCounty"; "Black"; 9; "CTY_t"; $1)
	LAY_bo_CountiesSetup:=True:C214
	
	$_l_TotalWidth:=LB_GetTotalColumnWIdths("oCounty")
	$0:=$_l_TotalWidth
	If ($_bo_SetReturnObjects)
		If (Size of array:C274(DB_at_CountyNames)>1)  //so we actually only show the area if there are some items in it
			If ($_l_TotalWidth>$_l_MaxLBWidth)
				$_l_MaxLBWidth:=$_l_TotalWidth
			End if 
			$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
			$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(DB_at_CountyNames)*20)+20
			APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(DB_at_CountyNames))
			$_Ptr_DisplayThisObject->:=True:C214
			APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Counties")
			$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
			$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
		End if 
	End if 
Else 
	
	
End if 
ERR_MethodTrackerReturn("DB_SetOutFIlterCounties"; $_t_OldMethodName)
//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_SetOutFIlterDiaryResults
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
	//ARRAY BOOLEAN(LAY_ab_ResultExclude;0)
	//ARRAY BOOLEAN(LAY_ab_ResultInclude;0)
	//ARRAY BOOLEAN(LAY_lb_ResultCodes;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVars; 0)
	ARRAY POINTER:C280($_aptr_HeaderVars; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY TEXT:C222($_at_ResultCodes; 0)
	ARRAY TEXT:C222($_at_ResultNames; 0)
	//ARRAY TEXT(DB_at_ResultCodes;0)
	//ARRAY TEXT(LAY_at_ResultCodes;0)
	//ARRAY TEXT(LAY_at_ResultNames;0)
	//ARRAY TEXT(LAY_at_SPName;0)
	C_BOOLEAN:C305($_bo_ObjectExists; $_bo_SetReturnObjects; DB_bo_ResultsReady; LAY_bo_ResultsSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_BlankPosition; $_l_GetResults; $_l_Index; $_l_Longest; $_l_Longest2; $_l_MaxLabelWidth; $_l_MaxLBWidth)
	C_LONGINT:C283($_l_ObjectExists; $_l_Ref; $_l_TableNumber; $_l_TotalWidth; $0)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $_Ptr_TableForStyle)
	C_POINTER:C301($1; $10; $11; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_SetOutFIlterDiaryResults")
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
		$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Results")  //this is not the name of the on screen object just a reference for this method
		If ($_l_ObjectExists<0)
			APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
			
			APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Results")
			
			APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oResults")
		End if 
		/////
		$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oResults")
		If ($_l_Ref>0)
			$_bo_ObjectExists:=$_ptr_ObjectExists->{$_l_Ref}
			
		Else 
			$_bo_ObjectExists:=False:C215
		End if 
	Else 
		$_l_Ref:=-1
		$_bo_ObjectExists:=False:C215
	End if 
	If (Not:C34(LAY_bo_ResultsSetup))
		
		ARRAY BOOLEAN:C223(LAY_lb_ResultCodes; 0)
		
		If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
			ARRAY BOOLEAN:C223(LAY_lb_ResultCodes; 0)
			OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oResults"; ->LAY_lb_ResultCodes)
			OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oResultsLabel")
			
			OBJECT SET TITLE:C194(*; "oResultsLabel"; "Results :")
		End if 
		
		
		//$_ptr_VarName:=OBJECT Get data source(*;"oSalesPerson")
		
		//oWASSalesPersonLabel
		CREATE SET:C116([RESULTS:14]; "$Temp")
		ALL RECORDS:C47([RESULTS:14])
		ARRAY TEXT:C222($_at_ResultCodes; 0)
		ARRAY TEXT:C222($_at_ResultNames; 0)
		SELECTION TO ARRAY:C260([RESULTS:14]Result_Code:1; $_at_ResultCodes; [RESULTS:14]Result_Name:2; $_at_ResultNames)
		$_l_BlankPosition:=Find in array:C230($_at_ResultCodes; "")
		If ($_l_BlankPosition>0)
			DELETE FROM ARRAY:C228($_at_ResultCodes; $_l_BlankPosition)
			DELETE FROM ARRAY:C228($_at_ResultNames; $_l_BlankPosition)
		End if 
		
		DB_bo_ResultsReady:=False:C215
		ARRAY TEXT:C222(DB_at_ResultCodes; 0)
		//ARRAY TEXT(DB_at_ResultNames;0)
		
		//ALERT("SIZE6")
		$_l_GetResults:=New process:C317("DB_GetResultsUsed"; 128000; "Get Diary Results"; Current process:C322)
		While (Not:C34(DB_bo_ResultsReady))
			DelayTicks(2)
		End while 
		//ALERT("SIZE7")
		ARRAY TEXT:C222(LAY_at_ResultCodes; 0)
		ARRAY TEXT:C222(LAY_at_ResultNames; 0)
		For ($_l_Index; 1; Size of array:C274(DB_at_ResultCodes))
			$_l_BlankPosition:=Find in array:C230($_at_ResultCodes; DB_at_ResultCodes{$_l_Index})
			If ($_l_BlankPosition>0)
				APPEND TO ARRAY:C911(LAY_at_ResultCodes; DB_at_ResultCodes{$_l_Index})
				APPEND TO ARRAY:C911(LAY_at_ResultNames; $_at_ResultNames{$_l_BlankPosition})
			End if 
		End for 
		
		SORT ARRAY:C229(LAY_at_ResultCodes; LAY_at_ResultNames)
		INSERT IN ARRAY:C227(LAY_at_ResultCodes; 1; 1)
		INSERT IN ARRAY:C227(LAY_at_ResultNames; 1; 1)
		LAY_at_ResultNames{1}:="No Result Set"
		
		
		//ALERT("SIZE8")
		ARRAY BOOLEAN:C223(LAY_ab_ResultInclude; 0)
		ARRAY BOOLEAN:C223(LAY_ab_ResultExclude; 0)
		
		ARRAY BOOLEAN:C223(LAY_ab_ResultInclude; Size of array:C274(LAY_at_ResultCodes))
		ARRAY BOOLEAN:C223(LAY_ab_ResultExclude; Size of array:C274(LAY_at_ResultCodes))
		For ($_l_Index; 1; Size of array:C274(LAY_ab_ResultInclude))
			LAY_ab_ResultInclude{$_l_Index}:=True:C214
		End for 
		LB_SetupListboxByObjectName("oResults"; "Result_S55"; "Result_L"; 1; ->LAY_at_ResultNames; ->LAY_at_ResultCodes; ->LAY_ab_ResultInclude; ->LAY_ab_ResultExclude)
		//OBJECT GET BEST SIZE(*;"OcsFilterZeros";$_l_BestWidth;$_l_BestHeight)
		$_l_Longest:=0
		$_l_Longest2:=0
		//TRACE
		For ($_l_Index; 1; Size of array:C274(LAY_at_ResultNames))
			dbFilterText:=LAY_at_ResultNames{$_l_Index}
			OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_Longest)
				$_l_Longest:=$_l_BestWidth
			End if 
			dbFilterText:=LAY_at_ResultCodes{$_l_Index}
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
		LB_SetColumnHeadersByObjectName("oResults"; "Result_L"; 1; "Result Name"; "Code"; "Inc."; "Exc.")
		LB_SetEnterablebyObjectName("oResults"; False:C215; 0)
		LB_SetEnterablebyObjectName("oResults"; True:C214; 3)
		LB_SetEnterablebyObjectName("oResults"; True:C214; 4)
		LB_SetColumnWIdthsByObjectName("oResults"; "Result_S55"; 1; $_l_Longest; $_l_Longest2; 35; 35)
		LB_SetScrollByObjectName("oResults"; -3; -2)
		//oBrand
		$0:=$_l_Longest2+$_l_Longest+35+35
		///
		//
	End if 
	OBJECT GET BEST SIZE:C717(*; "oResultsLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
	If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
		$_l_MaxLabelWidth:=$_l_BestLabelWidth
	End if 
	LB_StyleSettingsByObjectName("oResults"; "Black"; 9; "Result_S55"; $1)
	LAY_bo_ResultsSetup:=True:C214
	LISTBOX GET ARRAYS:C832(*; "oResultsLabel"; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVars; $_aptr_HeaderVars; $_abo_HeaderVars; $_aptr_ColumnStyles)
	
	
	$_l_TotalWidth:=LB_GetTotalColumnWIdths("oResults")
	$0:=$_l_TotalWidth
	If ($_bo_SetReturnObjects)
		If (Size of array:C274(LAY_at_ResultNames)>=1)  //so we actually only show the area if there are some items in it
			If ($_l_TotalWidth>$_l_MaxLBWidth)
				$_l_MaxLBWidth:=$_l_TotalWidth
			End if 
			$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
			$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(LAY_at_SPName)*20)+20
			APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(LAY_at_SPName))
			$_Ptr_DisplayThisObject->:=True:C214
			APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Results")
			
			$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
			$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DB_SetOutFIlterDiaryResults"; $_t_oldMethodName)
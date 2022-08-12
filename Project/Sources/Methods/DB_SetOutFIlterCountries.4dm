//%attributes = {}
If (False:C215)
	//Project Method Name: DB_SetOutFIlterCountries
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 09/05/2013 16:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnVisible; 0)
	//ARRAY BOOLEAN(LAY_abo_CountryExclude;0)
	//ARRAY BOOLEAN(LAY_abo_CountryInclude;0)
	//ARRAY BOOLEAN(LAY_lb_CNCodes;0)
	//ARRAY BOOLEAN(LAY_lb_SPCodes;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aPtr_ColumnVars; 0)
	ARRAY POINTER:C280($_aPtr_HeaderVars; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(DB_at_CountryNames;0)
	//ARRAY TEXT(LAY_at_SPName;0)
	C_BOOLEAN:C305($_bo_ObjectExists; $_bo_SetReturnObjects; LAY_bo_CountriesReady; LAY_bo_CountriesSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_GetCountriesProcess; $_l_Index; $_l_Longest; $_l_MaxLabelWidth; $_l_MaxLBWidth; $_l_ObjectExists; $_l_Ref)
	C_LONGINT:C283($_l_TotalWIdth; $0; $Bottom; $left; $MaxHeight; $MaxPortrait; $MaxRows; $Right; $Top; CTRY_l_BUT1; CTRY_l_But2)
	C_LONGINT:C283(CTRY_l_BUT3; CTRY_l_BUT4; CTRY_l_BUT5; CTRY_l_BUT6; CTRY_l_BUT7; CTRY_l_BUT8; CTRY_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $_Ptr_TableForStyle)
	C_POINTER:C301($1; $10; $11; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_CountryLabel; $_t_OldMethodName; CTRY_t_COL1; CTRY_t_COL2; CTRY_t_COL3; CTRY_t_COL4; CTRY_t_COL5; CTRY_t_COL6; CTRY_t_COL7; CTRY_t_COL8; CTRY_t_COL9)
	C_TEXT:C284(CTRY_t_HED1; CTRY_t_HED2; CTRY_t_HED3; CTRY_t_HED4; CTRY_t_HED5; CTRY_t_HED6; CTRY_t_HED7; CTRY_t_HED8; CTRY_t_HED9; dbFilterText)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_SetOutFIlterCountries")
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
		$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Countries")  //this is not the name of the on screen object just a reference for this method
		If ($_l_ObjectExists<0)
			APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
			APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Countries")
			APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oCountry")
		End if 
		
		
		$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "oCountry")
		If ($_l_Ref>0)
			$_bo_ObjectExists:=$_ptr_ObjectExists->{$_l_Ref}
			
		Else 
			$_bo_ObjectExists:=False:C215
		End if 
	Else 
		$_l_Ref:=-1
		$_bo_ObjectExists:=False:C215
	End if 
	
	If (Not:C34(LAY_bo_CountriesSetup))
		If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
			ARRAY BOOLEAN:C223(LAY_lb_CNCodes; 0)
			OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oCountry"; ->LAY_lb_CNCodes)
			OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oCountryLabel")
			$_t_CountryLabel:=Get localized string:C991("CompanyFieldNames_Country")
			If (Position:C15(":"; $_t_CountryLabel)=0)
				$_t_CountryLabel:=$_t_CountryLabel+" :"
			End if 
			OBJECT SET TITLE:C194(*; "oCountryLabel"; $_t_CountryLabel)
		End if 
		
		LAY_bo_CountriesReady:=False:C215
		ARRAY TEXT:C222(DB_at_CountryNames; 0)
		$_l_GetCountriesProcess:=New process:C317("DB_GetCountriesUsed"; 128000; "Get Countries"; Current process:C322)
		While (Not:C34(LAY_bo_CountriesReady))
			DelayTicks(2)
		End while 
		//ALERT("SIZE12")
		ARRAY BOOLEAN:C223(LAY_abo_CountryInclude; 0)
		ARRAY BOOLEAN:C223(LAY_abo_CountryExclude; 0)
		ARRAY BOOLEAN:C223(LAY_abo_CountryInclude; Size of array:C274(DB_at_CountryNames))
		ARRAY BOOLEAN:C223(LAY_abo_CountryExclude; Size of array:C274(DB_at_CountryNames))
		For ($_l_Index; 1; Size of array:C274(LAY_abo_CountryInclude))
			LAY_abo_CountryInclude{$_l_Index}:=True:C214
		End for 
		LB_SetupListboxByObjectName("oCountry"; "CTRY_t"; "CTRY_L"; 1; ->DB_at_CountryNames; ->LAY_abo_CountryInclude; ->LAY_abo_CountryExclude)
		
		$_l_Longest:=0
		For ($_l_Index; 1; Size of array:C274(DB_at_CountryNames))
			dbFilterText:=DB_at_CountryNames{$_l_Index}
			OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_Longest)
				$_l_Longest:=$_l_BestWidth
			End if 
		End for 
		$_l_Longest:=$_l_Longest+2
		Case of 
			: ($_l_Longest>(118+40))
				$_l_Longest:=(118+40)
			: ($_l_Longest<(60))
				$_l_Longest:=(60)
		End case 
		
		LB_SetColumnHeadersByObjectName("oCountry"; "CTRY_L"; 1; Get localized string:C991("CompanyFieldNames_Country"); "Inc."; "Exc.")
		LB_SetEnterablebyObjectName("oCountry"; False:C215; 0)
		LB_SetEnterablebyObjectName("oCountry"; True:C214; 2)
		LB_SetEnterablebyObjectName("oCountry"; True:C214; 3)
		LB_SetColumnWIdthsByObjectName("oCountry"; "CTRY_t"; 1; $_l_Longest; 35; 35)
		LB_SetScrollByObjectName("oCountry"; -3; -2)
	End if 
	OBJECT GET BEST SIZE:C717(*; "oCountryLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
	If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
		$_l_MaxLabelWidth:=$_l_BestLabelWidth
	End if 
	LB_StyleSettingsByObjectName("oCountry"; "Black"; 9; "CTRY_t"; $_Ptr_TableForStyle)
	LAY_bo_CountriesSetup:=True:C214
	$_l_TotalWidth:=LB_GetTotalColumnWIdths("oCountry")
	$0:=$_l_TotalWidth
	If ($_bo_SetReturnObjects)
		If (Size of array:C274(DB_at_CountryNames)>1)  //so we actually only show the area if there are some items in it
			If ($_l_TotalWidth>$_l_MaxLBWidth)
				$_l_MaxLBWidth:=$_l_TotalWidth
			End if 
			$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
			$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(DB_at_CountryNames)*20)+20
			APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(DB_at_CountryNames))
			$_Ptr_DisplayThisObject->:=True:C214
			APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Countries")
			$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
			$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
		End if 
	End if 
Else 
	
	
	
	
	
	
End if 
ERR_MethodTrackerReturn("DB_SetOutFIlterCountries"; $_t_OldMethodName)
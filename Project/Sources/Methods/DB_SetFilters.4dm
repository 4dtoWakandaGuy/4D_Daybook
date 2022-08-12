//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetFilters
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/05/2011 09:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	//ARRAY LONGINT(DB_al_FilterIDs;0)
	//ARRAY TEXT(DB_at_FilterNames;0)
	C_BOOLEAN:C305(DB_bo_DisplayFilters; DB_bo_DisplaySelections; DB_bo_DisplayStats; DB_bo_FiltersTouched; DB_bo_ShowArrayBased)
	C_LONGINT:C283($_l_FilterBoxSize; $_l_FilterObjectBottom; $_l_FilterObjectLeft; $_l_FilterObjectRight; $_l_FilterObjectTop; $_l_FilterRow; $_l_FiltersWidth; $_l_LBObjectBottom; $_l_LBObjectLeft; $_l_LBObjectRight; $_l_LBObjectTop)
	C_LONGINT:C283($_l_MaxWidth; $_l_MinimumObjectTop; $_l_NavObjectBottom; $_l_NavObjectLeft; $_l_NavObjectRight; $_l_NavObjectTop; $_l_NewWindowRight; $_l_StrapObjectBottom; $_l_StrapObjectLeft; $_l_StrapObjectRight; $_l_StrapObjectTop)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; DB_but_ClearFiltersButton; DB_l_CurrentDisplayedForm; DB_l_LBOutputForm; DB_l_RememberListBoxTop; DB_l_RememberNavBarTop)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_OldMethodName; DB_t_CurrentContext; DB_T_CurrentFilterName)
End if 
//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_SetFilters")
//ALERT("1")
OBJECT GET COORDINATES:C663(*; "oStrapHeader1"; $_l_StrapObjectLeft; $_l_StrapObjectTop; $_l_StrapObjectRight; $_l_StrapObjectBottom)
If ($_l_StrapObjectBottom>0)
	$_l_MinimumObjectTop:=$_l_StrapObjectBottom+5
Else 
	$_l_MinimumObjectTop:=5
End if 

If (Not:C34(DB_bo_DisplayFilters))
	DB_bo_DisplayFilters:=True:C214
	FORM GOTO PAGE:C247(2)
	If (Not:C34(DB_bo_DisplaySelections))
		OBJECT SET VISIBLE:C603(*; "oSelections@"; False:C215)
	End if 
	If (Not:C34(DB_bo_DisplayStats))
		OBJECT SET VISIBLE:C603(*; "oStats@"; False:C215)
	End if 
	OBJECT SET VISIBLE:C603(*; "oFilters@"; True:C214)
	$_l_MaxWidth:=Screen width:C187-10
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FilterObjectLeft; $_l_FilterObjectTop; $_l_FilterObjectRight; $_l_FilterObjectBottom)
	$_l_FilterBoxSize:=323
	$_l_NewWindowRight:=$_l_WindowRight+$_l_FilterBoxSize
	If ($_l_NewWindowRight>$_l_MaxWidth)
		$_l_NewWindowRight:=$_l_MaxWidth
	End if 
	//ALERT("2")
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_NewWindowRight; $_l_WindowBottom)
	//ALERT("2X")
	
	OBJECT GET COORDINATES:C663(*; "oNavigator"; $_l_NavObjectLeft; $_l_NavObjectTop; $_l_NavObjectRight; $_l_NavObjectBottom)
	//ALERT("2X1"
	If ($_l_MinimumObjectTop>$_l_NavObjectTop)
		$_l_NavObjectTop:=$_l_MinimumObjectTop
	End if 
	
	If (DB_l_RememberNavBarTop=0)
		DB_l_RememberNavBarTop:=$_l_NavObjectTop
	Else 
		$_l_NavObjectTop:=DB_l_RememberNavBarTop
	End if 
	OBJECT SET COORDINATES:C1248(*; "oNavigator"; $_l_NavObjectLeft; $_l_NavObjectTop; $_l_NewWindowRight-100; $_l_NavObjectBottom)
	//OBJECT MOVE(*;"oNavigator";$_l_NavObjectLeft;$_l_NavObjectTop;$_l_NewWindowRight-100;$_l_NavObjectBottom;*)
	//ALERT("2X2")
	$_l_FiltersWidth:=110
	OBJECT MOVE:C664(*; "oFiltersBox"; ($_l_NewWindowRight-$_l_FiltersWidth)-$_l_FilterBoxSize; $_l_FilterObjectTop; $_l_NewWindowRight-110; $_l_FilterObjectBottom; *)
	//ALERT("2X3")
	
	OBJECT GET COORDINATES:C663(*; "oListboxOutputForm"; $_l_LBObjectLeft; $_l_LBObjectTop; $_l_LBObjectRight; $_l_LBObjectBottom)
	//ALERT("2X4")
	If (DB_l_RememberListBoxTop=0)
		DB_l_RememberListBoxTop:=$_l_LBObjectTop
	Else 
		$_l_LBObjectTop:=DB_l_RememberListBoxTop
	End if 
	OBJECT MOVE:C664(*; "oListboxOutputForm"; $_l_LBObjectLeft; $_l_LBObjectTop; (($_l_NewWindowRight-$_l_FiltersWidth)-$_l_FilterBoxSize)-10; $_l_LBObjectBottom; *)
	//ALERT("2X5")
	
	OBJECT MOVE:C664(*; "oListboxOutputArrays"; $_l_LBObjectLeft; $_l_LBObjectTop; (($_l_NewWindowRight-$_l_FiltersWidth)-$_l_FilterBoxSize)-10; $_l_LBObjectBottom; *)
	//ALERT("2A")
	//SEL_CurrentRecordSelection
	
	//ALERT("2B")
	$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
	If ((DB_bo_DisplayFilters))
		
		SEL_CurrentRecordSelection
	End if 
	
	SRCH_Applyfilterstoselection($_ptr_Table)
	//ALERT("2C")
	DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	//ALERT("2D")
	OBJECT SET VISIBLE:C603(*; "oFiltersActiveText"; True:C214)
	OBJECT SET ENABLED:C1123(*; "oclearFilters"; True:C214)
	If (DB_T_CurrentFilterName#"")
		$_l_FilterRow:=Find in array:C230(DB_at_FilterNames; DB_T_CurrentFilterName)
		If ($_l_FilterRow>0)
			DB_at_FilterNames:=$_l_FilterRow
			$_l_FilterRow:=Find in array:C230(DB_at_FilterNames; "Remove Filters")
			If ($_l_FilterRow<0)
				APPEND TO ARRAY:C911(DB_at_FilterNames; "Remove Filters")
				APPEND TO ARRAY:C911(DB_al_FilterIDs; 99998)
			End if 
		End if 
	Else 
		If (Size of array:C274(DB_at_FilterNames)>0)
			$_l_FilterRow:=Find in array:C230(DB_at_FilterNames; "Remove Filters")
			If ($_l_FilterRow<0)
				APPEND TO ARRAY:C911(DB_at_FilterNames; "Remove Filters")
				APPEND TO ARRAY:C911(DB_al_FilterIDs; 99998)
			End if 
		End if 
		
	End if 
Else 
	DB_bo_DisplayFilters:=False:C215
	If (Not:C34(DB_bo_DisplaySelections)) & (Not:C34(DB_bo_DisplayStats))
		
		FORM GOTO PAGE:C247(1)
	Else 
		OBJECT SET VISIBLE:C603(*; "oFilters@"; False:C215)
	End if 
	OBJECT GET COORDINATES:C663(*; "oNavigator"; $_l_NavObjectLeft; $_l_NavObjectTop; $_l_NavObjectRight; $_l_NavObjectBottom)
	OBJECT GET COORDINATES:C663(*; "oListboxOutputForm"; $_l_LBObjectLeft; $_l_LBObjectTop; $_l_LBObjectRight; $_l_LBObjectBottom)
	OBJECT MOVE:C664(*; "oListboxOutputForm"; $_l_LBObjectLeft; DB_l_RememberListBoxTop; $_l_NavObjectRight-10; $_l_LBObjectBottom; *)
	OBJECT MOVE:C664(*; "oListboxOutputArrays"; $_l_LBObjectLeft; DB_l_RememberListBoxTop; $_l_NavObjectRight-10; $_l_LBObjectBottom; *)
	//ALERT("3")
	
	OBJECT SET VISIBLE:C603(*; "oFiltersActiveText"; DB_bo_FiltersTouched)
	OBJECT SET ENABLED:C1123(*; "oClearFilters"; DB_bo_FiltersTouched)
	
	
	
	
	OBJECT SET VISIBLE:C603(*; "oFiltersMessage"; False:C215)
End if 


If (DB_bo_ShowArrayBased)
	DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
Else 
	DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
End if 
//ALERT("4")
DB_SetFormMenuoptions
//ALERT("5")
ERR_MethodTrackerReturn("Co_SetFilters"; $_t_OldMethodName)

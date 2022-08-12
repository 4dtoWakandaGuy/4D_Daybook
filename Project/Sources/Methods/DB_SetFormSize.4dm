//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetFormSize
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2013 13:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnVisible; 0)
	//ARRAY LONGINT(<>INT_al_FormWidth;0)
	ARRAY LONGINT:C221($_al_ScreenBottom; 0)
	ARRAY LONGINT:C221($_al_ScreenLeft; 0)
	ARRAY LONGINT:C221($_al_ScreenRight; 0)
	ARRAY LONGINT:C221($_al_ScreenTop; 0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aPtr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aPtr_HeaderVariables; 0)
	//ARRAY TEXT(<>INT_at_FormNames;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(DB_at_TabNavigation;0)
	C_BOOLEAN:C305(<>INT_FormSIzesInited; $_bo_AcceptisVisible; $_bo_AddisVisible; $_bo_CalcIsVisible; $_bo_CancelisVisible; $_bo_CBFunctionButtonisVisible; $_bo_Configvisible; $_bo_DeleteisVisible; $_bo_FiltersAvailable; $_bo_FiltersDisplayed; $_bo_Function1isVisible)
	C_BOOLEAN:C305($_bo_Function2isVisible; $_bo_ListisVisible; $_bo_PopUp1isVisible; $_bo_ReportisVisible; $_bo_Resizable; $_bo_SelectIsVisible; $_bo_ShowStates; $_bo_SortIsVisible; $5; DB_bo_DisplayFilters; DB_bo_DisplaySelections)
	C_BOOLEAN:C305(DB_bo_DisplayStats; DB_bo_FiltersAvailable; DB_bo_HideModuleBar; DB_bo_NoLoad; DB_bo_NotSetFilters; DB_bo_ShowArrayBased; LAY_bo_CONStatusSetup)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>WIN_MINLEFT; <>WIN_MINTOP; $_l_AvailableWidth; $_l_BestHeight; $_l_BestWidth; $_l_bottom; $_l_ButtonBottom; $_l_ButtonLeft; $_l_ButtonNumber; $_l_ButtonRight)
	C_LONGINT:C283($_l_ButtonsBottom; $_l_ButtonsLeft; $_l_ButtonsRight; $_l_ButtonsTop; $_l_ButtonTop; $_l_ButtonWidth; $_l_ColumnNumber; $_l_ColumnWidth; $_l_Configvisible; $_l_CurrentFormWidth; $_l_CurrentWindowHeight)
	C_LONGINT:C283($_l_DefaultFilterID; $_l_DIfference; $_l_DockLeftSize; $_l_DockLL; $_l_DockLR; $_l_DockPosition; $_l_FiltersBottom; $_l_FiltersBoxBottom; $_l_FiltersBoxHeight; $_l_FiltersBoxLeft; $_l_FiltersBoxRight)
	C_LONGINT:C283($_l_FiltersBoxSize; $_l_FiltersBoxTop; $_l_FiltersLeft; $_l_FiltersPanelSize; $_l_FiltersRight; $_l_FiltersTop; $_l_FirstButtonRight; $_l_FootersAllowance; $_l_FormEvent; $_l_GetSizes; $_l_HeaderAllowance)
	C_LONGINT:C283($_l_IdealFormWidth; $_l_Index; $_l_left; $_l_LeftPosition; $_l_ListBoxHeight; $_l_ListBoxLeft; $_l_MaximumBottom; $_l_MaximumHeight; $_l_MaximumListBoxHeight; $_l_MaximumWidth; $_l_MaxWindowWidthPreference)
	C_LONGINT:C283($_l_MinimumHeight; $_l_MinimumListBoxHeight; $_l_MinimumListBoxWidth; $_l_MinimumWidth; $_l_MinLeft; $_l_MinTop; $_l_NarrowButtonCount; $_l_NarrowButtonWidth; $_l_NavigationLeft; $_l_NavigationRight; $_l_NewBottom)
	C_LONGINT:C283($_l_NewFormHeight; $_l_NewFormWidth; $_l_NewTop; $_l_NewWindowHeight; $_l_NewWindowRight; $_l_NewWindowWidth; $_l_NumberofModules; $_l_NumberOfMonitors; $_l_RecordsHeight; $_l_RectangleBottom; $_l_ReferenceRow)
	C_LONGINT:C283($_l_right; $_l_ScreenHeight; $_l_ScreenNumber; $_l_ScreenRight; $_l_ScreenWidth; $_l_SelObjBottom; $_l_SelObjLeft; $_l_SelObjRight; $_l_SelObjTop; $_l_SetButtons; $_l_SetTabWidths)
	C_LONGINT:C283($_l_Shift; $_l_TableNumber; $_l_top; $_l_TotalWIdth; $_l_WindowBottom; $_l_WIndowLeft; $_l_WindowRight; $_l_WIndowTop; $1; $3; $4)
	C_LONGINT:C283($6; DB_l_CurrentDisplayedForm; DB_l_TurnOnFilters)
	C_POINTER:C301($_ptr_ButtonPointer; $_Ptr_ColumnVariable; $2)
	C_TEXT:C284($_t_ButtonName; $_t_FormReferenceName; $_t_MoveObjectName; $_t_OldMethodName; DB_t_CurrentContext; DB_t_WindowFormPreference; dbtabText)
End if 
//Code Starts Here
//TRACE
$_t_OldMethodName:=ERR_MethodTracker("DB_SetFormSize")
$_l_MinimumListBoxHeight:=206  //never less than that
$_l_HeaderAllowance:=$3
$_l_FootersAllowance:=$4
$_bo_FiltersDisplayed:=$5
If ($_bo_FiltersDisplayed)
	OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
	OBJECT GET COORDINATES:C663(*; "oButtonAccept"; $_l_ButtonsLeft; $_l_ButtonsTop; $_l_ButtonsRight; $_l_ButtonsBottom)
	$_l_DIfference:=223-205
	$_l_FiltersBoxHeight:=$_l_FiltersBoxBottom-$_l_FiltersBoxTop
	If (($_l_FiltersBoxHeight-$_l_DIfference)>($_l_MinimumListBoxHeight))
		If ($_l_FiltersBoxBottom<($_l_ButtonsTop-10))
			//TRACE
			$_l_MinimumListBoxHeight:=$_l_FiltersBoxHeight
		Else 
			$_l_FiltersBoxHeight:=($_l_ButtonsTop-10)-$_l_FiltersBoxTop
			$_l_MinimumListBoxHeight:=$_l_FiltersBoxHeight
		End if 
	End if 
End if 
$_l_DockPosition:=INT_GetDock("A"; ->$_l_DockLeftSize; ->$_l_DockLR; ->$_l_DockLL)
$_l_MaximumBottom:=Screen height:C188-(($_l_DockLeftSize)+20)


If (Count parameters:C259>=6)
	$_l_FiltersPanelSize:=$6
Else 
	$_l_FiltersPanelSize:=323
End if 
//◊WIN_MINTOP
GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowTop; $_l_WindowRight; $_l_WindowBottom)
// ///////
ARRAY LONGINT:C221($_al_ScreenLeft; 0)
ARRAY LONGINT:C221($_al_ScreenTop; 0)
ARRAY LONGINT:C221($_al_ScreenRight; 0)
ARRAY LONGINT:C221($_al_ScreenBottom; 0)

$_l_NumberOfMonitors:=Count screens:C437
$_l_ScreenNumber:=0

For ($_l_GetSizes; 1; $_l_NumberOfMonitors)
	SCREEN COORDINATES:C438($_l_left; $_l_top; $_l_right; $_l_bottom; $_l_GetSizes)
	APPEND TO ARRAY:C911($_al_ScreenLeft; $_l_left)
	APPEND TO ARRAY:C911($_al_ScreenTop; $_l_top)
	APPEND TO ARRAY:C911($_al_ScreenRight; $_l_right)
	APPEND TO ARRAY:C911($_al_ScreenBottom; $_l_bottom)
	Case of 
		: ($_l_WIndowTop>=$_l_top) & ($_l_WIndowTop<=$_l_bottom) & ($_l_WIndowLeft>=$_l_left) & ($_l_WIndowLeft<=$_l_right)
			$_l_ScreenNumber:=$_l_GetSizes
			//this is the screen we are FULLY on-we keep within the bounds of this screen
		: ($_l_WIndowTop>=$_l_top) & ($_l_WIndowTop<=$_l_bottom) & ($_l_WIndowLeft<=$_l_right) & ($_l_WindowRight>$_l_left)
			//we are mostly on this screen but off to left
			$_l_ScreenNumber:=$_l_GetSizes
			
	End case 
End for 
If ($_l_ScreenNumber=1) | ($_l_ScreenNumber=0)
	$_l_MinTop:=Menu bar height:C440+1
	$_l_MinLeft:=0+$_l_DockLL
	//$_l_DockLeftSize;->$_l_DockLR;->$_l_DockLL
	$_l_ScreenWidth:=($_al_ScreenRight{1}+$_l_DockLR)-$_al_ScreenLeft{1}
	$_l_ScreenRight:=$_al_ScreenRight{1}+$_l_DockLR
	$_l_ScreenHeight:=($_al_ScreenBottom{1}-$_l_DockLeftSize)-$_al_ScreenTop{1}
Else 
	$_l_MinLeft:=0+$_l_DockLL
	$_l_MinTop:=Menu bar height:C440+1
	$_l_ScreenWidth:=($_al_ScreenRight{$_l_ScreenNumber}+$_l_DockLR)-$_al_ScreenLeft{$_l_ScreenNumber}
	$_l_ScreenRight:=$_al_ScreenRight{$_l_ScreenNumber}-$_l_DockLR
	$_l_ScreenHeight:=($_al_ScreenBottom{$_l_ScreenNumber}-$_l_DockLeftSize)-$_al_ScreenTop{$_l_ScreenNumber}
End if 

If (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	$_t_FormReferenceName:="Output_"+String:C10(DB_l_CurrentDisplayedForm)+"_"+DB_t_CurrentContext
	If (Not:C34(<>INT_FormSIzesInited))
		INT_LoadFormSizes(<>PER_l_CurrentUserID)
	End if 
	//the definitions its only displayed for them
	$_l_MaxWindowWidthPreference:=DB_GetUserWidthPreference(False:C215; $_t_FormReferenceName)
	
	DB_t_WindowFormPreference:=$_t_FormReferenceName  //make sure this is set if they tab even though we dont reload
	If ($_l_MaxWindowWidthPreference=0)
		$_l_MaximumWidth:=$_l_ScreenWidth-($_l_MinLeft+2)
		$_l_ReferenceRow:=Find in array:C230(<>INT_at_FormNames; $_t_FormReferenceName)
		If ($_l_ReferenceRow>0)
			$_l_MaximumWidth:=<>INT_al_FormWidth{$_l_ReferenceRow}
		End if 
	Else 
		$_l_MaximumWidth:=$_l_MaxWindowWidthPreference
	End if 
	
Else 
	$_l_MaximumWidth:=$_l_ScreenWidth-($_l_MinLeft+2)
End if 


// //////
$_l_CurrentWindowHeight:=$_l_WindowBottom-$_l_WIndowTop
$_l_CurrentFormWidth:=$_l_WindowRight-$_l_WIndowLeft
//TRACE
If (($_l_MinimumListBoxHeight+$_l_HeaderAllowance+$_l_FootersAllowance)>$_l_CurrentWindowHeight)
	//$_l_CurrentWindowHeight:=($_l_MinimumListBoxHeight+$_l_HeaderAllowance+$_l_FootersAllowance)
End if 
Case of 
	: ($_l_WIndowTop<$_l_MinTop)
		//window is to far up
		$_l_Shift:=$_l_MinTop-$_l_WIndowTop
		$_l_NewBottom:=($_l_WIndowTop+$_l_Shift)+$_l_CurrentWindowHeight
		If ($_l_NewBottom>$_l_ScreenHeight)
			$_l_NewBottom:=$_l_ScreenHeight
		End if 
		Case of 
			: ($_l_WindowLeft>($_l_MinLeft))  //window is too far Left as well
				$_l_Shift:=($_l_MinLeft+$_l_WindowLeft)
				If (($_l_WindowRight+$_l_Shift)>$_l_ScreenRight)
					$_l_WindowRight:=$_l_ScreenRight
				Else 
					$_l_WindowRight:=$_l_WindowRight+$_l_Shift
				End if 
			: ($_l_WindowRight>($_l_ScreenRight))  //window is too far Right as well
				$_l_WindowRight:=$_l_ScreenRight
		End case 
		SET WINDOW RECT:C444($_l_WIndowLeft; $_l_WIndowTop+$_l_Shift; $_l_WindowRight; $_l_NewBottom)
		$_l_WindowBottom:=$_l_NewBottom
		$_l_WIndowTop:=$_l_WIndowTop+$_l_Shift
	: ($_l_WindowBottom>($_l_MinTop+$_l_ScreenHeight))  //window is too far down
		$_l_Shift:=($_l_MinTop+$_l_ScreenHeight)-$_l_WindowBottom
		$_l_NewTop:=($_l_WindowBottom+$_l_Shift)-$_l_CurrentWindowHeight
		If ($_l_NewTop<$_l_MinTop)
			$_l_NewTop:=$_l_MinTop
		End if 
		Case of 
			: ($_l_WindowLeft>($_l_MinLeft))  //window is too far Left as well
				$_l_Shift:=($_l_MinLeft+$_l_WindowLeft)
				If (($_l_WindowRight+$_l_Shift)>$_l_ScreenRight)
					$_l_WindowRight:=$_l_ScreenRight
				Else 
					$_l_WindowRight:=$_l_WindowRight+$_l_Shift
				End if 
		End case 
		
		SET WINDOW RECT:C444($_l_WIndowLeft; $_l_NewTop; $_l_WindowRight; $_l_WindowBottom-$_l_Shift)
		$_l_WindowBottom:=$_l_WindowBottom-$_l_Shift
	: ($_l_WindowLeft<($_l_MinLeft))  //window is too far Left
		$_l_Shift:=($_l_MinLeft+$_l_WindowLeft)
		If (($_l_WindowRight+$_l_Shift)>$_l_ScreenRight)  //window is or will be too far right
			$_l_WindowRight:=$_l_ScreenRight
		Else 
			$_l_WindowRight:=$_l_WindowRight+$_l_Shift
		End if 
		$_l_WindowLeft:=$_l_WindowLeft+$_l_Shift
		SET WINDOW RECT:C444($_l_WIndowLeft; $_l_WIndowTop; $_l_WindowRight; $_l_WindowBottom)
		
	: ($_l_WindowRight>($_l_ScreenRight))  //window is too far Right only
		$_l_WindowRight:=$_l_ScreenRight
		SET WINDOW RECT:C444($_l_WIndowLeft; $_l_WIndowTop; $_l_WindowRight; $_l_WindowBottom)
		
		
	Else 
		//xT($_l_WIndowLeft;$_l_WIndowTop;$_l_WindowRight;$_l_WindowTop+$_l_CurrentWindowHeight)
End case 

$_l_MinimumListBoxWidth:=472
LISTBOX GET ARRAYS:C832($2->; $_at_ColumnNames; $_at_HeaderNames; $_aPtr_ColumnVariables; $_aPtr_HeaderVariables; $_abo_ColumnVisible; $_aptr_ColumnStyles)
$_l_TotalWIdth:=20
$_l_ColumnWidth:=0
//ALERT("SIZE3")
For ($_l_ColumnNumber; 1; Size of array:C274($_aPtr_ColumnVariables))
	If ($_abo_ColumnVisible{$_l_ColumnNumber}=True:C214)
		LB_GetWidths($2; $_l_ColumnNumber; ->$_l_ColumnWidth)
		$_l_TotalWIdth:=$_l_TotalWIdth+$_l_ColumnWidth
	End if 
End for 
dbtabText:=""
For ($_l_SetTabWidths; 1; Size of array:C274(DB_at_TabNavigation))
	dbtabText:=dbtabText+DB_at_TabNavigation{$_l_SetTabWidths}+(" "*8)
End for 
OBJECT GET BEST SIZE:C717(dbtabText; $_l_BestWidth; $_l_BestHeight)

If ($_l_BestWidth>$_l_TotalWIdth)
	$_l_TotalWIdth:=$_l_BestWidth
End if 

//End for
$_l_AvailableWidth:=$_l_MaximumWidth-((10)+($_l_FiltersPanelSize*(Num:C11($_bo_FiltersDisplayed))))

If ($_l_TotalWIdth>$_l_AvailableWidth)
	$_l_TotalWIdth:=$_l_AvailableWidth
	If ($_l_BestWidth>$_l_TotalWIdth)
		$_l_TotalWIdth:=$_l_BestWidth
	End if 
End if 
If ($_l_TotalWIdth<$_l_MinimumListBoxWidth)
	$_l_TotalWIdth:=$_l_MinimumListBoxWidth
End if 
If (False:C215)
	If ($_l_BestWidth>(Screen width:C187-((10)+($_l_FiltersPanelSize*(Num:C11($_bo_FiltersDisplayed))))))
		//there are too many tabs...
		Repeat 
			$_l_NumberofModules:=Size of array:C274(DB_at_TabNavigation)
			DB_DropTabs($1)
			dbtabText:=""
			For ($_l_SetTabWidths; 1; Size of array:C274(DB_at_TabNavigation))
				dbtabText:=dbtabText+DB_at_TabNavigation{$_l_SetTabWidths}+(" "*8)
			End for 
			
			OBJECT GET BEST SIZE:C717(dbtabText; $_l_BestWidth; $_l_BestHeight)
			
		Until ($_l_BestWidth<(Screen width:C187-((10)+($_l_FiltersPanelSize*(Num:C11($_bo_FiltersDisplayed)))))) | ($_l_NumberofModules=Size of array:C274(DB_at_TabNavigation))
		
		
		
	End if 
End if 
GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowTop; $_l_WindowRight; $_l_WindowBottom)

$_l_IdealFormWidth:=$_l_TotalWIdth+(10)+($_l_FiltersPanelSize*(Num:C11($_bo_FiltersDisplayed)))
If ($_l_MaxWindowWidthPreference>0)
	If ($_l_IdealFormWidth>$_l_MaxWindowWidthPreference)
		$_l_IdealFormWidth:=$_l_MaxWindowWidthPreference
	End if 
End if 

$_l_IdealFormWidth:=$_l_TotalWIdth+(10)+($_l_FiltersPanelSize*(Num:C11($_bo_FiltersDisplayed)))
If ($_l_CurrentFormWidth<$_l_IdealFormWidth)
	If (Form event code:C388=On Load:K2:1)
		
		Case of 
			: (($_l_WIndowLeft+$_l_IdealFormWidth)<$_l_ScreenWidth)
				
				SET WINDOW RECT:C444($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowLeft+$_l_IdealFormWidth; $_l_WindowBottom)
				
			: ((1+$_l_IdealFormWidth)<$_l_ScreenWidth)
				
				SET WINDOW RECT:C444(1; $_l_WIndowTop; 1+$_l_IdealFormWidth; $_l_WindowBottom)
				
			: ((1+$_l_IdealFormWidth)>$_l_ScreenWidth)
				//dont move it
				
			Else 
				
				SET WINDOW RECT:C444($_l_WindowRight-$_l_IdealFormWidth; $_l_WIndowTop; $_l_WindowRight; $_l_WindowBottom)
		End case 
	End if 
End if 

$_l_MaximumListBoxHeight:=($_l_ScreenWidth-$_l_MinTop)-($_l_HeaderAllowance+$_l_FootersAllowance)

If (DB_bo_ShowArrayBased)
	LISTBOX GET ARRAYS:C832(*; "oListboxOutputArrays"; $_at_ColumnNames; $_at_HeaderNames; $_aPtr_ColumnVariables; $_aPtr_HeaderVariables; $_abo_ColumnVisible; $_aptr_ColumnStyles)
	
	$_Ptr_ColumnVariable:=$_aPtr_ColumnVariables{1}
	
	$_l_RecordsHeight:=Size of array:C274($_Ptr_ColumnVariable->)*16.5
Else 
	
	$_l_RecordsHeight:=Records in selection:C76(Table:C252($1)->)*16.5
End if 
If ($_l_RecordsHeight>$_l_MaximumListBoxHeight)
	$_l_RecordsHeight:=$_l_MaximumListBoxHeight
Else 
	If ($_l_RecordsHeight<$_l_MinimumListBoxHeight)
		$_l_RecordsHeight:=$_l_MinimumListBoxHeight
	End if 
End if 

$_l_NewFormHeight:=$_l_RecordsHeight+$_l_HeaderAllowance+$_l_FootersAllowance
$_l_NewFormWidth:=$_l_TotalWIdth+10+($_l_FiltersPanelSize*(Num:C11($_bo_FiltersDisplayed)))
If ($_l_MaxWindowWidthPreference>0)
	If ($_l_NewFormWidth>$_l_MaxWindowWidthPreference)
		$_l_NewFormWidth:=$_l_MaxWindowWidthPreference
	End if 
End if 

GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowTop; $_l_WindowRight; $_l_WindowBottom)

$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent#On Load:K2:1)
		If ($_bo_FiltersDisplayed)
			OBJECT GET COORDINATES:C663(*; "oFiltersBox"; $_l_FiltersBoxLeft; $_l_FiltersBoxTop; $_l_FiltersBoxRight; $_l_FiltersBoxBottom)
			OBJECT GET COORDINATES:C663(*; "oButtonAccept"; $_l_ButtonsLeft; $_l_ButtonsTop; $_l_ButtonsRight; $_l_ButtonsBottom)
			$_l_DIfference:=223-205
			$_l_FiltersBoxHeight:=$_l_FiltersBoxBottom-$_l_FiltersBoxTop
			If (($_l_FiltersBoxHeight-$_l_DIfference)>($_l_MinimumListBoxHeight))
				If ($_l_FiltersBoxBottom<($_l_ButtonsTop-10))
					//TRACE
					$_l_MinimumListBoxHeight:=$_l_FiltersBoxHeight
				Else 
					$_l_FiltersBoxHeight:=($_l_ButtonsTop-10)-$_l_FiltersBoxTop
					$_l_MinimumListBoxHeight:=$_l_FiltersBoxHeight
				End if 
			End if 
			$_l_RectangleBottom:=$_l_ButtonsTop-10
		Else 
			OBJECT GET COORDINATES:C663(*; "oButtonAccept"; $_l_ButtonsLeft; $_l_ButtonsTop; $_l_ButtonsRight; $_l_ButtonsBottom)
			$_l_RectangleBottom:=$_l_ButtonsTop-10
			
		End if 
		
		GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowTop; $_l_NewWindowRight; $_l_WindowBottom)
		$_l_RectangleBottom:=((($_l_WindowBottom-$_l_WIndowTop)-5)-($_l_ButtonsBottom-$_l_ButtonsTop))-10
		//i//f($_l_RectangleBottom>(($_l_WindowBottom-5)-($_l_ButtonsBottom-$_l_ButtonsTop))
		//end if
		$_l_NewWindowWidth:=$_l_NewWindowRight-$_l_WIndowLeft
		$_l_NewWindowHeight:=$_l_WindowBottom-$_l_WIndowTop
		If (DB_bo_DisplayFilters)
			$_l_NavigationRight:=$_l_NewWindowWidth-(5+$_l_FiltersBoxSize)
			$_l_ListBoxHeight:=$_l_NewWindowWidth-(10+$_l_FiltersBoxSize)
		Else 
			$_l_NavigationRight:=$_l_NewWindowWidth-(5)
			$_l_ListBoxHeight:=$_l_NewWindowWidth-(10)
		End if 
		If (DB_bo_DisplaySelections)
			OBJECT GET COORDINATES:C663(*; "oSelectionsListbox"; $_l_SelObjLeft; $_l_SelObjTop; $_l_SelObjRight; $_l_SelObjBottom)
			If ($_l_SelObjRight<250)
				$_l_SelObjRight:=250
			End if 
			$_l_ListBoxLeft:=6+$_l_SelObjRight
			$_l_NavigationLeft:=5+$_l_SelObjRight
		Else 
			$_l_ListBoxLeft:=4
			$_l_NavigationLeft:=3
		End if 
		$_bo_FiltersAvailable:=DB_FIltersAvailable(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		If (DB_bo_NotSetFilters=False:C215)
			//DB_bo_NotSetFilters:=True
			//DB_SetOutPutFilters ($_bo_FiltersAvailable;$_l_NavigationLeft;$_l_NavigationRight;$_l_RectangleBottom;$_l_ListBoxHeight;$_l_NewWindowRight;$_l_NewWindowWidth;$_l_NewWindowHeight)
			DB_SetOutputFiltersTrial($_bo_FiltersAvailable; $_l_NavigationLeft; $_l_NavigationRight; $_l_RectangleBottom; $_l_ListBoxHeight; $_l_NewWindowRight; $_l_NewWindowWidth; $_l_NewWindowHeight)
		Else 
			//TRACE
			DB_bo_NotSetFilters:=False:C215
		End if 
		
	Else 
		
		
		WS_AutoscreenSize(2; $_l_NewFormHeight; $_l_NewFormWidth)
		If ($_bo_FiltersDisplayed)
			DB_l_TurnOnFilters:=1
			POST OUTSIDE CALL:C329(Current process:C322)
		End if 
		If (DB_bo_FiltersAvailable)
			$_l_DefaultFilterID:=DB_GetdefaultFilterID(DB_l_CurrentDisplayedForm)
			If ($_l_DefaultFilterID#0)
				DB_LoadFilterParameters($_l_DefaultFilterID; DB_l_CurrentDisplayedForm)
			End if 
		End if 
		
		
End case 
If ($_l_FormEvent=On Resize:K2:27) & ($_l_FormEvent#On Load:K2:1)
	//TRACE
	$_bo_AcceptisVisible:=OBJECT Get visible:C1075(*; "oButtonAccept")
	$_bo_CancelisVisible:=OBJECT Get visible:C1075(*; "oButtonCancel")
	$_bo_AddisVisible:=OBJECT Get visible:C1075(*; "oButtonAdd")
	$_bo_DeleteisVisible:=OBJECT Get visible:C1075(*; "oButtonDelete")
	$_bo_SortIsVisible:=OBJECT Get visible:C1075(*; "oButtonSort")
	$_bo_SelectIsVisible:=OBJECT Get visible:C1075(*; "oButtonSelect")
	$_bo_ReportisVisible:=OBJECT Get visible:C1075(*; "obuttonReport")
	$_bo_ListisVisible:=OBJECT Get visible:C1075(*; "obuttonDatalists")
	$_bo_CalcIsVisible:=OBJECT Get visible:C1075(*; "obuttonCalc")
	$_bo_Function2isVisible:=OBJECT Get visible:C1075(*; "oFunctionButton2")
	$_bo_Function1isVisible:=OBJECT Get visible:C1075(*; "oFunctionButton")
	$_bo_PopUp1isVisible:=OBJECT Get visible:C1075(*; "oDropDownQuery")
	$_bo_CBFunctionButtonisVisible:=OBJECT Get visible:C1075(*; "oCBFunctionButton")
	$_l_FirstButtonRight:=($_l_WindowRight-$_l_WIndowLeft)-10
	$_l_ButtonsBottom:=($_l_WindowBottom-$_l_WIndowTop)-5
	$_bo_Configvisible:=OBJECT Get visible:C1075(*; "obuttonConfig")
	
	For ($_l_SetButtons; 1; 9)
		Case of 
			: ($_bo_Configvisible)
				OBJECT MOVE:C664(*; "obuttonConfig"; 4; $_l_ButtonsBottom-35; 4+35; $_l_ButtonsBottom; *)
				
			: (($_bo_AcceptisVisible))
				OBJECT MOVE:C664(*; "oButtonAccept"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom; *)
				$_bo_AcceptisVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
			: (($_bo_CancelisVisible))
				OBJECT MOVE:C664(*; "oButtonCancel"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom; *)
				$_bo_CancelisVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
			: (($_bo_AddisVisible))
				OBJECT MOVE:C664(*; "oButtonAdd"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom; *)
				$_bo_AddisVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
			: (($_bo_DeleteisVisible))
				OBJECT MOVE:C664(*; "oButtonDelete"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom; *)
				$_bo_DeleteisVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
			: (($_bo_SortIsVisible))
				OBJECT MOVE:C664(*; "oButtonSort"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom; *)
				$_bo_SortIsVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
			: (($_bo_SelectIsVisible))
				OBJECT MOVE:C664(*; "oButtonSelect"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom; *)
				$_bo_SelectIsVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
			: (($_bo_ReportisVisible))
				OBJECT MOVE:C664(*; "obuttonReport"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom; *)
				$_bo_ReportisVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
			: (($_bo_ListisVisible))
				OBJECT MOVE:C664(*; "obuttonDatalists"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom; *)
				$_bo_ListisVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
			: (($_bo_CalcIsVisible))
				OBJECT MOVE:C664(*; "obuttonCalc"; $_l_FirstButtonRight-35; $_l_ButtonsBottom-35; $_l_FirstButtonRight; $_l_ButtonsBottom; *)
				$_bo_CalcIsVisible:=False:C215
				$_l_FirstButtonRight:=$_l_FirstButtonRight-40
		End case 
		
	End for 
	If ($_bo_Function2isVisible)
		OBJECT GET BEST SIZE:C717(*; "oFunctionButton2"; $_l_BestWidth; $_l_BestHeight)
		OBJECT MOVE:C664(*; "oFunctionButton2"; $_l_FirstButtonRight-$_l_BestWidth; $_l_ButtonsBottom-25; $_l_FirstButtonRight; $_l_ButtonsBottom-7; *)
		$_l_FirstButtonRight:=($_l_FirstButtonRight-$_l_BestWidth)-5
		$_bo_Function1isVisible:=OBJECT Get visible:C1075(*; "oFunctionButton")
	End if 
	If ($_bo_Function1isVisible)
		OBJECT GET BEST SIZE:C717(*; "oFunctionButton"; $_l_BestWidth; $_l_BestHeight)
		OBJECT MOVE:C664(*; "oFunctionButton"; $_l_FirstButtonRight-$_l_BestWidth; $_l_ButtonsBottom-25; $_l_FirstButtonRight; $_l_ButtonsBottom-7; *)
		$_l_FirstButtonRight:=($_l_FirstButtonRight-$_l_BestWidth)-5
		
	End if 
	If ($_bo_PopUp1isVisible)
		
		OBJECT GET BEST SIZE:C717(*; "oDropDownQuery"; $_l_BestWidth; $_l_BestHeight)
		OBJECT MOVE:C664(*; "oDropDownQuery"; $_l_FirstButtonRight-$_l_BestWidth; $_l_ButtonsBottom-30; $_l_FirstButtonRight; $_l_ButtonsBottom-2; *)
		$_l_FirstButtonRight:=($_l_FirstButtonRight-$_l_BestWidth)-5
		OBJECT GET BEST SIZE:C717(*; "oDropDownQueryLabel"; $_l_BestWidth; $_l_BestHeight)
		OBJECT MOVE:C664(*; "oDropDownQueryLabel"; $_l_FirstButtonRight-$_l_BestWidth; $_l_ButtonsBottom-25; $_l_FirstButtonRight; $_l_ButtonsBottom-7; *)
		$_l_FirstButtonRight:=($_l_FirstButtonRight-$_l_BestWidth)-5
	End if 
	If ($_bo_CBFunctionButtonisVisible)
		OBJECT GET BEST SIZE:C717(*; "oCBFunctionButton"; $_l_BestWidth; $_l_BestHeight)
		OBJECT MOVE:C664(*; "oCBFunctionButton"; $_l_FirstButtonRight-$_l_BestWidth; $_l_ButtonsBottom-30; $_l_FirstButtonRight; $_l_ButtonsBottom-2; *)
		
		
	End if 
	If ($_l_FormEvent#On Load:K2:1)
		DB_HideShowSearch(DB_l_CurrentDisplayedForm)
	End if 
End if 
If (Not:C34(DB_bo_HideModuleBar))
	//here the tool bar buttons that are blank need to be hidden and the position of the righ most button set. they seem to resize incorrectly
	$_l_NumberofModules:=Size of array:C274(MOD_al_ModuleBarOffsets)
	$_l_NarrowButtonCount:=0
	$_l_ButtonNumber:=1
	$_l_LeftPosition:=121
	$_l_NarrowButtonWidth:=45
	For ($_l_Index; 1; $_l_NumberofModules)
		$_l_NarrowButtonCount:=$_l_NarrowButtonCount+1
		$_t_MoveObjectName:="oBarButton"+String:C10($_l_Index+$_l_ButtonNumber)
		OBJECT MOVE:C664(*; $_t_MoveObjectName; $_l_LeftPosition; 5; $_l_LeftPosition+$_l_NarrowButtonWidth; 37; *)
		$_l_LeftPosition:=$_l_LeftPosition+$_l_NarrowButtonWidth
	End for 
	If (False:C215)
		$_t_ButtonName:="oBarButton"+String:C10($_l_NumberofModules)
		$_ptr_ButtonPointer:=Get pointer:C304($_t_ButtonName)
		
		OBJECT GET COORDINATES:C663(*; $_t_ButtonName; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_ButtonBottom)
		$_l_ButtonWidth:=$_l_ButtonRight-$_l_ButtonLeft
		$_t_ButtonName:="oBarButton"+String:C10($_l_NumberofModules+1)
		
		OBJECT MOVE:C664(*; $_t_ButtonName; $_l_ButtonRight; $_l_ButtonTop; ($_l_ButtonWidth-10)+$_l_ButtonRight; $_l_ButtonBottom; *)
		
	End if 
End if 



//Here set the colours
DB_SetOutputColor($1)
FORM GET HORIZONTAL RESIZING:C1077($_bo_Resizable; $_l_MinimumWidth; $_l_MaximumWidth)
If ($_l_BestWidth<(Screen width:C187-($_l_DockLR+$_l_DockLL)))
	
	//$_l_MinimumWidth:=$_l_BestWidth
End if 
If ($_l_MinimumWidth>(Screen width:C187-($_l_DockLR+$_l_DockLL)))  //min width would be greater than max
	//$_l_MinimumWidth:=Screen width-($_l_DockLR+$_l_DockLL)
End if 
FORM SET HORIZONTAL RESIZING:C892($_bo_Resizable; $_l_MinimumWidth; Screen width:C187-($_l_DockLR+$_l_DockLL))
//ALERT($_l_MaximumHeight)

FORM GET VERTICAL RESIZING:C1078($_bo_Resizable; $_l_MinimumHeight; $_l_MaximumHeight)
FORM SET VERTICAL RESIZING:C893($_bo_Resizable; $_l_MinimumHeight; $_l_MaximumBottom)
ERR_MethodTrackerReturn("DB_SetFormSize"; $_t_OldMethodName)

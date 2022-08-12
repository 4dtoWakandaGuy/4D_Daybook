//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_HideShowSearch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:      08/06/2010 10:02
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SRCH_at_SearchOptions;0)
	C_BOOLEAN:C305($_bo_visible; DB_bo_HideSearchBox)
	C_LONGINT:C283($_l_ClearSearchButtonLeft; $_l_DropDownpictureLeft; $_l_ListingAreaBottom; $_l_ListingAreaHeight; $_l_ListingAreaHeightRequired; $_l_ListingAreaLeft; $_l_ListingAreaRight; $_l_ListingAreaTop; $_l_NavOptionBottom; $_l_NavOptionLeft; $_l_NavOptionRight)
	C_LONGINT:C283($_l_NavOptionTop; $_l_OverlaptoFix; $_l_RecordsinSelection; $_l_SearchAreaBottom; $_l_SearchAreaHeight; $_l_SearchAreaLeft; $_l_SearchAreaRight; $_l_SearchAreaTop; $_l_SearchAreaWidth; $_l_SearchPromptBottom; $_l_SearchPromptLeft)
	C_LONGINT:C283($_l_SearchPromptRight; $_l_SearchPromptTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $_l_WindowWidth; $_l_bestHeight; $_l_bestWidth; DB_l_Navigatetoselected)
	C_POINTER:C301($_Ptr_TablePointer)
	C_REAL:C285($1)
	C_TEXT:C284($_t_OldMethodName; SRCH_t_Prompt)
End if 

//Code Starts Here


$_t_OldMethodName:=ERR_MethodTracker("DB_HideShowSearch")
If (Count parameters:C259>=1)
	$_Ptr_TablePointer:=Table:C252($1)
	$_l_RecordsinSelection:=Records in table:C83($_Ptr_TablePointer->)
	OBJECT GET COORDINATES:C663(*; "oListboxOutputForm"; $_l_ListingAreaLeft; $_l_ListingAreaTop; $_l_ListingAreaRight; $_l_ListingAreaBottom)
	$_l_ListingAreaHeight:=$_l_ListingAreaBottom-$_l_ListingAreaTop
	$_l_ListingAreaHeightRequired:=$_l_RecordsinSelection*15
	If ($1=Table:C252(->[ACCOUNT_BALANCES:34]))
		$_l_ListingAreaHeightRequired:=$_l_ListingAreaHeight+1
	End if 
	
	If (Size of array:C274(SRCH_at_SearchOptions)>0)
		OBJECT SET VISIBLE:C603(*; "oSearchCriteriaButton"; True:C214)
	End if 
	//End if
	OBJECT SET VISIBLE:C603(*; "oSearchClearButton"; False:C215)
	If ($_l_ListingAreaHeightRequired<=$_l_ListingAreaHeight) | (DB_bo_HideSearchBox)
		$_bo_visible:=False:C215
		//OBJECT SET VISIBLE(*;"oRoundArea1";False)
		//`OBJECT SET VISIBLE(*;"oFocusRing";False)
		//OBJECT SET VISIBLE(*;"oSearchClearButton";False)
		//OBJECT SET VISIBLE(*;"oSearchCriteriaButton";False)
		//OBJECT SET VISIBLE(*;"oSearchvalue";False)
		//OBJECT SET VISIBLE(*;"oSearchCriteria";False)
		//OBJECT SET VISIBLE(SRCH_t_Prompt;False)
	Else 
		$_bo_visible:=True:C214
	End if 
	//TRACE
	//OBJECT SET VISIBLE(*;"oSearchClearButton";$_bo_visible)
	OBJECT SET VISIBLE:C603(*; "oSearchCriteriaButton"; $_bo_visible)
	OBJECT SET VISIBLE:C603(*; "oSearchvalue"; $_bo_visible)
	OBJECT SET VISIBLE:C603(*; "oSearchCriteria"; $_bo_visible)
	OBJECT SET VISIBLE:C603(SRCH_t_Prompt; $_bo_visible)
	//f(Size of array(SRCH_at_SearchOptions)>0)
	//OBJECT SET VISIBLE(*;"oSearchCriteriaButton";(Size of array(SRCH_at_SearchOptions)>0))
	
	//OBJECT SET VISIBLE(*;"oRoundArea1";True)
	//OBJECT SET VISIBLE(*;"oFocusRing";True)
	//OBJECT SET VISIBLE(*;"oSearchClearButton";True)
	If (Size of array:C274(SRCH_at_SearchOptions)>0) & ($_bo_visible)
		
		OBJECT SET VISIBLE:C603(*; "oSearchCriteriaButton"; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(*; "oSearchCriteriaButton"; False:C215)
	End if 
	//OBJECT SET VISIBLE(*;"oSearchvalue";True)
	
	//OBJECT SET VISIBLE(*;"oSearchCriteria";True)
	
	//OBJECT SET VISIBLE(SRCH_t_Prompt;True)
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
	$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
	OBJECT GET COORDINATES:C663(*; "oNavigateOption"; $_l_NavOptionLeft; $_l_NavOptionTop; $_l_NavOptionRight; $_l_NavOptionBottom)
	
	If ($_bo_visible)
		OBJECT GET COORDINATES:C663(*; "oSearchvalue"; $_l_SearchAreaLeft; $_l_SearchAreaTop; $_l_SearchAreaRight; $_l_SearchAreaBottom)
		$_l_SearchAreaHeight:=30
		$_l_SearchAreaWidth:=$_l_SearchAreaRight-$_l_SearchAreaLeft
		If ($_l_SearchAreaWidth<205)
			$_l_SearchAreaWidth:=205
		End if 
		OBJECT MOVE:C664(*; "oSearchvalue"; ($_l_WindowWidth-10)-$_l_SearchAreaWidth; 40; $_l_WindowWidth-10; 40+30; *)
		//OBJECT MOVE(*;"oFocusRing";($_l_WindowWidth-10)-$_l_SearchAreaWidth;$_l_ObjectTop;$_l_WindowWidth-10;$_l_ObjectBottom;*)
		//drop down 12 in and 23 wid
		If (Is macOS:C1572)
			$_l_DropDownpictureLeft:=(($_l_WindowWidth-10)-$_l_SearchAreaWidth)+12
			//to test this
			//$_l_DropDownpictureLeft:=(($_l_WindowWidth-20)-23)  //+12
			OBJECT MOVE:C664(*; "oSearchCriteriaButton"; $_l_DropDownpictureLeft; $_l_SearchAreatop+8; $_l_DropDownpictureLeft+23; $_l_SearchAreaBottom-5; *)
			
		Else 
			$_l_DropDownpictureLeft:=(($_l_WindowWidth-20)-23)  //+12
			OBJECT MOVE:C664(*; "oSearchCriteriaButton"; $_l_DropDownpictureLeft; $_l_SearchAreatop+8; $_l_DropDownpictureLeft+23; $_l_SearchAreaBottom-5; *)
			
		End if 
		//$_t_Search:=(($_l_WindowWidth-10)-$_l_SearchAreaWidth)+38
		If (Is macOS:C1572)
			$_l_ClearSearchButtonLeft:=(($_l_WindowWidth-20)-23)  //+(462-269)
			//+12
			//OBJECT MOVE(*;"oSearchClearButton";$_l_ClearSearchButtonLeft;$_l_SearchAreatop+9;$_l_ClearSearchButtonLeft+15;$_l_SearchAreaBottom-9;*)
			
		Else 
			///might use a different icon on the button as well
			$_l_ClearSearchButtonLeft:=(($_l_WindowWidth-20)-23)  //12 in from the left as the drop down is on the right
			//OBJECT MOVE(*;"oSearchClearButton";$_l_ClearSearchButtonLeft;$_l_SearchAreatop+9;$_l_ClearSearchButtonLeft+15;$_l_SearchAreaBottom-9;*)
			
		End if 
		OBJECT GET COORDINATES:C663(*; "oSearchvalue"; $_l_SearchAreaLeft; $_l_SearchAreaTop; $_l_SearchAreaRight; $_l_SearchAreaBottom)
		
		//OBJECT MOVE(*;"oSearchvalue";$_t_Search;$_l_SearchAreatop+9;$_t_Search+150;$_l_SearchAreaBottom-9;*)
		//OBJECT MOVE(*;"oSearchCriteria";$_t_Search;$_l_SearchAreatop+9;$_t_Search+150;$_l_SearchAreaBottom-9;*)
		
		//OBJECT GET COORDINATES(*;"oRoundArea1";$_l_ObjectLeft;$_l_SearchAreatop;$_l_SearchAreaRight;$_l_SearchAreaBottom)
		OBJECT GET COORDINATES:C663(*; "oSRCH_t_Prompt"; $_l_SearchPromptLeft; $_l_SearchPromptTop; $_l_SearchPromptRight; $_l_SearchPromptBottom)
		OBJECT GET COORDINATES:C663(*; "oNavigateOption"; $_l_NavOptionLeft; $_l_NavOptionTop; $_l_NavOptionRight; $_l_NavOptionBottom)
		OBJECT GET BEST SIZE:C717(*; "oNavigateOption"; $_l_bestWidth; $_l_bestHeight)
		OBJECT SET COORDINATES:C1248(*; "oSRCH_t_Prompt"; $_l_NavOptionLeft; $_l_NavOptionTop; $_l_NavOptionLeft+$_l_bestWidth; $_l_NavOptionBottom)
		$_l_NavOptionRight:=$_l_NavOptionLeft+$_l_bestWidth
		
		
		
		OBJECT GET BEST SIZE:C717(*; "oSRCH_t_Prompt"; $_l_bestWidth; $_l_bestHeight)
		If ((($_l_SearchAreaLeft-10)-($_l_bestWidth+10))<$_l_NavOptionRight)
			$_l_OverlaptoFix:=$_l_NavOptionRight-(($_l_SearchAreaLeft-10)-($_l_bestWidth+10))
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight+$_l_OverlaptoFix; $_l_WindowBottom)
		End if 
		OBJECT SET COORDINATES:C1248(*; "oSRCH_t_Prompt"; ($_l_SearchAreaLeft-10)-($_l_bestWidth+10); $_l_SearchPromptTop; ($_l_SearchAreaLeft-10); $_l_SearchPromptBottom)
	End if 
	If (Size of array:C274(SRCH_at_SearchOptions)=0)
		OBJECT SET VISIBLE:C603(*; "oSearchCriteriaButton"; False:C215)
	End if 
End if 
ERR_MethodTrackerReturn("DB_HideShowSearch"; $_t_OldMethodName)
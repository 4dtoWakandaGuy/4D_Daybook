If (False:C215)
	//object Name: [USER]SD2_diaryViewer.oButLessFilters
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_ConfigureSD2;0)
	C_DATE:C307(SD2_D_DateFromFilter; SD2_D_DatetoFilter)
	C_LONGINT:C283($_l_ButtonHeight; $_l_event; $_l_Gap; $_l_ObjectBottom; $_l_ObjectBottom1; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectLeft; $_l_ObjectLeft1; $_l_ObjectLeft2; $_l_ObjectLeft3)
	C_LONGINT:C283($_l_ObjectRight; $_l_ObjectRight1; $_l_ObjectRight2; $_l_ObjectRight3; $_l_ObjectTop; $_l_ObjectTop1; $_l_ObjectTop2; $_l_ObjectTop3; $_l_TabHeight)
	C_PICTURE:C286(SD2_Pi_Configure)
	C_TEXT:C284($_t_oldMethodName; SD_t_ActionFilter; SD_t_ActionFilterCode; SD_t_ContactFilter; SD_t_ContactFilterName; SD_t_ResultsFilter; SD_t_ResultsFilterCode; SD2_t_CompanyFilter; SD2_t_CompanyFilterName; SD2_t_Document; SD2_t_DocumentName)
	C_TEXT:C284(SD2_t_StatusFIlter)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.oButLessFilters"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (FORM Get current page:C276=3)
				//Goto page2
				OBJECT SET VISIBLE:C603(*; "SD2_l_MoreFilters"; True:C214)
				
				OBJECT GET COORDINATES:C663(*; "oButMoreFilters"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRight1; $_l_ObjectBottom1)
				OBJECT GET COORDINATES:C663(*; "oButLessFilters"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
				OBJECT GET COORDINATES:C663(*; "oSD2Workflow"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT GET COORDINATES:C663(*; "oPageTab"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_TabHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
				$_l_Gap:=$_l_ObjectTop-$_l_ObjectTop2
				$_l_ObjectTop:=135
				$_l_ButtonHeight:=$_l_ObjectBottom1-$_l_ObjectTop1
				OBJECT MOVE:C664(*; "oButMoreFilters"; $_l_ObjectLeft1; 129-$_l_ButtonHeight; $_l_ObjectRight1; 129; *)
				OBJECT MOVE:C664(*; "oButLessFilters"; $_l_ObjectLeft3; 129-$_l_ButtonHeight; $_l_ObjectRight3; 129; *)
				OBJECT MOVE:C664(*; "oPageTab"; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectTop+$_l_TabHeight; *)
				$_l_ObjectTop:=$_l_ObjectTop+$_l_Gap
				OBJECT MOVE:C664(*; "oSD2Workflow"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom; *)
				OBJECT MOVE:C664(SD2_Pi_Configure; 1; $_l_ObjectTop-17; 17; $_l_ObjectTop-1; *)
				OBJECT MOVE:C664(SD2_at_ConfigureSD2; $_l_ObjectTop-17; 17; $_l_ObjectTop-1; *)
				
				SD_t_ContactFilter:=""
				//SD_S25_CompanyFilter:=""
				SD2_t_CompanyFilter:=""  //changed to this from above 03/07/08 -kmw (when applying filter it uses this so i think this is what it was meant to be)
				SD2_t_Document:=""
				
				SD2_t_CompanyFilterName:=""
				SD_t_ContactFilterName:=""
				SD2_t_DocumentName:=""
				
				//************** commented out 03/07/08 -kmw **************
				//If (SD2_T_SearchValue#"")
				//SD2_DiaryVIewManageView (1;SD2_T_SearchValue)
				//Else
				//SD2_DiaryViewManageSelection
				//SD2_DiaryVIewManageView (-1)
				//End if
				//**************************************************************
				SD2_DiaryVIewManageView(-1)  //changed to simply just this, 03/07/08 -kmw (SD2_DiaryVIewManageView does apply filters which now goes back to last search/select set before applying the filter anyway)
				
				FORM GOTO PAGE:C247(2)
			: (FORM Get current page:C276=2)
				//Goto Page_1
				OBJECT SET VISIBLE:C603(*; "oButLessFilters"; False:C215)
				OBJECT GET COORDINATES:C663(*; "oButMoreFilters"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRight1; $_l_ObjectBottom1)
				OBJECT GET COORDINATES:C663(*; "oButLessFilters"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
				OBJECT GET COORDINATES:C663(*; "oSD2Workflow"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT GET COORDINATES:C663(*; "oPageTab"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_TabHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
				$_l_Gap:=$_l_ObjectTop-$_l_ObjectTop2
				$_l_ObjectTop:=94
				$_l_ButtonHeight:=$_l_ObjectBottom1-$_l_ObjectTop1
				OBJECT MOVE:C664(*; "oButMoreFilters"; $_l_ObjectLeft1; 80-$_l_ButtonHeight; $_l_ObjectRight1; 80; *)
				OBJECT MOVE:C664(*; "oButLessFilters"; $_l_ObjectLeft3; 80-$_l_ButtonHeight; $_l_ObjectRight3; 80; *)
				
				OBJECT MOVE:C664(*; "oPageTab"; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectTop+$_l_TabHeight; *)
				$_l_ObjectTop:=$_l_ObjectTop+$_l_Gap
				OBJECT MOVE:C664(SD2_Pi_Configure; 1; $_l_ObjectTop-17; 17; $_l_ObjectTop-1; *)
				OBJECT MOVE:C664(SD2_at_ConfigureSD2; $_l_ObjectTop-17; 17; $_l_ObjectTop-1; *)
				
				OBJECT MOVE:C664(*; "oSD2Workflow"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom; *)
				FORM GOTO PAGE:C247(1)
				SD_t_ActionFilter:="ALL"
				SD_t_ActionFilterCode:=""
				SD_t_ResultsFilter:="ALL"
				SD_t_ResultsFilterCode:=""
				SD2_t_StatusFIlter:="ALL"
				SD2_D_DateFromFilter:=!00-00-00!
				SD2_D_DatetoFilter:=!00-00-00!
				//************** commented out 03/07/08 -kmw **************
				//If (SD2_T_SearchValue#"")
				//SD2_DiaryVIewManageView (1;SD2_T_SearchValue)
				//Else
				//SD2_DiaryViewManageSelection
				//SD2_DiaryVIewManageView (-1)
				//End if
				//**************************************************************
				SD2_DiaryVIewManageView(-1)  //changed to simply just this, 03/07/08 -kmw (SD2_DiaryVIewManageView does apply filters which now goes back to last search/select set before applying the filter anyway)
				
				
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_diaryViewer.oButLessFilters"; $_t_oldMethodName)

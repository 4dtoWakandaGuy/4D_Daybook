If (False:C215)
	//object Name: [USER]SD2_diaryViewer.oButMoreFilters
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
	C_LONGINT:C283($_l_ButtonHeight; $_l_event; $_l_Gap; $_l_ObjectBottom; $_l_ObjectBottom1; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectLeft; $_l_ObjectLeft1; $_l_ObjectLeft2; $_l_ObjectLeft3)
	C_LONGINT:C283($_l_ObjectRight; $_l_ObjectRight1; $_l_ObjectRight2; $_l_ObjectRight3; $_l_ObjectTop; $_l_ObjectTop1; $_l_ObjectTop2; $_l_ObjectTop3; $_l_TabHeight)
	C_PICTURE:C286(SD2_Pi_Configure)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.oButMoreFilters"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (FORM Get current page:C276=1)
				OBJECT SET VISIBLE:C603(*; "oButLessFilters"; True:C214)
				OBJECT GET COORDINATES:C663(*; "oButMoreFilters"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRight1; $_l_ObjectBottom1)
				OBJECT GET COORDINATES:C663(*; "oButLessFilters"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
				OBJECT GET COORDINATES:C663(*; "oSD2Workflow"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT GET COORDINATES:C663(*; "oPageTab"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_TabHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
				$_l_Gap:=$_l_ObjectTop-$_l_ObjectTop2
				$_l_ObjectTop:=135
				$_l_ButtonHeight:=$_l_ObjectBottom1-$_l_ObjectTop1
				OBJECT MOVE:C664(*; "oButMoreFilters"; $_l_ObjectLeft1; 127-$_l_ButtonHeight; $_l_ObjectRight1; 127; *)
				OBJECT MOVE:C664(*; "oButLessFilters"; $_l_ObjectLeft3; 127-$_l_ButtonHeight; $_l_ObjectRight3; 127; *)
				OBJECT MOVE:C664(*; "oPageTab"; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectTop+$_l_TabHeight; *)
				$_l_ObjectTop:=$_l_ObjectTop+$_l_Gap
				OBJECT MOVE:C664(SD2_Pi_Configure; 1; $_l_ObjectTop-17; 17; $_l_ObjectTop-1; *)
				OBJECT MOVE:C664(SD2_at_ConfigureSD2; $_l_ObjectTop-17; 17; $_l_ObjectTop-1; *)
				
				OBJECT MOVE:C664(*; "oSD2Workflow"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom; *)
				FORM GOTO PAGE:C247(2)
			: (FORM Get current page:C276=2)
				OBJECT SET VISIBLE:C603(*; "SD2_l_MoreFilters"; False:C215)
				
				OBJECT GET COORDINATES:C663(*; "oButMoreFilters"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRight1; $_l_ObjectBottom1)
				OBJECT GET COORDINATES:C663(*; "oButLessFilters"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
				OBJECT GET COORDINATES:C663(*; "oSD2Workflow"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT GET COORDINATES:C663(*; "oPageTab"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_TabHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
				$_l_Gap:=$_l_ObjectTop-$_l_ObjectTop2
				$_l_ObjectTop:=179  //64
				$_l_ButtonHeight:=$_l_ObjectBottom1-$_l_ObjectTop1
				OBJECT MOVE:C664(*; "oButMoreFilters"; $_l_ObjectLeft1; 172-$_l_ButtonHeight; $_l_ObjectRight1; 172; *)
				OBJECT MOVE:C664(*; "oButLessFilters"; $_l_ObjectLeft3; 172-$_l_ButtonHeight; $_l_ObjectRight3; 172; *)
				OBJECT MOVE:C664(*; "oPageTab"; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; $_l_ObjectTop+$_l_TabHeight; *)
				$_l_ObjectTop:=$_l_ObjectTop+$_l_Gap
				OBJECT MOVE:C664(SD2_Pi_Configure; 1; $_l_ObjectTop-17; 17; $_l_ObjectTop-1; *)
				OBJECT MOVE:C664(SD2_at_ConfigureSD2; $_l_ObjectTop-17; 17; $_l_ObjectTop-1; *)
				
				OBJECT MOVE:C664(*; "oSD2Workflow"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom; *)
				FORM GOTO PAGE:C247(3)
				
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_diaryViewer.oButMoreFilters"; $_t_oldMethodName)

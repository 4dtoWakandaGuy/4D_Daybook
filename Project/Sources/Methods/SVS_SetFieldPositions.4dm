//%attributes = {}
If (False:C215)
	//Project Method Name:      SVS_SetFieldPositions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2009 19:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SC_lb_PROD;0)
	//ARRAY TEXT(SC_at_SolutionTypes;0)
	C_BOOLEAN:C305($_bo_ShowResolution; $1)
	C_LONGINT:C283($_l_CurrentFormPage; $_l_Height; $_l_NextObjectTop; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectBottom4; $_l_objectGap; $_l_ObjectHeight; $_l_ObjectHeight2; $_l_ObjectHeight3)
	C_LONGINT:C283($_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectLeft3; $_l_ObjectLeft4; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectRight3; $_l_ObjectRight4; $_l_ObjectTop; $_l_ObjectTop2; $_l_ObjectTop3)
	C_LONGINT:C283($_l_ObjectTop4; $_l_SvsobjectHeight; $_l_TotalHeight; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; BResolve)
	C_REAL:C285($2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SVS_SetFieldPositions")

If (True:C214)
	If (Count parameters:C259>=1)
		$_bo_ShowResolution:=$1
	Else 
		$_bo_ShowResolution:=[SERVICE_CALLS:20]Resolved:9
	End if 
	If (Count parameters:C259>=2)
		$_l_CurrentFormPage:=$2
	Else 
		$_l_CurrentFormPage:=FORM Get current page:C276
	End if 
	OBJECT SET VISIBLE:C603(*; "ODiary@"; False:C215)
	OBJECT SET VISIBLE:C603([SERVICE_CALLS:20]Problem_Description:15; True:C214)
	OBJECT SET VISIBLE:C603(*; "oSCProblemLabel"; True:C214)
	Case of 
		: ($_l_CurrentFormPage=1)
			If ($_bo_ShowResolution)
				OBJECT SET VISIBLE:C603(*; "aSCSolutionLabel"; True:C214)
				OBJECT SET VISIBLE:C603([SERVICE_CALLS:20]Solution_Description:17; True:C214)
				OBJECT SET VISIBLE:C603(*; "oSCSolutionCodeLabel"; True:C214)
				OBJECT SET VISIBLE:C603([SERVICE_CALLS:20]Solution_Code:16; True:C214)
				OBJECT SET VISIBLE:C603([SOLUTIONS:23]Solution_Name:2; True:C214)
				OBJECT SET VISIBLE:C603(*; "oSolutionDescription"; True:C214)
				OBJECT SET VISIBLE:C603(SC_at_SolutionTypes; True:C214)
				OBJECT SET VISIBLE:C603(BResolve; False:C215)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				$_l_WindowTop:=($_l_WindowBottom-$_l_WindowTop)-10
				//GET OBJECT RECT(*;"oBottomofPage";$_l_WindowLeft;$_l_WindowTop;$_l_WindowRight;$_l_WindowBottom)
				OBJECT GET COORDINATES:C663([SERVICE_CALLS:20]Solution_Description:17; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				OBJECT GET COORDINATES:C663([SERVICE_CALLS:20]Problem_Description:15; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
				OBJECT GET COORDINATES:C663(SC_at_SolutionTypes; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
				$_l_SvsobjectHeight:=$_l_ObjectBottom4-$_l_ObjectTop4
				$_l_TotalHeight:=$_l_ObjectBottom2-$_l_ObjectTop3
				$_l_ObjectHeight:=($_l_TotalHeight/2)-($_l_SvsobjectHeight+10)
				$_l_Height:=$_l_ObjectBottom2-$_l_ObjectTop2
				$_l_objectGap:=8
				OBJECT MOVE:C664([SERVICE_CALLS:20]Problem_Description:15; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; ($_l_ObjectTop3+$_l_ObjectHeight); *)
				//`````
				$_l_NextObjectTop:=($_l_ObjectTop3+$_l_ObjectHeight)+$_l_objectGap
				//MOVE OBJECT(SC_at_SolutionTypes;$_l_ObjectLeft4;$_l_NextObjectTop;$_l_ObjectRight4;($_l_NextObjectTop+$_l_SvsobjectHeight);*)
				//GET OBJECT RECT([SERVICE CALLS]Solution Code;$_l_ObjectLeft5;$_l_ObjectTop4;$_l_ObjectRight5;$_l_ObjectBottom4)
				$_l_ObjectHeight2:=$_l_ObjectBottom4-$_l_ObjectTop4
				OBJECT MOVE:C664(SC_at_SolutionTypes; $_l_ObjectLeft4; $_l_NextObjectTop; $_l_ObjectRight4; ($_l_NextObjectTop+$_l_ObjectHeight2); *)
				OBJECT GET COORDINATES:C663([SERVICE_CALLS:20]Solution_Code:16; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
				
				OBJECT MOVE:C664([SERVICE_CALLS:20]Solution_Code:16; $_l_ObjectLeft4; $_l_NextObjectTop; $_l_ObjectRight4; ($_l_NextObjectTop+$_l_ObjectHeight2); *)
				OBJECT GET COORDINATES:C663([SOLUTIONS:23]Solution_Name:2; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
				OBJECT MOVE:C664([SOLUTIONS:23]Solution_Name:2; $_l_ObjectLeft4; $_l_NextObjectTop; $_l_ObjectRight4; ($_l_NextObjectTop+$_l_ObjectHeight2); *)
				
				OBJECT GET COORDINATES:C663(*; "oSCSolutionCodeLabel"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
				$_l_ObjectHeight3:=$_l_ObjectBottom4-$_l_ObjectTop4
				OBJECT MOVE:C664(*; "oSCSolutionCodeLabel"; $_l_ObjectLeft4; $_l_NextObjectTop; $_l_ObjectRight4; $_l_NextObjectTop+$_l_ObjectHeight3; *)
				//````````
				$_l_NextObjectTop:=$_l_NextObjectTop+$_l_ObjectHeight2+$_l_objectGap
				OBJECT GET COORDINATES:C663(*; "oSolutionDescription"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
				$_l_ObjectHeight2:=$_l_ObjectBottom4-$_l_ObjectTop4
				OBJECT MOVE:C664(*; "oSolutionDescription"; $_l_ObjectLeft4; $_l_NextObjectTop; $_l_ObjectRight4; ($_l_NextObjectTop+$_l_SvsobjectHeight); *)
				OBJECT SET VISIBLE:C603(*; "oSolutionDescription"; True:C214)
				OBJECT MOVE:C664([SERVICE_CALLS:20]Solution_Description:17; $_l_ObjectLeft2; $_l_NextObjectTop; $_l_ObjectRight2; ($_l_WindowTop-$_l_objectGap); *)
				
				
			Else 
				OBJECT SET VISIBLE:C603(*; "aSCSolutionLabel"; False:C215)
				OBJECT SET VISIBLE:C603([SERVICE_CALLS:20]Solution_Description:17; False:C215)
				OBJECT SET VISIBLE:C603(*; "oSCSolutionCodeLabel"; False:C215)
				OBJECT SET VISIBLE:C603([SERVICE_CALLS:20]Solution_Code:16; False:C215)
				OBJECT SET VISIBLE:C603([SOLUTIONS:23]Solution_Name:2; False:C215)
				OBJECT SET VISIBLE:C603(*; "oSolutionDescription"; False:C215)
				OBJECT SET VISIBLE:C603(SC_at_SolutionTypes; False:C215)
				OBJECT SET VISIBLE:C603(BResolve; True:C214)
				OBJECT GET COORDINATES:C663([SERVICE_CALLS:20]Elapsed_Time:19; $_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				OBJECT GET COORDINATES:C663(BResolve; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_Height:=$_l_ObjectBottom2-$_l_ObjectTop2
				OBJECT MOVE:C664(BResolve; $_l_ObjectLeft2; $_l_WindowTop-(5+$_l_Height); $_l_ObjectRight2; $_l_WindowTop-5; *)
				OBJECT GET COORDINATES:C663([SERVICE_CALLS:20]Problem_Description:15; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
				OBJECT MOVE:C664([SERVICE_CALLS:20]Problem_Description:15; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_WindowTop-(10+$_l_Height); *)
				
			End if 
			If (False:C215)
				If ([SERVICE_CALLS:20]Resolved:9=False:C215)
					
				Else 
					OBJECT SET VISIBLE:C603(*; "aSCSolutionLabel"; True:C214)
					OBJECT SET VISIBLE:C603([SERVICE_CALLS:20]Solution_Description:17; True:C214)
					OBJECT SET VISIBLE:C603(*; "oSCSolutionCodeLabel"; True:C214)
					OBJECT SET VISIBLE:C603([SERVICE_CALLS:20]Solution_Code:16; True:C214)
					OBJECT SET VISIBLE:C603([SOLUTIONS:23]Solution_Name:2; True:C214)
					OBJECT SET VISIBLE:C603(*; "oSolutionDescription"; True:C214)
					OBJECT SET VISIBLE:C603(SC_at_SolutionTypes; True:C214)
					OBJECT SET VISIBLE:C603(BResolve; False:C215)
					OBJECT GET COORDINATES:C663([SERVICE_CALLS:20]Elapsed_Time:19; $_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
					OBJECT GET COORDINATES:C663([SERVICE_CALLS:20]Solution_Description:17; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
					OBJECT GET COORDINATES:C663([SERVICE_CALLS:20]Problem_Description:15; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
					OBJECT GET COORDINATES:C663(SC_at_SolutionTypes; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
					$_l_SvsobjectHeight:=$_l_ObjectBottom4-$_l_ObjectTop4
					$_l_TotalHeight:=$_l_ObjectBottom2-$_l_ObjectTop3
					$_l_ObjectHeight:=($_l_TotalHeight/2)-($_l_SvsobjectHeight+10)
					$_l_Height:=$_l_ObjectBottom2-$_l_ObjectTop2
					
					OBJECT MOVE:C664([SERVICE_CALLS:20]Problem_Description:15; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_WindowTop-(10+$_l_ObjectHeight); *)
					OBJECT MOVE:C664(SC_at_SolutionTypes; $_l_ObjectLeft4; $_l_WindowTop-(10+$_l_ObjectHeight)+$_l_objectGap; $_l_ObjectRight4; $_l_WindowTop-(10+$_l_ObjectHeight)+$_l_objectGap+$_l_SvsobjectHeight; *)
					OBJECT GET COORDINATES:C663([SERVICE_CALLS:20]Solution_Code:16; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
					$_l_ObjectHeight2:=$_l_ObjectBottom4-$_l_ObjectTop4
					OBJECT MOVE:C664([SERVICE_CALLS:20]Solution_Code:16; $_l_ObjectLeft4; $_l_WindowTop-(10+$_l_ObjectHeight)+7; $_l_ObjectRight4; $_l_WindowTop-(10+$_l_ObjectHeight)+7+$_l_ObjectHeight2; *)
					OBJECT GET COORDINATES:C663([SOLUTIONS:23]Solution_Name:2; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
					OBJECT MOVE:C664([SERVICE_CALLS:20]Solution_Code:16; $_l_ObjectLeft4; $_l_WindowTop-(10+$_l_ObjectHeight)+7; $_l_ObjectRight4; $_l_WindowTop-(10+$_l_ObjectHeight)+7+$_l_ObjectHeight2; *)
					
					OBJECT GET COORDINATES:C663(*; "oSCSolutionCodeLabel"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
					$_l_ObjectHeight2:=$_l_ObjectBottom4-$_l_ObjectTop4
					OBJECT MOVE:C664(*; "oSCSolutionCodeLabel"; $_l_ObjectLeft4; $_l_WindowTop-(10+$_l_ObjectHeight)+7; $_l_ObjectRight4; $_l_WindowTop-(10+$_l_ObjectHeight)+7+$_l_ObjectHeight2; *)
					OBJECT GET COORDINATES:C663(*; "oSolutionDescription"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
					$_l_ObjectHeight2:=$_l_ObjectBottom4-$_l_ObjectTop4
					OBJECT MOVE:C664(*; "oSolutionDescription"; $_l_ObjectLeft4; $_l_WindowTop-(10+$_l_ObjectHeight)+$_l_objectGap+$_l_SvsobjectHeight+$_l_objectGap; $_l_ObjectRight4; $_l_WindowTop-(10+$_l_ObjectHeight)+$_l_objectGap+$_l_SvsobjectHeight+$_l_objectGap+10; *)
					//oSolutionDescription
					OBJECT MOVE:C664([SERVICE_CALLS:20]Solution_Description:17; $_l_ObjectLeft2; $_l_WindowTop-(10+$_l_ObjectHeight)+$_l_objectGap+$_l_SvsobjectHeight+$_l_objectGap; $_l_ObjectRight2; ($_l_WindowTop-$_l_objectGap); *)
					
				End if 
			End if 
		: ($_l_CurrentFormPage=2)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			$_l_WindowTop:=($_l_WindowBottom-$_l_WindowTop)-10
			OBJECT GET COORDINATES:C663(SC_lb_PROD; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT MOVE:C664(SC_lb_PROD; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_WindowTop; *)
			
		: ($_l_CurrentFormPage=3)
		: ($_l_CurrentFormPage=4)
	End case 
End if 
ERR_MethodTrackerReturn("SVS_SetFieldPositions"; $_t_oldMethodName)

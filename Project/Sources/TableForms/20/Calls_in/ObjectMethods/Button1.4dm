If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SC_at_SolutionTypes;0)
	C_LONGINT:C283($_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectBottom4; $_l_ObjectHeight; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectLeft3; $_l_ObjectLeft4; $_l_ObjectRight; $_l_ObjectRight2)
	C_LONGINT:C283($_l_ObjectRight3; $_l_ObjectRight4; $_l_ObjectTop; $_l_ObjectTop2; $_l_ObjectTop3; $_l_ObjectTop4; $_l_SOLObjectHeight; $_l_SOLObjectHeight2; $_l_TotalHeight; BResolve)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.Button1"; Form event code:C388)
OBJECT SET VISIBLE:C603(*; "aSCSolutionLabel"; True:C214)
OBJECT SET VISIBLE:C603([SERVICE_CALLS:20]Solution_Description:17; True:C214)
OBJECT SET VISIBLE:C603(*; "oSCSolutionCodeLabel"; True:C214)
OBJECT SET VISIBLE:C603([SERVICE_CALLS:20]Solution_Code:16; True:C214)
OBJECT SET VISIBLE:C603([SOLUTIONS:23]Solution_Name:2; True:C214)
OBJECT SET VISIBLE:C603(*; "oSolutionDescription"; True:C214)
OBJECT SET VISIBLE:C603(SC_at_SolutionTypes; True:C214)
OBJECT SET VISIBLE:C603(BResolve; False:C215)
OBJECT GET COORDINATES:C663([SERVICE_CALLS:20]Elapsed_Time:19; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
OBJECT GET COORDINATES:C663([SERVICE_CALLS:20]Solution_Description:17; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
OBJECT GET COORDINATES:C663([SERVICE_CALLS:20]Problem_Description:15; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
OBJECT GET COORDINATES:C663(SC_at_SolutionTypes; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
$_l_SOLObjectHeight:=$_l_ObjectBottom4-$_l_ObjectTop4
$_l_TotalHeight:=$_l_ObjectBottom2-$_l_ObjectTop3
$_l_ObjectHeight:=$_l_TotalHeight/2-($_l_SOLObjectHeight+10)
$_l_ObjectHeight:=$_l_ObjectBottom2-$_l_ObjectTop2

OBJECT MOVE:C664([SERVICE_CALLS:20]Problem_Description:15; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectTop-(10+$_l_ObjectHeight); *)
OBJECT MOVE:C664(SC_at_SolutionTypes; $_l_ObjectLeft4; $_l_ObjectTop-(10+$_l_ObjectHeight)+5; $_l_ObjectRight4; $_l_ObjectTop-(10+$_l_ObjectHeight)+5+$_l_SOLObjectHeight; *)
OBJECT GET COORDINATES:C663([SERVICE_CALLS:20]Solution_Code:16; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
$_l_SOLObjectHeight2:=$_l_ObjectBottom4-$_l_ObjectTop4
OBJECT MOVE:C664([SERVICE_CALLS:20]Solution_Code:16; $_l_ObjectLeft4; $_l_ObjectTop-(10+$_l_ObjectHeight)+7; $_l_ObjectRight4; $_l_ObjectTop-(10+$_l_ObjectHeight)+7+$_l_SOLObjectHeight2; *)
OBJECT GET COORDINATES:C663([SOLUTIONS:23]Solution_Name:2; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
OBJECT MOVE:C664([SOLUTIONS:23]Solution_Name:2; $_l_ObjectLeft4; $_l_ObjectTop-(10+$_l_ObjectHeight)+7; $_l_ObjectRight4; $_l_ObjectTop-(10+$_l_ObjectHeight)+7+$_l_SOLObjectHeight2; *)

OBJECT GET COORDINATES:C663(*; "oSCSolutionCodeLabel"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
$_l_SOLObjectHeight2:=$_l_ObjectBottom4-$_l_ObjectTop4
OBJECT MOVE:C664(*; "oSCSolutionCodeLabel"; $_l_ObjectLeft4; $_l_ObjectTop-(10+$_l_ObjectHeight)+7; $_l_ObjectRight4; $_l_ObjectTop-(10+$_l_ObjectHeight)+7+$_l_SOLObjectHeight2; *)
OBJECT GET COORDINATES:C663(*; "oSCSolutionDescription"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
$_l_SOLObjectHeight2:=$_l_ObjectBottom4-$_l_ObjectTop4
OBJECT MOVE:C664(*; "oSCSolutionDescription"; $_l_ObjectLeft2; $_l_ObjectTop-(10+$_l_ObjectHeight)+5+$_l_SOLObjectHeight+5; $_l_ObjectRight4; $_l_ObjectTop-(10+$_l_ObjectHeight)+5+$_l_SOLObjectHeight+5+10; *)
//MOVE OBJECT(SC_at_SolutionTypes;$_l_ObjectRight4;$_l_ObjectTop-(10+$_l_ObjectHeight)+5+$_l_SOLObjectHeight+5;$_l_ObjectRight4+12;$_l_ObjectTop-(10+$_l_ObjectHeight)+5+$_l_SOLObjectHeight+5+10;*)
//oSolutionDescription
OBJECT MOVE:C664([SERVICE_CALLS:20]Solution_Description:17; $_l_ObjectLeft2; $_l_ObjectTop-(10+$_l_ObjectHeight)+5+$_l_SOLObjectHeight+5; $_l_ObjectRight2; $_l_ObjectTop-5; *)
OBJECT SET VISIBLE:C603(*; "oSolutionDescription"; False:C215)
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.Button1"; $_t_oldMethodName)

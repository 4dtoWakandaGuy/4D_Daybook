//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_SetVisible
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:36`Method: Cal4D_Cal_SetVisible
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array BOOLEAN(<>Cal4D_Lb_CalenderList;0)
	C_BOOLEAN:C305(<>Cal_bo_CalisVisible; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_SetVisible")


Cal4D_Init

<>Cal_bo_CalisVisible:=$1

If (<>Cal_bo_CalisVisible)
	Cal4D_Cal_Redraw
End if 

OBJECT SET VISIBLE:C603(*; "Cal4D_@"; <>Cal_bo_CalisVisible)
OBJECT SET VISIBLE:C603(*; "Cal4D_ObjectsCover"; False:C215)
OBJECT SET VISIBLE:C603(<>Cal_Lb_CalenderList; False:C215)
ERR_MethodTrackerReturn("Cal4D_Cal_SetVisible"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_ShowHideActions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Baction)
	//C_UNKNOWN(SM_RB_1)
	//C_UNKNOWN(SM_RB_2)
	//C_UNKNOWN(SM_RB_3)
	//C_UNKNOWN(SM_RB_4)
	//C_UNKNOWN(SM_RB_5)
	//C_UNKNOWN(SM_SaveSelection)
	C_BOOLEAN:C305($_bo_Visible; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_ShowHideActions")
If (Count parameters:C259>=1)
	$_bo_Visible:=$1
Else 
	$_bo_Visible:=True:C214
End if 
If (True:C214)
	OBJECT SET ENTERABLE:C238(*; "Group Box1"; $_bo_Visible)
	OBJECT SET ENTERABLE:C238(*; "Picture1"; $_bo_Visible)
	OBJECT SET ENTERABLE:C238(*; "Picture2"; $_bo_Visible)
	OBJECT SET ENTERABLE:C238(*; "Picture3"; $_bo_Visible)
	OBJECT SET ENTERABLE:C238(*; "Picture4"; $_bo_Visible)
	OBJECT SET ENTERABLE:C238(*; "Picture5"; $_bo_Visible)
	
	OBJECT SET ENABLED:C1123(SM_RB_1; $_bo_Visible)
	OBJECT SET ENABLED:C1123(SM_RB_2; $_bo_Visible)
	OBJECT SET ENABLED:C1123(SM_RB_3; $_bo_Visible)
	OBJECT SET ENABLED:C1123(SM_RB_4; $_bo_Visible)
	OBJECT SET ENABLED:C1123(SM_RB_5; $_bo_Visible)
	OBJECT SET ENABLED:C1123(SM_SaveSelection; $_bo_Visible)
	OBJECT SET ENABLED:C1123(Baction; $_bo_Visible)
	
	
Else 
	OBJECT SET VISIBLE:C603(*; "Group Box1"; True:C214)
	OBJECT SET VISIBLE:C603(*; "Picture1"; True:C214)
	OBJECT SET VISIBLE:C603(*; "Picture2"; True:C214)
	OBJECT SET VISIBLE:C603(*; "Picture3"; True:C214)
	OBJECT SET VISIBLE:C603(*; "Picture4"; True:C214)
	OBJECT SET VISIBLE:C603(*; "Picture5"; True:C214)
	OBJECT SET VISIBLE:C603(SM_RB_1; True:C214)
	OBJECT SET VISIBLE:C603(SM_RB_2; True:C214)
	OBJECT SET VISIBLE:C603(SM_RB_3; True:C214)
	OBJECT SET VISIBLE:C603(SM_RB_4; True:C214)
	OBJECT SET VISIBLE:C603(SM_RB_5; True:C214)
	OBJECT SET VISIBLE:C603(SM_SaveSelection; True:C214)
	OBJECT SET VISIBLE:C603(Baction; True:C214)
End if 

ERR_MethodTrackerReturn("SM_ShowHideActions"; $_t_oldMethodName)

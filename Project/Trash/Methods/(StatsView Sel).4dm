//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SV_at_TableFindCodes;0)
	C_LONGINT:C283(vNo)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; $_t_oldMethodName2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("StatsView Sel")

If (SV_at_TableFindCodes{1}#"")
	$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+SV_at_TableFindCodes{1})
	EXECUTE FORMULA:C63(SV_at_TableFindCodes{1})
	If (OK=1)
		StatsView_Cal1
	End if 
	vNo:=Records in selection:C76(vFilePtr->)
End if 
ERR_MethodTrackerReturn("StatsView Sel"; $_t_oldMethodName)

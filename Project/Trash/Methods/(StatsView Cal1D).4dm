//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView_Cal1D
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
	C_LONGINT:C283($_l_CountRecords; vNo3)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; $_t_oldMethodName2; vSVCF)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("StatsView_Cal1D")

//StatsView_Cal1D - same as D but without the variable - CrossFile searches
$_l_CountRecords:=Records in selection:C76(vFilePtr->)
If (($_l_CountRecords=0) | (vSVCF=""))
	vNo3:=0
Else 
	$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+vSVCF)
	EXECUTE FORMULA:C63(vSVCF)
End if 
ERR_MethodTrackerReturn("StatsView_Cal1D"; $_t_oldMethodName)
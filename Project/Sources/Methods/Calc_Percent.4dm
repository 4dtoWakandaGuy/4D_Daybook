//%attributes = {}
If (False:C215)
	//Project Method Name:      Calc_Percent
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($_r_Input1; $_r_Input2; $0; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calc_Percent")
//Calc_Percent
If (Count parameters:C259>=2)
	$_r_Input1:=$1
	$_r_Input2:=$2
	If (($_r_Input1#0) & ($_r_Input2#0))
		$0:=$_r_Input1/$_r_Input2*100
	Else 
		$0:=0
	End if 
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("Calc_Percent"; $_t_oldMethodName)
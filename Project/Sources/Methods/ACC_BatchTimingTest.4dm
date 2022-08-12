//%attributes = {}

If (False:C215)
	//Project Method Name:      ACC_BatchTimingTest
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_TimeInSeconds)
	C_REAL:C285($0; $1)
	C_TEXT:C284(<>ACC_T_BatchTimeReport; $_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BatchTimingTest")

//$_t_oldMethodName:=ERR_MethodTracker ("ACC_BatchTimingTest")
If (False:C215)
	If (Count parameters:C259>=2) & (False:C215)
		$_l_TimeInSeconds:=(((Current time:C178*1)*60)-$1)/1000
		If ($_l_TimeInSeconds>10)
			<>ACC_T_BatchTimeReport:=<>ACC_T_BatchTimeReport+Char:C90(9)+$2+" Took "+String:C10($_l_TimeInSeconds)+" Seconds"
		End if 
	End if 
	$0:=((Current time:C178*1)*60)
End if 
//ERR_MethodTrackerReturn ("ACC_BatchTimingTest";$_t_oldMethodName)
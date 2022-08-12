//%attributes = {}
If (False:C215)
	//Project Method Name:      CAL_ISODayConstant
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 11:43`Method: CAL_ISODayContant
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_DayNumber; $0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAL_ISODayConstant")
//This method will return a day number for a day  name constant
If (Count parameters:C259>=1)
	$_l_DayNumber:=$1-2
	If ($_l_DayNumber<0)
		$_l_DayNumber:=6
	End if 
End if 
$0:=$_l_DayNumber
ERR_MethodTrackerReturn("CAL_ISODayConstant"; $_t_oldMethodName)
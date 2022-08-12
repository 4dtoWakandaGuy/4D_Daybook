//%attributes = {}
If (False:C215)
	//Project Method Name:      MonthName
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
	C_DATE:C307($1)
	C_LONGINT:C283($_l_Month; $2)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MonthName")
//MonthName
If (Count parameters:C259>=1)
	
	$_l_Month:=Month of:C24($1)
End if 
If (Count parameters:C259>=2)
	$_l_Month:=$2
End if 
Case of 
	: ($_l_Month=1)
		$0:="January"
	: ($_l_Month=2)
		$0:="February"
	: ($_l_Month=3)
		$0:="March"
	: ($_l_Month=4)
		$0:="April"
	: ($_l_Month=5)
		$0:="May"
	: ($_l_Month=6)
		$0:="June"
	: ($_l_Month=7)
		$0:="July"
	: ($_l_Month=8)
		$0:="August"
	: ($_l_Month=9)
		$0:="September"
	: ($_l_Month=10)
		$0:="October"
	: ($_l_Month=11)
		$0:="November"
	: ($_l_Month=12)
		$0:="December"
End case 
ERR_MethodTrackerReturn("MonthName"; $_t_oldMethodName)
